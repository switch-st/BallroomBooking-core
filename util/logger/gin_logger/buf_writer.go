package gin_logger

import (
	"bytes"
	"strings"
)

type bufWriter struct {
	bytes.Buffer
}

func (w *bufWriter) writeKeyMap(keyMap map[string][]string) *bufWriter {
	if w == nil || keyMap == nil {
		return w
	}
	for k, _ := range keyMap {
		_, _ = w.Write([]byte(k))
		_, _ = w.Write([]byte(": "))
		_, _ = w.Write([]byte(strings.Join(keyMap[k], ",")))
		_, _ = w.Write([]byte("; "))
	}
	return w
}

func (w *bufWriter) writeString(v ...string) *bufWriter {
	if w == nil || len(v) == 0 {
		return w
	}
	for idx, _ := range v {
		_, _ = w.Write([]byte(v[idx]))
	}
	return w
}

func (w *bufWriter) writeByte(v ...[]byte) *bufWriter {
	if w == nil || len(v) == 0 {
		return w
	}
	for idx, _ := range v {
		_, _ = w.Write(v[idx])
	}
	return w
}
