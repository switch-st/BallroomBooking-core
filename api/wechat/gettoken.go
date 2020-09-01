package wechat

import (
	"encoding/json"
	"fmt"
	"sync"
	"time"

	"github.com/switch-st/BallroomBooking-core/util/http_client"
)

var (
	token AccessToken
)

type AccessToken struct {
	Token  string `json:"token"`
	Expire int64  `json:"expire"`
	mut    sync.Mutex
}

type TokenValue struct {
	ErrCode     int    `json:"errcode"`
	ErrMsg      string `json:"errmsg"`
	AccessToken string `json:"access_token"`
	ExpireIn    int64  `json:"expires_in"`
}

func (token *AccessToken) getToken() string {
	token.mut.Lock()
	defer token.mut.Unlock()

	now := time.Now().Local().Unix()
	if token.Expire > now {
		return token.Token
	}
	token.Expire = now + 60
	if tokenStr := token.generateToken(); tokenStr == "" {
		// try again
		return token.generateToken()
	} else {
		return tokenStr
	}
}

func (token *AccessToken) generateToken() string {
	body, err := http_client.HttpGet(fmt.Sprintf(urlGetToken, corpId, corpSecret))
	if err != nil {
		return ""
	}

	var tokenVal TokenValue
	err = json.Unmarshal(*body, &tokenVal)
	if err != nil {
		return ""
	}
	if tokenVal.ErrCode != 0 {
		return ""
	}
	token.Token = tokenVal.AccessToken
	token.Expire = tokenVal.ExpireIn + time.Now().Local().Unix() - 60

	return tokenVal.AccessToken
}
