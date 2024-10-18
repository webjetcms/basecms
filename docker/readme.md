# Docker Image

## Basic information
- Base image `tomcat:9.0.95-jre17-temurin`
- TOMCAT_VERSION `9.0.95`
- CATALINA_HOME `/usr/local/tomcat`
- JAVA_VERSION `jdk-17.0.12+7`
- JAVA_HOME `/opt/java/openjdk`
- WebJet doc base `/home/tomcat/app`
- WebJet static files `/home/tomcat/static_files`

## Build
```bash
/bin/bash ./build.sh
```
It will build two images:
- `webjet:2024.18-app` - for public node deployment
- `webjet:2024.18-cms` - for cms node deployment

## Configuration
- use env variables to configure the image
- for configuration properties use prefix `webjet_`
- for secrets use prefix `BASE64_` and encode the value in base64
- for more information see project `deployment-examples`