package pages;

import helpers.BasePage;
import org.openqa.selenium.By;
import pages.tiles.NavigationTile;
import pages.tiles.WebPagesEditFormTile;
import pages.tiles.WebPagesMainStructureTile;

public class WebPagesPage extends BasePage {

    public WebPagesPage() {
        navigationTile = new NavigationTile();
        webPagesMainStructureTile = new WebPagesMainStructureTile();
        webPagesEditFormTile = new WebPagesEditFormTile();
        waitForElementToDisappear(By.className("WJLoaderDiv"));
    }

    public NavigationTile getNavigationTile() {
        return navigationTile;
    }

    public WebPagesMainStructureTile getWebPagesMainStructureTile() {
        return webPagesMainStructureTile;
    }

    public WebPagesEditFormTile getWebPagesEditFormTile() {
        return webPagesEditFormTile;
    }

    private final NavigationTile navigationTile;
    private final WebPagesMainStructureTile webPagesMainStructureTile;
    private final WebPagesEditFormTile webPagesEditFormTile;
}
