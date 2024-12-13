create table _adminlog_
(
    log_id         int(4) unsigned auto_increment
        primary key,
    log_type       int(4) default 0  null,
    user_id        int(4) default -1 not null,
    create_date    datetime          not null,
    description    text              null,
    sub_id1        int(4) default 0  null,
    sub_id2        int(4) default 0  null,
    ip             varchar(128)      null,
    hostname       varchar(255)      null,
    operation_type int               null
);

create index IX_adminlog_logtype
    on _adminlog_ (log_type);

create index IX_adminlog_userid
    on _adminlog_ (user_id);

create table _conf_
(
    name         varchar(255) default '' not null,
    value        text                    not null,
    date_changed datetime                null,
    constraint name
        unique (name)
);

INSERT INTO _conf_ (name, value, date_changed) VALUES ('defaultDisableUpload', 'false', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('disableWebJETToolbar', 'true', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('inlineEditingEnabled', 'true', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('installName', 'webjet', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('logLevel', 'debug', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('showDocActionAllowedDocids', '4', null);
INSERT INTO _conf_ (name, value, date_changed) VALUES ('smtpServer', 'smtp.local', null);
create table _conf_prepared_
(
    name           varchar(255) default '' not null,
    value          text                    not null,
    date_changed   datetime                null,
    date_prepared  datetime                null,
    user_id        int                     null,
    id             int auto_increment
        primary key,
    date_published datetime                null
);

create table _db_
(
    id          int(4) unsigned,
    create_date date         default '2000-01-01' not null,
    note        varchar(255) default ''           not null
);

create index id
    on _db_ (id);

alter table _db_
    modify id int(4) unsigned auto_increment;

INSERT INTO _db_ (id, create_date, note) VALUES (1, '2003-12-06', 'ukladanie poznamky a prihlaseneho usera k formularom');
INSERT INTO _db_ (id, create_date, note) VALUES (2, '2003-12-12', 'sposob zobrazenia menu pre adresar');
INSERT INTO _db_ (id, create_date, note) VALUES (3, '2003-12-21', 'atributy suborov');
INSERT INTO _db_ (id, create_date, note) VALUES (4, '2003-12-29', 'od teraz sa kontroluje aj admin, ci je autorizovany, takze nastavime default');
INSERT INTO _db_ (id, create_date, note) VALUES (5, '2004-01-04', 'uklada k formularu aj docid (ak sa podari zistit)');
INSERT INTO _db_ (id, create_date, note) VALUES (6, '2004-01-09', 'typ skupiny pouzivatelov, 0=perms, 1=email, 2=...');
INSERT INTO _db_ (id, create_date, note) VALUES (7, '2004-01-10', 'email je mozne posielat uz len ako URL, text sa priamo napisat neda');
INSERT INTO _db_ (id, create_date, note) VALUES (8, '2004-01-11', 'verifikacia subscribe k email newslettrom, po autorizacii emailom sa user_groups zapise do tabulky users');
INSERT INTO _db_ (id, create_date, note) VALUES (9, '2004-01-13', 'zoznam foldrov (/images/nieco...) do ktorych ma user pravo nahravat obrazky a subory');
INSERT INTO _db_ (id, create_date, note) VALUES (10, '2004-01-25', 'volne pouzitelne polia pre kalendar podujati');
INSERT INTO _db_ (id, create_date, note) VALUES (11, '2004-02-11', 'casova notifikacia pre kalendar podujati');
INSERT INTO _db_ (id, create_date, note) VALUES (12, '2004-02-15', 'virtualne cesty k strankam, napr. www.server.sk/products');
INSERT INTO _db_ (id, create_date, note) VALUES (13, '2004-02-17', 'uvodny text notifikacie kalendara, moznost poslat SMS');
INSERT INTO _db_ (id, create_date, note) VALUES (14, '2004-02-24', 'ak je true, dava navstevnik suhlas na zobrazenie na webe');
INSERT INTO _db_ (id, create_date, note) VALUES (15, '2004-02-28', 'urychlenie statistiky');
INSERT INTO _db_ (id, create_date, note) VALUES (16, '2004-01-03', 'zvacsenie poli');
INSERT INTO _db_ (id, create_date, note) VALUES (17, '2004-03-03', 'urychlenie nacitania virtual paths');
INSERT INTO _db_ (id, create_date, note) VALUES (18, '2004-03-05', 'konfiguracia webjetu (namiesto web.xml)');
INSERT INTO _db_ (id, create_date, note) VALUES (19, '2004-03-07', 'disabled items pouzivatelov');
INSERT INTO _db_ (id, create_date, note) VALUES (20, '2004-03-07', 'rozdelenie full name na meno a priezvisko');
INSERT INTO _db_ (id, create_date, note) VALUES (21, '2004-03-08', 'volne pouzitelne polozky');
INSERT INTO _db_ (id, create_date, note) VALUES (22, '2004-03-12', 'url nazov adresara');
INSERT INTO _db_ (id, create_date, note) VALUES (23, '2004-03-15', 'implemetacia rozdelenia full name');
INSERT INTO _db_ (id, create_date, note) VALUES (24, '2004-03-15', 'Konverzia pristupovych prav');
INSERT INTO _db_ (id, create_date, note) VALUES (25, '2004-03-18', 'custom zmena textov v properties suboroch');
INSERT INTO _db_ (id, create_date, note) VALUES (26, '2004-03-27', 'uprava statistik (eviduje sa id adresara)');
INSERT INTO _db_ (id, create_date, note) VALUES (27, '2004-03-28', 'statistika query vo vyhladavacoch');
INSERT INTO _db_ (id, create_date, note) VALUES (28, '2004-04-05', 'mod schvalovania adresara (0=approve, 1=notify, 2=none)');
INSERT INTO _db_ (id, create_date, note) VALUES (29, '2004-03-05', 'konfiguracia webjetu (namiesto web.xml)');
INSERT INTO _db_ (id, create_date, note) VALUES (30, '2004-03-07', 'disabled items pouzivatelov');
INSERT INTO _db_ (id, create_date, note) VALUES (31, '2004-03-07', 'rozdelenie full name na meno a priezvisko');
INSERT INTO _db_ (id, create_date, note) VALUES (32, '2004-03-08', 'volne pouzitelne polozky');
INSERT INTO _db_ (id, create_date, note) VALUES (33, '2004-03-12', 'url nazov adresara');
INSERT INTO _db_ (id, create_date, note) VALUES (34, '2004-03-18', 'custom zmena textov v properties suboroch');
INSERT INTO _db_ (id, create_date, note) VALUES (35, '2004-03-27', 'uprava statistik (eviduje sa id adresara)');
INSERT INTO _db_ (id, create_date, note) VALUES (36, '2004-03-28', 'statistika query vo vyhladavacoch');
INSERT INTO _db_ (id, create_date, note) VALUES (37, '2004-04-05', 'mod schvalovania adresara (0=approve, 1=notify, 2=none)');
INSERT INTO _db_ (id, create_date, note) VALUES (38, '2004-05-01', 'id a stav synchronizacie (status: 0=novy, 1=updated, 2=synchronized)');
INSERT INTO _db_ (id, create_date, note) VALUES (39, '2004-05-02', 'konfiguracia custom modulov');
INSERT INTO _db_ (id, create_date, note) VALUES (40, '2004-05-03', 'modul posielania SMS sprav');
INSERT INTO _db_ (id, create_date, note) VALUES (41, '2004-05-09', 'vyzadovanie schvalovania registracie, doc_id pre zasielany email');
INSERT INTO _db_ (id, create_date, note) VALUES (42, '2024-10-11', '18.5.2004 [jeeff] vo vyhladavani statistiky sa eviduje remote host');
INSERT INTO _db_ (id, create_date, note) VALUES (43, '2024-10-11', '24.5.2004 [jeeff] tabulka s tipmi dna');
INSERT INTO _db_ (id, create_date, note) VALUES (44, '2024-10-11', '9.6.2004 [joruz] zoznam alarmov pre notifikaciu registracie');
INSERT INTO _db_ (id, create_date, note) VALUES (45, '2024-10-11', '9.6.2004 [joruz] alarm pouzivatela pre notifikaciu registracie');
INSERT INTO _db_ (id, create_date, note) VALUES (46, '2024-10-11', '9.8.2004 [jeeff] html kod do hlavicky pre adresar');
INSERT INTO _db_ (id, create_date, note) VALUES (47, '2024-10-11', '10.8.2004 [jeeff] kalendar s meninami');
INSERT INTO _db_ (id, create_date, note) VALUES (48, '2024-10-11', '10.8.2004 [jeeff] banner system - banner_banners');
INSERT INTO _db_ (id, create_date, note) VALUES (49, '2024-10-11', '10.8.2004 [jeeff] banner system - banner_stat_clicks');
INSERT INTO _db_ (id, create_date, note) VALUES (50, '2024-10-11', '10.8.2004 [jeeff] banner system - banner_stat_views');
INSERT INTO _db_ (id, create_date, note) VALUES (51, '2024-10-11', '18.8.2004 [joruz] casovanie ankiet-zaciatok');
INSERT INTO _db_ (id, create_date, note) VALUES (52, '2024-10-11', '18.8.2004 [joruz] casovanie ankiet-koniec');
INSERT INTO _db_ (id, create_date, note) VALUES (53, '2024-10-11', '22.8.2004 [jeeff] id stranky s prihlasovacim dialogom');
INSERT INTO _db_ (id, create_date, note) VALUES (54, '2024-10-11', '22.8.2004 [jeeff] id stranky s prihlasovacim dialogom-documents');
INSERT INTO _db_ (id, create_date, note) VALUES (55, '2024-10-11', '22.8.2004 [jeeff] id stranky s prihlasovacim dialogom-documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (56, '2024-10-11', '11.9.2004 [jeeff] docid menu na pravej strane');
INSERT INTO _db_ (id, create_date, note) VALUES (57, '2024-10-11', '11.9.2004 [jeeff] docid menu na pravej strane-documents');
INSERT INTO _db_ (id, create_date, note) VALUES (58, '2024-10-11', '11.9.2004 [jeeff] docid menu na pravej strane-documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (59, '2024-10-11', '14.9.2004 [joruz] anketa - aktivny / neaktivny stav');
INSERT INTO _db_ (id, create_date, note) VALUES (60, '2024-10-11', '25.9.2004 [joruz] hodnotenie stranok');
INSERT INTO _db_ (id, create_date, note) VALUES (61, '2024-10-11', '29.9.2004 [jeeff] generator primarnych klucov');
INSERT INTO _db_ (id, create_date, note) VALUES (62, '2024-10-11', '29.9.2004 [jeeff] generator primarnych klucov - documents');
INSERT INTO _db_ (id, create_date, note) VALUES (63, '2024-10-11', '4.10.2004 [joruz] tabulka s perex skupinami');
INSERT INTO _db_ (id, create_date, note) VALUES (64, '2024-10-11', '15.10.2004 [jeeff] zoznam miestnosti pre chat');
INSERT INTO _db_ (id, create_date, note) VALUES (65, '2024-10-11', '15.10.2004 [jeeff] default miestnost pre chat');
INSERT INTO _db_ (id, create_date, note) VALUES (66, '2024-10-11', '15.10.2004 [jeeff] moderovana miestnost pre chat');
INSERT INTO _db_ (id, create_date, note) VALUES (67, '2024-10-11', '16.10.2004 [jeeff] crontab');
INSERT INTO _db_ (id, create_date, note) VALUES (68, '2024-10-11', '16.10.2004 [jeeff] crontab - CalendarDB.sendNotify');
INSERT INTO _db_ (id, create_date, note) VALUES (69, '2024-10-11', '16.10.2004 [jeeff] crontab - RegAlarm.regAlarm');
INSERT INTO _db_ (id, create_date, note) VALUES (70, '2024-10-11', '16.11.2004 [jeeff] email - cas a datum, kedy sa ma odoslat');
INSERT INTO _db_ (id, create_date, note) VALUES (71, '2024-10-11', '17.11.2004 [jeeff] email - text emailu (ak sa neodosiela URL)');
INSERT INTO _db_ (id, create_date, note) VALUES (72, '2024-10-11', '19.11.2004 [jeeff] email - replyTo');
INSERT INTO _db_ (id, create_date, note) VALUES (73, '2024-10-11', '19.11.2004 [jeeff] email - ccEmail');
INSERT INTO _db_ (id, create_date, note) VALUES (74, '2024-10-11', '19.11.2004 [jeeff] email - bccEmail');
INSERT INTO _db_ (id, create_date, note) VALUES (75, '2024-10-11', '8.12.2004 [jeeff] zakladny CSS styl pre sablonu');
INSERT INTO _db_ (id, create_date, note) VALUES (76, '2024-10-11', '10.12.2004 [joruz] komplet statistika - views');
INSERT INTO _db_ (id, create_date, note) VALUES (77, '2024-10-11', '10.12.2004 [joruz] komplet statistika - from');
INSERT INTO _db_ (id, create_date, note) VALUES (78, '2024-10-11', '10.12.2004 [joruz] komplet statistika - stat_browser_id - pkey');
INSERT INTO _db_ (id, create_date, note) VALUES (79, '2024-10-11', '10.12.2004 [joruz] komplet statistika - stat_session_id - pkey');
INSERT INTO _db_ (id, create_date, note) VALUES (80, '2024-10-11', '17.12.2004 [joruz] sprava fora');
INSERT INTO _db_ (id, create_date, note) VALUES (81, '2024-10-11', '21.12.2004 [jeeff] vlastnosti adresara na disku (indexacia, prava)');
INSERT INTO _db_ (id, create_date, note) VALUES (82, '2024-10-11', '7.1.2005 [joruz] schvalovanie diskusnych prispevkov (document_forum confirmed)');
INSERT INTO _db_ (id, create_date, note) VALUES (83, '2024-10-11', '7.1.2005 [joruz] schvalovanie diskusnych prispevkov (forum message_confirmation)');
INSERT INTO _db_ (id, create_date, note) VALUES (84, '2024-10-11', '7.1.2005 [joruz] schvalovanie diskusnych prispevkov (document_forum hash_code)');
INSERT INTO _db_ (id, create_date, note) VALUES (85, '2024-10-11', '7.1.2005 [joruz] schvalovanie diskusnych prispevkov (forum approve_email)');
INSERT INTO _db_ (id, create_date, note) VALUES (86, '2024-10-11', '25.1.2005 [jeeff] pkey generator - banner_id');
INSERT INTO _db_ (id, create_date, note) VALUES (87, '2024-10-11', '28.1.2005 [joruz] bazar - bazar_groups');
INSERT INTO _db_ (id, create_date, note) VALUES (88, '2024-10-11', '28.1.2005 [joruz] bazar - bazar_advertisements');
INSERT INTO _db_ (id, create_date, note) VALUES (89, '2024-10-11', '6.2.2005 [jeeff] custom fields - documents');
INSERT INTO _db_ (id, create_date, note) VALUES (90, '2024-10-11', '6.2.2005 [jeeff] custom fields - documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (91, '2024-10-11', '7.2.2005 [jeeff] adminlog');
INSERT INTO _db_ (id, create_date, note) VALUES (92, '2024-10-11', '15.2.2005 [joruz] forum - email nofifikacie');
INSERT INTO _db_ (id, create_date, note) VALUES (93, '2024-10-11', '15.2.2005 [jeeff] adminlog - ip a hostname');
INSERT INTO _db_ (id, create_date, note) VALUES (94, '2024-10-11', '31.3.2005 [jeeff] banner_banners - zrusenie identity stlpcov');
INSERT INTO _db_ (id, create_date, note) VALUES (95, '2024-10-11', '15.4.2005 [joruz] forum - uprava na message board');
INSERT INTO _db_ (id, create_date, note) VALUES (96, '2024-10-11', '15.4.2005 [jeeff] users - udaje o datume narodenia, pohlavi atd');
INSERT INTO _db_ (id, create_date, note) VALUES (97, '2024-10-11', '20.4.2005 [jeeff] custom fields - documents (dalsich 6)');
INSERT INTO _db_ (id, create_date, note) VALUES (98, '2024-10-11', '20.4.2005 [jeeff] custom fields - documents_history (dalsich 6)');
INSERT INTO _db_ (id, create_date, note) VALUES (99, '2024-10-11', '12.5.2005 [joruz] users - premenovanie sex fieldu');
INSERT INTO _db_ (id, create_date, note) VALUES (100, '2024-10-11', '19.5.2005 [joruz] user_groups - ak je 1, pouzivatel si moze danu skupinu priradit/odobrat');
INSERT INTO _db_ (id, create_date, note) VALUES (101, '2024-10-11', '27.5.2005 [jeeff] emails - ak je 1 tak sa nebude email odosielat (zostane cakat)');
INSERT INTO _db_ (id, create_date, note) VALUES (102, '2024-10-11', '22.6.2005 [joruz] doc_subscribe - tabulka pre subscribe notifikacie o zmene stranky (komponenta docSubscribeInfo)');
INSERT INTO _db_ (id, create_date, note) VALUES (103, '2024-10-11', '30.6.2005 [joruz] forum - typ prispevku');
INSERT INTO _db_ (id, create_date, note) VALUES (104, '2024-10-11', '30.6.2005 [joruz] user - rank pre forum');
INSERT INTO _db_ (id, create_date, note) VALUES (105, '2024-10-11', '10.7.2005 [jeeff] dictionary - slovnik vysvetlujuci vyrazy / slovicka');
INSERT INTO _db_ (id, create_date, note) VALUES (106, '2024-10-11', '11.7.2005 [jeeff] doc_subscribe - pridanie user_id');
INSERT INTO _db_ (id, create_date, note) VALUES (107, '2024-10-11', '26.8.2005 [miros] groups_approve - premenovanie modu (vadilo to Oracle)');
INSERT INTO _db_ (id, create_date, note) VALUES (108, '2024-10-11', '14.9.2005 [jeeff] document_forum - send_answer_notif (chyba v ORACLE verzii)');
INSERT INTO _db_ (id, create_date, note) VALUES (109, '2024-10-11', '28.9.2005 [jeeff] templates - 4 volne pouzitelne objekty');
INSERT INTO _db_ (id, create_date, note) VALUES (110, '2024-10-11', '17.10.2005 [miros] dmail - tabulka kampani');
INSERT INTO _db_ (id, create_date, note) VALUES (111, '2024-10-11', '18.10.2005 [jeeff] groups - zvacsenie datovych poloziek');
INSERT INTO _db_ (id, create_date, note) VALUES (112, '2024-10-11', '20.10.2005 [jeeff] media - tabulka s roznymi mediami');
INSERT INTO _db_ (id, create_date, note) VALUES (113, '2024-10-11', '28.10.2005 [jeeff] media - sortovanie a thumb');
INSERT INTO _db_ (id, create_date, note) VALUES (114, '2024-10-11', '9.11.2005 [jeeff] shoppnig basket');
INSERT INTO _db_ (id, create_date, note) VALUES (115, '2024-10-11', '11.11.2005 [jeeff] users - datumy pocas ktorych je platne prihlasovanie');
INSERT INTO _db_ (id, create_date, note) VALUES (116, '2024-10-11', '8.12.2005 [jeeff] stat - vytvorenie indexov');
INSERT INTO _db_ (id, create_date, note) VALUES (117, '2024-10-11', '19.12.2005 [jeeff] doc_atr - moznostu zadavania necelociselnych hodnot (aj ked atribut sa stale vola value_int)');
INSERT INTO _db_ (id, create_date, note) VALUES (118, '2024-10-11', '3.1.2005 [jeeff] groups - nove atributy - domena, ');
INSERT INTO _db_ (id, create_date, note) VALUES (119, '2024-10-11', '19.2.2005 [jeeff] stat_views - doplnene idecka adresarov stranok');
INSERT INTO _db_ (id, create_date, note) VALUES (120, '2024-10-11', '25.1.2006 [jeeff] users - hash pre autorizaciu z emailu');
INSERT INTO _db_ (id, create_date, note) VALUES (121, '2024-10-11', '7.2.2006 [jeeff] emails_campain - pocet odoslanych emailov, datum posedneho');
INSERT INTO _db_ (id, create_date, note) VALUES (122, '2024-10-11', '23.3.2006 [jeeff] modules - poradie usporiadania poloziek');
INSERT INTO _db_ (id, create_date, note) VALUES (123, '2024-10-11', '27.2.2006 [jeeff] admin_message - odkazy medzi administratormi');
INSERT INTO _db_ (id, create_date, note) VALUES (124, '2024-10-11', '5.3.2006 [jeeff] admin_message - stav ci je precitana sprava');
INSERT INTO _db_ (id, create_date, note) VALUES (125, '2024-10-11', '11.5.2005 [jeeff] stat - vytvorenie indexov MSSQL');
INSERT INTO _db_ (id, create_date, note) VALUES (126, '2024-10-11', '1.6.2006 [nepso] stat_from - prida stlpec doc_id=na ktoru stranku prisiel');
INSERT INTO _db_ (id, create_date, note) VALUES (127, '2024-10-11', '1.6.2006 [nepso] banner_banners - prida stlpec name = meno banneru');
INSERT INTO _db_ (id, create_date, note) VALUES (128, '2024-10-11', '1.6.2006 [nepso] banner_banners - prida stlpec target');
INSERT INTO _db_ (id, create_date, note) VALUES (129, '2024-10-11', '5.9.2006 [jeeff] sita - zoznam uz parsovanych sprav');
INSERT INTO _db_ (id, create_date, note) VALUES (130, '2024-10-11', '22.9.2006 [nepso] gallery - prida stlpec resize_mode');
INSERT INTO _db_ (id, create_date, note) VALUES (131, '2024-10-11', '3.1.2005 [jeeff] groups - nove atributy - menuType pre prihlaseneho, virtual link');
INSERT INTO _db_ (id, create_date, note) VALUES (132, '2024-10-11', '9.11.2006 [nepso] basket_invoice - prida stlpec html_code');
INSERT INTO _db_ (id, create_date, note) VALUES (133, '2024-10-11', '21.11.2006 [jeeff] url_redirects - presmerovania zmenenych stranok');
INSERT INTO _db_ (id, create_date, note) VALUES (134, '2024-10-11', '24.11.2006 [jeeff] forum - id administratorskych skupin');
INSERT INTO _db_ (id, create_date, note) VALUES (135, '2024-10-11', '2.2.2007 [jeeff] users - rozsirenie stlpca login na 128 znakov, aby mohol obsahovat aj email');
INSERT INTO _db_ (id, create_date, note) VALUES (136, '2024-10-11', '5.2.2007 [jeeff] emails - statistika kliknuti na linku v emaily');
INSERT INTO _db_ (id, create_date, note) VALUES (137, '2024-10-11', '11.2.2007 [jeeff] emails_stat_click - rozsirenie moznosti sledovania');
INSERT INTO _db_ (id, create_date, note) VALUES (138, '2024-10-11', '12.2.2007 [jeeff] forms - datum posledneho exportu zaznamu');
INSERT INTO _db_ (id, create_date, note) VALUES (139, '2024-10-11', '14.2.2007 [jeeff] emails - fix na user_id = -1');
INSERT INTO _db_ (id, create_date, note) VALUES (140, '2024-10-11', '6.3.2007 [jeeff] _properties_ - zvacsenie moznosti zadania hodnoty na text');
INSERT INTO _db_ (id, create_date, note) VALUES (141, '2024-10-11', '11.3.2007 [nepso] user_group_verify - prida stlpec hostname');
INSERT INTO _db_ (id, create_date, note) VALUES (142, '2024-10-11', '20.3.2007 [jeeff] groups - oprava -1 hodnoty na logged_menu_type');
INSERT INTO _db_ (id, create_date, note) VALUES (143, '2024-10-11', '2.4.2007 [jeeff] calendar - pridanie tabulky pre evidenciu akceptacii');
INSERT INTO _db_ (id, create_date, note) VALUES (144, '2024-10-11', '13.7.2007 [nepso] emails_campain - pridanie stlpca user_groups');
INSERT INTO _db_ (id, create_date, note) VALUES (145, '2024-10-11', '3.8.2007 [jeeff] emails - index podla kampane, znacne urychli nacitanie');
INSERT INTO _db_ (id, create_date, note) VALUES (146, '2024-10-11', '1.8.2007 [nepso] users - pridanie stlpca fax');
INSERT INTO _db_ (id, create_date, note) VALUES (147, '2024-10-11', '5.8.2007 [jeeff] doc_atr_def - zvacsenie pola s nazvom atributu');
INSERT INTO _db_ (id, create_date, note) VALUES (148, '2024-10-11', '16.11.2007 [jeeff] emails_campain - doplnenie poli podla tabulky emails');
INSERT INTO _db_ (id, create_date, note) VALUES (149, '2024-10-11', '23.11.2007 [jeeff] basket_item - doplnenie poli title a pn pre zobrazenie v objednavke aj po zmazani stranky');
INSERT INTO _db_ (id, create_date, note) VALUES (150, '2024-10-11', '5.11.2007 [jeeff] banner_banners - sposob vkladania click tagu a frame rate');
INSERT INTO _db_ (id, create_date, note) VALUES (151, '2024-10-11', '25.2.2008 [thaber] banner_stat_views_day - nova tabulka pre statistiku videni bannerov (zabera menej miesta)');
INSERT INTO _db_ (id, create_date, note) VALUES (152, '2024-10-11', '4.3.2008 [jeeff] _conf_ - zmena na text pole');
INSERT INTO _db_ (id, create_date, note) VALUES (153, '2024-10-11', '13.4.2008 [pbezak] emails_unsubscribed - zoznam odhlasenych emailov');
INSERT INTO _db_ (id, create_date, note) VALUES (154, '2024-10-11', '12.6.2008 [murbanec] BASKET_INVOICE - pridanie pola currency');
INSERT INTO _db_ (id, create_date, note) VALUES (155, '2024-10-11', '16.7.2008 [hric] banner_banners - prida stlpec client_id');
INSERT INTO _db_ (id, create_date, note) VALUES (156, '2024-10-11', '22.8.2008 [murbanec] podpora jazykov pre galeriu');
INSERT INTO _db_ (id, create_date, note) VALUES (157, '2024-10-11', '26.7.2008 [murbanec] image gallery - pridanie author stlpca');
INSERT INTO _db_ (id, create_date, note) VALUES (158, '2024-10-11', '3.10.2008 [jeeff] documents - disable_after_end');
INSERT INTO _db_ (id, create_date, note) VALUES (159, '2024-10-11', '23.10.2008 [jeeff] redirects - podpora domen');
INSERT INTO _db_ (id, create_date, note) VALUES (160, '2024-10-11', '7.11.2008 [thaber] proxy - konfiguracia proxy pre externe systemy');
INSERT INTO _db_ (id, create_date, note) VALUES (161, '2024-10-11', '13.11.2008 [jeeff] stat_searchengine - pridanie stlpca group_id pre moznost filtrovania');
INSERT INTO _db_ (id, create_date, note) VALUES (162, '2024-10-11', '17.11.2008 [jeeff] cluster - tabulka so zoznamom refreshov objektov');
INSERT INTO _db_ (id, create_date, note) VALUES (163, '2024-10-11', '22.11.2008 [jeeff] stat_from - pridanie stlpca group_id pre moznost filtrovania');
INSERT INTO _db_ (id, create_date, note) VALUES (164, '2024-10-11', '26.11.2008 [jeeff] user_settings - nastavenia pouzivatela (ak treba pre niektory modul)');
INSERT INTO _db_ (id, create_date, note) VALUES (165, '2024-10-11', '5.12.2008 [bhric] document_forum - deleted');
INSERT INTO _db_ (id, create_date, note) VALUES (166, '2024-10-11', '23.01.2009 [kmarton] reservation_object - tabulka so zoznamom rezervacnych objektov pre modul rezervacie');
INSERT INTO _db_ (id, create_date, note) VALUES (167, '2024-10-11', '23.01.2009 [kmarton] reservation - tabulka so zoznamom rezervacii pre modul rezervacie');
INSERT INTO _db_ (id, create_date, note) VALUES (168, '2024-10-11', '29.01.2009 [kmarton] adminlog_notify - tabulka so zoznamom notifikacii pre modul adminlog');
INSERT INTO _db_ (id, create_date, note) VALUES (169, '2024-10-11', '3.2.2008 [kmarton] tabulka inquiry - pridany stlpec multiple - ak sa da hlasovat za viac moznosti');
INSERT INTO _db_ (id, create_date, note) VALUES (170, '2024-10-11', '3.2.2008 [kmarton] tabulka inquiry - pridany stlpec total_clicks - pocet hlasujucich v ankete');
INSERT INTO _db_ (id, create_date, note) VALUES (171, '2024-10-11', '4.2.2008 [thaber] tabulka gallery pridany stlpec pre pocitanie odoslani pohladnice');
INSERT INTO _db_ (id, create_date, note) VALUES (172, '2024-10-11', '6.2.2008 [jeeff] documents_history - pridanie datumu schvalenia web stranky');
INSERT INTO _db_ (id, create_date, note) VALUES (173, '2024-10-11', '7.2.2008 [bhric] tabulka calendar - pridany stlpec creator_id');
INSERT INTO _db_ (id, create_date, note) VALUES (174, '2024-10-11', '7.2.2008 [bhric] tabulka calendar - pridany stlpec approve kvoli schvalovaciemu procesu');
INSERT INTO _db_ (id, create_date, note) VALUES (175, '2024-10-11', '7.2.2008 [bhric] tabulka calendar_types - pridany stlpec schvalovatel_id kvoli schvalovaciemu procesu');
INSERT INTO _db_ (id, create_date, note) VALUES (176, '2024-10-11', '7.2.2008 [bhric] tabulka calendar - pridany stlpec suggest kvoli odporucaniu udalosti');
INSERT INTO _db_ (id, create_date, note) VALUES (177, '2024-10-11', '5.3.2008 [jeeff] document_forum - pridany index podla doc_id');
INSERT INTO _db_ (id, create_date, note) VALUES (178, '2024-10-11', '20.3.2009 [jeeff] tabulka media - pridany datum poslednej zmeny');
INSERT INTO _db_ (id, create_date, note) VALUES (179, '2024-10-11', '14.03.2009 [kmarton] seo_bots - tabulka so zoznamom vyhladavacich botov, ktori pristupili na stranky WebJET-u');
INSERT INTO _db_ (id, create_date, note) VALUES (180, '2024-10-11', '07.04.2009 [kmarton] seo_keywords - tabulka so zoznamom SEO klucovych slov');
INSERT INTO _db_ (id, create_date, note) VALUES (181, '2024-10-11', '07.04.2009 [kmarton] seo_google_position - tabulka so zaznamenanymi poziciami vo vyhladavani na google.com pre klucove slova');
INSERT INTO _db_ (id, create_date, note) VALUES (182, '2024-10-11', '21.4.2009 [kmarton] tabulka seo_keywords - pridany stlpec domain kvoli rozlisovaniu jednotlivych klucovych slov pre rozne domeny');
INSERT INTO _db_ (id, create_date, note) VALUES (183, '2024-10-11', '23.4.2009 [kmarton] tabulka crontab - pridany zaznam, ktory bude na pozadi vykonavat kotrolu pozicii vo vyhladavani vsetkych klucovych slov pre dane domeny na google.com');
INSERT INTO _db_ (id, create_date, note) VALUES (184, '2024-10-11', '6.4.2008 [jeeff] tabulka gallery pridany stlpec pre povolenie domeny pohladnice');
INSERT INTO _db_ (id, create_date, note) VALUES (185, '2024-10-11', '17.4.2009 [jeeff] stat - vytvorenie indexov ORACLE 3');
INSERT INTO _db_ (id, create_date, note) VALUES (186, '2024-10-11', '6.5.2009 [jeeff] vytvorenie indexov MS SQL');
INSERT INTO _db_ (id, create_date, note) VALUES (187, '2024-10-11', '27.04.2009 [murbanec] permission groups - skupiny prav vo WebJETe');
INSERT INTO _db_ (id, create_date, note) VALUES (188, '2024-10-11', '25.5.2009 [kmarton] tabulka seo_keywords - pridany stlpec searchBot kvoli moznosti vyberu vyhladavaca, v ktorom sa bude klucove slovo vyhladavat');
INSERT INTO _db_ (id, create_date, note) VALUES (189, '2024-10-11', '31.7.2009 [jeeff] users - unique index nad loginom');
INSERT INTO _db_ (id, create_date, note) VALUES (190, '2024-10-11', '3.8.2008 [jeeff] user_disabled_items - zvacsenie pola s klucom modulu');
INSERT INTO _db_ (id, create_date, note) VALUES (191, '2024-10-11', '24.7.2009 [murbanec] _properties_ - zvacsenie moznosti zadania hodnoty na text / dorabka aj pre ostatne databazovy ako MySQL');
INSERT INTO _db_ (id, create_date, note) VALUES (192, '2024-10-11', '27.7.2009 [murbanec] tabulka form_file_restrictions - obmedzenie uploadnutych suborov na velkost, priponu a pod.');
INSERT INTO _db_ (id, create_date, note) VALUES (193, '2024-10-11', '10.06.2009 [kmarton] monitoring - tabulka, do ktorej sa ukladaju informacie z monitorovania servera');
INSERT INTO _db_ (id, create_date, note) VALUES (194, '2024-10-11', '11.6.2009 [kmarton] tabulka crontab - pridany zaznam, ktory bude na pozadi vykonavat zapis aktualnych hodnot servera do tabulky monitoring kazdych 30 sekund');
INSERT INTO _db_ (id, create_date, note) VALUES (195, '2024-10-11', '13.8.2009 [murbanec] crontab - pridanie stlpca cluster_node pre spustanie na definovanom node clustra');
INSERT INTO _db_ (id, create_date, note) VALUES (196, '2024-10-11', '18.8.2009 [jeeff] forms - zvacsenie pola pre HTML');
INSERT INTO _db_ (id, create_date, note) VALUES (197, '2024-10-11', '31.8.2009 [kmarton] tabulka gallery - pridany stlpec perex_group kvoli moznosti pridavaniu klucoveho slova k obrazku');
INSERT INTO _db_ (id, create_date, note) VALUES (198, '2024-10-11', '2.9.2009 [murbanec] publikovanie adresarov');
INSERT INTO _db_ (id, create_date, note) VALUES (199, '2024-10-11', '15.10.2009 [jraska] tabulka documents - pridany stlpec forum_count pre pocitanie poctu prispevkov v diskusii');
INSERT INTO _db_ (id, create_date, note) VALUES (200, '2024-10-11', '21.10.2009 [jeeff] tabulka documents_history - pridany stlpec forum_count pre kompatibility s tabulkou documents (stlpec ale bude prazdny)');
INSERT INTO _db_ (id, create_date, note) VALUES (201, '2024-10-11', '27.10.2009 [jeeff] oracle - zmena char stlpcov na varchar pre properties a calendar');
INSERT INTO _db_ (id, create_date, note) VALUES (202, '2024-10-11', '2.11.2009 [jeeff] oracle - doplnenie schemy pre Enterprise verziu');
INSERT INTO _db_ (id, create_date, note) VALUES (203, '2024-10-11', '5.11.2009 [kmarton] tabulka gallery_dimension - pridany stlpec pre nazov, perex a datum vytvorenia fotogalerie');
INSERT INTO _db_ (id, create_date, note) VALUES (204, '2024-10-11', '10.11.2009 [thaber] tabulka gallery - bod zaujmu');
INSERT INTO _db_ (id, create_date, note) VALUES (205, '2024-10-11', '13.11.2009 [kmarton] tabulka inquiry - pridany stlpec image_path - moznost pridania fotky k anketovej odpovedi');
INSERT INTO _db_ (id, create_date, note) VALUES (206, '2024-10-11', '19.11.2009 [kmarton] tabulka gallery_dimension - pridany stlpec pre autora fotogalerie');
INSERT INTO _db_ (id, create_date, note) VALUES (207, '2024-10-11', '19.11.2009 [bhric] tabulka gallery_dimension - pridany stlpec views pre pocet videni');
INSERT INTO _db_ (id, create_date, note) VALUES (208, '2024-10-11', '8.12.2009 [jeeff] doplnene indexy');
INSERT INTO _db_ (id, create_date, note) VALUES (209, '2024-10-11', '25.1.2010 [kmarton] tabulka seo_keywords - nastavenie search_bot atributu na default \'google.sk\', tam kde je to NULL kvoli NPE');
INSERT INTO _db_ (id, create_date, note) VALUES (210, '2024-10-11', '1.2.2010 [jeeff] documents_history - index nad doc_id');
INSERT INTO _db_ (id, create_date, note) VALUES (211, '2024-10-11', '5.2.2010 [jraska] tabulka users - pridane stlpce `position` a `parent_id`');
INSERT INTO _db_ (id, create_date, note) VALUES (212, '2024-10-11', '1.3.2010 [jeeff] documents_history - index nad awaiting_approve');
INSERT INTO _db_ (id, create_date, note) VALUES (213, '2024-10-11', '8.4.2010 [jeeff] emails - Oracle nepozna prazdny retazec v DB a ma problem s URL polom ktore realne moze byt prazdne (ked sa posiela priamo text)');
INSERT INTO _db_ (id, create_date, note) VALUES (214, '2024-10-11', '8.4.2010 [jeeff] documents - rozsirenie custom fields, pridanie SSL atributu');
INSERT INTO _db_ (id, create_date, note) VALUES (215, '2024-10-11', '12.4.2010 [jeeff] sablony - moznost predefinovania install name per sablona');
INSERT INTO _db_ (id, create_date, note) VALUES (216, '2024-10-11', '12.4.2010 [jeeff] sablony - moznost zrusenia spam ochrany per sablona (napr. pre mobil)');
INSERT INTO _db_ (id, create_date, note) VALUES (217, '2024-10-11', '23.4.2010 [bhric] basket - tabulka pre evidenciu ciastkovych platieb');
INSERT INTO _db_ (id, create_date, note) VALUES (218, '2024-10-11', '13.5.2010 [jeeff] stat_keys - cache tabulka pre prevod ID na VALUE pre zapis informacie o prehliadaci');
INSERT INTO _db_ (id, create_date, note) VALUES (219, '2024-10-11', '17.5.2010 [jeeff] media - index nad doc_id');
INSERT INTO _db_ (id, create_date, note) VALUES (220, '2024-10-11', '7.6.2010 [kmarton] BASKET_ITEM - zmena cudzieho kluca z -1 na NULL');
INSERT INTO _db_ (id, create_date, note) VALUES (221, '2024-10-11', '5.3.2010 [thaber] sms_templates - pridane tabulka pre sabolny pre sms ');
INSERT INTO _db_ (id, create_date, note) VALUES (222, '2024-10-11', '25.6.2010 [bhric] tabulka perex_groups - pridany stlpec available_groups pre moznost definovania adresarov perex skupinam');
INSERT INTO _db_ (id, create_date, note) VALUES (223, '2024-10-11', '28.6.2010 [jeeff] adminlog - index nad stlpcami pre vyhladavanie');
INSERT INTO _db_ (id, create_date, note) VALUES (224, '2024-10-11', '25.6.2010 [murbanec] crontab - HeatMapCleaner');
INSERT INTO _db_ (id, create_date, note) VALUES (225, '2024-10-11', '2.7.2010 [kmarton] user_settings_admin - pridana tabulka pre ukladanie nastaveni pouzivatela v admin casti ');
INSERT INTO _db_ (id, create_date, note) VALUES (226, '2024-10-11', '7.7.2010 [murbanec] crontab - StatWriteBuffer');
INSERT INTO _db_ (id, create_date, note) VALUES (227, '2024-10-11', '9.7.2010 [bhric] basket_invoice_payments - tabulka pre evidenciu ciastkovych platieb - pridany stlpec closed_date, confirmed a upraveny typ stlpca payed_price na decimal');
INSERT INTO _db_ (id, create_date, note) VALUES (228, '2024-10-11', '27.7.2010 [murbanec] Tabulka cluster_monitoring - pouziva sa pri prenose monitorovacich informacii medzi clustermi');
INSERT INTO _db_ (id, create_date, note) VALUES (229, '2024-10-11', '30.7.2010 [murbanec] Tabulka pkey_generator - zmena stlpca z INT na LONG');
INSERT INTO _db_ (id, create_date, note) VALUES (230, '2024-10-11', '3.8.2010 [murbanec] cluster_monitoring - pridany stlpec created_at');
INSERT INTO _db_ (id, create_date, note) VALUES (231, '2024-10-11', '4.8.2010 [murbanec] Watermarky pre galeriu');
INSERT INTO _db_ (id, create_date, note) VALUES (232, '2024-10-11', '6.8.2010 [kmarton] gallery - pridany stlpec upload_datetime - datum a cas nahratia fotografie na server');
INSERT INTO _db_ (id, create_date, note) VALUES (233, '2024-10-11', '10.8.2010 [murbanec] Spotlight - FileIndexer');
INSERT INTO _db_ (id, create_date, note) VALUES (234, '2024-10-11', '27.8.2010 [kmarton] Zmena kratkeho pola pre ukladanie ciest k priloham v tabulke emails a emails a emails_campaign');
INSERT INTO _db_ (id, create_date, note) VALUES (235, '2024-10-11', '31.8.2010 [jraska] Tabulka multigroup_mapping - pouziva sa pre mapovanie Master - Slave clankov pre ucely multikategorii/multiadresarov');
INSERT INTO _db_ (id, create_date, note) VALUES (236, '2024-10-11', '20.9.2010 [jeeff] documents - indexy pre rychlejsie nacitanie DocDB struktur');
INSERT INTO _db_ (id, create_date, note) VALUES (237, '2024-10-11', '4.1.2011 [murbanec] users - pridanie moznosti jednosmerneho hesla');
INSERT INTO _db_ (id, create_date, note) VALUES (238, '2024-10-11', '2.2.2011 [mhalas] domain_redirects - tabulka presmerovania domen');
INSERT INTO _db_ (id, create_date, note) VALUES (239, '2024-10-11', '21.2.2011 [mhalas] pridanie flagu do crontable na auditovacie ucely');
INSERT INTO _db_ (id, create_date, note) VALUES (240, '2024-10-11', '28.2.2011 [mhalas] pridanie sort_priority do gallery');
INSERT INTO _db_ (id, create_date, note) VALUES (241, '2024-10-11', '23.03.2011 [mrepasky] monitoring - pridanie cpu_usage a process_usage do monitoringu servera ');
INSERT INTO _db_ (id, create_date, note) VALUES (242, '2024-10-11', '27.03.2011 [murbanec] Vymazanie triedy RegAlarm - uz sa nepouziva');
INSERT INTO _db_ (id, create_date, note) VALUES (243, '2024-10-11', '5.4.2011 [jeeff] Oracle - zvacsenie datovy poli pre nazvy adresara');
INSERT INTO _db_ (id, create_date, note) VALUES (244, '2024-10-11', '25.05.2011 [bhric] inquiry - tabulka pre zapis statistiky o hlasovani daneho usera');
INSERT INTO _db_ (id, create_date, note) VALUES (245, '2024-10-11', '27.05.2010 [thaber] pridanie tabulky stopslov');
INSERT INTO _db_ (id, create_date, note) VALUES (246, '2024-10-11', '19.05.2011 [murbaenc] Atributy pre formulare + merge restrikcii suborov do spolocnej tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (247, '2024-10-11', '23.06.2011 [mrepasky] Tabulka regularnych vyrazov pre formulare');
INSERT INTO _db_ (id, create_date, note) VALUES (248, '2024-10-11', '24.6.2011 [mhalas] Pridanie priority do questions_answers');
INSERT INTO _db_ (id, create_date, note) VALUES (249, '2024-10-11', '11.7.2011 [bhric] zmluvy, zmluvy_prilohy - tabulky pre modul Zmluvy');
INSERT INTO _db_ (id, create_date, note) VALUES (250, '2024-10-11', '22.7.2011 [bhric] tabulky zmluvy - rozdelenia stlpca platnost na platnost_od a platnost_do');
INSERT INTO _db_ (id, create_date, note) VALUES (251, '2024-10-11', '25.7.2011 [mrepasky] Pretypovanie stlpca prop_value v tabulke properties');
INSERT INTO _db_ (id, create_date, note) VALUES (252, '2024-10-11', '26.8.2011 [mhalas] premenovanie stlpca audit kvoli oraclu');
INSERT INTO _db_ (id, create_date, note) VALUES (253, '2024-10-11', '19.9.2011 [mrepasky] Oracle - pretypovanie stlpca pre publikovanie adresara');
INSERT INTO _db_ (id, create_date, note) VALUES (254, '2024-10-11', '22.9.2011 [mrepasky] Pretypovanie stlpca pre defaultnu hodnotu atributu');
INSERT INTO _db_ (id, create_date, note) VALUES (255, '2024-10-11', '4.10.2011 [mhalas] Sledovanie otvorenia emailu pre dmail');
INSERT INTO _db_ (id, create_date, note) VALUES (256, '2024-10-11', '10.11.2011 [jeeff] forum - id skupin z ktorych je mozne pridat novy prispevok');
INSERT INTO _db_ (id, create_date, note) VALUES (257, '2024-10-11', '11.11.2011 [vbur] contact - tabulka s kontaktmi');
INSERT INTO _db_ (id, create_date, note) VALUES (258, '2024-10-11', '21.11.2011 [vbur] inquiry - pridanie url k odpovedi');
INSERT INTO _db_ (id, create_date, note) VALUES (259, '2024-10-11', '16.11.2011 [jeeff] forms - indexy pre rychlejsie nacitanie');
INSERT INTO _db_ (id, create_date, note) VALUES (260, '2024-10-11', '13.01.2012 [mrepasky] Pridanie regularnych vyrazov do databazy - tabulka form_regular_exp');
INSERT INTO _db_ (id, create_date, note) VALUES (261, '2024-10-11', '20.1.2012 [jeeff] cache - tabulka pre persistent cache');
INSERT INTO _db_ (id, create_date, note) VALUES (262, '2024-10-11', '7.3.2012 [jeeff] proxy - pridanie autorizacie');
INSERT INTO _db_ (id, create_date, note) VALUES (263, '2024-10-11', '18.4.2012 [vbur] inventory - evidencia majetku');
INSERT INTO _db_ (id, create_date, note) VALUES (264, '2024-10-11', '10.5.2012 [vbur] inventory - prislusenstvo');
INSERT INTO _db_ (id, create_date, note) VALUES (265, '2024-10-11', '15.5.2012 [bhric] zmluvy - odstranenie a pridanie dalsich stlpcov');
INSERT INTO _db_ (id, create_date, note) VALUES (266, '2024-10-11', '18.5.2012 [bhric] tabulka adminlog_notify - pridany stlpec text');
INSERT INTO _db_ (id, create_date, note) VALUES (267, '2024-10-11', '25.5.2012 [bhric] tabulka zmluvy - pridany stlpec zobrazit, vytvoril');
INSERT INTO _db_ (id, create_date, note) VALUES (268, '2024-10-11', '26.6.2010 [bhric] documents - rozsirenie tabulky o root_group_l1, root_group_l2 a root_group_l3');
INSERT INTO _db_ (id, create_date, note) VALUES (269, '2024-10-11', '17.7.2012 [bhric] Oracle - pretypovanie stlpca html_code v banner_banners');
INSERT INTO _db_ (id, create_date, note) VALUES (270, '2024-10-11', '3.8.2012 [bhric] perex_group_doc - pouziva sa pre mapovanie doc_id a perex_group_id z tabulky documents');
INSERT INTO _db_ (id, create_date, note) VALUES (271, '2024-10-11', '6.8.2012 [bhric] documents - indexy na root_group stlpcami');
INSERT INTO _db_ (id, create_date, note) VALUES (272, '2024-10-11', '22.8.2012 [jeeff] perex_group_doc - indexy');
INSERT INTO _db_ (id, create_date, note) VALUES (273, '2024-10-11', '12.9.2012 [mrepasky] Pridanie regularnych vyrazov do databazy - integer');
INSERT INTO _db_ (id, create_date, note) VALUES (274, '2024-10-11', '10.10.2012 [jeeff] prop - moznost zadat NULL hodnotu pre Oracle (akoze prazdny string)');
INSERT INTO _db_ (id, create_date, note) VALUES (275, '2024-10-11', '3.1.2013 [jeeff] questions_answers - rozsirenie tabulky o nove stlpce');
INSERT INTO _db_ (id, create_date, note) VALUES (276, '2024-10-11', '9.1.2013 [bhric] reservation_object - rozsirenie tabulky o nove stlpce');
INSERT INTO _db_ (id, create_date, note) VALUES (277, '2024-10-11', '11.3.2012 [mhalas] WJ Cloud - pridanie domain_id do galerie');
INSERT INTO _db_ (id, create_date, note) VALUES (278, '2024-10-11', '11.3.2012 [mhalas] WJ Cloud - pridanie domain_id do gallery_dimension');
INSERT INTO _db_ (id, create_date, note) VALUES (279, '2024-10-11', '14.3.2013 [prau] WebJet Cloud inquiry_answers - rozsirenie tabulky o novy stlpec domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (280, '2024-10-11', '14.3.2013 [prau] WebJet Cloud inquiry_users - rozsirenie tabulky o novy stlpec domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (281, '2024-10-11', '14.3.2013 [prau] WebJet Cloud inquiry - rozsirenie tabulky o novy stlpec domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (282, '2024-10-11', '15.3.2012 [mbocko] WJ Cloud (modul Forum) - pridanie domain_id do forum');
INSERT INTO _db_ (id, create_date, note) VALUES (283, '2024-10-11', '15.3.2012 [mbocko] WJ Cloud (modul Forum) - pridanie domain_id do document_forum');
INSERT INTO _db_ (id, create_date, note) VALUES (284, '2024-10-11', '18.3.2012 [mbocko] WJ Cloud (modul QA) - pridanie domain_id do questions_answers');
INSERT INTO _db_ (id, create_date, note) VALUES (285, '2024-10-11', '21.3.2012 [prau] WJ Cloud (modul formulare) - pridanie domain_id do forms ');
INSERT INTO _db_ (id, create_date, note) VALUES (286, '2024-10-11', '21.3.2012 [prau] WJ Cloud (modul formulare) - pridanie domain_id do form_attributes');
INSERT INTO _db_ (id, create_date, note) VALUES (287, '2024-10-11', '15.4.2013 [mrepasky] Pridany datum zmeny pre konfiguracne premenne - pridanie stlpca date_changed do tabulky _conf_ resp. webjet_conf');
INSERT INTO _db_ (id, create_date, note) VALUES (288, '2024-10-11', '03.06.2013 [mrepasky] Tabulka pre historiu suborov vo webjete - file_history a nastavenie generatora klucov');
INSERT INTO _db_ (id, create_date, note) VALUES (289, '2024-10-11', '4.6.2012 [mbocko] WJ Cloud (users) - pridanie domain_id do users');
INSERT INTO _db_ (id, create_date, note) VALUES (290, '2024-10-11', '22.5.2017 [mminda] inventory - evidencia majetku - pridanie dovodu vyradenia ');
INSERT INTO _db_ (id, create_date, note) VALUES (291, '2024-10-11', '11.6.2012 [mbocko] inventory - evidencia majetku - rozsirenie detailu, pridanie dovodu vyradenia pre detail');
INSERT INTO _db_ (id, create_date, note) VALUES (292, '2024-10-11', '19.6.2012 [mbocko] WJ Cloud (Basket) - pridanie domain_id do basket_item');
INSERT INTO _db_ (id, create_date, note) VALUES (293, '2024-10-11', '19.6.2012 [mbocko] WJ Cloud (Basket) - pridanie domain_id do basket_invoice');
INSERT INTO _db_ (id, create_date, note) VALUES (294, '2024-10-11', '25.7.2013 [mbocko] tabulka so zoznamom slov pre slovnikovu captchu');
INSERT INTO _db_ (id, create_date, note) VALUES (295, '2024-10-11', '25.7.2013 [mhalas] tabulka pre limity na domain throttling');
INSERT INTO _db_ (id, create_date, note) VALUES (296, '2024-10-11', '29.11.2013 [mhalas] Genericky template pre domenove limity');
INSERT INTO _db_ (id, create_date, note) VALUES (297, '2024-10-11', '13.12.2013 [mrepasky] Uprava tabulky pre historiu suborov vo webjete - file_history');
INSERT INTO _db_ (id, create_date, note) VALUES (298, '2024-10-11', '17.12.2013 [jeeff] Oprava mena stlpcu pkey generatora');
INSERT INTO _db_ (id, create_date, note) VALUES (299, '2024-10-11', '10.1.2013 [bhric] tabulka zmluvy - zmena typu pola pre predmet, poznamka na text / clob');
INSERT INTO _db_ (id, create_date, note) VALUES (300, '2024-10-11', '12.2.2013 [mcacko] #15400 - skutocny archiv, vytvorenie tabulky forms_archiv');
INSERT INTO _db_ (id, create_date, note) VALUES (301, '2024-10-11', '01.07.2014 [mkolejak] Tabulka pre todo');
INSERT INTO _db_ (id, create_date, note) VALUES (302, '2024-10-11', '12.9.2014 [mkolejak] doplnam chybajuci primarny kluc pre mssql');
INSERT INTO _db_ (id, create_date, note) VALUES (303, '2024-10-11', '27.10.2014 [mkolejak] reservation_object - rozsirenie tabulky o nove stlpce');
INSERT INTO _db_ (id, create_date, note) VALUES (304, '2024-10-11', '27.10.2014 [mkolejak] reservation - pridanie stlpca phone_number');
INSERT INTO _db_ (id, create_date, note) VALUES (305, '2024-10-11', '4.11.2014 [mkolejak] WJ Cloud - pridanie domain_id do reservation');
INSERT INTO _db_ (id, create_date, note) VALUES (306, '2024-10-11', '4.11.2014 [mkolejak] WJ Cloud - pridanie domain_id do reservation_object');
INSERT INTO _db_ (id, create_date, note) VALUES (307, '2024-10-11', '05.11.2014 [mkolejak] Tabulka pre export_dat');
INSERT INTO _db_ (id, create_date, note) VALUES (308, '2024-10-11', '27.10.2014 [mkolejak] _conf_prepared_ - pripravene hodnoty pre config, pridaju sa v prepared case');
INSERT INTO _db_ (id, create_date, note) VALUES (309, '2024-10-11', '12.12.2014 [mkolejak] Automaticky prenesenie predpripravenych konfiguracii z
     _config_prepared_ do _conf_ ked uplynul date_prepared pomocou cronu');
INSERT INTO _db_ (id, create_date, note) VALUES (310, '2024-10-11', '19.06.2015 [pbielik] tabulka terminologicky_slovnik');
INSERT INTO _db_ (id, create_date, note) VALUES (311, '2024-10-11', '16.07.2015 [rzapach] pridanie stlpcov pre kalendar');
INSERT INTO _db_ (id, create_date, note) VALUES (312, '2024-10-11', '22.07.2015 [rzapach] Tabulka pre modul GIS');
INSERT INTO _db_ (id, create_date, note) VALUES (313, '2024-10-11', '28.07.2015 [rzapach] Tabulky pre modul denneho menu v restauracii');
INSERT INTO _db_ (id, create_date, note) VALUES (314, '2024-10-11', '12.08.2015 [rzapach] Tabulka pre hodnotenie stranky');
INSERT INTO _db_ (id, create_date, note) VALUES (315, '2024-10-11', '14.9.2015 [rzapach] zmluvy - pridanie stlpca sposob_uhrady');
INSERT INTO _db_ (id, create_date, note) VALUES (316, '2024-10-11', '17.12.2015 [rzapach] tabulka cien pre dany rezervacny objekt');
INSERT INTO _db_ (id, create_date, note) VALUES (317, '2024-10-11', '28.4.2015 [mhalas] WebJet Cloud Zmluvy - rozsirenie tabulky o novy stlpec domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (318, '2024-10-11', '23.10.2015 [jeeff] Form regexp - uprava regexpu kontroly emailu pre velke pismena');
INSERT INTO _db_ (id, create_date, note) VALUES (319, '2024-10-11', '18.12.2015 [pbielik] pridanie stlpca synonymum do terminologicky_slovnik');
INSERT INTO _db_ (id, create_date, note) VALUES (320, '2024-10-11', '20.1.2016 [rzapach] tabulka povolenych casov pre dany rezervacny objekt, casova jednotka pre rez. objekt');
INSERT INTO _db_ (id, create_date, note) VALUES (321, '2024-10-11', '30.05.2016 [jeeff] pridanie stlpcov pre calendar_invitation');
INSERT INTO _db_ (id, create_date, note) VALUES (322, '2024-10-11', '14.10.2015 [jeeff] ckeditor - pocitadlo uploadnutych obrazkov');
INSERT INTO _db_ (id, create_date, note) VALUES (323, '2024-10-11', '10.12.2015 [jeeff] zmazanie cron tasku magzilly');
INSERT INTO _db_ (id, create_date, note) VALUES (324, '2024-10-11', '12.2.2016 [rzapach] groups_scheduler -> groups history, pridanie stlpca s casom a zmena when_to_publish aby povoloval null hodnoty');
INSERT INTO _db_ (id, create_date, note) VALUES (325, '2024-10-11', '21.6.2016 [jeeff] pkey_generator - nastavenie stlpcov');
INSERT INTO _db_ (id, create_date, note) VALUES (326, '2024-10-11', '11.7.2016 [rzapach] pridanie stlpca mobile_device (idcko zariadenia) do tabulky users -> kvoli posielaniu push notifikacii');
INSERT INTO _db_ (id, create_date, note) VALUES (327, '2024-10-11', '30.08.2016 [prau] pridanie stlpcu pre group scheduler kvoli historii');
INSERT INTO _db_ (id, create_date, note) VALUES (328, '2024-10-11', '23.09.2016 [rzapach] pridanie stlpcu pre domain_redirects kvoli pridaniu kontroly protokolu http/https');
INSERT INTO _db_ (id, create_date, note) VALUES (329, '2024-10-11', '15.09.2016 [prau] #20546 - WebJET - Vkladanie scriptov');
INSERT INTO _db_ (id, create_date, note) VALUES (330, '2024-10-11', '18.11.2016 [lpasek] Vytvorenie tabulky pre komponentu appcache');
INSERT INTO _db_ (id, create_date, note) VALUES (331, '2024-10-11', '06.02.2017 [bhric] pridanie stlpcu pre jazyk (lng) do groups');
INSERT INTO _db_ (id, create_date, note) VALUES (332, '2024-10-11', '15.02.2017 [mbocko] pridanie stlpca require_email_verification pre user_groups');
INSERT INTO _db_ (id, create_date, note) VALUES (333, '2024-10-11', '26.04.2017 [ryapach] vytvorenie tabulky pre poznmaky pre editorov k strankam');
INSERT INTO _db_ (id, create_date, note) VALUES (334, '2024-10-11', '10.5.2017 [mminda] oracle - doplnenie schemy pre Tooltipy (tatrabanka)');
INSERT INTO _db_ (id, create_date, note) VALUES (335, '2024-10-11', '15.05.2017 [bhric] pridanie stlpcu create_date (datum odhlasenia) do emails_unsubscribed');
INSERT INTO _db_ (id, create_date, note) VALUES (336, '2024-10-11', '1.5.2017 [prau] Archiv suborov');
INSERT INTO _db_ (id, create_date, note) VALUES (337, '2024-10-11', '29.05.2017 [jeeff] premenovanie stlpcu pre domain_redirects kvoli oracle vyhradenemu menu');
INSERT INTO _db_ (id, create_date, note) VALUES (338, '2024-10-11', '30.5.2017 [lpasek] Rozsirenie tabulky appcache_file o stlpec recursive');
INSERT INTO _db_ (id, create_date, note) VALUES (339, '2024-10-11', '30.5.2017 [lpasek] Vytvorenie tabulky appcache_page');
INSERT INTO _db_ (id, create_date, note) VALUES (340, '2024-10-11', '31.5.2017 [lpasek] Uprava tabulky appcache_page');
INSERT INTO _db_ (id, create_date, note) VALUES (341, '2024-10-11', '03.07.2017 [prau] #22201 rozsirenie Baneroveho systemu o domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (342, '2024-10-11', '17.07.2017 [prau] #22201 rozsirenie Baneroveho systemu o domain_id - fix mysql');
INSERT INTO _db_ (id, create_date, note) VALUES (343, '2024-10-11', '2.8.2017 [prau] Archiv suborov pridanie stlpcu pre velkost suboru');
INSERT INTO _db_ (id, create_date, note) VALUES (344, '2024-10-11', '2.8.2017 [prau] Archiv suborov oracle skript');
INSERT INTO _db_ (id, create_date, note) VALUES (345, '2024-10-11', '08.09.2017 [pbielik] vytvorenie tabuliek pre kviz');
INSERT INTO _db_ (id, create_date, note) VALUES (346, '2024-10-11', '27.09.2017 [prau] #20546 - WebJET - Vkladanie scriptov');
INSERT INTO _db_ (id, create_date, note) VALUES (347, '2024-10-11', '28.09.2017 [prau] pridanie stlpca right_answer pre quiz_answers');
INSERT INTO _db_ (id, create_date, note) VALUES (348, '2024-10-11', '07.11.2017 [prau] #20546 - WebJET - Vkladanie scriptov - oprava');
INSERT INTO _db_ (id, create_date, note) VALUES (349, '2024-10-11', '07.11.2017 [prau] #23245 - Rozsirenie funkcionality skupiny práv');
INSERT INTO _db_ (id, create_date, note) VALUES (350, '2024-10-11', '10.11.2017 [bhric] pridanie flagu do crontable na spustanie ulohy po starte servera a moznost zakazania vykonavania ulohy');
INSERT INTO _db_ (id, create_date, note) VALUES (351, '2024-10-11', '10.11.2017 [pbielik] #22743 - Pridanie domainId pre quiz');
INSERT INTO _db_ (id, create_date, note) VALUES (352, '2024-10-11', '14.11.2017 [bhric] crontab - fix default hodnoty pre run_at_startup, enable_task v MS SQL');
INSERT INTO _db_ (id, create_date, note) VALUES (353, '2024-10-11', '14.11.2017 [bhric] pridanie stlpcu pre jazyk (lng) do groups_scheduler');
INSERT INTO _db_ (id, create_date, note) VALUES (354, '2024-10-11', '15.11.2017 [prau] #22201 - Upravy modulov pre multiweb / pridanie stlpca domain_id do file archivu');
INSERT INTO _db_ (id, create_date, note) VALUES (355, '2024-10-11', '15.11.2017 [prau] #23167 - Archiv suborov - kontrola prav podla prav na subory pouzivatela - oprava');
INSERT INTO _db_ (id, create_date, note) VALUES (356, '2024-10-11', '21.09.2017 [lpasek] Uprava tabulky pre komponentu appcache');
INSERT INTO _db_ (id, create_date, note) VALUES (357, '2024-10-11', '21.09.2017 [lpasek] Uprava tabulky pre komponentu appcache file');
INSERT INTO _db_ (id, create_date, note) VALUES (358, '2024-10-11', '10.01.2018 [prau] #23471 - Password security');
INSERT INTO _db_ (id, create_date, note) VALUES (359, '2024-10-11', '29.1.2018 [jeeff] sablony - zvacsenie pola pre zadavanie CSS liniek');
INSERT INTO _db_ (id, create_date, note) VALUES (360, '2024-10-11', '02.02.2018 [jeeff] groups - pridanie moznosti oznacenia adresara pre nezobrazenie v admin casti');
INSERT INTO _db_ (id, create_date, note) VALUES (361, '2024-10-11', '07.03.2018 [bhric] Zmluvy, rozsirenie o organizacie. Moznost pridania organizacii a prav nad zmluvami (#23935)');
INSERT INTO _db_ (id, create_date, note) VALUES (362, '2024-10-11', '16.04.2018 [mhruby] #25103 M - SPRÁVA ČÍSELNÍKOV');
INSERT INTO _db_ (id, create_date, note) VALUES (363, '2024-10-11', '11.4.2018 [mhruby] #25103 M - SPRÁVA ČÍSELNÍKOV - pridanie stlpcovych nazvov');
INSERT INTO _db_ (id, create_date, note) VALUES (364, '2024-10-11', '11.04.2018 [jeeff] restaurant_menu - oprava datoveho stlpca pre MS SQL');
INSERT INTO _db_ (id, create_date, note) VALUES (365, '2024-10-11', '18.04.2018 [prau] #25043 M - INTERNÉ RIADIACE AKTY');
INSERT INTO _db_ (id, create_date, note) VALUES (366, '2024-10-11', '7.5.2018 [jeeff] presmerovania domen - zvacsenie pola pre zadavanie URL cielovej domeny');
INSERT INTO _db_ (id, create_date, note) VALUES (367, '2024-10-11', '18.5.2018 [mhruby] #25103 M - SPRÁVA ČÍSELNÍKOV - fix diakritiky pre Microsoft SQL');
INSERT INTO _db_ (id, create_date, note) VALUES (368, '2024-10-11', '8.5.2018 [prau] Modul GDPR zadanie regexpov #23673');
INSERT INTO _db_ (id, create_date, note) VALUES (369, '2024-10-11', '15.5.2018 [prau] #23673 Modul GDPR zadanie regexpov - rozsirenie tabulky o stlpec domain_id ');
INSERT INTO _db_ (id, create_date, note) VALUES (370, '2024-10-11', '30.5.2018 [prau] #23673  regularne vyrazy gdpr - zvacsenie pola pre zadavanie regularneho vyrazu');
INSERT INTO _db_ (id, create_date, note) VALUES (371, '2024-10-11', '26.5.2018 [prau] #23673  regularne vyrazy gdpr -inicializacia regularnych vyrazov');
INSERT INTO _db_ (id, create_date, note) VALUES (372, '2024-10-11', '05.06.2018 [pbielik] pridane customizacie kvizu');
INSERT INTO _db_ (id, create_date, note) VALUES (373, '2024-10-11', '04.04.2018 [lzlatohlavek] #23073 - UPRAVA MEDIA KOMPONENTY');
INSERT INTO _db_ (id, create_date, note) VALUES (374, '2024-10-11', '12.06.2018 [mhruby] Tabulky pre modul denneho menu v restauracii (zmena hmotnosti na string)');
INSERT INTO _db_ (id, create_date, note) VALUES (375, '2024-10-11', '12.06.2018 [mhruby] Tabulka pre skupiny sablon.');
INSERT INTO _db_ (id, create_date, note) VALUES (376, '2024-10-11', '18.06.2018 [pbielik] obodovany kviz');
INSERT INTO _db_ (id, create_date, note) VALUES (377, '2024-10-11', '2.7.2018 [pbielik] inquirysimple');
INSERT INTO _db_ (id, create_date, note) VALUES (378, '2024-10-11', '11.7.2018 [mhruby] #25103 M - SPRÁVA ČÍSELNÍKOV - fix diakritiky pre Microsoft SQL a Oracle');
INSERT INTO _db_ (id, create_date, note) VALUES (379, '2024-10-11', '11.7.2018 [mhruby] Tabulka pre skupiny sablon. - fix diakritiky pre Microsoft SQL');
INSERT INTO _db_ (id, create_date, note) VALUES (380, '2024-10-11', '13.07.2018 [pbielik] user_settings - nastavenia pouzivatela (ak treba pre niektory modul)');
INSERT INTO _db_ (id, create_date, note) VALUES (381, '2024-10-11', '27.7.2018 [pbielik] added email_files table');
INSERT INTO _db_ (id, create_date, note) VALUES (382, '2024-10-11', '17.05.2018 [prau] Vytvorenie tabuky pre cookies');
INSERT INTO _db_ (id, create_date, note) VALUES (383, '2024-10-11', '17.05.2018 [prau] Pridanie riadkov pre cookies');
INSERT INTO _db_ (id, create_date, note) VALUES (384, '2024-10-11', '13.8.2018 [prau] [#23881 - Cookies] - presun do WJ 8');
INSERT INTO _db_ (id, create_date, note) VALUES (385, '2024-10-11', '17.8.2018 [mhruby] rozsirienie intranetoveho widgetu ulohy');
INSERT INTO _db_ (id, create_date, note) VALUES (386, '2024-10-11', '5.9.2018 [jeeff] Pridanie key prefix stlpca na template groups');
INSERT INTO _db_ (id, create_date, note) VALUES (387, '2024-10-11', '13.9.2018 [jeeff] Zmazanie starej konf. premennej kvoli korektnemu updatu na WJ8');
INSERT INTO _db_ (id, create_date, note) VALUES (388, '2024-10-11', '20.9.2018 [pbielik] uprava quiz_questions question na varchar(500)');
INSERT INTO _db_ (id, create_date, note) VALUES (389, '2024-10-11', '20.9.2018 [jeeff] oprava identity stlpca na media_groups tabulke');
INSERT INTO _db_ (id, create_date, note) VALUES (390, '2024-10-11', '23.10.2018 [prau] #27127 Archiv suborov, defaultne zapnutie cronu pre nahratie suboru neskorej');
INSERT INTO _db_ (id, create_date, note) VALUES (391, '2024-10-11', '15.11.2018 [mhruby] rozsirienie intranetoveho widgetu ulohy (pre oracle)');
INSERT INTO _db_ (id, create_date, note) VALUES (392, '2024-10-11', '30.11.2018 [pbielik] add cookie_visitor_group to banner_banners');
INSERT INTO _db_ (id, create_date, note) VALUES (393, '2024-10-11', '19.12.2018 [jvyskoc] pridanie pageReactions (lajkov)');
INSERT INTO _db_ (id, create_date, note) VALUES (394, '2024-10-11', '19.12.2018 [bhric] Sprava ciselnikov - rozsirenie string data hodnot na 1024 znakov');
INSERT INTO _db_ (id, create_date, note) VALUES (395, '2024-10-11', '14.12.2018 [lpasek] Premenovanie stlpca priority v tabule todo na sort_priority (priority je klucove slovo)');
INSERT INTO _db_ (id, create_date, note) VALUES (396, '2024-10-11', '6.2.2019 [jeeff] index nad media grupami');
INSERT INTO _db_ (id, create_date, note) VALUES (397, '2024-10-11', '08.02.2019 [prau] #28315 - Archiv suborov - problem s vypisom  [MFSR]');
INSERT INTO _db_ (id, create_date, note) VALUES (398, '2024-10-11', '14.02.2019 [mhruby] Rozsirenie ciselnikov');
INSERT INTO _db_ (id, create_date, note) VALUES (399, '2024-10-11', '18.02.2019 [pbielik] pridany image url pre quiz bean');
INSERT INTO _db_ (id, create_date, note) VALUES (400, '2024-10-11', '20.02.2019 [mhruby] Pridanie regularnych vyrazov do databazy - tabulka form_regular_exp');
INSERT INTO _db_ (id, create_date, note) VALUES (401, '2024-10-11', '05.03.2019 [pbielik] pkgenerator zmenena cookies_id za cookie_id');
INSERT INTO _db_ (id, create_date, note) VALUES (402, '2024-10-11', '06.03.2019 [mhruby] Nastavenie defaultnej priority existujucim datam');
INSERT INTO _db_ (id, create_date, note) VALUES (403, '2024-10-11', '10.3.2019 [jeeff] Pridanie rezimu inline editacie do skupiny sablon');
INSERT INTO _db_ (id, create_date, note) VALUES (404, '2024-10-11', '18.3.2019 [mpijak] Pridanie pola DTYPE aby sa dala sfunkcnit dedicnost pre enumerations tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (405, '2024-10-11', '20.3.2019 [mhruby] Bugfix definicie tabulky pri praci s boolean hodnotami');
INSERT INTO _db_ (id, create_date, note) VALUES (406, '2024-10-11', '27.3.2019 [mhruby] Rozsirenie ciselnikov od dalsie stringy pre autokupu/autoweb');
INSERT INTO _db_ (id, create_date, note) VALUES (407, '2024-10-11', '28.3.2019 [mhruby] Rozsirenie ciselnikov o dalsie datumy pre autokupu/autoweb');
INSERT INTO _db_ (id, create_date, note) VALUES (408, '2024-10-11', '7.4.2019 [jeeff] Zmena sequencii na identity na Beanoch, Oracle stale potrebuje sequencie');
INSERT INTO _db_ (id, create_date, note) VALUES (409, '2024-10-11', '9.4.2019 [mhruby] Rozsirenie ciselnikov o rodicov pre organizacnu strukturu');
INSERT INTO _db_ (id, create_date, note) VALUES (410, '2024-10-11', '13.5.2019 [mhruby] Rozsirenie ciselnikov od dalsie stringy pre autokupu/autoweb');
INSERT INTO _db_ (id, create_date, note) VALUES (411, '2024-10-11', '27.05.2019 [pbielik] Premenovanie stlpca priority a level v tabulke file_archiv_category_node');
INSERT INTO _db_ (id, create_date, note) VALUES (412, '2024-10-11', '27.05.2019 [pbielik] Premenovanie stlpca level v tabulke file_archiv_category_node a inde');
INSERT INTO _db_ (id, create_date, note) VALUES (413, '2024-10-11', '14.06.2019 [lpasek] Vytvorenie stlpcov double_optin_confirmation_date a double_optin_hash nad tabulkami forms a forms_archive');
INSERT INTO _db_ (id, create_date, note) VALUES (414, '2024-10-11', '20.6.2019 [jeeff] fixnutie pkey generatora domain_redirects');
INSERT INTO _db_ (id, create_date, note) VALUES (415, '2024-10-11', '17.9.2019 [mpijak] Rozsirenie ciselnikov od dalsie stringy pre autokupu/autoweb a');
INSERT INTO _db_ (id, create_date, note) VALUES (416, '2024-10-11', '22.09.2019 [jeeff] Formulare - rozsirenie string value hodnot na 1024 znakov');
INSERT INTO _db_ (id, create_date, note) VALUES (417, '2024-10-11', '27.09.2019 [jeeff] pkey generator pre crypto modul (poradie kluca)');
INSERT INTO _db_ (id, create_date, note) VALUES (418, '2024-10-11', '23.10.2019 [mhruby] Rozsirenie tabulky url_redirect o datum publikacie');
INSERT INTO _db_ (id, create_date, note) VALUES (419, '2024-10-11', '7.11.2019 [mhruby] crontab - UrlRedirectDB');
INSERT INTO _db_ (id, create_date, note) VALUES (420, '2024-10-11', '22.11.2019 [bhric] basket_invoice - zvacsenie stlpca currency na 8 znakov');
INSERT INTO _db_ (id, create_date, note) VALUES (421, '2024-10-11', '5.12.2019 [mhruby] [#39370 - Vynutene nastavenie sablony v adresari] - uloha #0 => doplnenie forceTheUseOfGroupTemplate do adresara webstranok 2');
INSERT INTO _db_ (id, create_date, note) VALUES (422, '2024-10-11', '10.12.2019 [mhruby] [#39370 - Vynutene nastavenie sablony v adresari] - uloha #0 => doplnenie forceTheUseOfGroupTemplate do groups_scheduler');
INSERT INTO _db_ (id, create_date, note) VALUES (423, '2024-10-11', '13.12.2019 [mhruby] revert: crontab - UrlRedirectDB');
INSERT INTO _db_ (id, create_date, note) VALUES (424, '2024-10-11', '13.12.2019 [bhric] [#39430 - Notifikacia pri dosiahnuti maximalneho poctu DB spojeni] - default notifikacia pre web.spam');
INSERT INTO _db_ (id, create_date, note) VALUES (425, '2024-10-11', '8.1.2020 [mhruby] [#40177 - 404, WebJET neobsahuje žiadne súbory] - uloha #18 => bugfix pre oracle obmedzenie dlkzy stlpca');
INSERT INTO _db_ (id, create_date, note) VALUES (426, '2024-10-11', '31.01.2020 [mhruby] Rozsirenie todo tabulky a group_id');
INSERT INTO _db_ (id, create_date, note) VALUES (427, '2024-10-11', '28.02.2020 [jeeff] Oprava stlpca timestamp na date pre mssql');
INSERT INTO _db_ (id, create_date, note) VALUES (428, '2024-10-11', '11.03.2020 [jeeff] Nastavenie primarneho kluca pre vlastnosti formularu v multidomain prostredi');
INSERT INTO _db_ (id, create_date, note) VALUES (429, '2024-10-11', '04.06.2020 [jeeff] Premenovanie premennej groupCreateBlankWebpageAfterCreate na syncGroupAndWebpageTitle kedze jej povodne pouzitie riesilo 2 veci');
INSERT INTO _db_ (id, create_date, note) VALUES (430, '2024-10-11', '05.06.2020 [pgajdos] Zmena chybnych id skupin sablon (0 -> 1)');
INSERT INTO _db_ (id, create_date, note) VALUES (431, '2024-10-11', '17.06.2020 [bhric] forms_archive - doplneny chybajuci stlpec DOMAIN_ID pre Oracle');
INSERT INTO _db_ (id, create_date, note) VALUES (432, '2024-10-11', '2.7.2020 [mhruby] Pridanie stĺpca do tabulky inventory, prekopírovanie hodnôt z pôvodneho stlpca do nového a nasledne vycistinie stlpca ALTER');
INSERT INTO _db_ (id, create_date, note) VALUES (433, '2024-10-11', '2.7.2020 [mhruby] Pridanie stĺpca do tabulky inventory, prekopírovanie hodnôt z pôvodneho stlpca do nového a nasledne vycistinie stlpca UPDATE');
INSERT INTO _db_ (id, create_date, note) VALUES (434, '2024-10-11', '2.7.2020 [mhruby] Pridanie stĺpca do tabulky inventory, prekopírovanie hodnôt z pôvodneho stlpca do nového a nasledne vycistinie stlpca UPDATE 2');
INSERT INTO _db_ (id, create_date, note) VALUES (435, '2024-10-11', '09.07.2020 [pgajdos] Pridanie stlpca task_name do tabulky crontab, umiestnenie stlpca na druhe miesto');
INSERT INTO _db_ (id, create_date, note) VALUES (436, '2024-10-11', '09.07.2020 [pgajdos] Zapisanie popisov cronjobov do stlpca task_name, pre tabulku crontab');
INSERT INTO _db_ (id, create_date, note) VALUES (437, '2024-10-11', '07.10.2020 [pbielik] [#48232 - Spracovanie modulu FIQ] - uprava varchar stlpcov na nvarchar');
INSERT INTO _db_ (id, create_date, note) VALUES (438, '2024-10-11', '14.10.2020 [jeeff] Oprava nazvov stlpcov pkey generatora-domain_redirects');
INSERT INTO _db_ (id, create_date, note) VALUES (439, '2024-10-11', '13.7.2020 [lpasek] adminlog - operation_type');
INSERT INTO _db_ (id, create_date, note) VALUES (440, '2024-10-11', '30.11.2020 [lpasek] documents_history - disapproved_by');
INSERT INTO _db_ (id, create_date, note) VALUES (441, '2024-10-11', '20.01.2021 [lpasek] Pridanie 3 stlpcov do tabulky cookies #51550');
INSERT INTO _db_ (id, create_date, note) VALUES (442, '2024-10-11', '23.3.2021 [jeeff] pkey generator pre mirrorovanie struktury');
INSERT INTO _db_ (id, create_date, note) VALUES (443, '2024-10-11', '23.03.2021 [lmolcan] banner_banners tabulka - pridanie atributov pre obsahovy banner');
INSERT INTO _db_ (id, create_date, note) VALUES (444, '2024-10-11', '13.04.2021 [lmolcan] banner_banners tabulka - pridanie atributov pre obsahovy banner - mysql');
INSERT INTO _db_ (id, create_date, note) VALUES (445, '2024-10-11', '13.3.2021 [sivan] Pridanie stlpca id a user_id do _conf_prepared_ tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (446, '2024-10-11', '01.04.2021 [lbalat] Pridanie stlpca date_published do _conf_prepared_ tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (447, '2024-10-11', '16.04.2021 [lbalat] Pridanie stlpca date_published do groups_scheduler tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (448, '2024-10-11', '28.05.2021 [lbalat] Pridanie hashu pre kliknutie k emailom');
INSERT INTO _db_ (id, create_date, note) VALUES (449, '2024-10-11', '21.12.2021 [lmolcan] Pridanie stlpca pre priezvisko');
INSERT INTO _db_ (id, create_date, note) VALUES (450, '2024-10-11', '3.10.2022 [bhric] banery - rozsirenie o kampanovy banner');
INSERT INTO _db_ (id, create_date, note) VALUES (451, '2024-10-11', '20.04.2020 [lpasek] pkey_generator - gallery_dimension');
INSERT INTO _db_ (id, create_date, note) VALUES (452, '2024-10-11', '13.5.2020 [pgajdos] Pridanie stlpca update_date do _properties_ tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (453, '2024-10-11', '08.07.2020 [pgajdos] Pridanie stlpca task_name do tabulky crontab, umiestnenie stlpca na druhe miesto');
INSERT INTO _db_ (id, create_date, note) VALUES (454, '2024-10-11', '14.10.2020 [jeeff] Oprava nazvov stlpcov pkey generatora');
INSERT INTO _db_ (id, create_date, note) VALUES (455, '2024-10-11', '15.4.2021 [jeeff] _conf_prepared_ -> zmena date_prepared aby povoloval null hodnoty');
INSERT INTO _db_ (id, create_date, note) VALUES (456, '2024-10-11', '14.12.2021 [sivan] Pridanie stlpcov temp_field_a_docid ... temp_field_d_docid do tabuľky documents');
INSERT INTO _db_ (id, create_date, note) VALUES (457, '2024-10-11', '14.12.2021 [sivan] Pridanie stlpcov temp_field_a_docid ... temp_field_d_docid do tabuľky documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (458, '2024-10-11', '14.12.2021 [sivan] Pridanie boolean stlpcov (show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap) do tabulky documents');
INSERT INTO _db_ (id, create_date, note) VALUES (459, '2024-10-11', '18.12.2021 [sivan] Pridanie boolean stlpcov (show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap) do tabulky documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (460, '2024-10-11', '28.12.2021 [sivan] Pridanie boolean stlpcov (show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) do tabulky groups.');
INSERT INTO _db_ (id, create_date, note) VALUES (461, '2024-10-11', '28.12.2021 [sivan] Pridanie boolean stlpcov (show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) do tabulky groups_scheduler.');
INSERT INTO _db_ (id, create_date, note) VALUES (462, '2024-10-11', '28.12.2021 [sivan] Pridanie boolean stlpcov url_inherit_group, generate_url_from_title a editor_virtual_path do tabulky documents');
INSERT INTO _db_ (id, create_date, note) VALUES (463, '2024-10-11', '4.1.2022 [sivan] Pridanie boolean stlpcov url_inherit_group, generate_url_from_title a editor_virtual_path do tabulky documents_history');
INSERT INTO _db_ (id, create_date, note) VALUES (464, '2024-10-11', '21.1.2022 [lbalat] Nastavenie default hodnoty temp_field_d_docid');
INSERT INTO _db_ (id, create_date, note) VALUES (465, '2024-10-11', '21.12.2021 [sivan] Zmena primarneho kluca tabulky form_regular_exp na nový INT stlpec id');
INSERT INTO _db_ (id, create_date, note) VALUES (466, '2024-10-11', '18.2.2022 [jeeff] users - zmena password aby povoloval null hodnoty');
INSERT INTO _db_ (id, create_date, note) VALUES (467, '2024-10-11', '04.10.2022 [sivan] Pridanie zmena typu stĺpcov cas_od a cas_do z varchar na datetime.');
INSERT INTO _db_ (id, create_date, note) VALUES (468, '2024-10-11', '04.10.2022 [sivan] Uprava typov stĺpcov reservation_time_from a reservation_time_to z varchar na Datetime, time_unit z varchar na tinyint.');
INSERT INTO _db_ (id, create_date, note) VALUES (469, '2024-10-11', '15.12.2022 [lbalat] Pridanie stlpcov field_a-f do tabulky banner_banners');
INSERT INTO _db_ (id, create_date, note) VALUES (470, '2024-10-11', '20.12.2022 [lbalat] inquiry - podpora vkladania HTML kodu');
INSERT INTO _db_ (id, create_date, note) VALUES (471, '2024-10-11', '22.12.2022 [lbalat] users - pridanie stlpca api_key');
INSERT INTO _db_ (id, create_date, note) VALUES (472, '2024-10-11', '07.02.2023 [lbalat] pkey-generator - oprava nazvov, fix oracle documents');
INSERT INTO _db_ (id, create_date, note) VALUES (473, '2024-10-11', '11.03.2023 [lbalat] vypnutie FileIndexer cron jobu');
INSERT INTO _db_ (id, create_date, note) VALUES (474, '2024-10-11', '27.3.2023 [lbalat] Pridanie stlpcov publish_after_start do tabulky documents_history pre historicke uchovanie stavu publikovania');
INSERT INTO _db_ (id, create_date, note) VALUES (475, '2024-10-11', '13.04.2023 [lbalat] reservation_object_times - fix Oracle');
INSERT INTO _db_ (id, create_date, note) VALUES (476, '2024-10-11', '18.04.2023 [pbielik] JTB-1630 - conf_prepared value length');
INSERT INTO _db_ (id, create_date, note) VALUES (477, '2024-10-11', '21.4.2023 [lbalat] Pridanie stlpca id do doc_atr tabulky');
INSERT INTO _db_ (id, create_date, note) VALUES (478, '2024-10-11', '25.4.2023 [lbalat] doc_atr_def - pridanie domain_id');
INSERT INTO _db_ (id, create_date, note) VALUES (479, '2024-10-11', '11.5.2023 [lbalat] Banner - oprava NULL stlpcov');
INSERT INTO _db_ (id, create_date, note) VALUES (480, '2024-10-11', '26.05.2023 [sivan] Pridanie novej tabuľky response_headers');
INSERT INTO _db_ (id, create_date, note) VALUES (481, '2024-10-11', '8.6.2023 [sivan] media - pridanie stlpca domain_id');
INSERT INTO _db_ (id, create_date, note) VALUES (482, '2024-10-11', '05.06.2023 [sivan] #55285 - WebJET9 - Banner adresarova struktura zobrazenia');
INSERT INTO _db_ (id, create_date, note) VALUES (483, '2024-10-11', '14.6.2022 [lbalat] users - zmena password aby povoloval null hodnoty aj pre mysql');
INSERT INTO _db_ (id, create_date, note) VALUES (484, '2024-10-11', '7.7.2023 [lbalat] Oracle - nastavenie COLLATE bez ohladu na velkost pismen pre vyhladavanie');
INSERT INTO _db_ (id, create_date, note) VALUES (485, '2024-10-11', '20.07.2023 [sivan] cluster_monitoring - zvacsenie pola pre content');
INSERT INTO _db_ (id, create_date, note) VALUES (486, '2024-10-11', '17.08.2023 [lbalat] export_dat - rename xml format to rss');
INSERT INTO _db_ (id, create_date, note) VALUES (487, '2024-10-11', '10.08.2023 [sivan] seo_keywords - pridanie stlpca actual_position');
INSERT INTO _db_ (id, create_date, note) VALUES (488, '2024-10-11', '14.09.2023 [lbalat] proxy - podpora viacerych lokalnych URL adries');
INSERT INTO _db_ (id, create_date, note) VALUES (489, '2024-10-11', '14.09.2023 [sivan] Pridanie stlpcov field_a-f do tabulky media');
INSERT INTO _db_ (id, create_date, note) VALUES (490, '2024-10-11', '15.11.2023 [lbalat] rating - change class name');
INSERT INTO _db_ (id, create_date, note) VALUES (491, '2024-10-11', '23.12.2023 [lbalat] templates - add inline_editing_mode');
INSERT INTO _db_ (id, create_date, note) VALUES (492, '2024-10-11', '18.3.2024 [sivan] emails_campain - pridanie domain_id');
INSERT INTO _db_ (id, create_date, note) VALUES (493, '2024-10-11', '18.3.2024 [sivan] emails - pridanie domain_id');
INSERT INTO _db_ (id, create_date, note) VALUES (494, '2024-10-11', '18.3.2024 [sivan] emails_unsubscribed - pridanie domain_id');
INSERT INTO _db_ (id, create_date, note) VALUES (495, '2024-10-11', '09.04.2024 [sivan] questions_answers - pridanie answer_to_email');
INSERT INTO _db_ (id, create_date, note) VALUES (496, '2024-10-11', 'priprava synchronizacie');
INSERT INTO _db_ (id, create_date, note) VALUES (497, '2024-10-11', 'nastavenie reg date pouzivatelov');
INSERT INTO _db_ (id, create_date, note) VALUES (498, '2024-10-11', 'konverzia perex_group v tab. documents z name na id');
INSERT INTO _db_ (id, create_date, note) VALUES (499, '2024-10-11', 'nastavenie hodnot group_id pre tabulku stat_views');
INSERT INTO _db_ (id, create_date, note) VALUES (500, '2024-10-11', '8.6.2023 [sivan] pridanie stlpcu domain_id do tabulky media');
INSERT INTO _db_ (id, create_date, note) VALUES (501, '2024-10-11', '18.3.2024 [sivan] pridanie stlpcu domain_id do tabulky emails_campain');
INSERT INTO _db_ (id, create_date, note) VALUES (502, '2024-10-11', '14.3.2009 [kmarton] nastavenie spravnych hodnot browserId kvoli kompatibilite noveho kodu, ovplynuje tabulku stat_from a stat_views');
INSERT INTO _db_ (id, create_date, note) VALUES (503, '2024-10-11', '11.01.2010 [jraska] rozdelenie pristupovych prav ovladacieho panela na jednotlive podkategorie');
INSERT INTO _db_ (id, create_date, note) VALUES (504, '2024-10-11', '14.5.2010 [jeeff] pridanie novych stlpcov do stat_views');
INSERT INTO _db_ (id, create_date, note) VALUES (505, '2024-10-11', '10.03.2018 [lbalat] nastavenie defaultneho map providera podla nastavenia googleMapsApiKey');
INSERT INTO _db_ (id, create_date, note) VALUES (506, '2024-10-11', '20.3.2024 [jeeff] stat_error add domain_id column');
INSERT INTO _db_ (id, create_date, note) VALUES (507, '2024-10-11', 'NEW MODULE: editorMiniEdit');
INSERT INTO _db_ (id, create_date, note) VALUES (508, '2024-10-11', 'NEW MODULE: editor_show_hidden_folders');
INSERT INTO _db_ (id, create_date, note) VALUES (509, '2024-10-11', 'NEW MODULE: cmp_contact');
INSERT INTO _db_ (id, create_date, note) VALUES (510, '2024-10-11', 'NEW MODULE: components.news.edit_templates');
INSERT INTO _db_ (id, create_date, note) VALUES (511, '2024-10-11', 'NEW MODULE: editor_unlimited_upload');
INSERT INTO _db_ (id, create_date, note) VALUES (512, '2024-10-11', 'NEW MODULE: conf.show_all_variables');
INSERT INTO _db_ (id, create_date, note) VALUES (513, '2024-10-11', 'NEW MODULE: cmp_adminlog_logging');
INSERT INTO _db_ (id, create_date, note) VALUES (514, '2024-10-11', 'NEW MODULE: cmp_in-memory-logging');
INSERT INTO _db_ (id, create_date, note) VALUES (515, '2024-10-11', 'NEW MODULE: editor_edit_perex');
INSERT INTO _db_ (id, create_date, note) VALUES (516, '2024-10-11', '17.07.2017 [prau] #22201 rozsirenie Baneroveho systemu o domain_id - fix');
create table _modules_
(
    module_id  int(4) unsigned auto_increment,
    name_key   varchar(128) default ''  not null,
    item_key   varchar(64)  default ''  not null,
    path       varchar(255) default ''  not null,
    menu_order int          default 900 null,
    constraint module_id
        unique (module_id)
);

create index module_id_2
    on _modules_ (module_id);

create table _properties_
(
    prop_key    varchar(255) default '' not null,
    lng         char(3)      default '' not null,
    prop_value  longtext                null,
    update_date datetime                null,
    id          int auto_increment
        primary key,
    constraint prop_key
        unique (prop_key, lng)
);

create index prop_key_2
    on _properties_ (prop_key, lng);

create table admin_message
(
    admin_message_id  int unsigned                  not null
        primary key,
    create_date       datetime                      not null,
    create_by_user_id int                           not null,
    recipient_user_id int                           not null,
    only_for_logged   tinyint(1) unsigned default 0 not null,
    message_text      text                          not null,
    is_readed         tinyint(1)          default 0 null
);

create table adminlog_notify
(
    adminlog_notify_id int unsigned auto_increment
        primary key,
    adminlog_type      int          null,
    email              varchar(255) null,
    text               varchar(255) null
);

INSERT INTO adminlog_notify (adminlog_notify_id, adminlog_type, email, text) VALUES (1, 150, 'web.spam@interway.sk', 'waiting for idle object');
create table alarm_action
(
    alarm_id int(4) default 0 not null,
    days     int(4)           null,
    doc_id   int(4)           null
);

create index alarm_id
    on alarm_action (alarm_id);

create table appcache
(
    id       int auto_increment
        primary key,
    path     varchar(255) null,
    filename varchar(255) null,
    version  int          null,
    created  datetime     null
)
    collate = utf8mb3_uca1400_ai_ci;

create table appcache_file
(
    id           int auto_increment,
    is_recursive tinyint      null,
    path         varchar(255) null,
    filename     varchar(255) null,
    extension    varchar(255) null,
    created      datetime     null,
    appcache_id  int          not null,
    primary key (id, appcache_id)
)
    collate = utf8mb3_uca1400_ai_ci;

create table appcache_page
(
    id           int auto_increment,
    is_recursive tinyint      null,
    path         varchar(255) null,
    created      datetime     null,
    appcache_id  int          not null,
    primary key (id, appcache_id)
);

create table banner_banners
(
    banner_id             int                     not null
        primary key,
    banner_type           int          default 1  not null,
    banner_group          varchar(128)            null,
    priority              int unsigned default 1  null,
    active                tinyint(1)   default 0  not null,
    banner_location       varchar(255)            null,
    banner_redirect       varchar(255)            null,
    width                 int(10)                 null,
    height                int(10)                 null,
    html_code             text                    null,
    date_from             datetime                null,
    date_to               datetime                null,
    max_views             int(10)                 null,
    max_clicks            int(10)                 null,
    stat_views            int          default 0  null,
    stat_clicks           int          default 0  null,
    stat_date             datetime                null,
    name                  varchar(255)            null,
    target                varchar(16)             null,
    click_tag             varchar(32)             null,
    frame_rate            int                     null,
    client_id             int          default -1 null,
    domain_id             int          default 1  null,
    visitor_cookie_group  varchar(100)            null,
    image_link            varchar(255)            null,
    image_link_mobile     varchar(255)            null,
    primary_header        varchar(255)            null,
    secondary_header      varchar(255)            null,
    description_text      text                    null,
    primary_link_title    varchar(255)            null,
    primary_link_url      varchar(255)            null,
    primary_link_target   varchar(7)              null,
    secondary_link_title  varchar(255)            null,
    secondary_link_url    varchar(255)            null,
    secondary_link_target varchar(7)              null,
    campaign_title        varchar(255)            null,
    only_with_campaign    tinyint(1)   default 0  null,
    field_a               varchar(255)            null,
    field_b               varchar(255)            null,
    field_c               varchar(255)            null,
    field_d               varchar(255)            null,
    field_e               varchar(255)            null,
    field_f               varchar(255)            null
);

create index banner_id
    on banner_banners (banner_id);

create table banner_doc
(
    id        int auto_increment
        primary key,
    doc_id    int null,
    banner_id int null
);

create table banner_gr
(
    id        int auto_increment
        primary key,
    group_id  int null,
    banner_id int null
);

create table banner_stat_clicks
(
    id          int(4) unsigned auto_increment
        primary key,
    banner_id   int(4) unsigned default 0                     not null,
    insert_date datetime        default '0000-00-00 00:00:00' not null,
    ip          varchar(16)                                   null,
    host        varchar(128)                                  null,
    clicks      int(4) unsigned default 1                     null,
    domain_id   int             default 1                     null
);

create index i_banner_id
    on banner_stat_clicks (banner_id);

create index i_insert_date
    on banner_stat_clicks (insert_date);

create table banner_stat_views
(
    id          int(4) unsigned auto_increment
        primary key,
    banner_id   int(4) unsigned default 0                     not null,
    insert_date datetime        default '0000-00-00 00:00:00' not null,
    ip          varchar(16)                                   null,
    host        varchar(128)                                  null,
    views       int(4) unsigned default 1                     null,
    domain_id   int             default 1                     null
);

create index i_banner_id
    on banner_stat_views (banner_id);

create index i_insert_date
    on banner_stat_views (insert_date);

create table banner_stat_views_day
(
    view_id     int unsigned auto_increment
        primary key,
    banner_id   int unsigned           not null,
    insert_date date                   not null,
    views       int unsigned default 1 not null,
    domain_id   int          default 1 null
);

create table basket_invoice
(
    basket_invoice_id   int unsigned              not null
        primary key,
    browser_id          bigint unsigned default 0 not null,
    logged_user_id      int                       not null,
    create_date         datetime                  not null,
    status_id           int                       null,
    delivery_company    varchar(255)              null,
    delivery_name       varchar(255)              null,
    delivery_street     varchar(255)              null,
    delivery_city       varchar(255)              null,
    delivery_zip        varchar(10)               null,
    delivery_country    varchar(255)              null,
    internal_invoice_id varchar(255)              null,
    user_note           text                      null,
    user_lng            varchar(6)                null,
    payment_method      varchar(255)              null,
    delivery_method     varchar(255)              null,
    contact_title       varchar(32)               null,
    contact_first_name  varchar(255)              null,
    contact_last_name   varchar(255)              null,
    contact_email       varchar(255)              null,
    contact_phone       varchar(255)              null,
    contact_company     varchar(255)              null,
    contact_street      varchar(255)              null,
    contact_city        varchar(255)              null,
    contact_zip         varchar(10)               null,
    contact_country     varchar(255)              null,
    contact_ico         varchar(32)               null,
    contact_icdph       varchar(32)               null,
    contact_dic         varchar(32)               null,
    field_a             varchar(255)              null,
    field_b             varchar(255)              null,
    field_c             varchar(255)              null,
    field_d             varchar(255)              null,
    field_e             varchar(255)              null,
    field_f             varchar(255)              null,
    html_code           text                      null,
    currency            varchar(8)                null,
    domain_id           int             default 1 not null,
    delivery_surname    varchar(255)              null
);

create table basket_invoice_payments
(
    payment_id     int auto_increment
        primary key,
    invoice_id     int                         not null,
    create_date    datetime                    not null,
    payed_price    decimal(10, 2) default 0.00 not null,
    payment_method varchar(255)                null,
    closed_date    datetime                    null,
    confirmed      tinyint(1)                  null
);

create table basket_item
(
    basket_item_id    int unsigned              not null
        primary key,
    browser_id        bigint unsigned default 0 not null,
    logged_user_id    int                       not null,
    item_id           int unsigned              not null,
    item_title        varchar(255)              null,
    item_part_no      varchar(255)              null,
    item_price        double                    not null,
    item_vat          double                    null,
    item_qty          int unsigned              not null,
    item_note         varchar(255)              null,
    date_insert       datetime                  not null,
    basket_invoice_id int                       null,
    domain_id         int             default 1 not null
);

create table bazar_advertisements
(
    ad_id        int unsigned auto_increment
        primary key,
    group_id     int unsigned        null,
    user_id      int unsigned        null,
    description  text                null,
    contact      varchar(255)        null,
    confirmation tinyint(1) unsigned null,
    image        varchar(255)        null,
    price        varchar(255)        null,
    date_insert  datetime            null
);

create table bazar_groups
(
    group_id        int unsigned auto_increment
        primary key,
    parent_group_id int unsigned        null,
    group_name      varchar(255)        null,
    allow_ad_insert tinyint(1) unsigned null,
    require_approve tinyint(1) unsigned null
);

create table cache
(
    cache_id        int           not null
        primary key,
    data_type       int           not null,
    data_value      varchar(2000) null,
    data_result     mediumtext    null,
    refresh_minutes int           null,
    next_refresh    datetime      null
);

create table calendar
(
    calendar_id         int,
    title               text                                              not null,
    description         text                                              null,
    date_from           datetime            default '2000-01-01 00:00:00' not null,
    date_to             datetime            default '2000-01-01 00:00:00' not null,
    type_id             int(3)              default 0                     not null,
    time_range          varchar(128)                                      null,
    area                varchar(255)                                      null,
    city                varchar(255)                                      null,
    address             varchar(255)                                      null,
    info_1              varchar(255)                                      null,
    info_2              varchar(255)                                      null,
    info_3              varchar(255)                                      null,
    info_4              varchar(255)                                      null,
    info_5              varchar(255)                                      null,
    notify_hours_before int(4)              default 0                     null,
    notify_emails       text                                              null,
    notify_sender       varchar(255)                                      null,
    notify_sent         tinyint(1) unsigned default 0                     not null,
    notify_introtext    text                                              null,
    notify_sendsms      tinyint(1) unsigned default 0                     null,
    lng                 char(3)                                           null,
    creator_id          int                 default -1                    not null,
    approve             int(1)              default 1                     not null,
    suggest             tinyint(1)          default 0                     not null,
    domain_id           int                 default 1                     not null,
    hash_string         varchar(32)                                       null
);

create index calendar_id
    on calendar (calendar_id);

alter table calendar
    modify calendar_id int auto_increment;

create table calendar_invitation
(
    calendar_invitation_id int auto_increment
        primary key,
    calendar_id            int(11) unsigned not null,
    user_id                int(11) unsigned not null,
    sent_date              datetime         not null,
    status_date            datetime         null,
    status                 char             not null,
    domain_id              int default 1    not null
);

create table calendar_name_in_year
(
    day         int(4)      default 0    not null,
    month       int(4)      default 0    not null,
    name        varchar(200)             null,
    calendar_id int(4) unsigned auto_increment
        primary key,
    lng         varchar(10) default 'SK' not null
);

create table calendar_types
(
    type_id         int(3) unsigned auto_increment
        primary key,
    name            varchar(128) default '' not null,
    schvalovatel_id int          default -1 not null,
    domain_id       int          default 1  not null
);

create index type_id
    on calendar_types (type_id);

INSERT INTO calendar_types (type_id, name, schvalovatel_id, domain_id) VALUES (1, 'Výstava', -1, 1);
INSERT INTO calendar_types (type_id, name, schvalovatel_id, domain_id) VALUES (2, 'Šport', -1, 1);
INSERT INTO calendar_types (type_id, name, schvalovatel_id, domain_id) VALUES (3, 'Kultúra', -1, 1);
INSERT INTO calendar_types (type_id, name, schvalovatel_id, domain_id) VALUES (4, 'Rodina', -1, 1);
INSERT INTO calendar_types (type_id, name, schvalovatel_id, domain_id) VALUES (5, 'Konferencia', -1, 1);
create table captcha_dictionary
(
    id   int          not null
        primary key,
    word varchar(255) null
);

create table chat_rooms
(
    room_id             int(4) unsigned,
    room_name           varchar(255)                     not null,
    room_description    text                             null,
    room_class          varchar(255)                     not null,
    max_users           int(4) unsigned     default 50   not null,
    allow_similar_names tinyint(1) unsigned default 0    not null,
    lng                 varchar(3)          default 'sk' not null,
    moderator_name      varchar(128)                     null,
    moderator_username  varchar(64)                      null,
    moderator_password  varchar(64)                      null,
    hide_in_public_list tinyint(1) unsigned default 0    not null
)
    comment 'zoznam izieb pre modul chat';

create index room_id
    on chat_rooms (room_id);

alter table chat_rooms
    modify room_id int(4) unsigned auto_increment;

INSERT INTO chat_rooms (room_id, room_name, room_description, room_class, max_users, allow_similar_names, lng, moderator_name, moderator_username, moderator_password, hide_in_public_list) VALUES (1, 'pokec', 'Volny pokec', 'sk.iway.iwcm.components.chat.HtmlChatRoom', 50, 0, 'sk', null, null, null, 0);
INSERT INTO chat_rooms (room_id, room_name, room_description, room_class, max_users, allow_similar_names, lng, moderator_name, moderator_username, moderator_password, hide_in_public_list) VALUES (2, 'moderovany pokec', 'Moderovany pokec', 'sk.iway.iwcm.components.chat.ModeratedRoom', 50, 0, 'sk', 'Moderator', 'moderator', 'heslo', 0);
create table cluster_monitoring
(
    node       varchar(64) not null,
    type       varchar(64) not null,
    content    mediumtext  null,
    created_at datetime    null,
    primary key (node, type)
);

create table cluster_refresher
(
    cluster_refresh_id int unsigned auto_increment
        primary key,
    node_name          varchar(255) null,
    class_name         varchar(255) null,
    refresh_time       datetime     null
);

INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (262, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (263, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (264, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (265, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (266, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (267, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (268, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (269, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:11:43');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (270, 'auto', 'sk.iway.iwcm.components.proxy.ProxyDB', '2024-10-11 17:14:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (271, 'auto', 'sk.iway.iwcm.doc.GroupsDB', '2024-10-11 17:14:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (272, 'auto', 'sk.iway.iwcm.components.domainRedirects.DomainRedirectDB', '2024-10-11 17:14:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (273, 'auto', 'sk.iway.iwcm.components.proxy.ProxyDB', '2024-10-11 17:14:39');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (274, 'auto', 'sk.iway.iwcm.doc.GroupsDB', '2024-10-11 17:14:39');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (275, 'auto', 'sk.iway.iwcm.components.domainRedirects.DomainRedirectDB', '2024-10-11 17:14:39');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (276, 'auto', 'sk.iway.iwcm.system.msg.MessageDB', '2024-10-11 17:15:34');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (277, 'auto', 'sk.iway.iwcm.doc.TemplatesDB', '2024-10-11 17:15:35');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (278, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:38:36');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (279, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:38:36');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (280, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:38:36');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (281, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:38:36');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (282, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:38:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (283, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:38:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (284, 'auto', 'sk.iway.iwcm.doc.DocDB', '2024-10-11 17:38:37');
INSERT INTO cluster_refresher (cluster_refresh_id, node_name, class_name, refresh_time) VALUES (285, 'auto', 'sk.iway.iwcm.users.UserGroupsDB', '2024-10-11 17:38:37');
create table contact
(
    contact_id int          not null
        primary key,
    name       varchar(255) null,
    ico        varchar(16)  null,
    vatid      varchar(32)  null,
    street     varchar(128) null,
    city       varchar(64)  null,
    zip        varchar(8)   null,
    country    varchar(32)  null,
    contact    varchar(255) null,
    phone      varchar(32)  null,
    fax        varchar(32)  null,
    email      varchar(64)  null,
    web        varchar(255) null,
    gps        varchar(64)  null,
    category   varchar(255) null,
    field_a    varchar(255) null,
    field_b    varchar(255) null,
    field_c    varchar(255) null,
    field_d    varchar(255) null,
    field_e    varchar(255) null
);

create table cookies
(
    cookie_id      int           not null
        primary key,
    domain_id      int           null,
    user_id        int           null,
    save_date      datetime      null,
    cookie_name    varchar(255)  null,
    description    varchar(1000) null,
    provider       varchar(255)  null,
    purpouse       varchar(255)  null,
    validity       varchar(255)  null,
    type           varchar(255)  null,
    classification varchar(255)  null,
    application    varchar(255)  null,
    typical_value  varchar(255)  null,
    party_3rd      tinyint(1)    null
);

INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (1, 0, -1, null, 'JSESSIONID', null, null, null, null, 'http', 'nutne', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (2, 0, -1, null, 'lng', null, null, null, null, 'http', 'nutne', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (3, 0, -1, null, 'statBrowserIdNew', null, null, null, null, 'http', 'statisticke', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (4, 0, -1, null, 'forumemail', null, null, null, null, 'http', 'statisticke', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (5, 0, -1, null, 'forumname', null, null, null, null, 'http', 'statisticke', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (6, 0, -1, null, '_ga', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (7, 0, -1, null, '_gat', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (8, 0, -1, null, '__utmt', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (9, 0, -1, null, '__utma', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (10, 0, -1, null, '__utmb', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (11, 0, -1, null, '__utmc', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (12, 0, -1, null, '__utmz', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (13, 0, -1, null, '__utmv', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (14, 0, -1, null, 'id', null, null, null, null, 'http', 'marketingove', null, null, null);
INSERT INTO cookies (cookie_id, domain_id, user_id, save_date, cookie_name, description, provider, purpouse, validity, type, classification, application, typical_value, party_3rd) VALUES (15, 0, -1, null, 'drt', null, null, null, null, 'http', 'marketingove', null, null, null);
create table crontab
(
    id             int(4) unsigned auto_increment
        primary key,
    task_name      varchar(64)                null,
    second         varchar(64) default '0'    null,
    minute         varchar(64) default '*'    null,
    hour           varchar(64) default '*'    null,
    dayofmonth     varchar(64) default '*'    null,
    month          varchar(64) default '*'    null,
    dayofweek      varchar(64) default '*'    null,
    year           varchar(64) default '*'    null,
    task           varchar(255)               null,
    extrainfo      varchar(255)               null,
    businessDays   varchar(6)  default 'true' null,
    cluster_node   varchar(64)                null,
    audit_task     varchar(6)                 null,
    run_at_startup tinyint(1)  default 0      null,
    enable_task    tinyint(1)  default 1      null
);

INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (1, 'Zmazanie starých udalostí v kalendári', '0', '*/10', '*', '*', '*', '*', '*', 'sk.iway.iwcm.calendar.CalendarDB', null, 'true', 'all', '1', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (3, 'Kontrola pozícií kľúčových slov v Google', '0', '0', '2', '*', '*', '*', '*', 'sk.iway.iwcm.components.seo.SeoManager', '', '0', 'all', '1', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (4, 'Vytvorenie monitoringu systému', '*/30', '*', '*', '*', '*', '*', '*', 'sk.iway.iwcm.system.monitoring.MonitoringManager', '', '0', 'all', '0', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (5, 'Publikovanie zmien v adresároch web stránok', '0', '*', '*', '*', '*', '*', '*', 'sk.iway.iwcm.doc.GroupPublisher', null, '0', null, '0', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (6, 'Zmazanie záznamov heatmapy', '0', '30', '5', '*', '*', '*', '*', 'sk.iway.iwcm.stat.heat_map.HeatMapCleaner', null, 'true', null, '0', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (7, 'Zápis štatistiky návštevnosti', '0', '*', '*', '*', '*', '*', '*', 'sk.iway.iwcm.stat.StatWriteBuffer', null, 'true', null, '0', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (9, 'Aktualizácia persistent cache', '30', '*/5', '*', '*', '*', '*', '*', 'sk.iway.iwcm.system.cache.PersistentCacheDB', null, 'true', 'node3', 'false', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (10, 'Publikovanie zmien v konfigurácii', '0', '*/5', '*', '*', '*', '*', '2013', 'sk.iway.iwcm.system.ConfPreparedPublisher', null, 'false', 'all', 'false', 0, 1);
INSERT INTO crontab (id, task_name, second, minute, hour, dayofmonth, month, dayofweek, year, task, extrainfo, businessDays, cluster_node, audit_task, run_at_startup, enable_task) VALUES (11, 'Publikovanie zmien súborov v Archíve súborov', '0', '*/5', '*', '*', '*', '*', '*', 'sk.iway.iwcm.components.file_archiv.FileArchivatorInsertLater', null, 'true', 'all', 'false', 0, 0);
create table customer_reviews
(
    review_id      int          not null
        primary key,
    stars          int          null,
    name           varchar(255) null,
    surname        varchar(255) null,
    mail           varchar(255) null,
    description    text         null,
    url            varchar(255) null,
    date           date         null,
    show_to_public tinyint(1)   null,
    approve_hash   varchar(255) null,
    domain_id      int          null
);

create table dictionary
(
    dictionary_id    int                                    not null
        primary key,
    name             varchar(255)                           not null,
    name_orig        varchar(255)                           not null,
    dictionary_group varchar(128)                           not null,
    value            longtext                               not null,
    language         varchar(3) collate utf8mb3_slovak_ci   null,
    domain           varchar(255) collate utf8mb3_slovak_ci null
);

create table dirprop
(
    dir_url            varchar(255)                   not null
        primary key,
    index_fulltext     tinyint(1) unsigned default 0  not null,
    password_protected varchar(255)                   null,
    logon_doc_id       int                 default -1 not null,
    constraint dir_url
        unique (dir_url)
);

create table doc_atr
(
    doc_id       int(4) unsigned     default 0 not null,
    atr_id       int(4) unsigned     default 0 not null,
    value_string varchar(255)                  null,
    value_int    double                        null,
    value_bool   tinyint(1) unsigned default 0 null,
    id           int auto_increment
        primary key
);

create index doc_id
    on doc_atr (doc_id, atr_id);

create table doc_atr_def
(
    atr_id            int(4) unsigned auto_increment
        primary key,
    atr_name          varchar(255)     default ''        not null,
    order_priority    int(4)           default 10        null,
    atr_description   varchar(255)                       null,
    atr_default_value longtext                           null,
    atr_type          tinyint unsigned default 0         not null,
    atr_group         varchar(32)      default 'default' null,
    true_value        varchar(255)                       null,
    false_value       varchar(255)                       null,
    domain_id         int              default 1         not null
);

create index atr_id
    on doc_atr_def (atr_id);

create table doc_reactions
(
    ID         int auto_increment
        primary key,
    USER_ID    int      not null,
    DOC_ID     int      not null,
    REACTION   int      not null,
    CREATED_AT datetime not null,
    constraint doc_reactions_ID_uindex
        unique (ID)
);

create table doc_subscribe
(
    subscribe_id int unsigned auto_increment
        primary key,
    doc_id       int            null,
    first_name   varchar(255)   null,
    last_name    varchar(255)   null,
    email        varchar(255)   not null,
    user_id      int default -1 null
);

create table document_forum
(
    forum_id          int(11) unsigned auto_increment
        primary key,
    doc_id            int(11) unsigned    default 0  not null,
    parent_id         int                 default -1 not null,
    subject           varchar(255)                   null,
    question          text                           null,
    question_date     datetime                       null,
    author_name       varchar(255)                   null,
    author_email      varchar(255)                   null,
    ip                varchar(255)                   null,
    confirmed         tinyint(1)          default 1  not null,
    hash_code         varchar(64)                    null,
    send_answer_notif tinyint(1) unsigned default 0  null,
    user_id           int                 default -1 null,
    flag              varchar(128)                   null,
    stat_views        int unsigned                   null,
    stat_replies      int unsigned                   null,
    stat_last_post    datetime                       null,
    active            tinyint(1) unsigned default 1  null,
    deleted           tinyint(1)          default 0  null,
    domain_id         int                 default 1  not null
)
    comment 'diskusne forum';

create index forum_id
    on document_forum (forum_id);

create index i_doc_id
    on document_forum (doc_id);

create table document_notes
(
    id         int          not null
        primary key,
    doc_id     int          null,
    history_id int          null,
    note       varchar(255) null,
    user_id    int          null,
    created    timestamp    null
);

create table documents
(
    doc_id                  int auto_increment
        primary key,
    title                   varchar(255)        default ''                    not null,
    data                    mediumtext                                        not null,
    data_asc                mediumtext                                        not null,
    external_link           varchar(255)                                      null,
    navbar                  text                                              not null,
    date_created            datetime            default '2000-01-01 00:00:00' not null,
    publish_start           datetime                                          null,
    publish_end             datetime                                          null,
    author_id               int                 default 0                     not null,
    group_id                int                                               null,
    temp_id                 int                 default 0                     not null,
    views_total             int                 default 0                     not null,
    views_month             int                 default 0                     not null,
    searchable              tinyint(1)          default 0                     not null,
    available               tinyint(1)          default 0                     not null,
    cacheable               tinyint(1)          default 0                     not null,
    file_name               varchar(255)                                      null,
    file_change             datetime                                          null,
    sort_priority           int                 default 0                     not null,
    header_doc_id           int                                               null,
    menu_doc_id             int                 default -1                    not null,
    footer_doc_id           int                 default -1                    not null,
    password_protected      varchar(255)                                      null,
    html_head               text                                              null,
    html_data               text                                              null,
    perex_place             varchar(255)                                      null,
    perex_image             varchar(255)                                      null,
    perex_group             varchar(255)                                      null,
    show_in_menu            tinyint(1) unsigned default 1                     null,
    event_date              datetime                                          null,
    virtual_path            varchar(255)                                      null,
    sync_id                 int                 default 0                     null,
    sync_status             int                 default 0                     null,
    logon_page_doc_id       int(4)              default -1                    null,
    right_menu_doc_id       int(4)              default -1                    null,
    field_a                 varchar(255)                                      null,
    field_b                 varchar(255)                                      null,
    field_c                 varchar(255)                                      null,
    field_d                 varchar(255)                                      null,
    field_e                 varchar(255)                                      null,
    field_f                 varchar(255)                                      null,
    field_g                 varchar(255)                                      null,
    field_h                 varchar(255)                                      null,
    field_i                 varchar(255)                                      null,
    field_j                 varchar(255)                                      null,
    field_k                 varchar(255)                                      null,
    field_l                 varchar(255)                                      null,
    disable_after_end       tinyint(1)          default 0                     null,
    forum_count             int                 default 0                     null,
    field_m                 varchar(255)                                      null,
    field_n                 varchar(255)                                      null,
    field_o                 varchar(255)                                      null,
    field_p                 varchar(255)                                      null,
    field_q                 varchar(255)                                      null,
    field_r                 varchar(255)                                      null,
    field_s                 varchar(255)                                      null,
    field_t                 varchar(255)                                      null,
    require_ssl             tinyint(1)          default 0                     null,
    root_group_l1           int                                               null,
    root_group_l2           int                                               null,
    root_group_l3           int                                               null,
    temp_field_a_docid      int                 default -1                    null,
    temp_field_b_docid      int                 default -1                    null,
    temp_field_c_docid      int                 default -1                    null,
    temp_field_d_docid      int                 default -1                    null,
    show_in_navbar          tinyint(1)                                        null,
    show_in_sitemap         tinyint(1)                                        null,
    logged_show_in_menu     tinyint(1)                                        null,
    logged_show_in_navbar   tinyint(1)                                        null,
    logged_show_in_sitemap  tinyint(1)                                        null,
    url_inherit_group       tinyint(1)          default 0                     null,
    generate_url_from_title tinyint(1)          default 0                     null,
    editor_virtual_path     varchar(255)                                      null,
    publish_after_start     tinyint(1)          default 0                     null
);

create index IX_documents_cacheable
    on documents (cacheable);

create index IX_documents_dae
    on documents (disable_after_end);

create index IX_documents_pgl1
    on documents (root_group_l1);

create index IX_documents_pgl2
    on documents (root_group_l2);

create index IX_documents_pgl3
    on documents (root_group_l3);

create index i_group_id
    on documents (group_id);

create fulltext index search
    on documents (title, data_asc);

INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (1, 'Default header', '<h1>Headline</h1><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit aspernatur labore vel rem adipisci commodi odit eum vitae asperiores esse?</p><a href=\'#\' class=\'btn btn-default\'>Lorem ipsum.</a>', '', '', 'Default hlavička', '2002-07-25 00:00:00', null, null, 1, 4, 1, 0, 0, 0, 1, 0, '1_default_hlavicka.html', '2003-04-11 15:51:10', 50, -1, -1, -1, null, null, null, null, null, null, 1, null, null, 1, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (2, 'Default navigation', '!INCLUDE(/components/menu/menu_ul_li.jsp, rootGroupId=1, startOffset=0, maxLevel=3, classes=basic, openAllItems=true, rootUlId=mainNavigation)!', '', '', 'Default menu', '2003-05-23 00:00:00', null, null, 1, 3, 1, 0, 0, 0, 1, 0, '2_default_menu.html', '2003-08-27 10:36:59', 50, -1, -1, -1, null, '', '', null, null, null, 1, null, null, 2, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (3, 'Default footer', '<p>© !YEAR! InterWay, a. s. All Rights Reserved. Page generated by WebJET CMS.</p>', '', '', 'Default pätička', '2002-07-25 00:00:00', null, null, 1, 4, 1, 0, 0, 0, 1, 0, '3_default_paticka.html', '2003-04-11 15:51:10', 50, -1, -1, -1, null, null, null, null, null, null, 1, null, null, 3, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (4, 'Hlavna stranka', '<p>Vitajte na&nbsp;demo stránke systému WebJET.</p>

<p>Viac informácií o&nbsp;systéme nájdete na&nbsp;stránke <a href="http://www.webjetcms.sk/" target="_blank">www.webjetcms.sk</a>.</p>', '   vitajte na      demo stranke systemu webjet.

   viac informacii o      systeme najdete na      stranke                                                    www.webjetcms.sk    .    <h1>hlavna stranka</h1>
', '', 'Hlavna stranka', '2024-10-11 11:40:14', null, null, 1, 1, 1, 0, 0, 1, 1, 0, '/Slovensky', '2003-10-05 22:43:25', 1, -1, -1, -1, null, '', '', '', '', null, 1, null, '/', 0, 0, 0, -1, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', '', '', '', 0, 1, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, '', 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (5, 'Podstránka 1', '<p>Toto je podstránka 1</p>
<p>Ak chcete do stránky vložiť predpripravený objekt, kliknite v editore na komponenty a vyberte Predpripravené HTML. Tam si vyberte stránku a kliknutím na OK ju vložte do stránky. Nové predpripravené objekty si môžete vytvoriť v adresári System->HTMLBox.</p>
<p>Pred použitím formuláru prosím najskôr naň kliknite pravým tlačítkom, dajte vlastnosti formuláru a zmeňte emailovú adresu.</p>
<p>
<script src=\'/components/form/check_form.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/fix_e.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/event_attacher.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/class_magic.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/check_form_impl.jsp\' ENGINE=\'text/javascript\'></script>
<link media=\'screen\' href=\'/components/form/check_form.css\' ENGINE=\'text/css\' rel=\'stylesheet\'/>
<form name=\'formMailForm\' action=\'/formmail.do?recipients=test@tester.org&savedb=Kontaktny_formular\' method=\'post\'>
    <table cellspacing=\'0\' cellpadding=\'0\' border=\'0\'>
        <tbody>
            <tr>
                <td>Vaše meno: </td>
                <td><input class=\'required invalid\' maxlength=\'255\' name=\'meno\'/> </td>
            </tr>
            <tr>
                <td> Vaša emailová adresa:</td>
                <td><input class=\'required email invalid\' maxlength=\'255\' name=\'email\'/> </td>
            </tr>
            <tr>
                <td valign=\'top\'> Otázka / pripomienka:</td>
                <td><textarea class=\'required invalid\' name=\'otazka\' rows=\'5\' cols=\'40\'></textarea> </td>
            </tr>
            <tr>
                <td> </td>
                <td align=\'right\'> <input ENGINE=\'submit\' name=\'btnSubmit\' value=\'Odoslať\'/></td>
            </tr>
        </tbody>
    </table>
</form>
</p>
<p> </p>', '<p>toto je podstranka 1</p>
<p>ak chcete do stranky vlozit predpripraveny objekt, kliknite v editore na komponenty a vyberte predpripravene html. tam si vyberte stranku a kliknutim na ok ju vlozte do stranky. nove predpripravene objekty si mozete vytvorit v adresari system->htmlbox.</p>
<p>pred pouzitim formularu prosim najskor nan kliknite pravym tlacitkom, dajte vlastnosti formularu a zmente emailovu adresu.</p>
<p>
<script src=\'/components/form/check_form.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/fix_e.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/event_attacher.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/class_magic.js\' ENGINE=\'text/javascript\'></script>
<script src=\'/components/form/check_form_impl.jsp\' ENGINE=\'text/javascript\'></script>
<link media=\'screen\' href=\'/components/form/check_form.css\' ENGINE=\'text/css\' rel=\'stylesheet\'/>
<form name=\'formmailform\' action=\'/formmail.do?recipients=test@tester.org&savedb=kontaktny_formular\' method=\'post\'>
    <table cellspacing=\'0\' cellpadding=\'0\' border=\'0\'>
        <tbody>
            <tr>
                <td>vase meno: </td>
                <td><input class=\'required invalid\' maxlength=\'255\' name=\'meno\'/> </td>
            </tr>
            <tr>
                <td> vasa emailova adresa:</td>
                <td><input class=\'required email invalid\' maxlength=\'255\' name=\'email\'/> </td>
            </tr>
            <tr>
                <td valign=\'top\'> otazka / pripomienka:</td>
                <td><textarea class=\'required invalid\' name=\'otazka\' rows=\'5\' cols=\'40\'></textarea> </td>
            </tr>
            <tr>
                <td> </td>
                <td align=\'right\'> <input ENGINE=\'submit\' name=\'btnsubmit\' value=\'odoslat\'/></td>
            </tr>
        </tbody>
    </table>
</form>
</p>
<p> </p>', '', 'Podstránka 1', '2003-10-05 22:43:25', null, null, 1, 1, 1, 0, 0, 1, 1, 0, '5_podstranka_1.html', '2003-10-05 22:43:25', 1, -1, -1, -1, null, '', null, '', '', null, 1, null, null, 5, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (6, 'Podstránka 2', '<h1>Podstránka 2</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi id sapien ut massa interdum ultricies. Sed eget enim in ante ornare feugiat. Curabitur risus lectus, iaculis sed, pulvinar quis, convallis euismod, massa. Curabitur est enim, varius sed, hendrerit at, convallis elementum, tortor. In hac habitasse platea dictumst. Proin sagittis massa ac massa. Maecenas vel libero. Curabitur vestibulum pellentesque elit. Phasellus aliquet quam quis urna. In ultrices est vel lorem. Aliquam sit amet mi et nulla scelerisque vestibulum. Donec pellentesque tellus vitae massa. Curabitur euismod. Donec quis pede. Vivamus nulla mauris, aliquet sed, aliquet vitae, fringilla id, massa. Etiam id magna sed dolor rhoncus condimentum. Ut lacinia nonummy odio. Pellentesque interdum, tortor vitae congue elementum, nibh ipsum pellentesque quam, sed tempor tortor est sit amet felis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sagittis tellus vitae lorem.</p>', '<h1>podstranka 2</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi id sapien ut massa interdum ultricies. Sed eget enim in ante ornare feugiat. Curabitur risus lectus, iaculis sed, pulvinar quis, convallis euismod, massa. Curabitur est enim, varius sed, hendrerit at, convallis elementum, tortor. In hac habitasse platea dictumst. Proin sagittis massa ac massa. Maecenas vel libero. Curabitur vestibulum pellentesque elit. Phasellus aliquet quam quis urna. In ultrices est vel lorem. Aliquam sit amet mi et nulla scelerisque vestibulum. Donec pellentesque tellus vitae massa. Curabitur euismod. Donec quis pede. Vivamus nulla mauris, aliquet sed, aliquet vitae, fringilla id, massa. Etiam id magna sed dolor rhoncus condimentum. Ut lacinia nonummy odio. Pellentesque interdum, tortor vitae congue elementum, nibh ipsum pellentesque quam, sed tempor tortor est sit amet felis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sagittis tellus vitae lorem.</p>', '', 'Podstránka 2', '2003-10-05 22:43:25', null, null, 1, 1, 1, 0, 0, 1, 1, 0, '6_podstranka_2.html', '2003-10-05 22:43:25', 1, -1, -1, -1, null, '', null, '', '', null, 1, null, null, 6, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (7, 'Stranka s nadpisom a 2 stlpcami', '<table cellspacing=\'0\' cellpadding=\'2\' width=\'100%\' border=\'0\'>
    <tbody>
        <tr>
            <td colspan=\'2\'>
            <h1>Toto je nadpis stránky</h1>
            </td>
        </tr>
        <tr>
            <td valign=\'top\' width=\'50%\'>
            <p> Toto je stlpec 1</p>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam pulvinar sollicitudin est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae. Duis nulla risus, varius non, condimentum nec, adipiscing vel, nisl. Vestibulum facilisis lorem. Nam tortor tellus, venenatis vitae, tincidunt in, fringilla ut, arcu. Suspendisse imperdiet magna egestas nibh. Sed rutrum. Nulla pellentesque mollis leo. Mauris vel metus eget dolor feugiat consequat. Nam dapibus dapibus felis. Phasellus sit amet tortor vel ante dictum aliquam. Integer vehicula nisi et quam euismod commodo. Nam vel justo. Sed mattis libero non enim. Donec feugiat tortor. Quisque mauris. Nullam urna turpis, aliquam sit amet, posuere eget, consectetuer nec, massa. In non mauris.</p>
            </td>
            <td valign=\'top\' width=\'50%\'>
            <p> Toto je stlpec 2</p>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse in libero ac turpis porttitor porta. Aliquam varius massa vitae massa. Pellentesque fringilla diam vitae velit. Nulla facilisi. Sed id enim. Aenean in urna. Vivamus sed urna at elit porttitor ultrices. Morbi dolor felis, facilisis at, congue quis, convallis et, ipsum. Donec rutrum nulla luctus arcu luctus blandit. Mauris vitae ipsum et risus venenatis scelerisque. Duis ipsum. Donec viverra purus. Fusce non libero. Cras elementum. Curabitur fermentum elit at lorem. Etiam facilisis. Pellentesque nec erat ut ipsum consectetuer sodales. Morbi nec dolor ac velit rutrum faucibus. </p>
            </td>
        </tr>
    </tbody>
</table>', '<table cellspacing=\'0\' cellpadding=\'2\' width=\'100%\' border=\'0\'>
    <tbody>
        <tr>
            <td colspan=\'2\'>
            <h1>toto je nadpis stranky</h1>
            </td>
        </tr>
        <tr>
            <td valign=\'top\' width=\'50%\'>
            <p> toto je stlpec 1</p>
            <p>lorem ipsum dolor sit amet, consectetuer adipiscing elit. nam pulvinar sollicitudin est. vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. duis nulla risus, varius non, condimentum nec, adipiscing vel, nisl. vestibulum facilisis lorem. nam tortor tellus, venenatis vitae, tincidunt in, fringilla ut, arcu. suspendisse imperdiet magna egestas nibh. sed rutrum. nulla pellentesque mollis leo. mauris vel metus eget dolor feugiat consequat. nam dapibus dapibus felis. phasellus sit amet tortor vel ante dictum aliquam. integer vehicula nisi et quam euismod commodo. nam vel justo. sed mattis libero non enim. donec feugiat tortor. quisque mauris. nullam urna turpis, aliquam sit amet, posuere eget, consectetuer nec, massa. in non mauris.</p>
            </td>
            <td valign=\'top\' width=\'50%\'>
            <p> toto je stlpec 2</p>
            <p>lorem ipsum dolor sit amet, consectetuer adipiscing elit. suspendisse in libero ac turpis porttitor porta. aliquam varius massa vitae massa. pellentesque fringilla diam vitae velit. nulla facilisi. sed id enim. aenean in urna. vivamus sed urna at elit porttitor ultrices. morbi dolor felis, facilisis at, congue quis, convallis et, ipsum. donec rutrum nulla luctus arcu luctus blandit. mauris vitae ipsum et risus venenatis scelerisque. duis ipsum. donec viverra purus. fusce non libero. cras elementum. curabitur fermentum elit at lorem. etiam facilisis. pellentesque nec erat ut ipsum consectetuer sodales. morbi nec dolor ac velit rutrum faucibus. </p>
            </td>
        </tr>
    </tbody>
</table>', '', 'Stranka s nadpisom a 2 stlpcami', '2003-10-05 22:43:25', null, null, 1, 2, 1, 0, 0, 1, 1, 0, '7_s_nadpisom.html', '2003-10-05 22:43:25', 1, -1, -1, -1, null, '', null, '', '', null, 1, null, null, 7, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (8, 'Kontaktný formulár', '<p>Pred použitím formuláru prosím najskôr naň kliknite pravým tlačítkom, dajte vlastnosti formuláru a zmeňte emailovú adresu.</p>
<p>
<script src=\'/components/form/check_form.js\' ENGINE=\'text/javascript\'></script>
<form name=\'formMailForm\' action=\'/formmail.do?recipients=test@tester.org&savedb=Kontaktny_formular\' method=\'post\'>
    <table cellspacing=\'0\' cellpadding=\'0\' border=\'0\'>
        <tbody>
            <tr>
                <td>Vaše meno:</td>
                <td><input class=\'required\' maxlength=\'255\' name=\'meno\'/> </td>
            </tr>
            <tr>
                <td> Vaša emailová adresa:</td>
                <td><input class=\'required email\' maxlength=\'255\' name=\'email\'/> </td>
            </tr>
            <tr>
                <td valign=\'top\'> Otázka / pripomienka:</td>
                <td><textarea class=\'required\' name=\'otazka\' rows=\'5\' cols=\'40\'></textarea> </td>
            </tr>
            <tr>
                <td> </td>
                <td align=\'right\'> <input ENGINE=\'submit\' name=\'btnSubmit\' value=\'Odoslať\'/></td>
            </tr>
        </tbody>
    </table>
</form>
</p>
<p> </p>', '<p>pred pouzitim formularu prosim najskor nan kliknite pravym tlacitkom, dajte vlastnosti formularu a zmente emailovu adresu.</p>
<p>
<script src=\'/components/form/check_form.js\' ENGINE=\'text/javascript\'></script>
<form name=\'formmailform\' action=\'/formmail.do?recipients=test@tester.org&savedb=kontaktny_formular\' method=\'post\'>
    <table cellspacing=\'0\' cellpadding=\'0\' border=\'0\'>
        <tbody>
            <tr>
                <td>vase meno: </td>
                <td><input class=\'required\' maxlength=\'255\' name=\'meno\'/> </td>
            </tr>
            <tr>
                <td> vasa emailova adresa:</td>
                <td><input class=\'required email\' maxlength=\'255\' name=\'email\'/> </td>
            </tr>
            <tr>
                <td valign=\'top\'> otazka / pripomienka:</td>
                <td><textarea class=\'required\' name=\'otazka\' rows=\'5\' cols=\'40\'></textarea> </td>
            </tr>
            <tr>
                <td> </td>
                <td align=\'right\'> <input ENGINE=\'submit\' name=\'btnsubmit\' value=\'odoslat\'/></td>
            </tr>
        </tbody>
    </table>
</form>
</p>
<p> </p>', '', 'Kontaktný formulár', '2003-10-05 22:43:25', null, null, 1, 21, 1, 0, 0, 1, 1, 0, '8_kontakt.html', '2003-10-05 22:43:25', 1, -1, -1, -1, null, '', null, '', '', null, 1, null, null, 8, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
INSERT INTO documents (doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, menu_doc_id, footer_doc_id, password_protected, html_head, html_data, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, root_group_l1, root_group_l2, root_group_l3, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (9, 'Default left menu', '!INCLUDE(/components/menu/menu_ul_li.jsp, rootGroupId=1, startOffset=1, maxLevel=3, classes=basic, openAllItems=true, rootUlId=mainNavigation)!', '', '', 'Default menu', '2003-05-23 00:00:00', null, null, 1, 3, 1, 0, 0, 0, 1, 0, '9_default_menu.html', '2003-08-27 10:36:59', 50, -1, -1, -1, null, '', '', null, null, null, 1, null, null, 9, 2, -1, -1, null, null, null, null, null, null, null, null, null, null, null, null, 0, 0, null, null, null, null, null, null, null, null, 0, null, null, null, -1, -1, -1, -1, null, null, null, null, null, 0, 0, null, 0);
create table documents_history
(
    history_id              int auto_increment
        primary key,
    save_date               datetime                                          null,
    approved_by             int                 default -1                    not null,
    awaiting_approve        varchar(255)                                      null,
    actual                  tinyint(1)          default 0                     not null,
    doc_id                  int                 default 0                     not null,
    title                   varchar(255)        default ''                    not null,
    data                    mediumtext                                        not null,
    data_asc                mediumtext                                        not null,
    external_link           varchar(255)                                      null,
    navbar                  text                                              not null,
    date_created            datetime            default '2000-01-01 00:00:00' not null,
    publish_start           datetime                                          null,
    publish_end             datetime                                          null,
    author_id               int                 default 0                     not null,
    group_id                int                                               null,
    temp_id                 int                 default 0                     not null,
    views_total             int                 default 0                     not null,
    views_month             int                 default 0                     not null,
    searchable              tinyint(1)          default 0                     not null,
    available               tinyint(1)          default 0                     not null,
    cacheable               tinyint(1)          default 0                     not null,
    file_name               varchar(255)                                      null,
    file_change             datetime                                          null,
    sort_priority           int                 default 0                     not null,
    header_doc_id           int                                               null,
    footer_doc_id           int                                               null,
    menu_doc_id             int                 default -1                    not null,
    password_protected      varchar(255)                                      null,
    html_head               text                                              null,
    html_data               text                                              null,
    publicable              tinyint(1) unsigned default 0                     null,
    perex_place             varchar(255)                                      null,
    perex_image             varchar(255)                                      null,
    perex_group             varchar(255)                                      null,
    show_in_menu            tinyint(1) unsigned default 1                     null,
    event_date              datetime                                          null,
    virtual_path            varchar(255)                                      null,
    sync_id                 int                 default 0                     null,
    sync_status             int                 default 0                     null,
    logon_page_doc_id       int(4)              default -1                    null,
    right_menu_doc_id       int(4)              default -1                    null,
    field_a                 varchar(255)                                      null,
    field_b                 varchar(255)                                      null,
    field_c                 varchar(255)                                      null,
    field_d                 varchar(255)                                      null,
    field_e                 varchar(255)                                      null,
    field_f                 varchar(255)                                      null,
    field_g                 varchar(255)                                      null,
    field_h                 varchar(255)                                      null,
    field_i                 varchar(255)                                      null,
    field_j                 varchar(255)                                      null,
    field_k                 varchar(255)                                      null,
    field_l                 varchar(255)                                      null,
    disable_after_end       tinyint(1)          default 0                     null,
    approve_date            datetime                                          null,
    forum_count             int                 default 0                     null,
    field_m                 varchar(255)                                      null,
    field_n                 varchar(255)                                      null,
    field_o                 varchar(255)                                      null,
    field_p                 varchar(255)                                      null,
    field_q                 varchar(255)                                      null,
    field_r                 varchar(255)                                      null,
    field_s                 varchar(255)                                      null,
    field_t                 varchar(255)                                      null,
    require_ssl             tinyint(1)          default 0                     null,
    disapproved_by          int                                               null,
    temp_field_a_docid      int                 default -1                    null,
    temp_field_b_docid      int                 default -1                    null,
    temp_field_c_docid      int                 default -1                    null,
    temp_field_d_docid      int                 default -1                    null,
    show_in_navbar          tinyint(1)                                        null,
    show_in_sitemap         tinyint(1)                                        null,
    logged_show_in_menu     tinyint(1)                                        null,
    logged_show_in_navbar   tinyint(1)                                        null,
    logged_show_in_sitemap  tinyint(1)                                        null,
    url_inherit_group       tinyint(1)          default 0                     null,
    generate_url_from_title tinyint(1)          default 0                     null,
    editor_virtual_path     varchar(64)                                       null,
    publish_after_start     tinyint(1)          default 0                     null
);

create index IX_dh_author_id
    on documents_history (author_id);

create index IX_dh_awaiting_approve
    on documents_history (awaiting_approve);

create index IX_dh_docid
    on documents_history (doc_id);

create index IX_documents_hist_publicable
    on documents_history (publicable);

INSERT INTO documents_history (history_id, save_date, approved_by, awaiting_approve, actual, doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, footer_doc_id, menu_doc_id, password_protected, html_head, html_data, publicable, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, approve_date, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, disapproved_by, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (1, '2024-10-11 11:39:59', 0, '', 0, 4, 'Hlavna stranka', '<p>Vitajte na&nbsp;demo stránke systému WebJET.</p>

<p>Viac informácií o&nbsp;systéme nájdete na&nbsp;stránke <a href="http://www.webjetcms.sk/" target="_blank">www.webjetcms.sk</a>.</p>', '   vitajte na      demo stranke systemu webjet.

   viac informacii o      systeme najdete na      stranke                                                    www.webjetcms.sk    .    <h1>hlavna stranka</h1>
', '', 'Hlavna stranka', '2024-10-11 11:39:59', null, null, 1, 1, 1, 0, 0, 1, 1, 0, null, null, 1, -1, -1, -1, null, '', '', 0, '', '', null, 1, null, '/', 0, 1, 0, -1, '', '', '', '', '', '', '', '', '', '', '', '', 0, null, 0, '', '', '', '', '', '', '', '', 0, 0, -1, -1, -1, -1, null, null, null, null, null, 0, 0, '', 0);
INSERT INTO documents_history (history_id, save_date, approved_by, awaiting_approve, actual, doc_id, title, data, data_asc, external_link, navbar, date_created, publish_start, publish_end, author_id, group_id, temp_id, views_total, views_month, searchable, available, cacheable, file_name, file_change, sort_priority, header_doc_id, footer_doc_id, menu_doc_id, password_protected, html_head, html_data, publicable, perex_place, perex_image, perex_group, show_in_menu, event_date, virtual_path, sync_id, sync_status, logon_page_doc_id, right_menu_doc_id, field_a, field_b, field_c, field_d, field_e, field_f, field_g, field_h, field_i, field_j, field_k, field_l, disable_after_end, approve_date, forum_count, field_m, field_n, field_o, field_p, field_q, field_r, field_s, field_t, require_ssl, disapproved_by, temp_field_a_docid, temp_field_b_docid, temp_field_c_docid, temp_field_d_docid, show_in_navbar, show_in_sitemap, logged_show_in_menu, logged_show_in_navbar, logged_show_in_sitemap, url_inherit_group, generate_url_from_title, editor_virtual_path, publish_after_start) VALUES (2, '2024-10-11 11:40:14', 0, null, 1, 4, 'Hlavna stranka', '<p>Vitajte na&nbsp;demo stránke systému WebJET.</p>

<p>Viac informácií o&nbsp;systéme nájdete na&nbsp;stránke <a href="http://www.webjetcms.sk/" target="_blank">www.webjetcms.sk</a>.</p>', '   vitajte na      demo stranke systemu webjet.

   viac informacii o      systeme najdete na      stranke                                                    www.webjetcms.sk    .    <h1>hlavna stranka</h1>
', '', 'Hlavna stranka', '2024-10-11 11:40:14', null, null, 1, 1, 1, 0, 0, 1, 1, 0, null, null, 1, -1, -1, -1, null, '', '', 0, '', '', null, 1, null, '/', 0, 0, 0, -1, '', '', '', '', '', '', '', '', '', '', '', '', 0, null, 0, '', '', '', '', '', '', '', '', 0, 0, -1, -1, -1, -1, null, null, null, null, null, 0, 0, '', 0);
create table domain_limits
(
    domain_limit_id int(9) auto_increment
        primary key,
    domain          varchar(63)          not null,
    time_unit       varchar(20)          not null,
    limit_size      int(9)               not null,
    active          tinyint(1) default 1 not null,
    min_delay       int                  not null,
    delay_active    tinyint(1) default 1 not null
);

INSERT INTO domain_limits (domain_limit_id, domain, time_unit, limit_size, active, min_delay, delay_active) VALUES (1, '*', 'MINUTES', 10, 1, 1000, 1);
create table domain_redirects
(
    redirect_id     int                  not null
        primary key,
    redirect_from   varchar(100)         null,
    redirect_to     varchar(512)         null,
    redirect_params tinyint(1) default 0 not null,
    redirect_path   tinyint(1) default 0 not null,
    active          tinyint(1) default 0 not null,
    http_protocol   varchar(15)          null
);

create table email_files
(
    id        int auto_increment
        primary key,
    subject   varchar(255) not null,
    sender    varchar(255) not null,
    sent_date timestamp    not null,
    file_path varchar(255) not null,
    visible   int(1)       not null
);

create table emails
(
    email_id           int(4) unsigned auto_increment
        primary key,
    recipient_email    varchar(128)        default '0' not null,
    recipient_name     varchar(128)                    null,
    sender_name        varchar(128)        default '0' null,
    sender_email       varchar(128)        default '0' not null,
    subject            varchar(255)                    null,
    url                varchar(255)        default ''  not null,
    attachments        text                            null,
    retry              int(4)              default 0   not null,
    sent_date          datetime                        null,
    created_by_user_id int(4)              default 0   not null,
    create_date        datetime                        null,
    send_at            datetime                        null,
    message            text                            null,
    reply_to           varchar(255)                    null,
    cc_email           varchar(255)                    null,
    bcc_email          varchar(255)                    null,
    disabled           tinyint(1) unsigned default 0   null,
    campain_id         int                             null,
    recipient_user_id  int                 default -1  null,
    seen_date          datetime                        null,
    click_hash         varchar(64)                     null,
    domain_id          int                 default 1   not null
);

create index i_campain_id
    on emails (campain_id);

create table emails_campain
(
    emails_campain_id   int unsigned auto_increment
        primary key,
    sender_name         varchar(255)  null,
    sender_email        varchar(255)  null,
    subject             varchar(255)  null,
    url                 varchar(255)  null,
    created_by_user_id  int           null,
    create_date         datetime      null,
    count_of_recipients int           null,
    count_of_sent_mails int default 0 not null,
    last_sent_date      datetime      null,
    user_groups         varchar(64)   null,
    send_at             datetime      null,
    attachments         text          null,
    reply_to            varchar(255)  null,
    cc_email            varchar(255)  null,
    bcc_email           varchar(255)  null,
    domain_id           int default 1 not null
);

create table emails_stat_click
(
    click_id   int unsigned auto_increment
        primary key,
    email_id   int unsigned              not null,
    link       varchar(255)              not null,
    click_date datetime                  not null,
    session_id bigint unsigned default 0 null,
    browser_id bigint unsigned default 0 null
);

create table emails_unsubscribed
(
    emails_unsubscribed_id int unsigned auto_increment
        primary key,
    email                  varchar(128)  null,
    create_date            datetime      null,
    domain_id              int default 1 not null
);

create table enumeration_data
(
    enumeration_data_id        int                           not null
        primary key,
    enumeration_type_id        int                           not null,
    child_enumeration_type_id  int                           null,
    string1                    varchar(1024)                 null,
    string2                    varchar(1024)                 null,
    string3                    varchar(1024)                 null,
    string4                    varchar(1024)                 null,
    decimal1                   decimal(10, 4)                null,
    decimal2                   decimal(10, 4)                null,
    decimal3                   decimal(10, 4)                null,
    decimal4                   decimal(10, 4)                null,
    boolean1                   tinyint(1)  default 0         not null,
    boolean2                   tinyint(1)  default 0         not null,
    boolean3                   tinyint(1)  default 0         not null,
    boolean4                   tinyint(1)  default 0         not null,
    sort_priority              int                           null,
    hidden                     tinyint(1)  default 0         not null,
    DTYPE                      varchar(31) default 'default' null,
    string5                    varchar(1024)                 null,
    string6                    varchar(1024)                 null,
    date1                      datetime                      null,
    date2                      datetime                      null,
    date3                      datetime                      null,
    date4                      datetime                      null,
    parent_enumeration_data_id int                           null,
    string7                    varchar(1024)                 null,
    string8                    varchar(1024)                 null,
    string9                    varchar(1024)                 null,
    string10                   varchar(1024)                 null,
    string11                   varchar(1024)                 null,
    string12                   varchar(1024)                 null
)
    collate = utf8mb3_uca1400_ai_ci;

create table enumeration_type
(
    enumeration_type_id           int                           not null
        primary key,
    name                          varchar(255)                  null,
    string1_name                  varchar(255)                  null,
    string2_name                  varchar(255)                  null,
    string3_name                  varchar(255)                  null,
    string4_name                  varchar(255)                  null,
    string5_name                  varchar(255)                  null,
    string6_name                  varchar(255)                  null,
    string7_name                  varchar(255)                  null,
    string8_name                  varchar(255)                  null,
    string9_name                  varchar(255)                  null,
    string10_name                 varchar(255)                  null,
    string11_name                 varchar(255)                  null,
    string12_name                 varchar(255)                  null,
    decimal1_name                 varchar(255)                  null,
    decimal2_name                 varchar(255)                  null,
    decimal3_name                 varchar(255)                  null,
    decimal4_name                 varchar(255)                  null,
    boolean1_name                 varchar(255)                  null,
    boolean2_name                 varchar(255)                  null,
    boolean3_name                 varchar(255)                  null,
    boolean4_name                 varchar(255)                  null,
    hidden                        tinyint(1)                    null,
    child_enumeration_type_id     int                           null,
    DTYPE                         varchar(31) default 'default' null,
    allow_child_enumeration_type  tinyint(1)  default 0         not null,
    date1_name                    varchar(255)                  null,
    date2_name                    varchar(255)                  null,
    date3_name                    varchar(255)                  null,
    date4_name                    varchar(255)                  null,
    allow_parent_enumeration_data tinyint(1)  default 0         not null
)
    collate = utf8mb3_uca1400_ai_ci;

create table export_dat
(
    export_dat_id    int              not null
        primary key,
    url_address      varchar(255)     not null,
    format           varchar(32)      not null,
    number_items     int              null,
    group_ids        varchar(255)     null,
    expand_group_ids bit default b'1' not null,
    perex_group      varchar(255)     null,
    order_type       varchar(255)     not null,
    asc_order        bit default b'0' not null,
    publish_type     varchar(255)     not null,
    no_perex_check   bit default b'0' not null
)
    collate = utf8mb3_slovak_ci;

create table file_archiv
(
    file_archiv_id    int               not null
        primary key,
    user_id           int               null,
    file_path         varchar(255)      null,
    file_name         varchar(255)      null,
    virtual_file_name varchar(255)      null,
    show_file         tinyint(1)        not null,
    date_insert       datetime          null,
    valid_from        datetime          null,
    valid_to          datetime          null,
    domain            varchar(255)      null,
    reference_id      int               null,
    order_id          int               null,
    product_code      varchar(255)      null,
    product           varchar(255)      null,
    category          varchar(255)      null,
    md5               varchar(50)       null,
    reference_to_main varchar(255)      null,
    priority          varchar(255)      null,
    field_a           varchar(255)      null,
    field_b           varchar(255)      null,
    field_c           int               null,
    field_d           bigint            null,
    field_e           varchar(255)      null,
    global_id         int               null,
    note              varchar(1100)     null,
    date_upload_later date              null,
    uploaded          int(2) default -1 null,
    emails            varchar(1100)     null,
    file_size         int               null,
    domain_id         int    default 1  null,
    extended_data_id  int               null
);

create table file_archiv_category_node
(
    id            int auto_increment
        primary key,
    lft           int                                        null,
    rgt           int                                        null,
    lvl           int                                        null,
    rootid        int                                        null,
    category_name varchar(500) collate utf8mb3_uca1400_ai_ci null,
    date_insert   datetime                                   null,
    string1Name   varchar(500) collate utf8mb3_uca1400_ai_ci null,
    string2Name   varchar(500) collate utf8mb3_uca1400_ai_ci null,
    string3Name   varchar(500) collate utf8mb3_uca1400_ai_ci null,
    int1Val       int                                        null,
    int2Val       int                                        null,
    int3Val       int                                        null,
    category_type int                                        null,
    sort_priority int                                        null,
    is_show       int                                        null
);

create table file_atr
(
    file_name    varchar(128)        default '' not null,
    link         varchar(255)        default '' not null,
    atr_id       int(4) unsigned     default 0  not null,
    value_string varchar(255)                   null,
    value_int    int(4) unsigned                null,
    value_bool   tinyint(1) unsigned default 0  null,
    primary key (link, atr_id)
);

create index link
    on file_atr (link, atr_id);

create table file_atr_def
(
    atr_id            int(4) unsigned auto_increment
        primary key,
    atr_name          varchar(32)      default ''        not null,
    order_priority    int(4)           default 10        null,
    atr_description   varchar(255)                       null,
    atr_default_value varchar(255)                       null,
    atr_type          tinyint unsigned default 0         not null,
    atr_group         varchar(32)      default 'default' null,
    true_value        varchar(255)                       null,
    false_value       varchar(255)                       null
);

create index atr_id
    on file_atr_def (atr_id);

create table file_history
(
    file_history_id int                  not null
        primary key,
    file_url        varchar(255)         null,
    change_date     datetime             null,
    user_id         int                  null,
    deleted         tinyint(1) default 0 null,
    history_path    varchar(255)         null,
    ip_address      varchar(32)          null
);

create table form_attributes
(
    value      varchar(1024) null,
    form_name  varchar(255)  not null,
    param_name varchar(64)   not null,
    domain_id  int default 1 not null,
    primary key (form_name, param_name, domain_id)
);

create table form_regular_exp
(
    title   varchar(255) not null,
    type    varchar(32)  not null,
    reg_exp varchar(255) not null,
    id      int auto_increment
        primary key
);

INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.allPhone', 'phone', '^([+]?[s0-9]+)?(d{3}|[(]?[0-9]+[)])?([-]?[s]?[0-9])+$', 1);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.alphabet', 'alphabet', '^[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZľěščťřžýáíéúůňťóďäôöüĽĚŠČŤŘŽÝÁÍÉÚŮŇŤÓĎÄÔÖÜ ]{1,}$', 2);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.alphabetLowercase', 'alphabetLowercase', '^[abcdefghijklmnopqrstuvwxyzľěščťřžýáíéúůňťóďäô ]{1,}$', 3);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.alphabetUppercase', 'alphabetUppercase', '^[ABCDEFGHIJKLMNOPQRSTUVWXYZĽĚŠČŤŘŽÝÁÍÉÚŮŇŤÓĎÄÔ ]{1,}$', 4);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.alphanumeric', 'alphanumeric', '^[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ľěščťřžýáíéúůňťóďäôĽĚŠČŤŘŽÝÁÍÉÚŮŇŤÓĎÄÔ ]{1,}$', 5);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.date', 'date', '^(([0]?[123456789])|([12][0-9])|(3[01]))[.]((0?[123456789])|(1[012]))[.][0-9]{4}$', 6);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.datetime', 'datetime', '^[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{4}.[0-9]{1,2}[:][0-9]{1,2}[:][0-9]{1,2}$', 7);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.email', 'email', '^[a-zA-Z0-9]+[a-zA-Z0-9\\._+=#$%&-]*[a-zA-Z0-9]+@[a-zA-Z0-9]+[a-zA-Z0-9\\._-]*[a-zA-Z0-9]+\\.[a-zA-Z]{2,16}$', 8);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.email2', 'email2', '^[a-z0-9]+[a-z0-9\\._-]*[a-z0-9]+@[a-z0-9]+[a-z0-9\\._-]*[a-z0-9]+\\.[a-z]{2,4}$', 9);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.fixedPhone', 'fixedPhone', '(^[0-9]{2,3}[\\/][0-9]{3,12}$)|(^[+][0-9]{1,3}[\\/][0-9]{1,2}[\\/][0-9]{3,12}$)', 10);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.integer', 'integer', '^[-]?[0-9]+$', 11);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.loginChars', 'loginChars', '^[0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_.]{1,}$', 12);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen16', 'minLen16', '.................*', 13);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen2', 'minLen2', '...*', 14);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen3', 'minLen3', '....*', 15);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen4', 'minLen4', '.....*', 16);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen5', 'minLen5', '......*', 17);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen6', 'minLen6', '.......*', 18);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.minLen8', 'minLen8', '.........*', 19);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.mobilePhone', 'mobilePhone', '(^[0-9]{4}[\\/][0-9]{6}$)|(^[+][0-9]{1,3}[\\/][0-9]{3}[\\/][0-9]{6}$)', 20);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.numbers', 'numbers', '^[-]?[0-9]+([,.][0-9]+)?$', 21);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.postalCode', 'postalCode', '^(([0-9]{5})|([0-9]{3} [0-9]{2})|([0-9]{2} [0-9]{3}))$', 22);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.safeChars', 'safeChars', '^[0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_ ]{1,}$', 23);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.safeChars2', 'safeChars2', '^[0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_\\\\-]{1,}$', 24);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.time', 'time', '^[0-9]{1,2}[:][0-9]{1,2}$', 25);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.trim', 'trim', '^[^ \\f\\n\\r\\t\\v]+[.]*', 26);
INSERT INTO form_regular_exp (title, type, reg_exp, id) VALUES ('checkform.title.url', 'url', '^http[s]?:\\/\\/[a-zA-Z0-9]+([-_\\.]?[a-zA-Z0-9])*\\.[a-zA-Z]{2,4}([:0-9]*)(\\/{1}[%-_~&=\\?\\.:a-z0-9]*)*$', 27);
create table forms
(
    id                             int(11) unsigned auto_increment
        primary key,
    form_name                      varchar(255) default '' not null,
    data                           text                    not null,
    files                          text                    null,
    create_date                    datetime                null,
    html                           mediumtext              null,
    user_id                        int(4)       default -1 not null,
    note                           text                    null,
    doc_id                         int(4)       default -1 not null,
    last_export_date               datetime                null,
    domain_id                      int          default 1  not null,
    double_optin_confirmation_date datetime                null,
    double_optin_hash              varchar(20)             null
)
    comment 'formulare';

create index IX_forms_formname
    on forms (form_name);

create index id
    on forms (id);

create table forms_archive
(
    id                             int(11) unsigned          not null
        primary key,
    form_name                      varchar(255) default '''' not null,
    data                           text                      not null,
    files                          text                      null,
    create_date                    datetime                  null,
    html                           mediumtext                null,
    user_id                        int(4)       default -1   not null,
    note                           text                      null,
    doc_id                         int(4)       default -1   not null,
    last_export_date               datetime                  null,
    domain_id                      int          default 1    not null,
    double_optin_confirmation_date datetime                  null,
    double_optin_hash              varchar(20)               null
);

create index IX_forms_archive_formname
    on forms_archive (form_name);

create index id
    on forms_archive (id);

create table forum
(
    id                       int unsigned auto_increment
        primary key,
    doc_id                   int unsigned                  null,
    active                   tinyint(1) unsigned           not null,
    date_from                datetime                      null,
    date_to                  datetime                      null,
    hours_after_last_message int                           null,
    message_confirmation     tinyint(1)          default 0 not null,
    approve_email            varchar(255)                  null,
    notif_email              varchar(255)                  null,
    message_board            tinyint(1) unsigned default 0 not null,
    advertisement_type       tinyint(1) unsigned           null,
    admin_groups             varchar(32)                   null,
    addmessage_groups        varchar(128)                  null,
    domain_id                int                 default 1 not null
);

create table gallery
(
    image_id          int(4) unsigned auto_increment
        primary key,
    image_path        varchar(255)            null,
    s_description_sk  varchar(255)            null,
    l_description_sk  text                    null,
    image_name        varchar(255)            null,
    s_description_en  varchar(255)            null,
    l_description_en  text                    null,
    s_description_cz  varchar(255)            null,
    l_description_cz  text                    null,
    s_description_de  varchar(255)            null,
    l_description_de  text                    null,
    l_description_pl  text                    null,
    s_description_pl  varchar(255) default '' null,
    l_description_ru  text                    null,
    s_description_ru  varchar(255) default '' null,
    l_description_hu  text                    null,
    s_description_hu  varchar(255) default '' null,
    l_description_cho text                    null,
    s_description_cho varchar(255) default '' null,
    l_description_esp text                    null,
    s_description_esp varchar(255) default '' null,
    author            varchar(255) default '' null,
    send_count        int          default 0  null,
    allowed_domains   varchar(255)            null,
    perex_group       varchar(255)            null,
    selected_x        int                     null,
    selected_y        int                     null,
    selected_width    int                     null,
    selected_height   int                     null,
    upload_datetime   datetime                null,
    sort_priority     int                     null,
    domain_id         int          default 1  not null
);

create index i_image_path
    on gallery (image_path);

create table gallery_dimension
(
    dimension_id         int(4) unsigned auto_increment
        primary key,
    image_path           varchar(255)    default '0' null,
    image_width          int(4) unsigned default 0   null,
    image_height         int(4) unsigned default 0   null,
    normal_width         int(4) unsigned default 0   not null,
    normal_height        int(4) unsigned default 0   not null,
    resize_mode          varchar(1)                  null,
    gallery_name         varchar(255)                null,
    gallery_perex        text                        null,
    create_date          datetime                    null,
    author               varchar(255)                null,
    views                int             default 0   not null,
    watermark_saturation int                         null,
    watermark            varchar(255)                null,
    watermark_placement  varchar(255)                null,
    domain_id            int             default 1   not null
);

create index i_image_path
    on gallery_dimension (image_path);

INSERT INTO gallery_dimension (dimension_id, image_path, image_width, image_height, normal_width, normal_height, resize_mode, gallery_name, gallery_perex, create_date, author, views, watermark_saturation, watermark, watermark_placement, domain_id) VALUES (5, '/images/gallery', 160, 120, 750, 560, null, null, null, null, null, 0, null, null, null, 1);
create table gdpr_regexp
(
    gdpr_regexp_id int           not null
        primary key,
    regexp_name    varchar(255)  null,
    regexp_value   varchar(1024) null,
    user_id        int           null,
    date_insert    datetime      null,
    domain_id      int default 1 not null
);

INSERT INTO gdpr_regexp (gdpr_regexp_id, regexp_name, regexp_value, user_id, date_insert, domain_id) VALUES (1, 'rodné číslo', '[0-9]{6}/[0-9]{3,4}', -1, null, 1);
INSERT INTO gdpr_regexp (gdpr_regexp_id, regexp_name, regexp_value, user_id, date_insert, domain_id) VALUES (2, 'telefónne číslo 10 samostatných čísel', '[0-9]{10}', -1, null, 1);
INSERT INTO gdpr_regexp (gdpr_regexp_id, regexp_name, regexp_value, user_id, date_insert, domain_id) VALUES (3, 'telefónne číslo iné formáty', '(\\+[0-9]{3}) ?[0-9]{3,4} ?[0-9]{3} ?[0-9]{3}', -1, null, 1);
INSERT INTO gdpr_regexp (gdpr_regexp_id, regexp_name, regexp_value, user_id, date_insert, domain_id) VALUES (4, 'rok mesiac deň oddelené znakmi: ./-', '(19|20)dd[- /.](0[1-9]|1[012]|[0-9])[- /.](0[1-9]|[12][0-9]|3[01]|[0-9])', -1, null, 1);
INSERT INTO gdpr_regexp (gdpr_regexp_id, regexp_name, regexp_value, user_id, date_insert, domain_id) VALUES (5, 'deň mesiac rok oddelené znakmi: ./-', '(0[1-9]|[12][0-9]|3[01]|[0-9])[- /.](0[1-9]|1[012]|[0-9])[- /.](19|20)dd', -1, null, 1);
create table gis
(
    gis_id       int           not null
        primary key,
    cathegory    varchar(128)  null,
    name         varchar(255)  null,
    description  text          null,
    gps_lat      double(9, 6)  null,
    gps_lon      double(9, 6)  null,
    detail_url   varchar(2000) null,
    image_url    varchar(2000) null,
    pin_url      varchar(255)  null,
    approved     tinyint(1)    null,
    approve_hash varchar(255)  null,
    info_a       varchar(255)  null,
    info_b       varchar(255)  null,
    info_c       varchar(255)  null,
    info_d       varchar(255)  null,
    domain_id    int default 1 not null
);

create table `groups`
(
    group_id                int auto_increment
        primary key,
    group_name              varchar(255)                   not null,
    internal                tinyint(1)          default 0  not null,
    parent_group_id         int                 default 0  not null,
    navbar                  varchar(255)                   null,
    default_doc_id          int                            null,
    temp_id                 int                            null,
    sort_priority           int                 default 0  not null,
    password_protected      varchar(255)                   null,
    menu_type               tinyint(1) unsigned default 1  null,
    url_dir_name            varchar(255)                   null,
    sync_id                 int                 default 0  null,
    sync_status             int                 default 0  null,
    html_head               text                           null,
    logon_page_doc_id       int(4)              default -1 null,
    domain_name             varchar(255)                   null,
    new_page_docid_template int                 default 0  null,
    install_name            varchar(255)                   null,
    field_a                 varchar(255)                   null,
    field_b                 varchar(255)                   null,
    field_c                 varchar(255)                   null,
    field_d                 varchar(255)                   null,
    logged_menu_type        tinyint(1)          default -1 null,
    link_group_id           int                 default -1 null,
    lng                     varchar(8)                     null,
    hidden_in_admin         tinyint                        null,
    force_group_template    tinyint             default 0  null,
    show_in_navbar          tinyint(1)                     null,
    show_in_sitemap         tinyint(1)                     null,
    logged_show_in_navbar   tinyint(1)                     null,
    logged_show_in_sitemap  tinyint(1)                     null
);

INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (1, 'Slovensky', 0, 0, 'Slovensky', 4, 1, 0, null, 2, null, 1, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (2, 'Šablóny', 1, 20, 'Šablóny', 4, 1, 1500, null, 2, null, 2, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (3, 'Menu', 1, 20, 'Menu', 4, 1, 1501, null, 2, null, 3, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (4, 'Hlavičky-pätičky', 1, 20, 'Hlavičky-pätičky', 4, 2, 1502, null, 1, null, 4, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (5, 'English', 0, 0, 'English', 0, 1, 500, null, 2, null, 5, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (20, 'System', 1, 0, 'System', 4, 1, 1000, null, 2, null, 20, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (21, 'HTMLBox', 1, 20, 'HTMLBox', 4, 1, 1503, null, 2, null, 21, 2, null, -1, null, 0, null, null, null, null, null, -1, -1, null, null, 0, null, null, null, null);
INSERT INTO `groups` (group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, lng, hidden_in_admin, force_group_template, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (22, 'Kôš', 1, 20, 'Kôš', -1, 1, 10010, null, 2, 'Kôš', 0, 0, '', -1, '', 0, '', '', '', '', '', -1, -1, null, 0, 0, null, null, null, null);
create table groups_approve
(
    approve_id   int(11) unsigned auto_increment
        primary key,
    group_id     int(11) unsigned default 0 null,
    user_id      int(11) unsigned default 0 null,
    approve_mode int(4) unsigned            not null
);

create table groups_scheduler
(
    schedule_id             int auto_increment
        primary key,
    group_id                int                            not null,
    group_name              varchar(255)                   not null,
    internal                tinyint(1)          default 0  not null,
    parent_group_id         int                 default 0  not null,
    navbar                  varchar(255)                   null,
    default_doc_id          int                            null,
    temp_id                 int                            null,
    sort_priority           int                 default 0  not null,
    password_protected      varchar(255)                   null,
    menu_type               tinyint(1) unsigned default 1  null,
    url_dir_name            varchar(255)                   null,
    sync_id                 int                 default 0  null,
    sync_status             int                 default 0  null,
    html_head               text                           null,
    logon_page_doc_id       int(4)              default -1 null,
    domain_name             varchar(255)                   null,
    new_page_docid_template int                 default 0  null,
    install_name            varchar(255)                   null,
    field_a                 varchar(255)                   null,
    field_b                 varchar(255)                   null,
    field_c                 varchar(255)                   null,
    field_d                 varchar(255)                   null,
    logged_menu_type        tinyint(1)          default -1 null,
    link_group_id           int                 default -1 null,
    when_to_publish         timestamp                      null,
    save_date               datetime                       null,
    user_id                 int                 default -1 null,
    lng                     varchar(8)                     null,
    hidden_in_admin         tinyint                        null,
    force_group_template    tinyint             default 0  null,
    date_published          datetime                       null,
    show_in_navbar          tinyint(1)                     null,
    show_in_sitemap         tinyint(1)                     null,
    logged_show_in_navbar   tinyint(1)                     null,
    logged_show_in_sitemap  tinyint(1)                     null
);

INSERT INTO groups_scheduler (schedule_id, group_id, group_name, internal, parent_group_id, navbar, default_doc_id, temp_id, sort_priority, password_protected, menu_type, url_dir_name, sync_id, sync_status, html_head, logon_page_doc_id, domain_name, new_page_docid_template, install_name, field_a, field_b, field_c, field_d, logged_menu_type, link_group_id, when_to_publish, save_date, user_id, lng, hidden_in_admin, force_group_template, date_published, show_in_navbar, show_in_sitemap, logged_show_in_navbar, logged_show_in_sitemap) VALUES (1, 22, 'Kôš', 1, 20, 'Kôš', -1, 1, 10010, null, 2, 'Kôš', 0, 0, '', -1, '', 0, '', '', '', '', '', -1, -1, null, '2024-10-11 11:46:43', 1, null, 0, 0, null, null, null, null, null);
create table inquiry
(
    question_id      int(4) unsigned auto_increment,
    question_text    text                      null,
    hours            int(4) unsigned default 0 null,
    question_group   varchar(255)              null,
    answer_text_ok   tinytext                  null,
    answer_text_fail tinytext                  null,
    date_from        datetime                  null,
    date_to          datetime                  null,
    question_active  int(1)          default 1 null,
    multiple         tinyint(1)                null,
    total_clicks     int                       null,
    domain_id        int(6)          default 1 null,
    constraint question_id
        unique (question_id)
);

create index question_id_2
    on inquiry (question_id);

INSERT INTO inquiry (question_id, question_text, hours, question_group, answer_text_ok, answer_text_fail, date_from, date_to, question_active, multiple, total_clicks, domain_id) VALUES (1, 'Ako sa vám páči WebJET', 24, 'default', 'Ďakujeme, že ste sa zúčastnili ankety.', 'Ľutujeme, ale tejto ankety ste sa už zúčastnili.', null, null, 1, null, null, 1);
create table inquiry_answers
(
    answer_id     int(4) unsigned auto_increment
        primary key,
    question_id   int             default 0 not null,
    answer_text   varchar(255)              null,
    answer_clicks int(4) unsigned default 0 null,
    image_path    varchar(255)              null,
    url           varchar(255)              null,
    domain_id     int(6)          default 1 null
);

INSERT INTO inquiry_answers (answer_id, question_id, answer_text, answer_clicks, image_path, url, domain_id) VALUES (1, 1, 'Je super', 8, null, null, 1);
INSERT INTO inquiry_answers (answer_id, question_id, answer_text, answer_clicks, image_path, url, domain_id) VALUES (2, 1, 'Neviem, nepoznám', 3, null, null, 1);
create table inquiry_users
(
    user_id     int              not null,
    question_id int(4) unsigned  not null,
    answer_id   int(4) unsigned  not null,
    create_date datetime         null,
    ip_address  varchar(255)     null,
    domain_id   int(6) default 1 null
);

create table inquirysimple_answers
(
    id          int auto_increment
        primary key,
    form_id     varchar(255) not null,
    question_id varchar(255) not null,
    user_id     varchar(255) not null
);

create index form_id
    on inquirysimple_answers (form_id);

create table insert_script
(
    insert_script_id int           not null
        primary key,
    save_date        datetime      null,
    user_id          int           null,
    script_body      text          null,
    name             varchar(255)  null,
    valid_from       datetime      null,
    valid_to         datetime      null,
    position         varchar(60)   null,
    domain_id        int default 1 null,
    cookie_class     varchar(255)  null
);

create table insert_script_doc
(
    insert_script_doc_id int not null
        primary key,
    doc_id               int null,
    insert_script        int null
);

create table insert_script_gr
(
    insert_script_gr_id int           not null
        primary key,
    group_id            int           null,
    insert_script       int           null,
    domain_id           int default 1 null
);

create table inventory
(
    inventory_id     int         not null
        primary key,
    type             varchar(32) not null,
    serial_number    varchar(32) null,
    inventory_number varchar(32) null,
    user_id          int         null,
    room             varchar(32) null,
    deleted          tinyint     null,
    date_deleted     date        null,
    name             varchar(64) null,
    description      text        null,
    junk_reason      text        null,
    department       varchar(32) null
);

create table inventory_detail
(
    inventory_detail_id int         not null
        primary key,
    inventory_id        int         not null,
    type                varchar(32) not null,
    serial_number       varchar(32) null,
    name                varchar(64) null,
    description         text        null,
    date_from           date        not null,
    date_till           date        null,
    junk_reason         text        null
);

create table inventory_log
(
    inventory_log_id int         not null
        primary key,
    inventory_id     int         not null,
    user_id          int         null,
    room             varchar(32) null,
    date_from        date        not null,
    date_till        date        null,
    department       varchar(32) null
);

create table media
(
    media_id            int unsigned       not null
        primary key,
    media_fk_id         int unsigned       null,
    media_fk_table_name varchar(255)       null,
    media_title_sk      varchar(255)       null,
    media_title_cz      varchar(255)       null,
    media_title_de      varchar(255)       null,
    media_title_en      varchar(255)       null,
    media_link          varchar(255)       null,
    media_thumb_link    varchar(255)       null,
    media_group         varchar(255)       null,
    media_info_sk       text               null,
    media_info_cz       text               null,
    media_info_de       text               null,
    media_info_en       text               null,
    media_sort_order    int(10) default 10 not null,
    last_update         datetime           null,
    domain_id           int     default 1  not null,
    field_a             varchar(255)       null,
    field_b             varchar(255)       null,
    field_c             varchar(255)       null,
    field_d             varchar(255)       null,
    field_e             varchar(255)       null,
    field_f             varchar(255)       null
);

create index IX_media_docis
    on media (media_fk_id);

create table media_group_to_media
(
    media_group_id int not null,
    media_id       int not null
);

create index ix_media_id
    on media_group_to_media (media_id);

create table media_groups
(
    media_group_id   int          not null
        primary key,
    media_group_name varchar(255) not null,
    available_groups varchar(255) null,
    related_pages    text         null
);

create table monitoring
(
    monitoring_id int auto_increment
        primary key,
    date_insert   datetime     null,
    node_name     varchar(16)  null,
    db_active     int          null,
    db_idle       int          null,
    mem_free      bigint       null,
    mem_total     bigint       null,
    cache         int          null,
    sessions      int          null,
    cpu_usage     double(5, 2) null,
    process_usage double(5, 2) null
);

create table multigroup_mapping
(
    doc_id    int                   not null
        primary key,
    master_id int        default -1 not null,
    redirect  tinyint(1) default 1  not null
);

create table passwords_history
(
    passwords_history_id int          not null
        primary key,
    user_id              int          null,
    password             varchar(128) null,
    salt                 varchar(64)  null,
    save_date            datetime     null
);

INSERT INTO passwords_history (passwords_history_id, user_id, password, salt, save_date) VALUES (5, 1, '7c89a6978915e89a71da64170eebf55d', '', '2024-10-11 11:46:11');
create table perex_group_doc
(
    doc_id         int not null,
    perex_group_id int null
);

create index IX_perex_group_doc_id
    on perex_group_doc (doc_id);

create index IX_perex_group_grp_id
    on perex_group_doc (perex_group_id);

create table perex_groups
(
    perex_group_id   int unsigned auto_increment
        primary key,
    perex_group_name varchar(255) not null,
    related_pages    text         null,
    available_groups varchar(255) null
);

create table pkey_generator
(
    name            varchar(255) not null
        primary key,
    value           bigint       not null,
    table_name      varchar(255) null,
    table_pkey_name varchar(255) null
);

INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('banner_banners', 1, 'banner_banners', 'banner_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('basket_browser_id', 1, 'basket_item', 'browser_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('cache', 1, 'cache', 'cache_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('captcha_dictionary', 1, 'captcha_dictionary', 'id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('ckeditor_upload_counter', 1, '', '');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('contact', 1, 'contact', 'contact_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('cookies', 100, 'cookies', 'cookie_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('crypto_key', 1, null, null);
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('document_notes', 1, 'document_notes', 'id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('documents', 1, 'documents', 'doc_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('domain_limits', 1, 'domain_limits', 'domain_limit_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('export_dat', 1, 'export_dat', 'export_dat_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('file_archiv', 1, 'file_archiv', 'file_archiv_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('file_archiv_global_id', 1, 'file_archiv', 'global_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('file_history', 1, 'file_history', 'file_history_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('gallery_dimension', 1, 'dimension_id', 'gallery_dimension_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('gdpr_regexp', 6, 'gdpr_regexp', 'gdpr_regexp_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('insert_script', 1, 'insert_script', 'insert_script_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('insert_script_doc', 1, 'insert_script_doc', 'insert_script_doc_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('insert_script_gr', 1, 'insert_script_gr', 'insert_script_gr_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('inventory', 1, 'inventory', 'inventory_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('inventory_detail', 1, 'inventory_detail', 'inventory_detail_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('inventory_log', 1, 'inventory_log', 'inventory_log_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('passwords_history', 2, 'passwords_history', 'passwords_history_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('reservation_object_price', 1, 'reservation_object_price', 'object_price_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('reservation_object_times', 1, 'reservation_object_times', 'object_time_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('stat_browser_id', 2, null, null);
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('stat_keys', 4, 'stat_keys', 'stat_keys_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('stat_session_id', 20, null, null);
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('structuremirroring', 1, null, null);
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('terminologicky_slovnik', 1, 'terminologicky_slovnik', 'terminologicky_slovnik_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('todo', 1, 'todo', 'todo_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('url_redirect', 2, 'url_redirect', 'url_redirect_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('user_perm_groups', 1, 'user_perm_groups', 'group_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('user_perm_groups_perms', 1, 'user_perm_groups_perms', 'perm_id');
INSERT INTO pkey_generator (name, value, table_name, table_pkey_name) VALUES ('zmluvy_organizacia', 1, 'zmluvy_organizacia', 'zmluvy_organizacia_id');
create table proxy
(
    proxy_id        int unsigned auto_increment
        primary key,
    name            varchar(255) null,
    local_url       text         null,
    remote_server   varchar(255) null,
    remote_url      varchar(255) null,
    remote_port     int          not null,
    crop_start      varchar(255) null,
    crop_end        varchar(255) null,
    encoding        varchar(16)  null,
    proxy_method    varchar(64)  null,
    include_ext     varchar(255) null,
    auth_method     varchar(16)  null,
    auth_username   varchar(64)  null,
    auth_password   varchar(64)  null,
    auth_host       varchar(64)  null,
    auth_domain     varchar(64)  null,
    allowed_methods varchar(64)  null,
    keep_crop_start tinyint(1)   null,
    keep_crop_end   tinyint(1)   null
);

create table questions_answers
(
    qa_id                int(4) unsigned auto_increment
        primary key,
    group_name           varchar(255)        default '' not null,
    category_name        varchar(64)                    null,
    question_date        datetime                       null,
    answer_date          datetime                       null,
    question             text                           null,
    answer               text                           null,
    from_name            varchar(255)        default '' not null,
    from_email           varchar(255)                   null,
    to_name              varchar(255)                   null,
    to_email             varchar(255)                   null,
    publish_on_web       tinyint(1) unsigned default 0  null,
    hash                 varchar(255)                   null,
    allow_publish_on_web tinyint(1) unsigned default 1  not null,
    sort_priority        int                            null,
    from_phone           varchar(32)                    null,
    from_company         varchar(128)                   null,
    field_a              varchar(255)                   null,
    field_b              varchar(255)                   null,
    field_c              varchar(255)                   null,
    field_d              varchar(255)                   null,
    domain_id            int                 default 1  not null,
    answer_to_email      text                           null
);

create index qa_id
    on questions_answers (qa_id);

create table quiz
(
    id        int auto_increment
        primary key,
    name      varchar(255) not null,
    domain_id int          null,
    quiz_type varchar(20)  null
);

create table quiz_answers
(
    id               int auto_increment
        primary key,
    form_id          varchar(255)                          not null,
    quiz_id          int                                   not null,
    quiz_question_id int                                   not null,
    answer           int                                   not null,
    is_correct       int                                   not null,
    created          timestamp default current_timestamp() not null,
    right_answer     int                                   not null,
    rate             int                                   null
);

create index quiz_id
    on quiz_answers (quiz_id);

create index quiz_question_id
    on quiz_answers (quiz_question_id);

create table quiz_questions
(
    id           int auto_increment
        primary key,
    quiz_id      int          not null,
    sort_order   int          not null,
    question     varchar(500) not null,
    option1      varchar(255) null,
    option2      varchar(255) null,
    option3      varchar(255) null,
    option4      varchar(255) null,
    option5      varchar(255) null,
    option6      varchar(255) null,
    right_answer int          not null,
    rate1        int          null,
    rate2        int          null,
    rate3        int          null,
    rate4        int          null,
    rate5        int          null,
    rate6        int          null,
    image_url    varchar(255) null
);

create index quiz_id
    on quiz_questions (quiz_id);

create table quiz_results
(
    id          int auto_increment
        primary key,
    quiz_id     int  not null,
    sort_order  int  not null,
    score_from  int  not null,
    score_to    int  null,
    description text null
);

create index quiz_id
    on quiz_results (quiz_id);

create table rating
(
    rating_id    int(4) unsigned auto_increment
        primary key,
    doc_id       int(4) unsigned null,
    user_id      int(4)          null,
    rating_value int(4) unsigned null,
    insert_date  datetime        null
)
    comment 'rating stranok';

create table reservation
(
    reservation_id        int unsigned auto_increment
        primary key,
    reservation_object_id int unsigned default 0                 not null,
    date_from             datetime                               null,
    date_to               datetime                               null,
    name                  varchar(150)                           null,
    surname               varchar(155)                           null,
    email                 varchar(100)                           null,
    purpose               text                                   null,
    accepted              tinyint(1)                             null,
    hash_value            varchar(60)                            null,
    phone_number          varchar(255) collate utf8mb3_slovak_ci null,
    domain_id             int          default 1                 not null
);

create table reservation_object
(
    reservation_object_id   int unsigned auto_increment
        primary key,
    name                    varchar(100) collate utf8mb4_uca1400_ai_ci default ''   not null,
    must_accepted           tinyint(1)                                 default 0    not null,
    email_accepter          varchar(150) collate utf8mb4_uca1400_ai_ci              null,
    passwd                  varchar(60) collate utf8mb4_uca1400_ai_ci               null,
    max_reservations        tinyint(2)                                 default 1    null,
    cancel_time_befor       tinyint(2)                                 default 0    null,
    reservation_time_from   datetime                                                null,
    reservation_time_to     datetime                                                null,
    price_for_day           decimal(7, 2)                              default 0.00 not null,
    price_for_hour          decimal(7, 2)                              default 0.00 not null,
    reservation_for_all_day bit                                        default b'0' not null,
    photo_link              varchar(255)                                            null,
    description             varchar(2000)                                           null,
    domain_id               int                                        default 1    not null,
    time_unit               tinyint(2)                                              null,
    constraint unique_name
        unique (name)
)
    collate = utf8mb3_slovak_ci;

create table reservation_object_price
(
    object_price_id int            not null
        primary key,
    object_id       int unsigned   not null,
    datum_od        date           null,
    datum_do        date           null,
    cena            decimal(10, 2) null,
    domain_id       int default 1  not null
);

create table reservation_object_times
(
    object_time_id int           not null
        primary key,
    object_id      int unsigned  not null,
    cas_od         datetime      null,
    cas_do         datetime      null,
    den            int           null,
    domain_id      int default 1 not null
);

create table response_headers
(
    response_header_id int auto_increment
        primary key,
    url                varchar(255) not null,
    header_name        varchar(255) not null,
    header_value       varchar(255) not null,
    change_date        datetime     not null,
    note               varchar(255) null,
    domain_id          int          not null
);

create table restaurant_menu
(
    menu_id       int           not null
        primary key,
    menu_meals_id int           null,
    day           date          null,
    priority      tinyint       null,
    domain_id     int default 1 not null
);

create index menu_meals_id
    on restaurant_menu (menu_meals_id);

create table restaurant_menu_meals
(
    meals_id    int            not null
        primary key,
    cathegory   varchar(128)   null,
    name        varchar(255)   null,
    description text           null,
    weight      varchar(255)   null,
    price       decimal(10, 2) null,
    alergens    varchar(32)    null,
    domain_id   int default 1  not null
);

create table seo_bots
(
    seo_bots_id int auto_increment
        primary key,
    name        varchar(255) null,
    last_visit  datetime     null,
    visit_count int          null
);

create table seo_google_position
(
    seo_google_position_id int auto_increment
        primary key,
    keyword_id             int      null,
    position               int      null,
    search_datetime        datetime null
);

create table seo_keywords
(
    seo_keyword_id  int auto_increment
        primary key,
    name            varchar(100)   null,
    created_time    datetime       null,
    author          int            null,
    domain          varchar(255)   null,
    search_bot      varchar(150)   null,
    actual_position int default -1 null
);

create table sita_parsed_ids
(
    news_item_id int unsigned not null
        primary key,
    parse_date   datetime     not null,
    sita_group   varchar(16)  null
);

create table sms_addressbook
(
    book_id    int unsigned auto_increment
        primary key,
    user_id    int(4) unsigned default 0  not null,
    sms_name   varchar(128)    default '' not null,
    sms_number varchar(32)     default '' not null
);

create index user_id
    on sms_addressbook (user_id);

create table sms_log
(
    log_id     int unsigned auto_increment
        primary key,
    user_id    int(4)       default 0                     not null,
    user_ip    varchar(32)  default ''                    not null,
    sent_date  datetime     default '2000-01-01 00:00:00' not null,
    sms_number varchar(32)  default ''                    not null,
    sms_text   varchar(255) default ''                    not null
);

create table sms_template
(
    sms_template_id int          not null,
    user_id         int          not null,
    text            varchar(255) not null
);

create table stat_error
(
    year         int(11) unsigned default 0   null,
    week         int(11) unsigned default 0   null,
    url          varchar(255)     default '0' null,
    query_string varchar(255)     default '0' null,
    count        int(11) unsigned default 0   null,
    domain_id    int              default 0   not null
);

create index i_update
    on stat_error (year, week);

create table stat_from
(
    from_id             int unsigned auto_increment
        primary key,
    browser_id          bigint unsigned        null,
    session_id          bigint unsigned        null,
    referer_server_name varchar(255)           null,
    referer_url         varchar(255)           null,
    from_time           datetime               null,
    doc_id              int                    null,
    group_id            int unsigned default 0 not null
);

create table stat_keys
(
    stat_keys_id int         not null,
    value        varchar(64) not null,
    constraint IX_sk_value
        unique (value)
);

create table stat_searchengine
(
    search_date datetime        default '2000-01-01 00:00:00' not null,
    server      varchar(16)     default ''                    not null,
    query       varchar(64)     default ''                    not null,
    doc_id      int(4) unsigned default 0                     not null,
    remote_host varchar(255)                                  null,
    group_id    int unsigned    default 0                     not null
);

create table stat_userlogon
(
    year         int(4) unsigned  default 0 not null,
    week         int(4) unsigned  default 0 not null,
    user_id      int(4) unsigned  default 0 not null,
    views        int(4) unsigned  default 1 null,
    logon_time   datetime                   null,
    view_minutes int(11) unsigned default 0 null,
    hostname     varchar(255)               null
);

create index i_update
    on stat_userlogon (user_id, logon_time);

create index i_userid
    on stat_userlogon (user_id);

create table stopword
(
    word     varchar(255) null,
    language varchar(2)   null
);

create table templates
(
    temp_id                 int auto_increment
        primary key,
    temp_name               varchar(64) default ''   not null,
    forward                 varchar(64) default ''   not null,
    lng                     varchar(16) default 'sk' not null,
    header_doc_id           int         default 0    not null,
    footer_doc_id           int         default 0    not null,
    after_body_data         text                     null,
    css                     varchar(4000)            null,
    menu_doc_id             int         default -1   not null,
    right_menu_doc_id       int(4)      default -1   null,
    base_css_path           varchar(4000)            null,
    object_a_doc_id         int(4)                   null,
    object_b_doc_id         int(4)                   null,
    object_c_doc_id         int(4)                   null,
    object_d_doc_id         int(4)                   null,
    available_groups        varchar(255)             null,
    template_install_name   varchar(64)              null,
    disable_spam_protection tinyint(1)  default 0    null,
    templates_group_id      int         default 1    not null,
    inline_editing_mode     varchar(16)              null
);

INSERT INTO templates (temp_id, temp_name, forward, lng, header_doc_id, footer_doc_id, after_body_data, css, menu_doc_id, right_menu_doc_id, base_css_path, object_a_doc_id, object_b_doc_id, object_c_doc_id, object_d_doc_id, available_groups, template_install_name, disable_spam_protection, templates_group_id, inline_editing_mode) VALUES (1, 'Generic 1', 'basecms/test/home-page.jsp', 'sk', 1, 3, '', '', 2, -1, '/css/page.css', -1, -1, -1, -1, '', '', 0, 1, '');
INSERT INTO templates (temp_id, temp_name, forward, lng, header_doc_id, footer_doc_id, after_body_data, css, menu_doc_id, right_menu_doc_id, base_css_path, object_a_doc_id, object_b_doc_id, object_c_doc_id, object_d_doc_id, available_groups, template_install_name, disable_spam_protection, templates_group_id, inline_editing_mode) VALUES (2, 'Generic 2', 'basecms/test/home-page.jsp', 'sk', 1, 3, '', '', 2, -1, '/css/page.css', -1, -1, -1, -1, '', '', 0, 1, '');
INSERT INTO templates (temp_id, temp_name, forward, lng, header_doc_id, footer_doc_id, after_body_data, css, menu_doc_id, right_menu_doc_id, base_css_path, object_a_doc_id, object_b_doc_id, object_c_doc_id, object_d_doc_id, available_groups, template_install_name, disable_spam_protection, templates_group_id, inline_editing_mode) VALUES (3, 'Generic 3', 'basecms/test/home-page.jsp', 'sk', 1, 3, '', '', 2, -1, '/css/page.css', -1, -1, -1, -1, '', '', 0, 1, '');
create table templates_group
(
    templates_group_id  int          not null
        primary key,
    name                varchar(255) null,
    directory           varchar(255) null,
    key_prefix          varchar(128) null,
    inline_editing_mode varchar(16)  null
);

INSERT INTO templates_group (templates_group_id, name, directory, key_prefix, inline_editing_mode) VALUES (1, 'nepriradené', '/', null, null);
create table terminologicky_slovnik
(
    terminologicky_slovnik_id int                                     not null
        primary key,
    termin                    varchar(255)                            null,
    synonymum                 varchar(255) collate utf8mb3_general_ci null,
    kategoria                 text                                    null,
    definicia                 text                                    null,
    poznamka1                 text                                    null,
    poznamka2                 text                                    null,
    zdroj1                    text                                    null,
    zdroj2                    text                                    null,
    priklad                   text                                    null
);

create table tips_of_the_day
(
    tip_id    int(4) unsigned auto_increment
        primary key,
    tip_group varchar(255) not null,
    tip_text  text         not null,
    constraint tip_id
        unique (tip_id)
);

create table todo
(
    todo_id       int                  not null
        primary key,
    user_id       int                  not null,
    create_date   datetime             not null,
    modif_date    datetime             null,
    text          varchar(128)         not null,
    is_global     tinyint(1) default 0 not null,
    is_resolved   tinyint(1) default 0 not null,
    sort_priority int                  null,
    dead_line     datetime             null,
    note          varchar(2000)        null,
    group_id      int        default 0 null
);

create table url_redirect
(
    url_redirect_id int(11) unsigned not null
        primary key,
    old_url         varchar(255)     not null,
    new_url         varchar(255)     not null,
    redirect_code   int(11) unsigned not null,
    insert_date     datetime         not null,
    domain_name     varchar(255)     null,
    publish_date    datetime         null
);

INSERT INTO url_redirect (url_redirect_id, old_url, new_url, redirect_code, insert_date, domain_name, publish_date) VALUES (5, '/sk/', '/', 301, '2024-10-11 11:39:59', '', null);
create table user_alarm
(
    user_id   int(4) default 0 not null
        primary key,
    alarm_id  int(4)           null,
    warning   int(4)           null,
    send_date datetime         null
);

create table user_disabled_items
(
    user_id   int(4) unsigned default 0 not null,
    item_name varchar(64)               not null
);

create index user_id
    on user_disabled_items (user_id);

INSERT INTO user_disabled_items (user_id, item_name) VALUES (1, 'editorMiniEdit');
create table user_group_verify
(
    verify_id   int(4) unsigned auto_increment
        primary key,
    user_id     int(4) unsigned default 0                     not null,
    user_groups varchar(255)    default ''                    not null,
    hash        varchar(32)     default ''                    not null,
    create_date datetime        default '2000-01-01 00:00:00' not null,
    verify_date datetime                                      null,
    email       varchar(255)    default ''                    not null,
    hostname    varchar(255)                                  null
);

create index verify_id
    on user_group_verify (verify_id);

create table user_groups
(
    user_group_id              int auto_increment
        primary key,
    user_group_name            varchar(255)        default '' not null,
    user_group_type            tinyint unsigned    default 0  not null,
    user_group_comment         text                           null,
    require_approve            tinyint(1)          default 0  not null,
    email_doc_id               int(4)              default -1 not null,
    allow_user_edit            tinyint(1) unsigned default 0  null,
    require_email_verification tinyint(1)                     null
);

INSERT INTO user_groups (user_group_id, user_group_name, user_group_type, user_group_comment, require_approve, email_doc_id, allow_user_edit, require_email_verification) VALUES (1, 'VIP Klienti', 0, null, 0, -1, 0, null);
INSERT INTO user_groups (user_group_id, user_group_name, user_group_type, user_group_comment, require_approve, email_doc_id, allow_user_edit, require_email_verification) VALUES (2, 'Obchodní partneri', 0, null, 0, -1, 0, null);
INSERT INTO user_groups (user_group_id, user_group_name, user_group_type, user_group_comment, require_approve, email_doc_id, allow_user_edit, require_email_verification) VALUES (3, 'Redaktor', 0, null, 0, -1, 0, null);
create table user_perm_groups
(
    group_id         int          not null
        primary key,
    group_title      varchar(255) null,
    writable_folders varchar(600) null,
    editable_groups  varchar(255) null,
    editable_pages   varchar(255) null
);

create table user_perm_groups_perms
(
    perm_group_id int         not null,
    perm_id       int         not null
        primary key,
    permission    varchar(64) not null
);

create table user_settings
(
    user_settings_id int unsigned auto_increment
        primary key,
    user_id          int unsigned  not null,
    skey             varchar(64)   null,
    svalue1          varchar(2000) null,
    svalue2          varchar(255)  null,
    svalue3          varchar(255)  null,
    svalue4          varchar(255)  null,
    sint1            int           null,
    sint2            int           null,
    sint3            int           null,
    sint4            int           null,
    sdate            datetime      null
);

create table user_settings_admin
(
    user_settings_admin_id int auto_increment
        primary key,
    user_id                int           not null,
    skey                   varchar(255)  null,
    value                  varchar(4000) null
);

create table users
(
    user_id             int auto_increment
        primary key,
    title               varchar(16)                   null,
    first_name          varchar(128)                  null,
    last_name           varchar(255)                  null,
    login               varchar(128)                  not null,
    password            varchar(128)                  null,
    is_admin            tinyint(1)          default 0 not null,
    user_groups         varchar(255)                  null,
    company             varchar(255)                  null,
    adress              varchar(255)                  null,
    city                varchar(255)                  null,
    email               varchar(255)                  null,
    PSC                 varchar(20)                   null,
    country             varchar(255)                  null,
    phone               varchar(255)                  null,
    authorized          tinyint(1)                    null,
    editable_groups     varchar(255)                  null,
    editable_pages      varchar(255)                  null,
    writable_folders    text                          null,
    last_logon          datetime                      null,
    module_perms        varchar(255)                  null,
    disabled_items      varchar(255)                  null,
    reg_date            datetime                      null,
    field_a             varchar(255)                  null,
    field_b             varchar(255)                  null,
    field_c             varchar(255)                  null,
    field_d             varchar(255)                  null,
    field_e             varchar(255)                  null,
    date_of_birth       date                          null,
    sex_male            tinyint(1) unsigned default 1 null,
    photo               varchar(255)                  null,
    signature           varchar(255)                  null,
    forum_rank          int(11) unsigned    default 0 not null,
    rating_rank         int(11) unsigned    default 0 not null,
    allow_login_start   date                          null,
    allow_login_end     date                          null,
    authorize_hash      varchar(32)                   null,
    fax                 varchar(255)                  null,
    delivery_first_name varchar(64)                   null,
    delivery_last_name  varchar(64)                   null,
    delivery_company    varchar(64)                   null,
    delivery_adress     varchar(128)                  null,
    delivery_city       varchar(64)                   null,
    delivery_psc        varchar(8)                    null,
    delivery_country    varchar(32)                   null,
    delivery_phone      varchar(32)                   null,
    position            varchar(255)                  null,
    parent_id           int                 default 0 not null,
    password_salt       varchar(64)                   null,
    domain_id           int                 default 1 not null,
    mobile_device       varchar(255)                  null,
    api_key             varchar(255)                  null,
    constraint IX_login_name
        unique (login)
);

INSERT INTO users (user_id, title, first_name, last_name, login, password, is_admin, user_groups, company, adress, city, email, PSC, country, phone, authorized, editable_groups, editable_pages, writable_folders, last_logon, module_perms, disabled_items, reg_date, field_a, field_b, field_c, field_d, field_e, date_of_birth, sex_male, photo, signature, forum_rank, rating_rank, allow_login_start, allow_login_end, authorize_hash, fax, delivery_first_name, delivery_last_name, delivery_company, delivery_adress, delivery_city, delivery_psc, delivery_country, delivery_phone, position, parent_id, password_salt, domain_id, mobile_device, api_key) VALUES (1, '', 'WebJET', 'Administrátor', 'admin', 'd7ed8dc6fc9b4a8c3b442c3dcc35bfe4', 1, null, 'InterWay, a. s.', '', '', 'web.spam@interway.sk', '', 'Slovakia', '02/32788888', 1, '', '', '', '2024-10-11 17:15:23', null, null, '2024-10-11 11:53:00', '', '', '', '', '', null, 1, '', '', 0, 0, null, null, null, '', '', '', '', '', '', '', '', '', '', 0, '', 1, null, null);
create table users_in_perm_groups
(
    user_id       int not null,
    perm_group_id int not null,
    primary key (user_id, perm_group_id)
);

create table zmluvy
(
    zmluvy_id          int auto_increment
        primary key,
    cislo_zmluvy       varchar(128)         null,
    cislo_rzupsk       varchar(255)         null,
    nazov              varchar(512)         null,
    predmet            text                 null,
    hodnota_zmluvy     double               null,
    mena               varchar(3)           null,
    podpisanie         datetime             null,
    platnost_od        datetime             null,
    ucinnost           datetime             null,
    zverejnenie        datetime             null,
    zdroj              varchar(255)         null,
    zdroj_nazov        varchar(255)         null,
    editor             int                  null,
    skupina            smallint(3)          null,
    status             smallint             null,
    platnost_do        datetime             null,
    viazanost_k_zmluve int                  null,
    zmluvna_strana1    varchar(255)         null,
    zs_nazov1          varchar(255)         null,
    zs_sidlo1          varchar(255)         null,
    zs_ico1            varchar(255)         null,
    zs_osoba1          varchar(255)         null,
    zmluvna_strana2    varchar(255)         null,
    zs_nazov2          varchar(255)         null,
    zs_sidlo2          varchar(255)         null,
    zs_ico2            varchar(255)         null,
    zs_osoba2          varchar(255)         null,
    zmluvna_strana3    varchar(255)         null,
    zs_nazov3          varchar(255)         null,
    zs_sidlo3          varchar(255)         null,
    zs_ico3            varchar(255)         null,
    zs_osoba3          varchar(255)         null,
    cena_s_dph         tinyint(1) default 1 null,
    dodatok            tinyint(1) default 0 null,
    poznamka           text                 null,
    zobrazovat         tinyint(1) default 1 null,
    vytvoril           int        default 0 not null,
    sposob_uhrady      varchar(255)         null,
    domain_id          int(6)     default 1 null,
    organizacia_id     int        default 0 not null
);

create table zmluvy_organizacia
(
    zmluvy_organizacia_id int           not null
        primary key,
    nazov                 varchar(255)  not null,
    domain_id             int default 1 null
);

INSERT INTO zmluvy_organizacia (zmluvy_organizacia_id, nazov, domain_id) VALUES (1, 'default', 1);
create table zmluvy_organizacia_approvers
(
    organizacia_id int not null,
    user_id        int not null
);

create table zmluvy_organizacia_users
(
    organizacia_id int not null,
    user_id        int not null
);

create table zmluvy_prilohy
(
    zmluvy_prilohy_id int auto_increment
        primary key,
    zmluvy_id         int          null,
    zdroj             varchar(255) null,
    nazov             varchar(255) null
);

ALTER TABLE enumeration_data ADD foreign key (parent_enumeration_data_id) references enumeration_data (enumeration_data_id);
ALTER TABLE enumeration_data ADD foreign key (child_enumeration_type_id) references enumeration_type (enumeration_type_id);
ALTER TABLE enumeration_data ADD foreign key (enumeration_type_id) references enumeration_type (enumeration_type_id)
    on update cascade on delete cascade;

ALTER TABLE enumeration_type ADD foreign key (child_enumeration_type_id) references enumeration_type (enumeration_type_id);

ALTER TABLE restaurant_menu ADD foreign key (menu_meals_id) references restaurant_menu_meals (meals_id)
            on delete cascade;

ALTER TABLE reservation ADD foreign key (reservation_object_id) references reservation_object (reservation_object_id)