package pages;

import helpers.BasePage;
import models.UserModel;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import static helpers.Config.*;


public class LoginPage extends BasePage {

    public void login() {
        UserModel user = new UserModel(getUsername(),getPassword());
        waitForElementToAppear(username);
        username.sendKeys(user.getUserName());
        password.sendKeys(user.getPassword());
        submit.click();
        new HomePage();
    }

    //locators
    @FindBy(id = "username")
    private WebElement username;

    @FindBy(id = "password")
    private WebElement password;

    @FindBy(id = "login-submit")
    private WebElement submit;

}
