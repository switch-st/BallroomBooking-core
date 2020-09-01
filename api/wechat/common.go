package wechat

import (
	"github.com/switch-st/BallroomBooking-core/config"
)

const urlGetToken string = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=%s&corpsecret=%s"
const urlGetUserInfo string = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=%s&code=%s"

var (
	corpId     string
	agentId    int
	corpSecret string
)

func InitWechat() (bool, error) {
	corpId = config.ServerIns.CorpWeChat.CorpId
	agentId = config.ServerIns.CorpWeChat.AgentId
	corpSecret = config.ServerIns.CorpWeChat.CorpSecret
	return true, nil
}
