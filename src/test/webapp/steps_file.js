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

      this.seeVisualDiffForElement(selector, screenshotFileName, {tolerance: tolerance});
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
      randomText += "-"+Math.floor(Math.random() * 1000);
      return randomText;
    }

  });
}