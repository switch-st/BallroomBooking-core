package config

func InitConfig(filename string) (ok bool, err error) {
	return InitServerConfig(filename)
}
