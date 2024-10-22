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

## Simple deployment example
For deployment in development environment with one node and database (MariaDB) you can run the following script from [docker](./) directory:
```bash
docker compose --env-file .env.example up -d
```
- it will start two containers and expose ports `80` for WebJET and `3306` for MariaDB
- database is filled from scripts in [db](./db) directory (this happens only on first start if you have mount persistent volume)
- you can access WebJET on [http://localhost:80](http://localhost:80)
- default credentials for admin access ([http://localhost/admin](http://localhost/admin)) are `admin`/`WjDemo123`
- you can access MariaDB on [localhost:3306](localhost:3306)
- for MariaDB default credentials see [.env.example](./.env.example) 
- for more details, see [docker-compose.yml](./docker-compose.yml)