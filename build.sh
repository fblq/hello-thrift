#!/usr/bin/env bash
mkdir output
go build -o ./output/thrift-client github.com/lnhote/hello-thrift/client
go build -o ./output/thrift-server github.com/lnhote/hello-thrift/server