package version

var (
	// versionCode set by build flags, like:
	// go build -ldflags "-X $(MODULE_NAME)/util/version.versionCode=xxx"
	versionCode int
	// versionName set by build flags, like:
	// go build -ldflags "-X $(MODULE_NAME)/util/version.versionCode=xxx"
	versionName string
)

func GetVersionCode() int {
	return versionCode
}

func GetVersionName() string {
	return versionName
}
