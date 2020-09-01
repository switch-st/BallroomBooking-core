package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
	_ "go.uber.org/automaxprocs"

	"github.com/switch-st/BallroomBooking-core/api/wechat"
	"github.com/switch-st/BallroomBooking-core/config"
	"github.com/switch-st/BallroomBooking-core/db"
	"github.com/switch-st/BallroomBooking-core/logger"
	"github.com/switch-st/BallroomBooking-core/router"
	"github.com/switch-st/BallroomBooking-core/util/midware"
	urouter "github.com/switch-st/BallroomBooking-core/util/router"
)

// TODO daemon
func main() {
	if ok, err := config.InitConfig("conf/server.yaml"); !ok {
		_, _ = fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	_, _ = logger.InitLogger()
	_, _ = db.InitDatabase()
	_, _ = wechat.InitWechat()

	// gin mode
	if strings.ToLower(config.ServerIns.Log.Level) == "debug" {
		gin.SetMode(gin.DebugMode)
	} else {
		gin.SetMode(gin.ReleaseMode)
	}

	// gin instance
	r := gin.New()
	r.Use(gin.Recovery())
	r.Use(logger.LogInsGin, logger.LogInsGinErr, logger.LogInsTrace)
	r.Use(midware.Cors(nil))

	_, _ = router.InitRouter(r)
	{
		new(urouter.RouteFactory).SetBasePath("/").AddRouteWorkshop("/ping", "GET",
			func(c *gin.Context) {
				c.JSON(200, gin.H{
					"message": "pong",
				})
			}).RegisterEngine(r)
	}

	_ = r.Run(config.ServerIns.Server.Listen)
}
