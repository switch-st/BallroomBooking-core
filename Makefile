GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

TARGET=BallroomBooking-core
BUILD_FLAG=-ldflags "-X github.com/switch-st/BallroomBooking-core/util/logger.loggerProjectPath=`pwd`"
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

