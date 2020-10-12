import helpers.Config;
import helpers.Enums;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import pages.WebPagesPage;
import pages.dialogs.EditFolderDialog;
import pages.tiles.WebPagesEditFormTile;

import static helpers.BasePage.goToUrl;

public class WebPageTest extends BaseTest{

    private WebPagesPage webPage;
    private String folderId;

    @Before
    public void CreateFolder(){
        goToUrl(Config.getBase_url()+"webpages/");

        //add folder
        webPage = new WebPagesPage();
        //folderId = webPage.getWebPagesMainStructureTile().createMainFolder();
        folderId = "22";
    }

    @Test
    public void JsTreeFolderManipulation() {
        //rename folder
        webPage.getWebPagesMainStructureTile().renameFolder(folderId);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),webPage.getWebPagesMainStructureTile().getFolderName());

        //edit folder
        EditFolderDialog editFolderDialog = webPage.getWebPagesMainStructureTile().editFolder(folderId);
        editFolderDialog.leaveEditDialog(Enums.EditDialog.CANCEL);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.folderName);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.navbarName);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName().toLowerCase(),editFolderDialog.urlDirName);
        Assert.assertEquals("/",editFolderDialog.parentFolderName);

        //add subfolder
        ImmutablePair<String, String> subFolder = webPage.getWebPagesMainStructureTile().createSubFolder(folderId);
        String subFolderId = subFolder.left;
        String subFolderName = subFolder.right;
        editFolderDialog = webPage.getWebPagesMainStructureTile().editFolder(subFolderId);
        editFolderDialog.leaveEditDialog(Enums.EditDialog.CANCEL);
        Assert.assertEquals(subFolderName,editFolderDialog.folderName);
        Assert.assertEquals(subFolderName,editFolderDialog.navbarName);
        Assert.assertEquals(subFolderName.toLowerCase(),editFolderDialog.urlDirName);
        Assert.assertEquals("/"+webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.parentFolderName);


        //remove folder
        webPage.getWebPagesMainStructureTile().removeFolder(folderId);
        Assert.assertFalse(webPage.getWebPagesMainStructureTile().isFolderPresent());
    }

    @Test
    public void DataTableFolderManipulation(){
        //add subfolder
        WebPagesEditFormTile editForm = webPage.getWebPagesEditFormTile();
        editForm.folderManipulation(folderId, Enums.FolderManipulation.ADD_SUBFOLDER);
        Assert.assertTrue(editForm.newSubfolderConfirm().isDisplayed());

        //edit folder
        editForm.folderManipulation(folderId, Enums.FolderManipulation.EDIT_FOLDER);

    }
}
