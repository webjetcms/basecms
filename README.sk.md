# WebJET CMS

Základný projekt pre WebJET CMS. Požiadajte InterWay o prístup k WebJET Maven repozitáru, premenujte súbor ```gradle.sample.properties``` na ```gradle.properties``` a nastavte v ňom prihlasovacie údaje.

## Gradle príkazy

Vždy používajte ```gradle wrapper``` použitím ```gradlew```, nikdy nepoužívajte priamo váš globálny ```gradle``` príkaz. Príkaz ```gradlew``` použije projektovú verziu gradle, nebude kolidovať verzia s vašou globálnou verziou.

Pridaním --info získate podrobnejšie informácie o behu príkazu

**kompilácia projektu**
```
gradlew compileJava
```

**kompilácia vrátane obnovenia knižníc (hlavne keď sa zmení SNAPSHOT verzia WJ)**

```
gradlew compileJava --refresh-dependencies --info
```

Vo vašom IDE môžu byť potrebné ďalšie kroky pre aktualizáciu knižníc tak, aby zmenu videlo aj IDE. Napr. vo VS Code je potrebné daný gradle príkaz vykonať z Gradle konzoly (v ľavej lište je ikona Gradle). Otvorte v ```Tasks``` uzol ```other```, kliknite pravým na ```compileJava``` a zvoľte možnosť ```Run Task With Args```. Ako argumenty použite ```--refresh-dependencies --info```. Prípadne si rovno cez možnosť ```Pin Task With Args``` príkaz aj s argumentami uložte do vlastného zoznamu.

**Zoznam závislostí/použitých jar knižníc**
```
gradlew dependencies --configuration default
```

**Tomcat**
```
gradlew appRun
gradlew appStop
```

**Vytvorenie distribučného WAR archívu**
```
gradlew war
```

ak máte WebJET v starom formáte (s rozbalenou štruktúrou kde vidno /admin súbory, všetky komponenty v /components/ aj všetky Java triedy vo /WEB-INF/classes/) môžete použiť:

```
gradlew updatezip
```

ktorý pripraví aktualizačný ZIP súbor v starom formáte. Vo WebJETe nastavte konf. premennú ```updateAllowFileUpload``` na ```true``` a následne môžete použiť vygenerovaný ZIP
balík pre aktualizáciu (cez Ovládací panel->Aktualizácia WebJETu->dole vybrať update.zip a uploadnúť).

## Aktualizácia WebJETu

V súbore [build.gradle](build.gradle) je sekcia ```ext``` v ktorej je nastavená verzia WebJET CMS použitá v projekte:

```javascript
ext {
    webjetVersion = "2023.0-SNAPSHOT";
}
```

v ukážke je to verzia ```2023.0-SNAPSHOT```, pričom ```SNAPSHOT``` znamená, že sa jedná a najnovšiu verziu radu 2023. Najnovšia verzia môže vždy obsahovať rozpracovanú funkcionalitu, takže zvážte jej použitie podľa [zoznamu zmien](http://docs.webjetcms.sk/v2023/#/CHANGELOG).

Zoznam všetkých dostupných verzií nájdete na v dokumentácii v [sekcii inštalácia](http://docs.webjetcms.sk/v2023/#/install/README).
