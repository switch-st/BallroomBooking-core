package rotate_logger

import (
	"io"
	"path/filepath"
	"strings"
	"time"

	rotatelogs "github.com/lestrrat-go/file-rotatelogs"
	"github.com/pkg/errors"
)

type RotateType uint32

func (rt *RotateType) GetFormat() string {
	switch *rt {
	case RtDay:
		return "%Y%m%d"
	case RTHour:
		return "%Y%m%d_%H"
	default:
		return "%Y%m%d"
	}
}

const (
	RtDay RotateType = iota
	RTHour
)

// New rotate log file
func New(filePath string, rType RotateType, maxDays int, maxCount int) (w io.Writer, err error) {
	if absPath, err := filepath.Abs(filePath); err == nil {
		filePath = absPath
	}
	prefix, suffix := func(str string) (string, string) {
		if idx := strings.LastIndex(filePath, "."); idx == -1 {
			return str, ""
		} else {
			return filePath[:idx], filePath[idx:]
		}
	}(filePath)

	var options []rotatelogs.Option
	options = append(options, rotatelogs.WithLinkName(filePath))
	options = append(options, rotatelogs.WithRotationTime(func() time.Duration {
		switch rType {
		case RtDay:
			return 24 * time.Hour
		case RTHour:
			return time.Hour
		default:
			return 24 * time.Hour
		}
	}()))
	if maxDays > 0 {
		options = append(options, rotatelogs.WithMaxAge(time.Duration(maxDays)*24*time.Hour))
	} else {
		if maxCount > 0 {
			options = append(options, rotatelogs.WithMaxAge(-1))
			options = append(options, rotatelogs.WithRotationCount(uint(maxCount)))
		}
	}

	w, err = rotatelogs.New(prefix+"_"+rType.GetFormat()+suffix, options...)
	if err != nil {
		return nil, errors.Errorf("rotate_logger: %w", err)
	}
	return w, nil
}
