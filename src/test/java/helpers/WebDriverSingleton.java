package helpers;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class WebDriverSingleton {
    private static WebDriver driver;

    /**
     * Initialize driver with selected operating system.
     * @return driver
     */
    public static WebDriver getWebDriverInstance(){
        if (driver==null){
            initialize(Enums.OperatingSystem.WIN);
        }
        return driver;
    }

    /**
     * This method initialize chromedriver in depend on you operating system.
     * You can setup head or headless mode and chrome options.
     * @param system list of available operating systems
     */
    private static void initialize(Enums.OperatingSystem system){
        switch (system){
            case WIN:
                System.setProperty("webdriver.chrome.driver", "src/test/resources/win/chromedriver.exe");
                break;
            case LINUX:
                System.setProperty("webdriver.chrome.driver", "src/test/resources/linux/chromedriver");
                break;
            case MAC:
                System.setProperty("webdriver.chrome.driver", "src/test/resources/mac/chromedriver");
                break;
        }
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
        }


    }
}
