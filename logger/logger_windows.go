// +build windows

package logger

func checkLogDirPermit(logDir string) (ok bool, err error) {
	return true, nil
}
