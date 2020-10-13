package pages;

import helpers.BasePage;
import org.openqa.selenium.By;
import pages.tiles.NavigationTile;
import pages.tiles.WebPagesEditFormTile;
import pages.tiles.WebPagesMainStructureTile;

public class WebPagesPage extends BasePage {
    /**
     * Class to check if web Pages page is completely loaded.
     */
    public WebPagesPage() {
        navigationTile = new NavigationTile();
        webPagesMainStructureTile = new WebPagesMainStructureTile();
        webPagesEditFormTile = new WebPagesEditFormTile();
        waitForElementToDisappear(By.className("WJLoaderDiv"));
    }

    /**
     * Redirect method to handle operations in navigation tile.
     * @return navigation tile
     */
    public NavigationTile getNavigationTile() {
        return navigationTile;
    }

    /**
     * Redirect method to handle operations in source tree tile.
     * @return source tree tile
     */
    public WebPagesMainStructureTile getWebPagesMainStructureTile() {
        return webPagesMainStructureTile;
    }

    /**
     * Redirect method to handle operations in edit form tile.
     * @return edit form tile
     */
    public WebPagesEditFormTile getWebPagesEditFormTile() {
        return webPagesEditFormTile;
    }

    private final NavigationTile navigationTile;
    private final WebPagesMainStructureTile webPagesMainStructureTile;
    private final WebPagesEditFormTile webPagesEditFormTile;
}
