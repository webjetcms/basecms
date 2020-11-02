package pages.tiles;

import helpers.BasePage;
import helpers.Enums;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import pages.dialogs.EditFolderDialog;

public class WebPagesEditFormTile extends BasePage {
    /**
     * Class to handle operations in edit part of web page window.
     */
    public WebPagesEditFormTile() {
        waitForElementToAppear(createNewWebpageButton);
        waitForElementToAppear(editFolderButton);
        waitForElementToAppear(addSubfolderButton);
        waitForElementToAppear(importExportButton);
        waitForElementToAppear(linkVerificationButton);
    }

    /**
     * This method opens dialog to add subfolder or edit actual folder.
     * @param folderId folder identifier in main source tree
     * @param action type of action, edit folder or add subfolder
     * @return folder id
     */
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

    /**
     * Confirmation that subfolder was created
     * @return boolean
     */
    public boolean newSubfolderConfirm(){
        return findElement(By.id("toast-container")).isDisplayed();
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
