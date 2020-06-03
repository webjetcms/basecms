<%@ page pageEncoding="windows-1250"  import="sk.iway.iwcm.*,sk.iway.iwcm.doc.*"%>

<div data-module="mainNavigation" class="c-main-navigation">
    <header>
        
        <div class="c-main-navigation__skip">
            <span class="u-screen-reader">Jdìte pøímo na:</span>
            <a href="#page" class="u-screen-reader u-screen-reader--focusable">Obsah</a>
        </div>
        
        <nav class="c-main-navigation__portal">
            <ul>
                <li class="c-main-navigation__portal-menu">
                    <iwcm:write>!INCLUDE(/components/menu/menu_ul_li.jsp, rootGroupId=1, startOffset=0, maxLevel=1, menuIncludePerex=false, classes=basic, generateEmptySpan=false, openAllItems=false, onlySetVariables=false, rootUlId=menu, menuInfoDirName=)!</iwcm:write>
                </li>
            </ul>
        </nav>

        <nav class="c-main-navigation__main">
            <ul>
                <li class="c-main-navigation__logo">
                    <a href="/">
                        <img src="/templates/ninja-starter-kit/assets/images/logo-nn.png"/>
                    </a>
                </li>
                <li class="c-main-navigation__menu">
                    <iwcm:write>!INCLUDE(/components/menu/menu_ul_li.jsp, rootGroupId=46, startOffset=0, maxLevel=2, menuIncludePerex=false, classes=basic, generateEmptySpan=false, openAllItems=true, onlySetVariables=false, rootUlId=menu, menuInfoDirName=)!</iwcm:write>
                </li>
                <li class="c-main-navigation__search">
                    <button class="c-button c-button--secondary" data-module="chatbotTrigger">
                        Hledat
                        <span class="c-icon c-icon--icon-search"></span>
                    </button>
                </li>
                <li class="c-main-navigation__login">
                    <a href="#" class="c-list-icon__link"><span aria-hidden="true" class="c-icon c-icon--lock c-list-icon__icon"></span>Moje NN</a>
                    <a href="#" class="c-list-icon__link u-margin-left--10"><span aria-hidden="true" class="c-icon c-icon--lock c-list-icon__icon"></span>NN Blue</a>
                </li>
            </ul>
        </nav>

    </header>
</div>