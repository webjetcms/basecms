# WebJET CMS

Basic project for WebJET CMS. Uses Spring Boot 4.1.1, Jakarta EE and Tomcat 11 with Java 17 or later. The project uses the Gradle 8.14 wrapper. You can convert old `javax` code to `jakarta` using script [jakarta-migration.sh](ant/jakarta-migration.sh).

## Gradle commands

Always use a `gradle wrapper` using `gradlew`, never use your global `gradle` command directly. The command `gradlew` will use the project version of gradle, it will not conflict with your global version.

Add --info to get more detailed information about the command's execution

### Project compilation

```shell
gradlew compileJava
```

### Compiling including rebuilding libraries (especially when the SNAPSHOT version of WJ changes)

```shell
gradlew compileJava --refresh-dependencies --info
```

Additional steps may be required in your IDE to update the libraries so that the IDE sees the change. For example in VS Code, the given gradle command must be executed from the Gradle console (the Gradle icon is in the left bar). In `Tasks`, open the `other` node, right-click on `compileJava` and select `Run Task With Args`. Use `--refresh-dependencies --info` as arguments. Alternatively, save the command with arguments to your own list via `Pin Task With Args` option.

### List of dependencies/jar libraries used

```shell
gradlew dependencies --configuration default
```

### Local Spring Boot server

Configure `src/main/resources/poolman-local.xml`, then start the application:

```shell
./gradlew bootRun
```

The server uses HTTP port 80, HTTPS port 443 and debugger port 5005. The build generates a development certificate in `build/certificates`; it is excluded from both WARs. Stop the server with Ctrl+C or `./app-stop.sh`. VS Code's existing `Debug` and `Debug Docker XXX` launch configurations now use `bootRun`.

For a new database, use the `Run SETUP` launch configuration. It prompts for a setup token of at least 16 characters. Sign in at `https://localhost/wjerrorpages/setup/setup` as `setup` using that token. After completing setup, stop the server and restart it with the normal launch configuration.

### Creating the distribution WAR archive

```shell
./gradlew verifyBootWar
```

This builds and checks both deployment forms:

- `build/libs/basecms-plain.war`: deploy to external Tomcat 11; contains no embedded Tomcat libraries.
- `build/libs/basecms.war`: Spring Boot WAR, with the embedded container in `WEB-INF/lib-provided`; it can also be deployed to external Tomcat.

`./gradlew buildAllArtifacts` builds the plain admin WAR and `basecms-public.war` for external Tomcat. The Dockerfile consumes these two archives.

Use `bootRun` for local development and the plain WAR on external Tomcat for deployment. Direct `java -jar basecms.war` startup is not yet a supported deployment path: the packed WAR has no filesystem document root, while WebJET's `Tools.getRealPath` and `SetCharacterEncodingFilter` still require one. The setup page can respond despite these errors, so an HTTP 200 alone does not validate this mode.

## Docker containers

Use the `Docker Tomcat 11 Start` VS Code task to build and verify the WAR, build the Tomcat 11 image and start the `basecms-tomcat11` container. It copies `poolman-local.xml` and the development certificate into the container. In that database configuration, use `host.docker.internal` to connect to a database on the host. Ports 80 and 443 must be free. The task follows server logs; Ctrl+C or `Docker Tomcat 11 Stop` stops this container.

For first installation, use `Docker Tomcat 11 SETUP Start`, then restart in normal mode after setup.

There are example docker containers for supported databases in `.devconteiner/db` directory. For first use read the instructions in the [README](.devcontainer/db/README.md) file. In VSCode you can use `Debug Docker XXX` launch configuration to start the container. You need to specify database password in the environment variable `WEBJET_DB_PASS` for the container to start.

```shell
WEBJET_DB_PASS=your_password_here
```

There is also container for `Keycloak` integration in `.devcontainer/keycloak` directory. You can start the container using `Run Task` command and selecting `Docker Keycloak Start/Stop` task. It has pre-configured realm with users and clients for WebJET CMS in [template file](.devcontainer/keycloak/realm-export.json.template). You need to have environment variable `CODECEPT_DEFAULT_PASSWORD` set to the password for the users. more info about `OAuth2` and `Keycloak` setting are in the documentation in [OAuth2 section](https://docs.webjetcms.sk/latest/en/install/oauth2/oauth2).

```shell
CODECEPT_DEFAULT_PASSWORD=your_password_here
```

## WebJET update

The Boot snapshot and WebJET AI dependencies are downloaded from GitHub Packages. Configure `GPR_USER` and `GPR_API_KEY`, or `gpr.user` and `gpr.api-key` in your untracked Gradle properties. The token needs package read access. The first `2026.0-boot-SNAPSHOT` must be published from the WebJET CMS repository before a normal client build can resolve it.

In the file [build.gradle](build.gradle) there is a section `ext` in which the version of WebJET CMS used in the project is set:

```javascript
ext {
     webjetVersion = "2026.0-boot-SNAPSHOT";
}
```

in the preview it's version `2026.0-boot-SNAPSHOT`, where `SNAPSHOT` means it's the latest version of the 2026 series. The latest version may always contain work-in-progress functionality, so consider using it according to [changelog](http://docs.webjetcms.sk/latest/en/CHANGELOG).

You can find a list of all available versions in the documentation in the [installation section](https://docs.webjetcms.sk/latest/en/install/versions).
