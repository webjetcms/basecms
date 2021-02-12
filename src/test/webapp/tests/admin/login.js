Feature('login');

Scenario('odhlasenie', ({ I }) => {
    //I.clickIfVisible("a.js-logout-toggler");
    I.amOnPage('/logoff.do?forward=/admin/');
});

//Kazdy scenar sa spusta samostatne a samostatne sa vyhodnocuje
Scenario('zle zadane heslo', ({ I }) => {
    I.amOnPage('/admin/');
    I.fillField("username", "tester");

    //do pola password vyplnim zle heslo
    I.fillField("password", "wrongpassword");
    //kliknem na tlacitko
    I.click("login-submit");
    //overim, ci sa zobrazi uvedena hlaska
    I.see("Zadané meno alebo heslo je nesprávne.");
});

Scenario('prihlasenie zablokovane', ({ I }) => {
    I.amOnPage('/admin/');
    I.fillField("username", "tester");

    I.fillField("password", "wrongpassword");
    I.click("login-submit");
    I.see("Pre nesprávne zadané prihlasovacie údaje je prihlásenie na 10 sekúnd zablokované");
    I.say("Cakam 10 sekund na expirovanie zablokovanej IP adresy");
    //je potrebne cakat 10 sekund na expirovanie zleho hesla
    I.wait(13);
    //odkomentujte pre zobrazenie interaktivneho terminalu
    //pause();
});

Scenario('uspesne prihlasenie', ({ I }) => {
    I.amOnPage('/admin/');
    I.fillField("username", "tester");

    I.fillField("password", secret("***REMOVED***"));
    I.click("login-submit");
    //konecne som prihlaseny, pockame na VUE load
    I.wait(5);
    I.see("Vitajte, Tester Playwright");
    //menu polozky
    I.wait(1);
    I.see("Úvod");
    I.see("Monitorovanie servera");

    //toto plati pre WJ8
    I.amOnPage('/admin/v8');
    I.wait(1);
    //zobrazim dropdown s menom usera, ten vyberam cez CSS selector
    I.click({css: "li.dropdown.user"});
    //overim, ci vidim moznost Odhlasenia
    I.see("Odhlásenie");
    //kliknem na odhlasenie, vsimnite si, ze to selectujem podla textu linky
    I.click("Odhlásenie");
    //overim, ci sa zobrazi text Prihlasenie (som korektne odhlaseny)
    I.see("Prihlásenie");
});