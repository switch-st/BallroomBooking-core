package config

import (
	"fmt"
	"io/ioutil"
	"net"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"gopkg.in/yaml.v2"
)

var (
	ServerIns ServerConf
)

type ServerConf struct {
	filename string
	load     bool
	Server   struct {
		Listen    string `yaml:"listen"`
		BasePath  string `yaml:"base_path"`
		Daemon    bool   `yaml:"daemon"`
		DBStr     string `yaml:"db_string"`
		RedisStr  string `yaml:"redis_string"`
		RedisPass string `yaml:"redis_password"`
	} `yaml:"server"`
	CorpWeChat struct {
		CorpId     string `yaml:"corp_id"`
		AgentId    int    `yaml:"agent_id"`
		CorpSecret string `yaml:"corp_secret"`
	} `yaml:"corp_wechat"`
	Auth struct {
		Domain    string `yaml:"domain"`
		Path      string `yaml:"path"`
		MaxAge    int    `yaml:"max_age"`
		Secure    bool   `yaml:"secure"`
		HttpOnly  bool   `yaml:"http_only"`
		CheckAuth bool   `yaml:"check_auth"`
	} `yaml:"auth"`
	Log struct {
		Level       string `yaml:"level"`
		MaxSaveDays int    `yaml:"max_save_days"`
	} `yaml:"log"`
}

func init() {
	ServerIns.filename = ""
	ServerIns.load = false
}

func InitServerConfig(filename string) (ok bool, err error) {
	ServerIns.filename = filepath.FromSlash(filename)
	return ServerIns.readConf()
}

func (conf *ServerConf) readConf() (ok bool, err error) {
	if conf == nil {
		return false, fmt.Errorf("server conf is nil")
	}
	if conf.filename == "" {
		return false, fmt.Errorf("server conf filename is empty")
	}
	data, err := ioutil.ReadFile(conf.filename)
	if err != nil {
		return false, fmt.Errorf("read config file failed, filename: %s, err: %w", conf.filename, err)
	}

	if err := yaml.Unmarshal(data, conf); err != nil {
		return false, fmt.Errorf("parse config file failed, filename: %s, err: %w", conf.filename, err)
	}

	isValidAddress := func(str string) bool {
		idx := strings.Index(str, ":")
		if idx != -1 {
			ip := str[:idx]
			port := str[idx+1:]
			ip_ := net.ParseIP(ip)
			port_, err := strconv.Atoi(port)
			if ip_ != nil && err == nil && port_ > 0 && port_ < 65536 {
				return true
			}
		}
		return false
	}

	if isValidAddress(conf.Server.Listen) == false {
		return false, fmt.Errorf("config 'server.listen' is an invalid address, address: %s", conf.Server.Listen)
	}
	if basePath, err := filepath.Abs(conf.Server.BasePath); err != nil {
		return false, fmt.Errorf("check config 'server.base_path' failed, err: %w", err)
	} else {
		conf.Server.BasePath = basePath
	}
	if fileInfo, err := os.Stat(conf.Server.BasePath); err != nil {
		return false, fmt.Errorf("check config 'server.base_path' failed, err: %w", err)
	} else if !fileInfo.IsDir() {
		return false, fmt.Errorf("config 'server.base_path' is not an valid directory, base_path: %s", conf.Server.BasePath)
	}
	if conf.Auth.Path == "" {
		conf.Auth.Path = "/api"
	}
	if conf.Auth.MaxAge <= 0 {
		conf.Auth.MaxAge = 30 * 24 * 3600
	}

	conf.load = true
	return true, nil
}
