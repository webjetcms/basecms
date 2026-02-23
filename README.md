# WebJET CMS

Basic project for WebJET CMS. Uses `JakartaEE` and `Tomcat 11`. The project is built using Gradle. You can convert old `javax` code to `jakarta` using script [jakarta-migration.sh](ant/jakarta-migration.sh).

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

### Tomcat

```shell
gradlew appRun
gradlew appStop
```

### Creating the distribution WAR archive

```shell
gradlew war
```

## Docker containers

There are example docker containers for supported databases in `.devconteiner/db` directory. For first use read the instructions in the [README](.devcontainer/db/README.md) file. In VSCode you can use `Debug Docker XXX` launch configuration to start the container. You need to specify database password in the environment variable `WEBJET_DB_PASS` for the container to start.

```shell
WEBJET_DB_PASS=your_password_here
```

There is also container for `Keycloak` integration in `.devcontainer/keycloak` directory. You can start the container using `Run Task` command and selecting `Docker Keycloak Start/Stop` task. It has pre-configured realm with users and clients for WebJET CMS in [template file](.devcontainer/keycloak/realm-export.json.template). You need to have environment variable `CODECEPT_DEFAULT_PASSWORD` set to the password for the users. more info about `OAuth2` and `Keycloak` setting are in the documentation in [OAuth2 section](https://docs.webjetcms.sk/latest/en/install/oauth2/oauth2).

```shell
CODECEPT_DEFAULT_PASSWORD=your_password_here
```

## WebJET update

In the file [build.gradle](build.gradle) there is a section `ext` in which the version of WebJET CMS used in the project is set:

```javascript
ext {
     webjetVersion = "2026.0-jakarta-SNAPSHOT";
}
```

in the preview it's version `2026.0-jakarta-SNAPSHOT`, where `SNAPSHOT` means it's the latest version of the 2026 series. The latest version may always contain work-in-progress functionality, so consider using it according to [changelog](http://docs.webjetcms.sk/latest/en/CHANGELOG).

You can find a list of all available versions in the documentation in the [installation section](https://docs.webjetcms.sk/latest/en/install/versions).
