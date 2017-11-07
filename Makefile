UID:=`id -u`
GID:=`id -g`

all: clean hello-world sandbox

%: src/github.com/ninetails/learning-go/%.go
	docker run --rm -u $(UID):$(GID) -v $(PWD):/go -w /go/src golang:latest go build -o /go/bin/$@ github.com/ninetails/learning-go/$@.go

.PHONY: clean

clean:
	rm -rf bin/*
