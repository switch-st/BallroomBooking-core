package midware

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type CorsConditionFunc func(c *gin.Context) (ok bool, origin string)

var (
	DefaultCorsFunc = defaultCorsFunc
)

func defaultCorsFunc(c *gin.Context) (ok bool, origin string) {
	return true, c.GetHeader("Origin")
}

func Cors(cond CorsConditionFunc) gin.HandlerFunc {
	if cond == nil {
		cond = DefaultCorsFunc
	}
	return func(c *gin.Context) {
		ok, origin := cond(c)
		if !ok {
			c.AbortWithStatusJSON(http.StatusForbidden, gin.H{
				"code": http.StatusForbidden,
				"msg":  "prohibit cross-domain",
			})
		}

		c.Header("Access-Control-Allow-Origin", origin)
		c.Header("Access-Control-Allow-Headers", "Content-Type, AccessToken,X-CSRF-Token, Authorization, Token, Origin, Referer")
		c.Header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, PATCH, DELETE")
		c.Header("Access-Control-Expose-Headers", "Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type")
		c.Header("Access-Control-Allow-Credentials", "true")
		c.Header("Cache-Control", "no-cache")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(http.StatusNoContent)
		}

		c.Next()
	}
}
