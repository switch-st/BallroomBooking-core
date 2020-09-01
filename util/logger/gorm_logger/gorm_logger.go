package gorm_logger

import (
	"github.com/jinzhu/gorm"
	"github.com/pkg/errors"
	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/util/logger/sin_logger"
)

type LogWriter struct {
	ins *logrus.Logger
}

func (logger *LogWriter) Println(v ...interface{}) {
	if logger == nil || logger.ins == nil || len(v) == 0 {
		return
	}
	res := make([]interface{}, 0, len(v)*2-1)
	for i := 0; i < len(v); i++ {
		if i == len(v)-1 {
			res = append(res, v[i])
		} else {
			res = append(res, v[i], '|')
		}
	}
	logger.ins.Println(res)
}

func New(filename string, maxDays int) (*gorm.Logger, error) {
	if ins, err := sin_logger.New(filename, "", maxDays); err != nil {
		return nil, errors.Errorf("gorm_logger: %w", err)
	} else {
		sin_logger.DisableCaller(ins)
		gorm.LogFormatter = LogFormatter
		return &gorm.Logger{LogWriter: &LogWriter{ins: ins}}, nil
	}
}
