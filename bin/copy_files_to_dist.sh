#!/bin/bash

BIN_PATH="$(dirname -- ${0})"
ROOT_PATH="$BIN_PATH/../"
SOURCE_PATH="$BIN_PATH/../document"
DIST_PATH="$BIN_PATH/../dist"

rm -rf $DIST_PATH

cp $SOURCE_PATH/doc/openapi.yml $DIST_PATH/documents
