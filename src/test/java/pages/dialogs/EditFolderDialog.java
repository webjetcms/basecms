package pages.dialogs;

import helpers.BasePage;
import helpers.Enums;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import pages.tiles.WebPagesMainStructureTile;

import java.util.Set;

public class EditFolderDialog extends BasePage {
    PreferencesTabDialog preferences;


    public EditFolderDialog() {
        windowsHandle(WebPagesMainStructureTile.mainWindow);
        preferences = new PreferencesTabDialog();
        String url = driver.getCurrentUrl();
        if (!url.contains("myParentGroupId")){
            waitForElementToAppear(historyTab);
        }
        waitForElementToAppear(preferencesTab);
        waitForElementToAppear(advancedTab);
        waitForElementToAppear(accessTab);
        waitForElementToAppear(publicationTab);
        waitForElementToAppear(submitButton);
        waitForElementToAppear(cancelButton);
        waitForElementToAppear(helpButton);


        this.folderName = preferences.getFolderNameInput();
        this.navbarName = preferences.getNavbarInput();
        this.parentFolderName = preferences.getParentFolderInput();
        this.urlDirName = preferences.getUrlDirName();
    }

    public String folderName;
    public String navbarName;
    public String parentFolderName;
    public String urlDirName;

    public void setFolderName(String folderName){
        preferences.setFolderName(folderName);
    }

    public void leaveEditDialog(Enums.EditDialog action){
        switch (action) {
            case SUBMIT:
                submitButton.click();
                break;
            case CANCEL:
                cancelButton.click();
                break;
        }
        driver.switchTo().window(WebPagesMainStructureTile.mainWindow);
        waitForPageLoaded();
    }

    private void windowsHandle(String mainWindow){
        Set<String> wins = driver.getWindowHandles();

        for (String ChildWindow : wins) {
            if (!mainWindow.equalsIgnoreCase(ChildWindow)) {
                driver.switchTo().window(ChildWindow);
            }
        }
    }
    //locators
    @FindBy(id = "tabLink1")
    private WebElement preferencesTab;
    @FindBy(id = "tabLink3")
    private WebElement advancedTab;
    @FindBy(id = "tabLink2")
    private WebElement accessTab;
    @FindBy(id = "tabLink4")
    private WebElement publicationTab;
    @FindBy(id = "tabLink5")
    private WebElement historyTab;
    @FindBy(id = "btnOk")
    private WebElement submitButton;
    @FindBy(id = "btnCancel")
    private WebElement cancelButton;
    @FindBy(id = "btnHelp")
    private WebElement helpButton;

}
