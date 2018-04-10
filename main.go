package main

import (
	"github.com/gin-gonic/gin"
	"graphql/routes"
	"log"
	"os"
	"os/signal"
)

func main() {
	//初始化
	app := gin.Default()
	//路由
	routes.Register(app)
	//监听端口
	app.Run(":80")

	quit := make(chan os.Signal)
	signal.Notify(quit, os.Interrupt)
	<-quit

	log.Println("Shutdown Server ...")
	log.Println("Server exist")
}
