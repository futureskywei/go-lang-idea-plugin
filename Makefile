NAME = $(shell basename $(PWD))
VERSION = $(shell grep FROM Dockerfile|head -n 1|cut -d ':' -f2)
DOCKERDATAPATH = $(DATAPATH)/$(NAME)

.PHONY: build stop rm start

build:
	dd if=/dev/urandom of=dockercachebuster.dat bs=1024 count=1 2>&1
	docker build -t $(NAME):$(VERSION) . || exit 1

stop:
	docker stop $(NAME) > /dev/null 2>&1 || true

rm: stop
	docker rm $(NAME) > /dev/null 2>&1 || true

start: rm
	docker run --rm -v `pwd`:/target $(NAME):$(VERSION) cp /data/go-lang-idea-plugin/google-go-language.jar /target
