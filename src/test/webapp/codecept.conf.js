const { setHeadlessWhen } = require('@codeceptjs/configure');
const { devices } = require('playwright');

// turn on headless mode when running with HEADLESS=true environment variable
// HEADLESS=true npx codecept run
setHeadlessWhen(process.env.HEADLESS);

var url = process.env.CODECEPT_URL || 'http://iwcm.interway.sk';
var codeceptShow = process.env.CODECEPT_SHOW;
var browser = process.env.CODECEPT_BROWSER || "chromium";

var showBrowser = true;
if (typeof codeceptShow != "undefined" && "false" == codeceptShow) {
  showBrowser = false;
}

console.log("url=", url);
console.log("showBrowser=", showBrowser);
console.log("browser=", browser);

exports.config = {
  tests: './tests/**/*.js',
  output: '../../../build/test',
  helpers: {
    Playwright: {
      url: url,
      show: showBrowser,
      browser: browser,
      waitForNavigation: "networkidle0",
      restart: false,
      keepCookies: true
      /* este nefunguje, vid https://github.com/microsoft/playwright/pull/3526
      ,
      chromium: {
        showUserInput: true
      }
      */
      //,emulate: devices['iPhone 6']
    },
    CustomWebjetHelper: {
      require: './custom_helper.js'
    },
    ChaiWrapper: {
      //https://www.npmjs.com/package/codeceptjs-chai
      require: "codeceptjs-chai"
    },
    ResembleHelper : {
      require: "codeceptjs-resemblehelper",
      screenshotFolder : "./../../build/test",
      baseFolder: "./screenshots/base/",
      diffFolder: "./screenshots/diff/"
    }
  },
  include: {
    I: './steps_file.js',
    DataTables: './pages/DataTables.js'
  },
  bootstrap: null,
  mocha: {
    //generovanie reportov do output adresara https://codecept.io/reports/#html
    reporterOptions: {
        reportDir: "../../../build/test/report"
    }
  },
  name: 'webapp',
  plugins: {
    retryFailedStep: {
      enabled: true
    },
    screenshotOnFail: {
      enabled: true
    },
    pauseOnFail: {},
    autoLogin: {
      enabled: true,
      saveToFile: false,
      inject: 'login',
      users: {
        admin: {
          login: (I) => {
            I.say("logging in");
            I.amOnPage('/admin/');
            //aby sme vzdy v kazdom scenari mali prednastavenu velkost okna
            I.wjSetDefaultWindowSize();
            //odosli prihlasenie
            I.fillField("username", "tester");
            I.fillField("password", secret("password"));
            I.click("login-submit");
          },
          check: (I) => {
            I.say("checking logged user");
            I.see("Tester Playwright");
            //aby sme vzdy v kazdom scenari mali prednastavenu velkost okna
            I.wjSetDefaultWindowSize();
          },
          restore: (I) => {
            I.say("restoring logged user");
            I.see("Tester Playwright");
          }
        }
      }
    }
  }
}