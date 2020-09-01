package gin_logger

import (
	"bytes"
	"fmt"
	"io"
	"net/url"
	"os"
	"path"
	"strconv"
	"testing/iotest"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"

	"github.com/switch-st/BallroomBooking-core/util/logger/sin_logger"
)

const maxLogBodyLen = 10240

type bodyLogWriter struct {
	gin.ResponseWriter
	bodyBuf    *bytes.Buffer
	bodyWriter io.Writer
	bodyReader io.Reader
	maxLen     int64
}

func (w bodyLogWriter) Write(b []byte) (int, error) {
	_, _ = w.bodyWriter.Write(b)
	return w.ResponseWriter.Write(b)
}

func (w bodyLogWriter) GetBodyReader() io.Reader {
	return w.bodyReader
}

func newBodyLogWriter(c *gin.Context, maxLen int64) *bodyLogWriter {
	bw := &bodyLogWriter{ResponseWriter: c.Writer, bodyBuf: bytes.NewBuffer(nil), maxLen: 0}
	if maxLen >= 0 {
		bw.maxLen = maxLen
		bw.bodyWriter = iotest.TruncateWriter(bw.bodyBuf, maxLen)
	} else {
		bw.bodyWriter = bw.bodyBuf
	}
	bw.bodyReader = bw.bodyBuf
	return bw
}

func setBodyLogWriter(c *gin.Context, w *bodyLogWriter) {
	c.Writer = w
}

type bodyLogReader struct {
	io.ReadCloser
	bodyBuf    *bytes.Buffer
	bodyWriter io.Writer
	bodyReader io.Reader
	maxLen     int64
}

func (w bodyLogReader) Read(p []byte) (n int, err error) {
	n, err = w.ReadCloser.Read(p)
	if n > 0 {
		_, _ = w.bodyWriter.Write(p[:n])
	}
	return
}

func (w bodyLogReader) GetBodyReader() io.Reader {
	return w.bodyReader
}

func newBodyLogReader(c *gin.Context, maxLen int64) *bodyLogReader {
	bw := &bodyLogReader{ReadCloser: c.Request.Body, bodyBuf: bytes.NewBuffer(nil), maxLen: 0}
	if maxLen >= 0 {
		bw.maxLen = maxLen
		bw.bodyWriter = iotest.TruncateWriter(bw.bodyBuf, maxLen)
	} else {
		bw.bodyWriter = bw.bodyBuf
	}
	bw.bodyReader = bw.bodyBuf
	return bw
}

func setBodyLogReader(c *gin.Context, r *bodyLogReader) {
	c.Request.Body = r
}

// TODO add trace log filter
// NewTraceLog new a trace log handle
func NewTraceLog(reqFileName string, resFilename string, maxDays int) gin.HandlerFunc {
	newTraceLog := func(filename string) *logrus.Logger {
		ins, err := sin_logger.New(filename, "", maxDays)
		if err != nil {
			_, _ = fmt.Fprintf(os.Stderr, "New gin trace log failed, err: %v", err)
			return nil
		}
		sin_logger.DisableCaller(ins)
		return ins
	}
	reqLogIns := newTraceLog(reqFileName)
	resLogIns := newTraceLog(resFilename)
	if reqLogIns == nil || resLogIns == nil {
		return nil
	}

	return func(c *gin.Context) {
		reader := newBodyLogReader(c, maxLogBodyLen)
		writer := newBodyLogWriter(c, maxLogBodyLen)
		setBodyLogReader(c, reader)
		setBodyLogWriter(c, writer)

		c.Next()

		method := c.Request.Method
		path_ := path.Clean(c.Request.URL.EscapedPath())
		logChan := make(chan int, 2)

		// req
		go func() {
			buf := bufWriter{}
			header := c.Request.Header
			query, _ := url.ParseQuery(c.Request.URL.RawQuery)

			buf.writeString(method, "|").
				writeString(path_, "|").
				writeString(strconv.FormatInt(c.Request.ContentLength, 10), "|").
				writeKeyMap(header).writeString("|").
				writeKeyMap(query).writeString("|")
			if len(c.Request.PostForm) != 0 {
				buf.writeKeyMap(c.Request.PostForm)
			} else if len(c.Request.MultipartForm.Value) != 0 || len(c.Request.MultipartForm.File) != 0 {
				buf.writeKeyMap(c.Request.MultipartForm.Value).
					writeKeyMap(func() map[string][]string {
						m := make(map[string][]string)
						for key, _ := range c.Request.MultipartForm.File {
							ma := make([]string, 0, len(c.Request.MultipartForm.File[key]))
							for idx, _ := range c.Request.MultipartForm.File[key] {
								ma = append(ma, c.Request.MultipartForm.File[key][idx].Filename)
							}
							m[key] = ma
						}
						return nil
					}())
			} else {
				_, _ = buf.ReadFrom(reader.GetBodyReader())
			}
			buf.writeString("|")
			reqLogIns.Println(buf.Bytes())
			logChan <- 0
		}()

		// resp
		go func() {
			buf := bufWriter{}
			header := c.Writer.Header()

			buf.writeString(method, "|").
				writeString(path_, "|").
				writeString(strconv.Itoa(c.Writer.Status()), "|").
				writeString(strconv.Itoa(c.Writer.Size()), "|").
				writeKeyMap(header).writeString("|")
			_, _ = buf.ReadFrom(writer.GetBodyReader())
			resLogIns.Println(buf.Bytes())

			logChan <- 1
		}()

		<-logChan
		<-logChan
	}
}
