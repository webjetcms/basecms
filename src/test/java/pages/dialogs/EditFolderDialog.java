package pages.dialogs;

import helpers.BasePage;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import pages.WebPagesPage;
import pages.tiles.WebPagesMainStructureTile;

import java.util.Set;

public class EditFolderDialog extends BasePage {

    public EditFolderDialog() {
        windowsHandle(WebPagesMainStructureTile.mainWindow);
        waitForElementToAppear(preferencesTab);
        waitForElementToAppear(advancedTab);
        waitForElementToAppear(accessTab);
        waitForElementToAppear(publicationTab);
        waitForElementToAppear(historyTab);
        waitForElementToAppear(submitButton);
        waitForElementToAppear(cancelButton);
        waitForElementToAppear(helpButton);

        PreferencesTabDialog preferences = new PreferencesTabDialog();

        this.folderName = preferences.getFolderNameInput();
        this.navbarName = preferences.getNavbarInput();
        this.parentFolderName = preferences.getParentFolderInput();
        this.urlDirName = preferences.getUrlDirName();
    }

    public String folderName;
    public String navbarName;
    public String parentFolderName;
    public String urlDirName;

    public void close() {
        cancelButton.click();
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
