package server

import (
    "log"
    //"net/http"

    //"github.com/OkanoShogo0903/image-database/controller"
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
    s.db = dbcon
    s.router = s.Route()
}

func (s *Server) Run(port string) {
    log.Printf("Listening on port %s", port)
    s.router.Run(":" + port)
}

func (s *Server) Route() *gin.Engine {
    router := gin.Default()
    router.Use(cors.Default())

    //router.Use(static.Serve("/", static.LocalFile("./frontend/dist", false))) // Home

    /*
    aquarium_controller := controller.NewAquarium(s.db)
    user := router.Group("/user")
    {
        user.GET("/check", aquarium_controller.GetUserExistence)
        user.GET("/aquarium", aquarium_controller.GetUserData)
        user.PUT("/update", aquarium_controller.UpdateUserData)
        user.POST("/signup", aquarium_controller.Signup)
    }
    */

    //router.NoRoute(routers.NoRoute)
    return router
}
