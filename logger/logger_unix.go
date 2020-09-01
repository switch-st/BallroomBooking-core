// +build !windows

package logger

import (
	"fmt"
	"syscall"
)

const (
	R_OK = 0x4
	W_OK = 0x2
	X_OK = 0x1
)

func checkLogDirPermit(logDir string) (ok bool, err error) {
	if err := syscall.Access(logDir, W_OK|X_OK); err != nil {
		return false, fmt.Errorf("check log directory failed, dir: %s, err: %w", logDir, err)
	}
	return true, nil
}
