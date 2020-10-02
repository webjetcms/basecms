import helpers.Config;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.junit.Assert;
import org.junit.Test;
import pages.WebPagesPage;
import pages.dialogs.EditFolderDialog;

import static helpers.BasePage.goToUrl;

public class WebPageTest extends BaseTest{

    @Test
    public void CreateNewFolder() {
        goToUrl(Config.getBase_url()+"webpages/");

        //add folder
        WebPagesPage webPage = new WebPagesPage();
        String folderId = webPage.getWebPagesMainStructureTile().createMainFolder();

        //rename folder
        webPage.getWebPagesMainStructureTile().renameFolder(folderId);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),webPage.getWebPagesMainStructureTile().getFolderName());

        //edit folder
        EditFolderDialog editFolderDialog = webPage.getWebPagesMainStructureTile().editFolder(folderId);
        editFolderDialog.close();
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.folderName);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.navbarName);
        Assert.assertEquals(webPage.getWebPagesMainStructureTile().getFolderName().toLowerCase(),editFolderDialog.urlDirName);
        Assert.assertEquals("/",editFolderDialog.parentFolderName);

        //add subfolder
        ImmutablePair<String, String> subFolder = webPage.getWebPagesMainStructureTile().createSubFolder(folderId);
        String subFolderId = subFolder.left;
        String subFolderName = subFolder.right;
        editFolderDialog = webPage.getWebPagesMainStructureTile().editFolder(subFolderId);
        editFolderDialog.close();
        Assert.assertEquals(subFolderName,editFolderDialog.folderName);
        Assert.assertEquals(subFolderName,editFolderDialog.navbarName);
        Assert.assertEquals(subFolderName.toLowerCase(),editFolderDialog.urlDirName);
        Assert.assertEquals("/"+webPage.getWebPagesMainStructureTile().getFolderName(),editFolderDialog.parentFolderName);


        //remove folder
        webPage.getWebPagesMainStructureTile().removeFolder(folderId);
        Assert.assertFalse(webPage.getWebPagesMainStructureTile().isFolderPresent());
    }
}
