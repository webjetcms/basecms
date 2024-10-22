#!/bin/bash

# change the current directory to the directory of the script
cd "$(dirname "$0")" || exit

# set image name and version
IMAGE_NAME_PREFIX="webjetcms"
IMAGE_VERSION="2024.40"
# default project name, if not found in settings.gradle
PROJECT_NAME="default-project-name"

# parse project name from settings.gradle
SETTINGS_GRADLE_FILE="../settings.gradle"
PROPERTY_KEY="rootProject.name"
PROPERTY_VALUE=$(grep "^$PROPERTY_KEY" "$SETTINGS_GRADLE_FILE"|cut -d"'" -f2)
PROJECT_NAME=${PROPERTY_VALUE:-$PROJECT_NAME}

# override image version if provided
if [ -n "$1" ]; then
  echo "overriding IMAGE_VERSION with ${1}"
  IMAGE_VERSION=$1
fi

# build public image
PUBLIC_IMAGE_TAG="${IMAGE_NAME_PREFIX}/${PROJECT_NAME}-public:${IMAGE_VERSION}"
echo "building image ${PUBLIC_IMAGE_TAG}"
docker build \
--target runtime-public \
-t "${PUBLIC_IMAGE_TAG}" \
-f Dockerfile ../

# build admin image
ADMIN_IMAGE_TAG="${IMAGE_NAME_PREFIX}/${PROJECT_NAME}-admin:${IMAGE_VERSION}"
echo "building image ${ADMIN_IMAGE_TAG}"
docker build \
--target runtime-admin \
-t "${ADMIN_IMAGE_TAG}" \
-f Dockerfile ../