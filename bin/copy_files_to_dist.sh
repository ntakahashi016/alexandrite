#!/bin/bash

BIN_PATH="$(dirname -- ${0})"
ROOT_PATH="$BIN_PATH/.."
SOURCE_PATH="$ROOT_PATH/documents"
DIST_PATH="$ROOT_PATH/dist"

rm -rf $DIST_PATH

mkdir $DIST_PATH/documents
cp $SOURCE_PATH/doc/openapi.yml $DIST_PATH/documents
