package routes

import (
	"github.com/gin-gonic/gin"
	"graphql/routes/demo"
)

func Register(app *gin.Engine) {
	app.GET("/ping", func (c *gin.Context) {
		c.String(200, "ok")
	})

	demo.Group(app.Group("/demo"))
}