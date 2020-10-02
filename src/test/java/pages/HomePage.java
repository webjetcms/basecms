package pages;

import helpers.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HomePage extends BasePage {

    public HomePage(){
        waitForElementToAppear(homePage);
        waitForElementToAppear(webPages);
//        waitForElementToAppear(applications);
        waitForElementToAppear(templates);
        waitForElementToAppear(files);
//        waitForElementToAppear(users);
//        waitForElementToAppear(settings);
    }

    //locators
    @FindBy(css = "a[href='/admin/']")
    private WebElement homePage;
    @FindBy(css = "a[href='/admin/webpages/']")
    private WebElement webPages;
//    @FindBy(linkText = "Aplikácie")
//    private WebElement applications;
    @FindBy(css = "a[href='/admin/temps_list.jsp']")
    private WebElement templates;
    @FindBy(css = "a[href='/admin/elFinder/']")
    private WebElement files;
//    @FindBy(linkText = "Používatelia")
//    private WebElement users;
//    @FindBy(linkText = "Ovládací panel")
//    private WebElement settings;
}
