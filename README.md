# WebJET CMS

Basic project for WebJET CMS. Ask InterWay to access the WebJET Maven repository, rename the file `gradle.sample.properties` to `gradle.properties` and set the credentials in it.

## Gradle commands

Always use a `gradle wrapper` using `gradlew`, never use your global `gradle` command directly. The command `gradlew` will use the project version of gradle, it will not conflict with your global version.

Add --info to get more detailed information about the command's execution

**project compilation**
```
gradlew compileJava
```

**compiling including rebuilding libraries (especially when the SNAPSHOT version of WJ changes)**

```
gradlew compileJava --refresh-dependencies --info
```

Additional steps may be required in your IDE to update the libraries so that the IDE sees the change. For example in VS Code, the given gradle command must be executed from the Gradle console (the Gradle icon is in the left bar). In `Tasks`, open the `other` node, right-click on `compileJava` and select `Run Task With Args`. Use `--refresh-dependencies --info` as arguments. Alternatively, save the command with arguments to your own list via `Pin Task With Args` option.

**List of dependencies/jar libraries used**
```
gradlew dependencies --configuration default
```

**Tomcat**
```
gradlew appRun
gradlew appStop
```

**Creating the distribution WAR archive**
```
gradlew war
```

## WebJET update

In the file [build.gradle](build.gradle) there is a section ```ext``' in which the version of WebJET CMS used in the project is set:

```javascript
ext {
     webjetVersion = "2024.0-SNAPSHOT";
}
```

in the preview it's version `2024.0-SNAPSHOT`, where ``SNAPSHOT`` means it's the latest version of the 2024 series. The latest version may always contain work-in-progress functionality, so consider using it according to [changelist ](http://docs.webjetcms.sk/latest/en/CHANGELOG).

You can find a list of all available versions in the documentation in the [installation section](http://docs.webjetcms.sk/latest/en/install/README).