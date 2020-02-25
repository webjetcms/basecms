WebJET CMS
==========

Zakladny projekt pre WebJET CMS

Gradle prikazy
--------------
Pridanim --info ziskate podrobnejsie informacie o behu prikazu

**kompilacia projektu**
gradle compileJava
**kompilacia vratane refreshu kniznic (hlavne ked sa zmeni SNAPSHOT verzia WJ)**
gradle compileJava --refresh-dependencies --info 

**Tomcat**
gradle appRun
gradle appStop

**vybuildovanie distribucneho WAR archivu**
gradle war