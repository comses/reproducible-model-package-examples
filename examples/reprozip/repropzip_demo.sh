#!/usr/bin/env bash

case "$1" in
  "build")
    docker build -t boltzmann-model-reprozip -f Dockerfile ..
    ;;
  "run")
    docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock \
	    --cap-add=SYS_PTRACE -p 127.0.0.1:8521:8521 boltzmann-model-reprozip bash
    ;;
esac
