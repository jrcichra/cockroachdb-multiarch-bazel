#!/bin/bash
set -x
echo "Got architecture $1..."
git clone --branch v22.1.2 https://github.com/cockroachdb/cockroach
cd cockroach
bazel build pkg/cmd/cockroach --config=with_ui --cross=$1
ls -lrt artifacts/
