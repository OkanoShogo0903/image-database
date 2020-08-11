package server

import (
    "log"
    //"net/http"

    "github.com/OkanoShogo0903/image-database/controller"
    db2 "github.com/OkanoShogo0903/image-database/db"

    "github.com/jmoiron/sqlx"
    "github.com/gin-gonic/gin"
    "github.com/gin-contrib/cors"
    //"github.com/gin-contrib/static"
)

type Server struct {
    db         *sqlx.DB
    router     *gin.Engine
}

func NewServer() *Server {
    return &Server{}
}

func (s *Server) Init(datasource string) {
    db := db2.NewDB(datasource)
    dbcon, err := db.Open()
    if err != nil {
        log.Fatalf("failed db init. %s", err)
    }
    log.Printf("successed db open. %s", datasource)

    s.db = dbcon
    s.router = s.Route()
}

func (s *Server) Run(port string) {
    log.Printf("Listening on port %s", port)
    s.router.Run(":" + port)
}

func (s *Server) Route() *gin.Engine {
    router := gin.Default()

    //router.Use(cors.Default())
    router.Use(cors.New(cors.Config{
        AllowOrigins: []string{"http://localhost:8081", "https://response-img.herokuapp.com"},
        AllowMethods: []string{"GET", "PUT", "DELETE", "OPTIONS"},
        AllowHeaders: []string{"*"},
    }))
    //router.Use(static.Serve("/", static.LocalFile("./frontend/dist", false))) // Home

    controller := controller.New(s.db)

    router.GET("/health_check", controller.HealthCheck)
    router.GET("/all_image", controller.GetAllImage)
    router.GET("/images", controller.GetRequestedImage)
    router.GET("/all_genre", controller.GetAllGenre)
    router.GET("/all_charactor", controller.GetAllCharactorName)
    //router.GET("/Attributes", controller.GetAttributes)
    router.PUT("/new_charactor", controller.PutNewCharactor)
    //router.PUT("/new_genre", controller.PutNewGenre)
    router.PUT("/registe", controller.RegisteImage)
    //router.PUT("/update", aquarium_controller.UpdateImageAttribute)

    //router.NoRoute(routers.NoRoute)
    return router
}
