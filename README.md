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

GIT fork update
---------------
Po forku tohto projektu je mozne robit synchronizaciu z upstream servera:

git remote add upstream git@gitlab.web.iway.local:webjet/basecms.git
git fetch upstream
git merge upstream/master

a nasledne si mergnut zmeny z upstream/master