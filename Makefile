hello-world:
	docker run --rm -v $(PWD):/go -w /go/src/github.com/ninetails/learning-go golang:latest go build -v -o /go/hello-world
clean:
	rm -rf hello-world
