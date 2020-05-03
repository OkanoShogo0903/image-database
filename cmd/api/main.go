package main

import (
    "log"
    "os"

    server "github.com/OkanoShogo0903/image-database"
)

func loadEnv(a string, b string)string{
    val, is_exist := os.LookupEnv(a)
    if is_exist {
        return val
    }

    val, is_exist = os.LookupEnv(b)
    if is_exist {
        return val
    }

    log.Fatal("Cannot get datasource for database.")
    return ""
}

func main() {
    log.SetFlags(log.Ldate + log.Ltime + log.Lshortfile)
    log.SetOutput(os.Stdout)

    datasource := loadEnv("LOCAL_HEROKU_IMG_APP_DATABASE_URL", "DATABASE_URL")
    log.Printf(datasource)

    s := server.NewServer()
    s.Init(datasource)

    port, is_port := os.LookupEnv("PORT")
    if is_port == false {
        port = "8080"
    }
    s.Run(port)

}
