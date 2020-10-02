package pages.tiles;

import helpers.BasePage;
import helpers.Enums;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import pages.dialogs.EditFolderDialog;
import pages.modals.WebPageSettingsModal;

import java.util.ArrayList;
import java.util.List;


public class WebPagesMainStructureTile extends BasePage {

    public WebPagesMainStructureTile() {
        waitForElementToAppear(idInputBox);
        waitForElementToAppear(docIdInputBox);
        waitForElementToAppear(settingsButton);
        waitForElementToAppear(reloadButton);
        waitForElementToAppear(folderList);
    }

    Actions actions = new Actions(driver);

    public String getFolderName() {
        return "New-autotest-folder";
    }

    public String createMainFolder() {
        settingsButton.click();
        new WebPageSettingsModal().CreateNewFolder();
        WebElement newFolder =findElement(By.cssSelector("div[id='groupslist-jstree']>ul>li:last-child"));
        return newFolder.getAttribute("id");
    }

    public ImmutablePair<String,String> createSubFolder(String folderId) {
        selectFromContextMenu(folderId, Enums.ContextMenu.ADD_SUBFOLDER);
        waitForElementToDisappear(By.className("WJLoaderDiv"));
        waitForPageLoaded();
        String subFolderLocator = "div[id='groupslist-jstree']>ul>li:last-child>ul>li:first-child";
        return new ImmutablePair<>(findElement(By.cssSelector(subFolderLocator)).getAttribute("id"),
                findElement(By.cssSelector(subFolderLocator)).getText());
    }

    public void renameFolder(String id){
        findFolder(id);
        actions.sendKeys(Keys.F2).perform();
        actions.sendKeys(getFolderName()).perform();
        actions.sendKeys(Keys.ENTER).perform();
        waitForElementToDisappear(By.className("WJLoaderDiv"));
        waitForPageLoaded();
    }

    public String getFolderName(String nameOfFolder){
        String folderName = null;
        for (String name :
                getFolderNames()) {
            if (name.equals(nameOfFolder)){
                folderName=name;
            }
        }
        return folderName;
    }

    public boolean isFolderPresent(){
        return getFolderName(getFolderName()) != null;
    }

    public static String mainWindow;

    public EditFolderDialog editFolder(String id){
        mainWindow= driver.getWindowHandle();
        selectFromContextMenu(id, Enums.ContextMenu.EDIT_FOLDER);
        return new EditFolderDialog();
    }

    public void removeFolder(String id){
        selectFromContextMenu(id, Enums.ContextMenu.DELETE);
        waitForElementToDisappear(By.className("WJLoaderDiv"));
    }

    private void selectFromContextMenu(String id, Enums.ContextMenu contextRow){
        String contextMenuStartLocator = "ul.jstree-contextmenu>li>a>i";
        WebElement el = findFolder(id);
        actions.contextClick(el).perform();
        switch (contextRow){
            case RENAME:
                findElement(By.cssSelector(contextMenuStartLocator+".glyphicon-pencil")).click();
                //----
                break;
            case ADD_SUBFOLDER:
                findElement(By.cssSelector(contextMenuStartLocator+".glyphicon-folder-close")).click();
                actions.sendKeys(Keys.ENTER).perform();
                break;
            case DELETE:
                findElement(By.cssSelector(contextMenuStartLocator+".glyphicon-remove")).click();
                driver.switchTo().alert().accept();
                break;
            case EDIT_FOLDER:
                findElement(By.cssSelector(contextMenuStartLocator+".glyphicon-folder-open")).click();
                break;
            case CREATE_PAGE:
                findElement(By.cssSelector(contextMenuStartLocator+".glyphicon-file")).click();
                //----
                break;
        }
    }

    private List<String> getFolderNames(){
        List<String> names = new ArrayList<>();
        List<WebElement> folders = findElements(By.cssSelector("div[id='groupslist-jstree']>ul>li>a"));
        for (WebElement element :
                folders) {
            names.add(element.getText());
        }
        return names;
    }

    private WebElement findFolder(String id){
        idInputBox.clear();
        idInputBox.sendKeys(id);
        idInputBox.sendKeys(Keys.ENTER);
        return waitForElementGetClass("jstree-clicked");
    }
    //locators
    @FindBy(id="groupIdInputBox")
    private WebElement idInputBox;
    @FindBy(id="docIdInputBox")
    private WebElement docIdInputBox;
    @FindBy(css="span[data-target='#user-settings-modal']")
    private WebElement settingsButton;
    @FindBy(css="div[class='tree-settings']>span[class='reloadTree']")
    private WebElement reloadButton;
    @FindBy(id="groupslist-jstree")
    private WebElement folderList;
}
