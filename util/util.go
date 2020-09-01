package util

import (
	"math/rand"
	"regexp"
	"strings"
	"sync"
	"time"
)

var (
	CookieStr     = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-"
	AsciiStr      = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	AsciiLowerStr = "0123456789abcdefghijklmnopqrstuvwxyz"
	randIns       = rand.New(rand.NewSource(time.Now().UnixNano()))
)

func GetRandomString(src *string, length int) string {
	if src == nil || len(*src) == 0 || length <= 0 {
		return ""
	}

	var result string
	for i := 0; i < length; i++ {
		n := randIns.Intn(len(*src))
		result += (*src)[n : n+1]
	}
	return result
}

func GetSalt(length int) string {
	return GetRandomString(&AsciiLowerStr, length)
}

func GetCookie(length int) string {
	return GetRandomString(&CookieStr, length)
}

var (
	CheckPhoneNo checkPhoneNo
)

type checkPhoneNo struct {
	reg   *regexp.Regexp
	once  sync.Once
	valid bool
}

func (ins *checkPhoneNo) Check(no string) bool {
	ins.once.Do(func() {
		if reg, err := regexp.Compile("^1\\d{10}$"); err == nil {
			ins.valid = true
			ins.reg = reg
		} else {
			ins.valid = false
			ins.reg = nil
		}
	})
	if !ins.valid {
		return false
	}
	return ins.reg.MatchString(no)
}

type CheckEnumString struct {
	enums map[string]bool
}

func (ins *CheckEnumString) Init(enums string, sep string) {
	if len(ins.enums) > 0 {
		return
	}
	ins.enums = make(map[string]bool)
	values := strings.Split(enums, sep)
	for _, v := range values {
		ins.enums[v] = true
	}
}

func (ins *CheckEnumString) Check(val string, sep string) bool {
	values := strings.Split(val, sep)
	for _, v := range values {
		if _, ok := ins.enums[v]; ok == false {
			return false
		}
	}
	return len(values) > 0
}

func (ins *CheckEnumString) CheckOne(val string) bool {
	return ins.enums[val]
}
