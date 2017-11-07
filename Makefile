UID:=`id -u`
GID:=`id -g`

all: clean hello sandbox

%: src/github.com/ninetails/%
	docker run --rm -u $(UID):$(GID) -v $(PWD):/go -w /go/src golang:latest go build -o /go/bin/$@ github.com/ninetails/$@

.PHONY: clean

clean:
	rm -rf bin/*
