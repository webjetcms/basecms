package helpers;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class WebDriverSingleton {
    private static WebDriver driver;

    private static void initialize(){
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        System.setProperty("headless", "false"); // You can set this property elsewhere
        String headless = System.getProperty("headless");
        if("true".equals(headless)) {
            ChromeOptions chromeOptions = new ChromeOptions();
            chromeOptions.addArguments("--headless");
            driver = new ChromeDriver(chromeOptions);
        } else {
            ChromeOptions options = new ChromeOptions();
            options.addArguments("--incognito");
            driver = new ChromeDriver(options);
            driver.manage().window().maximize();
        };


    }

    public static WebDriver getWebDriverInstance(){
        if (driver==null){
            initialize();
        }
        return driver;
    }
}
