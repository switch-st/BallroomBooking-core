package logger

import (
	"errors"
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/config"
	"github.com/switch-st/BallroomBooking-core/util/logger/gin_logger"
	"github.com/switch-st/BallroomBooking-core/util/logger/gorm_logger"
	"github.com/switch-st/BallroomBooking-core/util/logger/sin_logger"
)

var (
	LogNameMain   string = "server"
	LogNameDB     string = "db"
	LogNameGin    string = "gin"
	LogNameGinErr string = "gin_err"
	LogNameReq    string = "request"
	LogNameRes    string = "response"

	LogInsMain   *logrus.Logger  = nil
	LogInsDB     *gorm.Logger    = nil
	LogInsGin    gin.HandlerFunc = nil
	LogInsGinErr gin.HandlerFunc = nil
	LogInsTrace  gin.HandlerFunc = nil
)

func InitLogger() (ok bool, err error) {
	logDir := config.ServerIns.Server.BasePath + "/logs/"
	maxDays := config.ServerIns.Log.MaxSaveDays
	level := config.ServerIns.Log.Level

	if ok, err := checkLogDirectory(logDir); !ok {
		return ok, err
	}
	if LogInsMain, err = sin_logger.New(logDir+LogNameMain+".log", level, maxDays); err != nil {
		return false, err
	}
	if LogInsDB, err = gorm_logger.New(logDir+LogNameDB+".log", maxDays); err != nil {
		return false, err
	}
	LogInsGin = gin_logger.NewNginxLog(logDir+LogNameGin+".log", maxDays)
	LogInsGinErr = gin_logger.NewErrorLog(logDir+LogNameGinErr+".log", maxDays)
	LogInsTrace = gin_logger.NewTraceLog(logDir+LogNameReq+".log", logDir+LogNameRes+".log", maxDays)
	return true, nil
}

func checkLogDirectory(logDir string) (ok bool, err error) {
	if fileInfo, err := os.Stat(logDir); err != nil {
		if os.IsNotExist(err) {
			if err := os.MkdirAll(logDir, 0755); err != nil {
				return false, fmt.Errorf("creates log directory failed, dir: %s, err: %w", logDir, err)
			}
		} else {
			return false, fmt.Errorf("check log directory failed, dir: %s, err: %w", logDir, err)
		}
	} else if !fileInfo.IsDir() {
		err := errors.New("is not a directory")
		return false, fmt.Errorf("check log directory failed, dir: %s, err: %w", logDir, err)
	}

	return checkLogDirPermit(logDir)
}
