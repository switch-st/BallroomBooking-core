package sin_logger

import (
	"bytes"
	"strings"

	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/util/logger"
)

type SimpleFormatter struct {
	disableLevel  bool
	disableCaller bool
}

func NewSimpleFormatter() *SimpleFormatter {
	return &SimpleFormatter{disableLevel: false, disableCaller: false}
}

func (f *SimpleFormatter) DisableLevel(disable bool) *SimpleFormatter {
	if f != nil {
		f.disableLevel = disable
	}
	return f
}

func (f *SimpleFormatter) DisableCaller(disable bool) *SimpleFormatter {
	if f != nil {
		f.disableCaller = disable
	}
	return f
}

func (f *SimpleFormatter) Format(entry *logrus.Entry) ([]byte, error) {
	// format: time|level|caller|msg
	buf := bytes.NewBuffer(nil)
	buf.WriteString(entry.Time.Format("2006-01-02 15:04:05"))
	buf.WriteString("|")
	if f.disableLevel == false {
		buf.WriteString(strings.ToUpper(entry.Level.String()))
		buf.WriteString("|")
	}

	if f.disableCaller == false && entry.Caller != nil {
		buf.WriteString(logger.GetCaller(entry.Caller.File, entry.Caller.Line))
		buf.WriteString("|")
	}
	buf.WriteString(entry.Message)
	buf.WriteString("\n")
	return buf.Bytes(), nil
}
