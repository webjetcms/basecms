import helpers.Config;
import helpers.WebDriverSingleton;
import org.junit.Before;
import org.junit.Rule;
import org.junit.rules.TestRule;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;
import org.junit.runners.model.Statement;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.io.FileHandler;
import pages.HomePage;
import pages.LoginPage;

import javax.swing.*;
import java.io.File;
import java.io.IOException;

public class BaseTest  {


    @Rule
    public final TestRule watchman = new TestWatcher() {
        @Override
        public Statement apply(Statement base, Description description) {
            return super.apply(base, description);
        }
        // This method gets invoked if the test fails for any reason:
        @Override
        protected void failed(Throwable e, Description description) {
            // Print out the error message:
            String testName=description.getDisplayName();
            System.out.println(testName + " " + e.getClass().getSimpleName() + "\n");
            System.out.println(e.getMessage() + "\n");
            // Now you can do whatever you need to do with it, for example take a screenshot
            File scrFile = ((TakesScreenshot)getDriver()).getScreenshotAs(OutputType.FILE);
            try {
                File currPath = new File(new JFileChooser().getFileSystemView().getDefaultDirectory().toString() + "\\"+testName+".png");
                System.out.println("Screenshot at: " + currPath.toString());
                FileHandler.copy(scrFile,  currPath );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        // This method gets called when the test finishes, regardless of status
        // If the test fails, this will be called after the method above
        @Override
        protected void finished(Description description) {
            if (getDriver() != null)
                getDriver().quit();
        }
    };

    @Before
    public void beforeSuite() {
        new Config();
        getDriver().get(Config.getBase_url());
        LoginPage loginPage=new LoginPage();
        loginPage.login();
        new HomePage();
    }

    public WebDriver getDriver() {
        return WebDriverSingleton.getWebDriverInstance();
    }


}