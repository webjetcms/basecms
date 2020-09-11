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
      waitForNavigation: "networkidle0"
      //,emulate: devices['iPhone 6']
    },
    CustomWebjetHelper: {
      require: './custom_helper.js'
    }
  },
  include: {
    I: './steps_file.js'
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
      saveToFile: true,
      inject: 'login',
      users: {
        admin: {
          login: (I) => {
            I.amOnPage('/admin/');
            I.fillField("username", "tester");
            I.fillField("password", secret("***REMOVED***"));
            I.click("login-submit");
          },
          check: (I) => {
             I.amOnPage('/admin/');
             I.see("Nástenka");
          }
        }
      }
    }
  }
}