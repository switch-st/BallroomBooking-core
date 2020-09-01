package sin_logger

import (
	"github.com/pkg/errors"
	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/util/logger/rotate_logger"
)

func New(filename string, level string, maxDays int) (*logrus.Logger, error) {
	ins := logrus.New()
	formatter := NewSimpleFormatter()

	if rl, err := rotate_logger.New(filename, rotate_logger.RtDay, maxDays, 0); err != nil {
		return nil, errors.Errorf("sin_logger: %w", err)
	} else {
		ins.SetOutput(rl)
	}

	if level != "" {
		if lvl, err := logrus.ParseLevel(level); err != nil {
			return nil, errors.Errorf("sin_logger: invalid log level, level: %s, err: %w", level, err)
		} else {
			ins.SetLevel(lvl)
		}
	} else {
		formatter.DisableLevel(true)
	}

	ins.SetReportCaller(true)
	ins.SetFormatter(formatter)

	return ins, nil
}

func DisableCaller(logger *logrus.Logger) {
	if logger != nil && logger.Formatter != nil {
		if formatter, ok := logger.Formatter.(*SimpleFormatter); ok {
			formatter.DisableCaller(true)
		}
	}
}
