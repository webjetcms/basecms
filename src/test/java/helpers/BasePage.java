package helpers;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.pagefactory.AjaxElementLocatorFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;

import static java.lang.Thread.sleep;

public class BasePage {

    private static final int TIMEOUT = 5;
    private static final int POLLING = 100;

    protected static WebDriver driver;
    private final WebDriverWait wait;

    public BasePage() {
        driver = WebDriverSingleton.getWebDriverInstance();
        wait = new WebDriverWait(driver, TIMEOUT, POLLING);
        PageFactory.initElements(new AjaxElementLocatorFactory(driver, TIMEOUT), this);
    }

    public static void goToUrl(String url){
        driver.get(url);
        waitForPageLoaded();
    }

    protected void waitForElementToAppear(By locator) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
    }

    protected void waitForElementToAppear(WebElement element) {
        wait.until(ExpectedConditions.visibilityOf(element));
    }

    protected void waitForElementToDisappear(By locator) {
        wait.until(ExpectedConditions.invisibilityOfElementLocated(locator));
    }

    protected WebElement waitForElementGetClass(String className){
        return wait.until(ExpectedConditions.elementToBeClickable(By.className(className)));
    }

    protected void waitForElementToDisappear(WebElement element) {
        wait.until(ExpectedConditions.invisibilityOf(element));
    }

    protected void waitForTextToDisappear(By locator, String text) {
        wait.until(ExpectedConditions.not(ExpectedConditions.textToBe(locator, text)));
    }

    protected void waitForElementToBeClickable(WebElement element){
        wait.until(ExpectedConditions.elementToBeClickable(element));
    }

    protected WebElement findElement(By locator){
        return driver.findElement(locator);
    }

    protected List<WebElement> findElements(By locator){
        return driver.findElements(locator);
    }

    protected boolean elementPresence(By locator){
        return findElements(locator).size()>0;
    }

    protected static void waitForPageLoaded() {
        ExpectedCondition<Boolean> expectation = new
                ExpectedCondition<Boolean>() {
                    public Boolean apply(WebDriver driver) {
                        return ((JavascriptExecutor) driver).executeScript("return document.readyState").toString().equals("complete");
                    }
                };
        try {
            sleep(1000);
            WebDriverWait wait = new WebDriverWait(driver, 30);
            wait.until(expectation);
        } catch (Throwable error) {
            Assert.fail("Timeout waiting for Page Load Request to complete.");
        }
    }

//    public void inputText(WebElement element,String text) throws InterruptedException {
//        for (int i=0;i<text.length();i++){
//            char ch = text.charAt(i);
//            String s = String.valueOf(ch);
//            element.sendKeys(s);
//            sleep(100);
//        }
//
//    }
}