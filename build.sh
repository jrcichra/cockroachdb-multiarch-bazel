#!/bin/bash
set -x
echo "Got architecture $1..."
git clone --branch v22.1.3 https://github.com/cockroachdb/cockroach
cd cockroach
echo "build --config=crosslinux
build --config nolintonbuild
" >> .bazelrc.user
echo "build --remote_cache=http://127.0.0.1:9867" >> ~/.bazelrc
./dev doctor
./dev build --cross=$1
ls -lrt artifacts/
