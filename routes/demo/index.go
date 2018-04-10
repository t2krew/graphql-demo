package demo

import (
	"github.com/gin-gonic/gin"
	ctrlDemo "graphql/controller/demo"
)

func Group(r *gin.RouterGroup) {
	r.GET("/v1", ctrlDemo.V1)
}

