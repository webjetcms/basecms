Sem zadaj meno projektu
=======================
Sem zadaj popis projektu



<!--- Needituj nic za touto ciarou, text nizsie sa ti bude aktualizovat z basecms --->
WebJET CMS
==========

Zakladny projekt pre WebJET CMS

Gradle prikazy
--------------
Pridanim --info ziskate podrobnejsie informacie o behu prikazu

**kompilacia projektu**
```
gradle compileJava
```

**kompilacia vratane refreshu kniznic (hlavne ked sa zmeni SNAPSHOT verzia WJ)**
```
gradle compileJava --refresh-dependencies --info 
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

FORK projektu basecms do zakaznickeho projektu
==============================================
Tento postup popisuje fork projektu basecms do zakaznickeho projektu. Gitlab Community neumoznuje toto spravit v jednom kroku, postup je teda zlozitejsi. Forknutemu projektu je potrebne zmenit cestu a potom ho presunut do cieloveho workspace.

- prihlaste sa do Gitlabu a najskor overte, ci existuje zakaznicka skupina (horne menu Groups, napr. NN alebo Uniqa), ak nie, je najskor potrebne vytvori tu. Poziadajte LBA o jej vytvorenie.
- prejdite do projektu basecms https://gitlab.web.iway.local/webjet/basecms
- kliknite na moznost fork https://gitlab.web.iway.local/webjet/basecms/-/forks/new
- POZOR: ako namespace musite zvolit vase meno, nie priamo cielovu zakaznicku skupinu (napr. NN alebo Uniqa), tam sa projekt presunie az po jeho nastaveni
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

Naklonovanie do lokalneho workspace
-----------------------------------
Odporucam si kvoli poriadku v lokalnom workspace vytvarat podadresar pre klienta a az do neho naklonovat projekt. Cize nieco ako:

```
cd workspace
mkdir menoklienta
cd menoklienta
git clone git@gitlab.web.iway.local:menoklienta/projekt.git
cd projekt
```

Zriadenie "cistej" instalacie
-----------------------------
Pre zriadenie cistej instalacie WebJETu (novej databazy) je potrebne:

- zriadit novu databazu na mysql-devel serveri. Je na to script na DEV serveroch: ```dba-newdb.sh meno-databazy```, na servre asi nemate pristup, takze je potrebne poziadat adminov o vytvorrenie danej DB a zaslanie prihlasovacieho hesla. Meno databazy zvykneme pouzivat v tvare:
   - INSTALL_NAME_web (napr. interway_web) pre tabulky WebJET CMS
   - INSTALL_NAME_data (napr. interway_data) pre tabulky zakazkovych modulov
- v subore ```src/main/resources/poolman.xml``` je potrebne zadat JDBC cestu k databaze (tagy driver a url) a prihlasovacie udaje (tagy username a password). Ak sa pouziva aj _data databaza je zduplikujte tag datasource a upravte dbname na INSTALL_NAME_data a prislusne udaje v tagoch url, username a password.
- spustit app server cez ```gradle appRun```, pri starte vypise chybu z dovodu, ze databaza je prazdna
- naplnte DB schemu podla postupu na stranke http://docs.webjetcms.sk/#/install-config/install-webjet/ od casti Naplnenie DB schémy
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

Migracia existujuceho projektu v SVN
----------------------------------------
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

GIT fork update
---------------
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
