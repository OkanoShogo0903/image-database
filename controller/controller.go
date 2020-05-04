package controller

import (
    "log"
    "net/http"
    "encoding/json"

    "github.com/OkanoShogo0903/image-database/model"

    "github.com/jmoiron/sqlx"
    "github.com/gin-gonic/gin"
)

type ImageController struct {
    db *sqlx.DB
}

func New(db *sqlx.DB) *ImageController {
    return &ImageController{db: db}
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

    c.JSON(http.StatusOK, j)
}

func (ic *ImageController)RegisteImage(c *gin.Context) {
    // TODO: s3, validation, id brocking ...

    m := make([]model.Image, 0)
    c.JSON(http.StatusOK, m)
}

func (ic *ImageController)HealthCheck(c *gin.Context) {
    c.Status(http.StatusOK)
}

