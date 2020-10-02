package pages.modals;

import helpers.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class WebPageSettingsModal extends BasePage {

    public WebPageSettingsModal() {
        waitForElementToAppear(sortPriority);
        waitForElementToAppear(showWebPageId);
        waitForElementToAppear(showCreationDate);
        waitForElementToAppear(reloadTreeButton);
        waitForElementToAppear(newRootFolderButton);
        waitForElementToAppear(menuWidthSelect);
        waitForElementToAppear(closeModalButton);
        waitForElementToAppear(saveButton);
    }

    public void CreateNewFolder(){
        newRootFolderButton.click();
        waitForElementToDisappear(By.className("WJLoaderDiv"));
    }


    //locators
    @FindBy (id = "uniform-userSettings-sortPriority")
    private WebElement sortPriority;
    @FindBy (id = "uniform-userSettings-docId")
    private WebElement showWebPageId;
    @FindBy(id = "uniform-userSettings-dateCreated")
    private WebElement showCreationDate;
    @FindBy(className = "reloadTree")
    private WebElement reloadTreeButton;
    @FindBy (id = "newRootGroup")
    private WebElement newRootFolderButton;
    @FindBy (id = "userSettings-menuWidth")
    private WebElement menuWidthSelect;
    @FindBy(className = "closeModal")
    private WebElement closeModalButton;
    @FindBy (className = "saveUserSettings")
    private WebElement saveButton;
}
