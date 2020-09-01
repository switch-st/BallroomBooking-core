GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

TARGET=BallroomBooking-core
MODULE_NAME=github.com/switch-st/BallroomBooking-core
VERSION=$(shell git describe --tags --always --dirty=-dev --match 'v*')
BUILD_FLAG=-ldflags "-X $(MODULE_NAME)/util/logger.loggerProjectPath=`pwd`" -ldflags "-X $(MODULE_NAME)/util/version.versionName=$(VERSION)"
REMOTE_DEST=vps:~/

all: build

build:
	$(GOBUILD) $(BUILD_FLAG) -o $(TARGET) -v

clean:
	$(GOCLEAN)
	rm -f $(TARGET)

cleanall: clean
	$(GOCLEAN) -cache
	rm -f $(TARGET).tgz

gen_table:

tar: build
	tar zcf $(TARGET).tgz $(TARGET) doc/sql/*.sql conf/*.yaml

push: build
	scp $(TARGET) $(REMOTE_DEST)

pushtar: tar
	scp $(TARGET).tgz $(REMOTE_DEST)

