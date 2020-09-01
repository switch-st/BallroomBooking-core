package wechat

import (
	"encoding/json"
	"errors"
	"fmt"

	"github.com/switch-st/BallroomBooking-core/util/http_client"
)

type UserInfo struct {
	UserId   string `json:"user_id"`
	OpenId   string `json:"open_id"`
	DeviceId string `json:"device_id"`
}

type UserInfoValue struct {
	ErrCode  int    `json:"errcode"`
	ErrMsg   string `json:"errmsg"`
	UserId   string `json:"UserId"`
	OpenId   string `json:"OpenId"`
	DeviceId string `json:"DeviceId"`
}

func (user *UserInfo) QueryUserInfo(code string) error {
	body, err := http_client.HttpGet(fmt.Sprintf(urlGetUserInfo, token.getToken(), code))
	if err != nil {
		return err
	}

	var userVal UserInfoValue
	err = json.Unmarshal(*body, &userVal)
	if err != nil {
		return err
	}
	if userVal.ErrCode != 0 {
		return errors.New(userVal.ErrMsg)
	}
	user.UserId = userVal.UserId
	user.OpenId = userVal.OpenId
	user.DeviceId = userVal.DeviceId

	return nil
}
