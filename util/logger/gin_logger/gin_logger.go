package gin_logger

import (
	"fmt"
	"io"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/util/logger/rotate_logger"
	"github.com/switch-st/BallroomBooking-core/util/logger/sin_logger"
)

// NewErrorLog new a error log handle
func NewErrorLog(filename string, maxDays int) gin.HandlerFunc {
	out := func() *logrus.Logger {
		ins, err := sin_logger.New(filename, "error", maxDays)
		if err != nil {
			_, _ = fmt.Fprintf(os.Stderr, "New gin error log failed, err: %v", err)
			ins = logrus.New()
			ins.SetOutput(gin.DefaultErrorWriter)
		}
		ins.SetReportCaller(false)
		sin_logger.DisableCaller(ins)
		return ins
	}()
	return func(c *gin.Context) {
		c.Next()
		if len(c.Errors) != 0 {
			out.Println(c.Errors)
		}
	}
}

// NewNginxLog new a nginx-like access log handle
func NewNginxLog(filename string, maxDays int) gin.HandlerFunc {
	return gin.LoggerWithConfig(gin.LoggerConfig{Formatter: func(param gin.LogFormatterParams) string {
		return fmt.Sprintf("%s %s - [%s] %s %s %s \"%d\" %d %s \"%s\" \"%s\"\n",
			param.ClientIP,
			param.Request.Host,
			param.TimeStamp.Format(time.RFC3339),
			param.Method,
			param.Path,
			param.Request.Proto,
			param.StatusCode,
			param.BodySize,
			param.Latency,
			param.Request.UserAgent(),
			func() string {
				if param.ErrorMessage == "" {
					return "-"
				} else {
					return param.ErrorMessage
				}
			}(),
		)
	}, Output: func() io.Writer {
		rl, err := rotate_logger.New(filename, rotate_logger.RtDay, maxDays, 0)
		if err != nil {
			_, _ = fmt.Fprintf(os.Stderr, "New gin access log failed, err: %v", err)
			return gin.DefaultWriter
		}
		return rl
	}(),
	})
}
