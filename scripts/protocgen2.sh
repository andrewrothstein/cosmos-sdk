#!/usr/bin/env bash

# this script is for generating protobuf files for the new google.golang.org/protobuf API

set -eo pipefail

protoc_gen_gopulsar() {
  go install github.com/cosmos/cosmos-proto/cmd/protoc-gen-go-pulsar@latest 2>/dev/null
}

protoc_gen_gopulsar

echo "Generating API module"
(cd proto; buf generate --template buf.gen.pulsar.yaml)

(cd orm/internal; buf generate .)
