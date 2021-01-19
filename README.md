Sem zadaj meno projektu
=======================
Sem zadaj popis projektu



<!--- Needituj nic za touto ciarou, text nizsie sa ti bude aktualizovat z basecms --->
# WebJET CMS

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Sem zadaj meno projektu](#sem-zadaj-meno-projektu)
- [WebJET CMS](#webjet-cms)
  - [Gradle prikazy](#gradle-prikazy)
  - [Aktualizácia WebJETu](#aktualizácia-webjetu)
- [FORK projektu basecms do zakaznickeho projektu](#fork-projektu-basecms-do-zakaznickeho-projektu)
  - [Naklonovanie do lokalneho workspace](#naklonovanie-do-lokalneho-workspace)
  - [Zriadenie "cistej" instalacie](#zriadenie-cistej-instalacie)
  - [Migracia existujuceho projektu v SVN](#migracia-existujuceho-projektu-v-svn)
  - [GIT fork update](#git-fork-update)
  - [Zriadenie prostredia na TAU-XXX](#zriadenie-prostredia-na-tau-xxx)

<!-- /code_chunk_output -->

Základný projekt pre WebJET CMS

## Gradle prikazy
Pridaním --info získate podrobnejšie informácie o behu príkazu

**kompilácia projektu**
```
gradle compileJava
```

**kompilácia vrátane refreshu knižníc (hlavne keď sa zmení SNAPSHOT verzia WJ)**
```
gradle compileJava --refresh-dependencies --info
```

Vo vašom IDE môžu byť potrebné ďaľšie kroky pre aktualizáciu knižníc tak, aby zmenu videlo aj IDE. Napr. vo VS Code je potrebné daný gradle príkaz vykonať z Gradle konzoly (v ľavej lište je ikona Gradle). Otvorte v taskoch uzol other, kliknite pravým na ```compileJava``` a zvoľte možnosť ```Run Task With Args```. Ako argumenty použite ```--refresh-dependencies --info```. Prípadne si rovno cez možnosť ```Pin Task With Args``` príkaz aj s argumentami uložte do vlastného zoznamu.

**Zoznam závislostí/použitých jar knižníc**
```
gradle dependencies --configuration default
```

**Tomcat**
```
gradle appRun
gradle appStop
```

**vybuildovanie distribucneho WAR archivu**
```
gradle war
```

ak máte WebJET v starom formáte (s rozbalenou štruktúrou kde vidno /admin súbory, všetky komponenty v /components/ aj všetky Java triedy vo /WEB-INF/classes/) môžete použiť:

```
gradle updatezip
```

ktorý pripraví aktualizačný ZIP súbor v starom formáte. Vo WebJETe nastavte konf. premennú updateAllowFileUpload na true a následne môžete použiť vygenerovaný ZIP
balik pre aktualizáciu (cez Ovládací panel->Aktualizácia WebJETu->dole vybrať update.zip a uploadnúť).

## Aktualizácia WebJETu

V súbore [build.gradle](build.gradle) je sekcia ```ext``` v ktorej je nastavená verzia WebJET CMS použitá v projekte:

```javascript
ext {
    webjetVersion = "8.8-SNAPSHOT";
}
```

v ukážke je to verzia 8.8-SNAPSHOT, pričom SNAPSHOT znamená, že sa jedná a najnovšiu verziu radu 8.8. Najnovšia verzia môže vždy obsahovať rozpracovanú funkcionalitu, takže zvážte jej použitie podľa súboru /admin/changelog.txt vo WebJETe.

Zoznam všetkých dostupných verzií nájdete na našom [artifactory/maven serveri](http://maven.web.iway.local/ui/repos/tree/General/gradle-dev-local%2Fsk%2Fiway%2Fwebjet) v sekcii Artifactory/Artifacts po rozkliknutí package gradle-dev-local/sk/iway/webjet.

POZOR: verzia SNAPSHOT nie je automatický nočný build (nightly build). Ak nastave zmena priamo v SVN kóde WebJET CMS je potrebné požiadať produktový tím o buildnutie novej snapshot verzie WebJET CMS.

# FORK projektu basecms do zakaznickeho projektu

Tento postup popisuje fork projektu basecms do zákazníckeho projektu. Gitlab Community neumožňuje toto spraviť v jednom kroku, postup je teda zložitejší. Forknutému projektu je potrebné zmeniť cestu a potom ho presunúť do cieľového workspace.

- prihlaste sa do Gitlabu a najskor overte, ci existuje zakaznicka skupina (horne menu Groups, napr. NN alebo Uniqa), ak nie, je najskor potrebne vytvori [novu zakaznicku skupinu](https://gitlab.web.iway.local/groups/new).
- prejdite do projektu basecms https://gitlab.web.iway.local/webjet/basecms
- kliknite na moznost fork https://gitlab.web.iway.local/webjet/basecms/-/forks/new
- POZOR: ako **namespace** musite zvolit **vase meno**, nie priamo cielovu zakaznicku skupinu (napr. NN alebo Uniqa), tam sa projekt presunie az po jeho nastaveni
- zvolte namespace podla vasho mena, napr. Lubos Balat, projekt basecms sa sem forkne
- v menu kliknite na Settings/General a upravte meno projektu, popis a zvolte obrazok avataru (ak nemate, stiahnite si obrazok z grupy), kliknite na Save changes
- stale v casti Settings/General kliknite na Expand vedla moznosti Advanced (uplne dole), v casti Change path upravte URL cestu z basecms na meno projektu (bez medzier, diakritiky, velkych pismen, napr. nnweb2020) a kliknite na Change path
- vsimnite si URL, zadanu cestu by ste mali vidiet aj v URL
- stale v casti Settings/General kliknite na Expand vedla moznosti Advanced (uplne dole), v casti Transfer project vyberte zakaznicku skupinu (napr. NN) a kliknite na Transfer project. Potvrdte to menom projektu a kliknite na Confirm.
- vsimnite si URL, mali by ste vidiet, ze URL obsahuje meno klienta aj meno projektu, cize z povodneho /lbalat/basecms uz mate nieco ako /nn/nnweb2020/

Poznamka: URL meno projektu som schvalne zvolil aj s menom skupiny, cize nnweb2020 pretoze sa potom lepsie orientuje vo VS Code kde v hlavicke vidite nazov projektu, hned viem, ze je to NN, keby nazov bol len web2020 tak sa ku koncu roka moze stat, ze budete mat otvorenych viacero projektov web2020 a nebudete sa v tom dobre orientovat.

Po vytvoreni projektu mozete skontrolovat prava v Settings/Members, odporucam ludi definovat priamo na skupine, nie na projekte.

Nasledne upravte meno projektu v subore settings.gradle (vsetko malymi pismenami bez medzier):

```
rootProject.name = 'menoprojektu'
```

**POZOR:** menoprojektu sa musí zhodovať s menom adresára projektu, čiže poslednou časťou URL adresy (napr. nnweb2020). Inak vám vo VS Code budú vznikať [chyby typu](https://github.com/redhat-developer/vscode-java/issues/1607) ```vscode project description file (.project) is out of sync with the file system```, respektíve budú sa zobrazovať nezmyselné chyby, že nevie nájsť package ```org.springframework``` a podobne.

## Naklonovanie do lokalneho workspace

Odporucam si kvoli poriadku v lokalnom workspace vytvarat podadresar pre klienta a az do neho naklonovat projekt. Cize nieco ako:

```
cd workspace
mkdir menoklienta
cd menoklienta
git clone git@gitlab.web.iway.local:menoklienta/projekt.git
cd projekt
```

## Zriadenie "cistej" instalacie

Pre zriadenie cistej instalacie WebJETu (novej databazy) je potrebne:

- zriadit novu databazu na mysql-devel serveri. Je na to script na DEV serveroch: ```dba-newdb.sh meno-databazy```, na servre asi nemate pristup, takze je potrebne poziadat adminov o vytvorrenie danej DB a zaslanie prihlasovacieho hesla. Meno databazy zvykneme pouzivat v tvare:
   - INSTALL_NAME_web (napr. interway_web) pre tabulky WebJET CMS
   - INSTALL_NAME_data (napr. interway_data) pre tabulky zakazkovych modulov
- v subore ```src/main/resources/poolman.xml``` je potrebne zadat JDBC cestu k databaze (tagy driver a url) a prihlasovacie udaje (tagy username a password). Ak sa pouziva aj _data databaza je zduplikujte tag datasource a upravte dbname na INSTALL_NAME_data a prislusne udaje v tagoch url, username a password.
- spustit app server cez ```gradle appRun```, pri starte vypise chybu z dovodu, ze databaza je prazdna
- pokracujte podla postupu na stranke http://docs.webjetcms.sk/#/install-config/install-webjet/ od casti Naplnenie DB schémy
- po naplneni DB schemy sa nemusi vzdy app server restartnut, ak sa dlhsie nic nedeje, jednoducho ho zastavte a nastartujte nanovo, nasledne uz by vam malo fungovat prihlasenie do administracie

Priklady tagov driver a url pre podporovane databazy:

```
#MariaDB/MySQL
   <driver>com.mysql.jdbc.Driver</driver>
   <url>jdbc:mysql://meno.db.servera/meno_databazy</url>

#Microsoft SQL - dokumentacia http://jtds.sourceforge.net/faq.html#urlFormat
   <driver>net.sourceforge.jtds.jdbc.Driver</driver>
   <url>jdbc:jtds:sqlserver://meno.db.servera:1433/meno_databazy;encoding=utf-8</url>

#Oracle
   <driver>oracle.jdbc.OracleDriver</driver>
   <url>jdbc:oracle:thin:@meno.db.servera:1521/meno.sql.instancie</url>
```

## Migracia existujuceho projektu v SVN

Ak mate existujuci projekt v SVN (alebo niekde) je potrebne vykonat dodatocne kroky po naforkovani basecms projektu:

Ak este neexistuje DEV databaza (kopirujete novu z produkcie):
- skopirovat zalohu DB zo servis.srv.iway.local/Tomcat-SQLdump
- zriadit novu databazu na mysql-devel serveri. Je na to script na DEV serveroch: ```dba-newdb.sh meno-databazy```, na servre asi nemate pristup, takze je potrebne poziadat adminov o vytvorrenie danej DB a zaslanie prihlasovacieho hesla. Admini vam pripadne vedia do danej DB skopirovat rovno aj zalohu. Niektore instalacie pouzivaju 2 databazy - meno_web a meno_data, nezabudnite vytvorit a skopirovat obe.
- pre ine databazy ako MariaDB poziadajte adminov o pripravu DEV databazy
- ***skopirovanu DB z produkcie je potrebne precistit (vymazat data)***:
   - zmazat (idealne cez truncate table) tabulky _adminlog_, email, documents_history
   - skontrolovat ulohy na pozadi v tabulke crontab, overit na ulohach domenu (aby sa nestalo, ze sa zavola 2x na domenu produkcie), idealne co najviac uloh zmazat
   - zmazat tabulky statistik (ja ich oznacim a zmazem cele tabulky konciace na _YYYY_MM), statistiky mozete lahko zmazat aj cez modul Mazanie dat vo WebJETe

Nasledne ked mate databazu pripravenu:
- do forknuteho projektu skopirovat Java triedy (```sk.iway.INSTALL_NAME```), komponenty (```/components/INSTALL_NAME```), sablony (```/templates/INSTALL_NAME```) daneho projektu a pripadne aspon zakladne obrazky (typu ```/images/css``` aby sa zobrazila homepage a substranky s obrazkami layoutu)
- casto sa stava, ze su zavislosti medzi projektami a potom nejdu triedy skompilovat. To odporucam riesit refaktorom kodu tak, aby v projekte INSTALL_NAME nebola zavislost na package mimo tohto projektu. Danu metodu a triedu odporucam skopirovat do package sk.iway.INSTALL_NAME a refaktorovat zavislosti
- v subore ```src/main/resources/poolman.xml``` je potrebne zadat JDBC cestu k databaze (tagy driver a url) a prihlasovacie udaje (tagy username a password). Bud podla povodneho projektu v SVN ak robite migraciu alebo podla novo zriadenej databazy. Ak sa pouziva aj _data databaza je zduplikujte tag datasource a upravte dbname na INSTALL_NAME_data a prislusne udaje v tagoch url, username a password.

Prakticky identicky postup je aj pre skopirovanie ukazkovych sablon typu http://idsk.webjetcms.sk. Rozdiel je v:

- databaza ukazkovych sablon je na mysql-devel, je potrebne spravit jej dump (kedze mysql-devel sa nezalohuje) a restornut do novo vytvorenej databazy podla mena projektu
- odporucam pridat konfiguracnu premennu ```logInstallName``` s menom projektu. Vyhoda je v tom, ze komponenty sa budu citat z adresarov logInstallName ak existuju, inak sa budu citat z povodneho installName. Viete tak lahko customizovat komponenty pre vasu instalaciu.

Zvazte tiez nastavenie pre externe ukladanie suborov, pri migracii z SVN mozete mat subory priamo v GITe, alebo pouzivate externe ulozistko. Jedna sa o konfiguracne premenne ```enableStaticFilesExternalDir``` a ```cloudStaticFilesDir```.

Pre cistenie dat v databaze mozete ako zaklad pouzit nasledovne SQL prikazy:

```sql
#zmazanie nepotrebnych dat
TRUNCATE TABLE _adminlog_;
TRUNCATE TABLE documents_history;
TRUNCATE TABLE emails;
TRUNCATE TABLE monitoring;

#ak nutne nepotrebujete formulare odporucam zmazat aj tie
TRUNCATE TABLE forms;
TRUNCATE TABLE forms_archive;

#nastavenie multidomainAdminHostu na iwcm.interway.sk
UPDATE _conf_ SET value="iwcm.interway.sk" WHERE name="multiDomainAdminHost";

#ak lokalne nepouzivate SSL mozete ho tymto vypnut
UPDATE _conf_ SET value="false" WHERE name="adminRequireSSL";
UPDATE documents SET require_ssl=false;

#pre istotu zmena email adries, aby sa nieco neposlalo kde sa nema
UPDATE users SET email=concat(login, '@donotwork.interway.sk') WHERE email NOT LIKE '%@interway.sk';

#vypnutie CRON uloh nastavenim pola rok do minulosti, ktore sa odkazuju na http adresu
UPDATE crontab SET year=2013 WHERE extrainfo LIKE '%http%';

#nastavenie pristupov len pre IWAY adresy
DELETE FROM _conf_ WHERE name='adminEnableIPs';
INSERT INTO _conf_ (name, value) VALUES ('adminEnableIPs','127.0.0.1,10.,192.168.,195.168.35.4,195.168.35.5,62.65.161.197');
DELETE FROM _conf_ WHERE name='webEnableIPs';
INSERT INTO _conf_ (name, value) VALUES ('webEnableIPs','#localhost,127.0.0.1,10.,192.168.,#interway,85.248.107.8,195.168.35.4,195.168.35.5,62.65.161.197,#klient,');

#nastavenie logLevelu na debug a pre package sk.iway.iwcm.io na INFO
UPDATE _conf_ SET value='debug' WHERE name='logLevel';
DELETE FROM _conf_ WHERE name='logLevels';
INSERT INTO _conf_ (name, value) VALUES ('logLevels', 'sk.iway.iwcm.io=INFO')

#po starte este zmazte staru statistiku cez Ovladaci panel->Mazanie dat->Statistika
```

## GIT fork update

Po forku tohto projektu je mozne robit synchronizaciu z upstream servera (cize zmeny z basecms).
Ak teda v basecms upravime konfiguraciu v build.gradle mozete si to fetchnut a mergnut s pripadnymi vasimi zmenami.

```
git remote add upstream git@gitlab.web.iway.local:webjet/basecms.git
git pull
git fetch upstream
git merge upstream/master
..kontrola suborov..
git push
```

## Zriadenie prostredia na TAU-XXX

Pre zriadenie prostredia na tau-xxx je potrebne:

- na serveri vytvorit adresar pre WebJET, cize nieco ako:
```sh
mkdir /www/tomcat_au27/webapps/menoprojektu
chown tomcat_au27:tomcat_au27 /www/tomcat_au27/webapps/menoprojektu
chmod g+w /www/tomcat_au27/webapps/menoprojektu
```
  - tomcat_au27 = meno aplikacneho servera
  - menoprojektu = hodnota z [settings.gradle](settings.gradle), verim, ze ste ju pri forku projektu nezabudli zmenit z basecms na skutocne meno projektu
- upravit konfiguraciu Tomcatu:
```sh
nano /www/tomcat_au27/conf/server.xml

#pridat na koniec pred </Engine> element
      <Host name="menoprojektu.tau27.iway.sk" debug="0" appBase="webapps2" unpackWARs="false" autoDeploy="false">
        <Context path="" docBase="../webapps/menoprojektu" reloadable="true" debug="0" swallowOutput="true">
            <Resources allowLinking="true" />
        </Context>
        <Valve className="org.apache.catalina.valves.RemoteIpValve"
                remoteIpHeader="x-forwarded-for" protocolHeader="x-forwarded-proto" />
      </Host>
```

**TIP:** zriadenie adresára by malo byť možné aj priamo vytvorením adresára cez \\servis\Webapps-XXX a konfigurácie Tomcatu je možné upravovať cez \\servis\\TomcatConf, čiže bez SSH prístupu na server.

- nastavit Git pipeline na skopirovanie projektu z Gitlabu do daneho adresara:
  - skopirovat ukazkovy subor [gitlab-ci-sample.yml](.gitlab-ci-sample.yml) do gitlab-ci.yml
  - upravit kod v [build.gradle](build.gradle) v tasku rsyncExplodedWar:
   ```
      commandLine "/usr/local/bin/wj-rsync.sh","webjet4.dev.iway.sk","build/explodedWar","/www/tomcat_au27/webapps/${rootProject.name}","tomcat_au27.service","tomcat_au27"
   ```
   - webjet4.dev.iway.sk = meno servera
   - /www/tomcat_au27/webapps/${rootProject.name} = meno adresara, pricom ${rootProject.name} sa berie z [settings.gradle](settings.gradle)
   - tomcat_au27.service = meno sluzby, na ktorej sa vykona restart
   - tomcat_au27 = meno usera, pod ktorym sa subory skopiruju
   - pipeline je potrebne spustit manualne v Gitlabe v menu CI-CD a overit, ze sa subory nakopirovali po builde na server do adresara /www/tomcat_au27/webapps/menoprojektu

- restartnut Tomcat