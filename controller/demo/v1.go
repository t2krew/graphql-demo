package demo

import (
	"log"
	"github.com/gin-gonic/gin"
)

func V1(c *gin.Context) {
	query := c.Request.URL.Query()
	log.Println(query)
	c.JSON(200, map[string]string{"result": "ok"})
}