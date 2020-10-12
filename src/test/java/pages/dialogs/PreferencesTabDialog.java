package pages.dialogs;

import helpers.BasePage;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class PreferencesTabDialog extends BasePage {

    public PreferencesTabDialog() {
        waitForElementToAppear(folderNameInput);
        waitForElementToAppear(navBarInput);
        waitForElementToAppear(parentFolderInput);
        waitForElementToAppear(templateSelect);
        waitForElementToAppear(urlDirName);
        waitForElementToAppear(menuTypeSelect);
        waitForElementToAppear(subPageVisualisationSelect);
        waitForElementToAppear(loggedMenuType);
    }

    public void setFolderName(String folderName) {
        folderNameInput.clear();
        folderNameInput.sendKeys(folderName);
    }

    public String getFolderNameInput() {
        return folderNameInput.getAttribute("value");
    }

    public String getNavbarInput() {
        return navBarInput.getAttribute("value");
    }

    public String getParentFolderInput() {
        return parentFolderInput.getAttribute("value");
    }

    public String getUrlDirName() {
        return urlDirName.getAttribute("value");
    }

    //locators
    @FindBy(id = "groupName")
    private WebElement folderNameInput;
    @FindBy(id = "navbar")
    private WebElement navBarInput;
    @FindBy(id = "parentGroup")
    private WebElement parentFolderInput;
    @FindBy(id = "selectBoxTempId1")
    private WebElement templateSelect;
    @FindBy(id = "urlDirName")
    private WebElement urlDirName;
    @FindBy(id = "menuTypeId")
    private WebElement menuTypeSelect;
    @FindBy(id = "menuTypeSubdocs")
    private WebElement subPageVisualisationSelect;
    @FindBy(id = "loggedMenuType")
    private WebElement loggedMenuType;




}
