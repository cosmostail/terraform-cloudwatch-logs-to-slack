#!/usr/bin/env bash

ROOT_DIR=`pwd`

pip3.8 install --target=./package requests

pushd "$ROOT_DIR/package" &>/dev/null
  zip -r9 ${ROOT_DIR}/../dist/lambda_function.zip .
popd &>/dev/null

zip -g ${ROOT_DIR}/../dist/lambda_function.zip lambda.py

