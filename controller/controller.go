package controller

import (
    "os"
    "log"
    "strings"
    "net/http"
    "encoding/json"

    "github.com/google/uuid"
    "github.com/jmoiron/sqlx"
    "github.com/gin-gonic/gin"

    "github.com/OkanoShogo0903/image-database/aws"
    "github.com/OkanoShogo0903/image-database/model"
)

type ImageController struct {
    db *sqlx.DB
}

func New(db *sqlx.DB) *ImageController {
    return &ImageController{db: db}
}

func (ic *ImageController)HealthCheck(c *gin.Context) {
    c.Status(http.StatusOK)
}

func (ic *ImageController)GetAllImage(c *gin.Context) {
    m := make([]model.ImageDB, 0)
    err := ic.db.Select(&m, `SELECT * FROM image`)
    if err != nil {
        log.Printf(err.Error())
        c.Status(http.StatusInternalServerError)
        return
    }

    c.JSON(http.StatusOK, m)
}

func (ic *ImageController)GetRequestedImage(c *gin.Context) {
    //var attributes model.Attributes
    //attributes.attribute.append(c.)

    m := make([]model.ImageDB, 0)

    err := ic.db.Select(&m, `SELECT * FROM image WHERE attribute_primary = ?`, c.Query("primary"))
    if err != nil {
        log.Printf(err.Error())
        c.Status(http.StatusInternalServerError)
        return
    }

    j, err := json.Marshal(m)
    if err != nil {
        log.Printf(err.Error())
        c.Status(http.StatusInternalServerError)
        return
    }
    log.Printf(string(j))

    c.JSON(http.StatusOK, j)
}

func (ic *ImageController)RegisteImage(c *gin.Context) {
    // TODO: validation, id brocking, extension blocking ...
    // TODO: 同一IPからの過剰な送信を防ぐ
    // TODO: S3に一定以上データが貯まると送信を防ぐ(サーバのアプリ側で弾くのではなく、S3のポリシーを変えるのが確実)
    // TODO: ファイルサイズ一定以上で弾く
    form, _ := c.MultipartForm()

    file := form.File["file"][0] // ひとつだけ処理

    uri := "tmp/" + file.Filename

    // TODO: 雑にIO処理噛ませて変換してるけど、これは速度的に遅い
    // Save and remove
    err := c.SaveUploadedFile(file, uri)
    if err != nil {
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
    s3.Init("resimagebucket", "AWS_S3_REGION", "AWS_IAM_ACCESS_KEY", "AWS_SECRET_ACCESS_KEY")

    name := createUuidV4() + extractExtension(file.Filename)
    url, err := s3.UploadImage(file_io, name)
    if err != nil {
        log.Printf(err.Error())
        c.Status(http.StatusInternalServerError)
        return
    }

    // SQL
    _, err = ic.db.NamedExec(`insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values (:url, :name, :a, :b, :c)`,
        map[string]interface{}{
            "url": url,
            "name": c.Query("character"),
            "a": c.Query("primary"),
            "b": c.Query("secondary"),
            "c": c.Query("tertiary"),
    })

    log.Printf("[REGIST] IP: " + c.ClientIP() + ",  FILE: " + name)
    c.Status(http.StatusOK) // if even one file to fail, server return 500 state.
}

func createUuidV4() string {
    uuidObj, _ := uuid.NewRandom()
    return uuidObj.String()
}

func extractExtension(s string) string {
    // "hoge.png" -> ".png"
    return  s[strings.LastIndex(s, "."):]
}
