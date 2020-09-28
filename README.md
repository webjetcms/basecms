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
