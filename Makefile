UID:=`id -u`
GID:=`id -g`

all: bin/hello-world

bin/%: src/github.com/ninetails/learning-go/%.go
	docker run --rm -u $(UID):$(GID) -v $(PWD):/go -w /go/src/github.com/ninetails/learning-go golang:latest go build -v -o /go/$@

clean:
	rm -rf bin/*
