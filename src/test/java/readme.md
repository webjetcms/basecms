# Selenium E2E testy 
![](https://img.shields.io/badge/selenium-v3.141.59-%2300B400) ![](https://img.shields.io/badge/jUnit-v4.12-%234E9A06) ![](https://img.shields.io/badge/doc-v1.0-blue)

### Umiestnenie
Testy sú uožené v zložke `src/test/java`
V tejto hlavnej zložke zároveň máme všetky ostatné pomocne triedy a zdroje. Celý zvyšok tohto textu sa bude týkať súborov umiestnených v tejto zložke.

### Prvotné nastavenie
1. Najprv nainštalujeme selenium pomocou gradle dependency
 ```sh
 $ gradle build --refresh-dependecy
 ```
2. Na základe operačného systému nastavíme správny chromedriver
otvoríme triedu `/helpers/WebDriverSingleton.java`
V nej nastavíme v metóde `getWebDriverInstance()` používaný operačný systém
-Windows (WIN)
-Linux (LINUX)
-MAC OS (MAC)
```java
public static WebDriver getWebDriverInstance(){
        if (driver==null){
            initialize(Enums.OperatingSystem.WIN);
        }
        return driver;
```
Teraz by už mali byť testy spustitelné aj z vášho lokálneho prostredia.

### Overenie funkčnosti
Pre overenie funkčnosti nastavenia je dobré spustiť `LoginTest.java`.
```java
  @Test
    public void loginTest() {
    }
```
Test  je prázdny, spustia sa len `@Before` a `@After` metódy, ktoré nalogujú užívateľa do WebJetu a ukončia test. Pokiaľ test prejde, vaše nastavenie je správne.

### Štruktúra testov
Všetky spustiteľné testy sú umiestnenie v root (čiže v src/test/java). V tomto umiestnení sa nachádza aj `BaseTest.java`, čo je rodič všetkých testovacích tried.
Každá testovacia trieda môže obsahovať niekoľko test metód, kde každá reprezentuje samostatne spustitelný test. Zároveň môže mať vlastnú `@Before` metódu, ktorá rozširuje tú hlavnú v `BaseTest.java`.
Test následne zavolá `object` reprezentujúci web stránku, na ktorej test bude prebiehať. V teste sa následne využívajú metódy prislúchajúce danému objektu.
##### Zásady tvorby testov
1. Po úspešnom ukončení testu by mal byť stav na stránke rovnaký, ako pôvodne. To znamená, že na účely testovania si samotný test vytvorí potrebné dáta, ktoré na konci zmaže.
2. Každá testovacia trieda by mala využívať len jeden `PageObject`, ktorý reprezentuje testovanú stránku.
3. Pokiaľ logika testu dovolí, každý test by mal byť ukončený jedným, alebo viacerými `Assert` funkciami, ktoré overia správnosť testu.
4. Vyhýbame sa používaniu funkcií Selenia pri písaní testov (rovnako ako nepouživame JUnit pri tvorbe page objektov).