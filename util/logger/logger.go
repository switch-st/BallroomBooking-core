package logger

import (
	"path/filepath"
	"strconv"
)

var (
	// loggerProjectPath set by build flags, like:
	// go build -ldflags "-X $(MODULE_NAME)/util/logger.loggerProjectPath=`pwd`"
	loggerProjectPath string = ""
	loggerValidPath   bool   = false
)

func init() {
	if loggerProjectPath != "" && filepath.IsAbs(loggerProjectPath) {
		loggerValidPath = true
	} else {
		loggerValidPath = false
	}
}

func GetCaller(file string, line int) string {
	getLine := func() string {
		if line > 0 {
			return ":" + strconv.Itoa(line)
		}
		return ""
	}
	getFile := func() string {
		if loggerValidPath {
			if rel, err := filepath.Rel(loggerProjectPath, file); err == nil {
				return rel
			} else {
				return filepath.Base(file)
			}
		} else {
			return filepath.Base(file)
		}
	}
	return getFile() + getLine()
}

// TODO 日志时间，秒、毫秒
