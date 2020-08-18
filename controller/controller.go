package controller

import (
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"

	"github.com/OkanoShogo0903/image-database/aws"
	"github.com/OkanoShogo0903/image-database/repository"
)

type ImageController struct {
	db *sqlx.DB
}

func New(db *sqlx.DB) *ImageController {
	return &ImageController{db: db}
}

func (ic *ImageController) HealthCheck(c *gin.Context) {
	c.Status(http.StatusOK)
}

func (ic *ImageController) GetAllImage(c *gin.Context) {
	images, err := repository.AllImage(ic.db)
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	c.JSON(http.StatusOK, images)
}

func (ic *ImageController) GetRequestedImage(c *gin.Context) {
	//var attributes model.Attributes
	//attributes.attribute.append(c.)
	image, err := repository.Image(ic.db, c.Query("primary"))
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	c.JSON(http.StatusOK, image)
}

func (ic *ImageController) GetAllGenre(c *gin.Context) {
	genres, err := repository.AllGenre(ic.db)
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	c.JSON(http.StatusOK, genres)
}

func (ic *ImageController) GetAllCharactorName(c *gin.Context) {
	names, err := repository.AllCharactorName(ic.db)
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}

	c.JSON(http.StatusOK, names)
}

func (ic *ImageController) PutNewCharactor(c *gin.Context) {
	err := repository.CreateNewCharactor(ic.db, c.Query("char"))
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusInternalServerError)
		return
	}
}

/*
func (ic *ImageController) PutNewGenre(c *gin.Context) {
    err := repository.CreateNewGenre(ic.db, c.Query("genre"))
    if err != nil {
    }
}
*/

func (ic *ImageController) RegisteImage(c *gin.Context) {
	// TODO: validation, id brocking, extension blocking ...
	// TODO: 同一IPからの過剰な送信を防ぐ
	// TODO: S3に一定以上データが貯まると送信を防ぐ(サーバのアプリ側で弾くのではなく、S3のポリシーを変えるのが確実)
	form, err := c.MultipartForm()
	if err != nil {
		log.Printf(err.Error())
		c.Status(http.StatusBadRequest)
		return
	}

	files := form.File["file"]
	for _, file := range files {
		uri := "tmp/" + file.Filename
		// TODO: 雑にIO処理噛ませて変換してるけど、これは速度的に遅い
		// Save and remove
		err = c.SaveUploadedFile(file, uri)
		if err != nil {
			log.Printf(err.Error())
			c.Status(http.StatusInternalServerError)
			return
		}
		defer os.Remove(uri)

		// Trans type to io.Reader from *multipart.FileHeader
		file_io, err := os.Open(uri)
		if err != nil {
			log.Printf(err.Error())
			c.Status(http.StatusInternalServerError)
			return
		}
		defer file_io.Close()

		// Upload image and get uploaded url
		s3 := aws.New()
		s3.Init("resimagebucket", "AWS_S3_REGION", "AWS_IAM_ACCESS_KEY", "AWS_SECRET_ACCESS_KEY") // Please write "export AWS_S3_REGION='xxx' to .bashrc"

		name := createUuidV4() + extractExtension(file.Filename)
		url, err := s3.UploadImage(file_io, name)
		if err != nil {
			log.Printf(err.Error())
			c.Status(http.StatusInternalServerError)
			return
		}

		// SQL
		err = repository.RegisteImage(
			ic.db,
			url,
			c.Query("character"),
			c.Query("primary"),
		)
		if err != nil {
			log.Printf(err.Error())
			c.Status(http.StatusInternalServerError)
			return
		}
		log.Printf("[REGIST] IP: " + c.ClientIP() + ",  FILE: " + name)
	}
	c.Status(http.StatusOK) // if even one file to fail, server return 500 state.
}

func createUuidV4() string {
	uuidObj, _ := uuid.NewRandom()
	return uuidObj.String()
}

func extractExtension(s string) string {
	// "hoge.png" -> ".png"
	return s[strings.LastIndex(s, "."):]
}
