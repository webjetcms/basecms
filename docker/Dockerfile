# Build app
FROM eclipse-temurin:17 as build

ARG ARTIFACT_NAME=basecms

# Install prerequisites
RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_16.x  | bash - && \
    apt-get -y install nodejs unzip

# Create tomcat user
RUN groupadd tomcat
RUN useradd -g tomcat tomcat

# Create work directory
RUN mkdir /home/app
WORKDIR /home/app

# Copy app source
COPY . .

# Build app
RUN ./gradlew buildAllArtifacts

# Dev workaround - to speed up image build - copy war instead of building it
#COPY build/libs/${ARTIFACT_NAME}.war /home/app/build/libs/${ARTIFACT_NAME}.war
#COPY build/libs/${ARTIFACT_NAME}-public.war /home/app/build/libs/${ARTIFACT_NAME}-public.war

# unzip wars
RUN unzip build/libs/${ARTIFACT_NAME}.war -d build/libs/${ARTIFACT_NAME}
RUN unzip build/libs/${ARTIFACT_NAME}-public.war -d build/libs/${ARTIFACT_NAME}-public

# Copy default poolman
COPY docker/webjet/poolman.xml build/libs/${ARTIFACT_NAME}/WEB-INF/classes/
COPY docker/webjet/poolman.xml build/libs/${ARTIFACT_NAME}-public/WEB-INF/classes/

# Change owner to tomcat
RUN chown -R tomcat:tomcat /home/app

########################################################################################

# Runtime base image
FROM tomcat:9.0.95-jre17-temurin as runtime-base

ARG ARTIFACT_NAME=basecms
ARG TOMCAT_LOCAL_PATH=/docker/tomcat

ENV REDISSON_VERSION=3.22.0

# Install ImageMagick
RUN apt-get update && \
    apt-get -y install imagemagick --no-install-recommends  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf ${CATALINA_HOME}/webapps.dist/*

# Copy redis libraries
RUN curl -o ${CATALINA_HOME}/lib/redisson-all-${REDISSON_VERSION}.jar https://repo1.maven.org/maven2/org/redisson/redisson-all/${REDISSON_VERSION}/redisson-all-${REDISSON_VERSION}.jar
RUN curl -o ${CATALINA_HOME}/lib/redisson-tomcat-9-${REDISSON_VERSION}.jar https://repo1.maven.org/maven2/org/redisson/redisson-tomcat-9/${REDISSON_VERSION}/redisson-tomcat-9-${REDISSON_VERSION}.jar

# Create tomcat user
RUN groupadd tomcat
RUN useradd -g tomcat tomcat
RUN usermod -a -G www-data tomcat

# Create app directory
RUN mkdir -p /home/tomcat/static_files
RUN mkdir -p /home/tomcat/app
RUN chown -R tomcat:tomcat /home/tomcat
RUN chown -R tomcat:www-data /home/tomcat/static_files

# Copy tomcat configuration
COPY ${TOMCAT_LOCAL_PATH}/conf/*.xml ${CATALINA_HOME}/conf/
COPY ${TOMCAT_LOCAL_PATH}/conf/*.properties ${CATALINA_HOME}/conf/
COPY ${TOMCAT_LOCAL_PATH}/conf/*.yaml ${CATALINA_HOME}/conf/
COPY ${TOMCAT_LOCAL_PATH}/conf-examples ${CATALINA_HOME}/conf-examples

# Copy setenv.sh
COPY ${TOMCAT_LOCAL_PATH}/conf/setenv.sh ${CATALINA_HOME}/bin/setenv.sh

# change owner to tomcat
RUN chown -R tomcat:tomcat ${CATALINA_HOME}

# config + secrets for tomcat setenv.sh
RUN touch $CATALINA_HOME/bin/setenv_values.sh && \
    chown tomcat:tomcat $CATALINA_HOME/bin/setenv_values.sh && \
    chmod 700 $CATALINA_HOME/bin/setenv_values.sh

# change user to tomcat
USER tomcat

########################################################################################

# Runtime cms image
FROM runtime-base as runtime-admin

# Copy built app \
COPY --from=build /home/app/build/libs/${ARTIFACT_NAME} /home/tomcat/app

# Start tomcat
CMD ["catalina.sh", "run"]

########################################################################################

# Runtime app image
FROM runtime-base as runtime-public

# Copy built app \
COPY --from=build /home/app/build/libs/${ARTIFACT_NAME}-public /home/tomcat/app

# Start tomcat
CMD ["catalina.sh", "run"]