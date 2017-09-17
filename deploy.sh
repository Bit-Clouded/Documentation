#!/bin/sh

cd "$(dirname "$0")"
echo Uploading to: $1

unzip ./site.zip

aws s3 cp ./site/ s3://$1/ --recursive