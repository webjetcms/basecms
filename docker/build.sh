#!/bin/bash

# set the image name
IMAGE_NAME=webjet:2024.18
echo "default image name = $IMAGE_NAME"

if [ -n "$1" ]; then
  echo "overriding image name with $1"
  IMAGE_NAME=$1
fi

# change the current directory to the directory of the script
cd "$(dirname "$0")"

# build app image
docker build \
--target runtime-app \
-t ${IMAGE_NAME}-app \
-f Dockerfile ../

# build cms image
docker build \
--target runtime-cms \
-t ${IMAGE_NAME}-cms \
-f Dockerfile ../