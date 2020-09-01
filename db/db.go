package db

import (
	"github.com/gomodule/redigo/redis"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"

	"github.com/switch-st/BallroomBooking-core/config"
	"github.com/switch-st/BallroomBooking-core/logger"
)

var (
	BookIns  *gorm.DB
	RedisIns redis.Conn
)

// TODO 所有的表都要增加DeletedAt，软删除，不能真的删除，目的：做数据保护，防止客户经理恶意删除信息
func InitDatabase() (ok bool, err error) {
	if BookIns, err = gorm.Open("mysql", config.ServerIns.Server.DBStr); err != nil {
		return false, err
	}

	BookIns.SetLogger(logger.LogInsDB)
	BookIns.LogMode(true)

	if RedisIns, err = redis.Dial("tcp", config.ServerIns.Server.RedisStr,
		redis.DialPassword(config.ServerIns.Server.RedisPass)); err != nil {
		return false, err
	}

	return true, nil
}
