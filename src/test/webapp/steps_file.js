// in this file you can append custom step methods to 'I' object

module.exports = function () {
  return actor({

    seeAndClick(name) {
      this.see(name);
      this.click(name);
    },

    /**
     * Naformatuje zadany timestamp do datumu a casu podla nastavenia moment v stranke
     * @param timestamp
     */
    formatDateTime(timestamp) {
      //const I = this.helpers['Playwright'];
      /*var formatted = I.executeScript((timestamp) => {
            //console.log("execScript, timestamp=", timestamp);
            return window.moment(timestamp).format("L HH:mm:ss");
        }, timestamp
      );*/
      //TODO: nefunguje hore uvedeny kod (dropne session/cookies) takze treba fixnut tento problem
      const moment = require("moment");
      var userLng = "sk";
      moment.updateLocale(userLng, { invalidDate: "" });
      moment.locale(userLng);
      return moment(timestamp).format("L HH:mm:ss");
      //return "15.10.2020 17:40:30";
    },

    wjSetDefaultWindowSize() {
      this.resizeWindow(1280, 760);
    },

    wjCompareScreenshotElement(selector, screenshotFileName, width, height, tolerance) {
      if (typeof tolerance == "undefined" || tolerance == null) tolerance = 1;

      var windowResized = false;
      if (typeof width != "undefined" && width != null && typeof height != "undefined" && height != null) {
        this.resizeWindow(width, height);
        windowResized = true;
      }

      this.saveElementScreenshot(selector, screenshotFileName);

      if (windowResized) this.wjSetDefaultWindowSize();

      this.seeVisualDiffForElement(selector, screenshotFileName, { tolerance: tolerance });
    },

    // odhlasenie z aplikacie
    logout() {
      this.refreshPage();
      this.click('.btn.btn-sm.btn-outline-secondary.js-logout-toggler');
      this.waitUrlEquals('/admin/logon/', 10);
    },

    //vygenerovanie nahodneho retazca
    getRandomText() {
      const startDate = new Date();
      //let randomText = startDate.toISOString().replace(/T/gi, ' ').replace(/\..+/gi, '').replace(/:/gi, '').replace(/ /gi, '-');
      const moment = require("moment");
      var userLng = "sk";
      moment.updateLocale(userLng, { invalidDate: "" });
      moment.locale(userLng);
      let randomText = moment(startDate).format("YYYY-MM-DD-HHmmss");
      randomText += "-" + Math.floor(Math.random() * 1000);
      return randomText;
    },

    getRandomTextShort() {
      const startDate = new Date();
      //let randomText = startDate.toISOString().replace(/T/gi, ' ').replace(/\..+/gi, '').replace(/:/gi, '').replace(/ /gi, '-');
      const moment = require("moment");
      var userLng = "sk";
      moment.updateLocale(userLng, { invalidDate: "" });
      moment.locale(userLng);
      let randomText = moment(startDate).format("MMDD");
      randomText += Math.floor(Math.random() * 100);
      return randomText;
    },

    waitForLoader(selector) {
      this.waitForInvisible(selector, 20);
      //ak by sa este nestihol zobrazit kym sa vykona prva podmienka, pre istotu pockame a potom skusime znova
      this.wait(1);
      this.waitForInvisible(selector, 20);
      this.wait(1);
    },

    //-------------- FUNKCIE PRE DATATABLE --------------

    dtWaitForLoader(name) {
      if (typeof name == "undefined") { name = "div.dataTables_processing"; }
      this.waitForInvisible(name, 40);
      //ak by sa este nestihol zobrazit kym sa vykona prva podmienka, pre istotu pockame a potom skusime znova
      this.wait(1);
      this.waitForInvisible(name, 40);
    },

    dtEditorWaitForLoader() {
      let name = "div.DTE_Processing_Indicator";
      this.waitForInvisible(name, 40);
      this.wait(1);
    },

    dtWaitForEditor(name) {
      if (typeof name == "undefined") { name = "datatableInit"; }
      this.waitForVisible("#" + name + "_modal", 40);
      this.wait(1);
    },

    waitForModal(id) {
      this.waitForVisible("#" + id);
      this.wait(1);
    },

    waitForModalClose(id) {
      this.waitForInvisible("#" + id);
      this.wait(1);
    },

    dtFilter(name, value) {
      if (name.indexOf(".")!=-1) name = name.replace(/\./gi, "\\.");
      this.fillField({ css: "div.dataTables_scrollHeadInner input.dt-filter-" + name }, value);
      this.click({ css: "div.dataTables_scrollHeadInner button.dt-filtrujem-" + name });
      this.dtWaitForLoader();
    },

    dtFilterSelect(name, value) {
      if (name.indexOf(".")!=-1) name = name.replace(/\./gi, "\\.");
      this.click({ css: "div.dataTables_scrollHeadInner div.dt-filter-" + name + " button.btn-outline-secondary" });
      this.click(locate('div.dropdown-menu.show .dropdown-item').withText(value));
      this.click({ css: "div.dataTables_scrollHeadInner button.dt-filtrujem-" + name });
      this.dtWaitForLoader();
    },

    dtFillField(name, value) {
      this.fillField("#DTE_Field_"+name, value);
    },

    /**
     * Vyplni hodnotu do WYSIWYG editora Quill
     * @param {*} name
     * @param {*} value
     */
    dtFillQuill(name, value) {
      this.click(locate('p').inside("#DTE_Field_"+name));
      this.wait(0.3);
      this.pressKey(['CommandOrControl', 'A']);
      this.wait(0.3);
      this.pressKey('Backspace');
      this.wait(0.3);
      /*var i;
      for (i=0; i<value.length; i++) {
        this.pressKey(value.charAt(i));
      }*/
      this.fillField(locate('p').inside("#DTE_Field_"+name), value);
    },

    /**
     * Vyplni hodnotu do WYSIWYG editora Quill
     * @param {*} htmlCode - html kod, ktory sa ma do editora nastavit
     */
    async dtFillCkeditor(htmlCode) {
      //pockaj na inicializaciu CK editora
      this.waitForElement("span.cke_toolbox");
      this.wait(2);
      await this.executeScript(function(html) {
          window.ckEditorInstance.setData(html);
        }, htmlCode
      );
      this.wait(2);
    },

    //vybere hodnotu v selecte v DT editore
    dtEditorSelectOption(name, text) {
      this.click({ css: "div.modal-dialog div.DTE_Field_Name_" + name + " button.dropdown-toggle" });
      this.waitForElement(locate('div.dropdown-menu.show .dropdown-item').withText(text), 5);
      this.click(locate('div.dropdown-menu.show .dropdown-item').withText(text));
      this.wait(0.3);
    },

    //ulozi editor a pocka na vysledok
    dtEditorSave() {
      //ideme cez slector, pretoze to moze byt Pridat (novy zaznam) alebo Ulozit (existujuci)
      this.click({ css: "div.DTED.show div.DTE_Footer.modal-footer button.btn.btn-primary" });
      this.dtEditorWaitForLoader();
      //cakaj na reload datatabulky, nevieme aka to je DT, takze radsej takto natvrdo
      this.wait(3);
    },

    dtEditorCancel() {
      this.click({ css: "div.DTED.show div.DTE_Footer.modal-footer button.btn-close-editor" });
      this.dtEditorWaitForLoader();
      //cakaj na reload datatabulky, nevieme aka to je DT, takze radsej takto natvrdo
      this.wait(3);
    },

    //skontroluje prava na datatabulke - zobrazi, odoberie pravo a overi zobrazenie chyby prav
    dtCheckPerms(perms, url) {
      let warningText = "Prístup k tejto stránke je zamietnutý";
      this.say("Testing permissions, perms=" + perms + " url=" + url + " warningText=" + warningText);
      this.amOnPage(url);
      this.dtWaitForLoader();
      this.dontSee(warningText);

      this.amOnPage(url + "?removePerm=" + perms);
      this.waitForElement("#toast-container-webjet", 10);
      this.see(warningText);
      this.click("button.toast-close-button", "#toast-container-webjet");

      this.amOnPage('/logoff.do?forward=/admin/');
      this.waitUrlEquals('/admin/logon/', 10);
    },

    //-------------- FUNKCIE PRE JSTREE --------------
    jstreeClick(name) {
      this.click(name, "#SomStromcek");
      //pockaj na nacitanie datatable
      this.dtWaitForLoader();
    },

    //postupne otvori stromovu strukturu zadanej cesty, napr. ["Jet portal 4", "Kontakt"]
    jstreeNavigate(pathArray) {
      var that = this;
      pathArray.forEach(function (name, index) {
        that.say("clicking on jstreitem: name=" + name + " index=" + index);
        that.jstreeClick(name);
      });
    },

    //-------------- FUNKCIE PRE DOKUMENTACIU --------------
    wjDocsScreenshot(screenshotFilePath, width, height) {
      this.wjDocsScreenshotElement(null, screenshotFilePath, width, height);
    },

    wjDocsScreenshotElement(selector, screenshotFilePath, width, height) {
      var windowResized = false;
      if (typeof width != "undefined" && width != null && typeof height != "undefined" && height != null) {
        this.say("resizing window");
        //60=vyska toolbaru okna
        this.resizeWindow(width, height + 60);
        windowResized = true;
      }

      var path = "../../../docs" + screenshotFilePath;
      //If platform is windows, edit path (or screens will not be saved)
      if(process.platform == "win32") {
        path = path.replace(/\//gi, '\\');
      }
      this.wait(2);
      if (typeof selector != "undefined" && selector != null && selector != "") this.saveElementScreenshot(selector, path);
      else this.saveScreenshot(path);

      this.say("windows resized=" + windowResized);
      if (windowResized) this.wjSetDefaultWindowSize();
    }
  });
}