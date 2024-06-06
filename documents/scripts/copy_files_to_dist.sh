#!/bin/bash

BIN_PATH="$(dirname -- ${0})"
ROOT_PATH="$BIN_PATH/../../../"
SOURCE_PATH="$ROOT_PATH/documents"
DIST_PATH="$ROOT_PATH/dist"

rm -rf $DIST_PATH
mkdir $DIST_PATH

cp $SOURCE_PATH/api/openapi.yml $DIST_PATH
cp $SOURCE_PATH/swagger/* $DIST_PATH
