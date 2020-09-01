package router

import (
	"errors"

	"github.com/gin-gonic/gin"

	"github.com/switch-st/BallroomBooking-core/util/router"
)

var (
	root = new(router.RouteFactory)
)

func init() {
	root.SetBasePath("/")
}

func InitRouter(engine *gin.Engine) (bool, error) {
	if engine == nil {
		return false, errors.New("InitRouter: engine is nil")
	}
	if root == nil {
		return false, errors.New("InitRouter: main router is nil")
	}
	root.RegisterEngine(engine)

	return true, nil
}

func GetRoot() *router.RouteFactory {
	return root
}
