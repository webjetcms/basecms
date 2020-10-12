package pages.tiles;

import helpers.BasePage;
import helpers.Enums;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import pages.dialogs.EditFolderDialog;

public class WebPagesEditFormTile extends BasePage {

    public WebPagesEditFormTile() {
        waitForElementToAppear(createNewWebpageButton);
        waitForElementToAppear(editFolderButton);
        waitForElementToAppear(addSubfolderButton);
        waitForElementToAppear(importExportButton);
        waitForElementToAppear(linkVerificationButton);
    }

    public String folderManipulation(String folderId, Enums.FolderManipulation action){
        WebPagesMainStructureTile tree = new WebPagesMainStructureTile();
        WebPagesMainStructureTile.mainWindow = driver.getWindowHandle();
        tree.findFolder(folderId);
        String folderName="";
        switch (action){
            case EDIT_FOLDER:
                editFolderButton.click();
                folderName = "Renamed-autotest-folder";
                break;
            case ADD_SUBFOLDER:
                addSubfolderButton.click();
                folderName = "New-autotest-subfolder";
                break;
        }
        EditFolderDialog editFolderDialog = new EditFolderDialog();
        editFolderDialog.setFolderName(folderName);
        editFolderDialog.leaveEditDialog(Enums.EditDialog.SUBMIT);
        return folderId;
    }

    public WebElement newSubfolderConfirm(){
        return findElement(By.id("toast-container"));
    }


    //locators
    @FindBy(css = "button[class*='noperms-addPage']")
    private WebElement createNewWebpageButton;
    @FindBy(css = "button[class*='noperms-editDir']")
    private WebElement editFolderButton;
    @FindBy(css = "button[class*='noperms-addSubdir']")
    private WebElement addSubfolderButton;
    @FindBy(css = "button[class*='noperms-cmp_sync']")
    private WebElement importExportButton;
    @FindBy(css = "button[class*='imageButton']")
    private WebElement linkVerificationButton;
}
