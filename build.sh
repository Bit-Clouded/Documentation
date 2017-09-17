#!/bin/sh

cd "$(dirname "$0")"

rm -rf ./site
rm -rf ./artifacts
mkdir ./artifacts

mkdocs build

zip ./artifacts/site.zip ./site/* -r
cp ./deploy.sh ./artifacts