package main

import (
	"log"
	"os"

    server "github.com/OkanoShogo0903/osakana"
)

func main() {
	log.SetFlags(log.Ldate + log.Ltime + log.Lshortfile)
	log.SetOutput(os.Stdout)

	datasource := os.Getenv("DATABASE_DATASOURCE")
	if datasource == "" {
		log.Fatal("Cannot get datasource for database.")
	}

	s := server.NewServer()
	s.Init(datasource)

    port, is_port := os.LookupEnv("PORT")
    if is_port == false {
        port = "8080"
    }
	s.Run(port)

}
