UID:=`id -u`
GID:=`id -g`
IMAGE:=golang:latest
GO:=docker run --rm -u $(UID):$(GID) -v $(PWD):/go -w /go/src $(IMAGE) go

all: clean hello sandbox

%: src/github.com/ninetails/%
	$(GO) build -o /go/bin/$@ github.com/ninetails/$@

test:
	$(GO) test $(package)

.PHONY: clean

clean:
	rm -rf bin/*
