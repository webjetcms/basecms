# Docker Image

## Basic information
- Base image `tomcat:9.0.95-jre17-temurin`
- TOMCAT_VERSION `9.0.95`
- CATALINA_HOME `/usr/local/tomcat`
- JAVA_VERSION `jdk-17.0.12+7`
- JAVA_HOME `/opt/java/openjdk`
- WebJET doc base `/home/tomcat/app`
- WebJET static files `/home/tomcat/static_files`
- User `tomcat`

## Build
```bash
/bin/bash ./build.sh
```
It will build two images:
- `webjetcms/basecms-public:2024.40` - for public node deployment
- `webjetcms/basecms-admin:2024.40` - for admin node or single node deployment

### Set specific image name and version
Image name is composed of following parts:
- `webjetcms` - image name prefix, script variable `IMAGE_NAME_PREFIX`
- `basecms` - project name, script variable `PROJECT_NAME`
- `admin` or `public` - this is the type of image
- `2024.40` - version of the image, script variable `IMAGE_VERSION`

In your forked project you should edit the `build.sh` script and change variable `IMAGE_NAME_PREFIX`. 
Variable `PROJECT_NAME` is parsed from `settings.gradle` file from `rootProject.name` property.
Version of the image can be set as a parameter of the script `./build.sh`. When not set, it will use default value from `build.sh` script.

Example:

[settings.gradle](../settings.gradle)
```groovy
rootProject.name = 'my-project'
```

[build.sh](./build.sh)
```bash
# ...
IMAGE_NAME_PREFIX="my-client"
# ...
```

run
```bash
./build.sh "v12.23.1"
```

It will build images:
- `my-client/my-project-admin:v12.23.1`
- `my-client/my-project-public:v12.23.1`

## Configuration

### Container configuration
- use `ENV` variables to configure the image
- for configuration properties use prefix `webjet_`
- for secrets use prefix `BASE64_` and encode the value in base64 (see [setenv.sh](./tomcat/conf/setenv.sh) for example)
- for more information see https://docs.webjetcms.sk/latest/sk/install/external-configuration

## Deployment
- for more information see project `deployment-examples`