<%@ page pageEncoding="windows-1250" trimDirectiveWhitespaces="true" %>
<% sk.iway.iwcm.Encoding.setResponseEnc(request, response, "text/html");%>
<%@ taglib uri="/WEB-INF/iwcm.tld" prefix="iwcm" %>
<%@ taglib uri="/WEB-INF/iway.tld" prefix="iway" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ninja" scope="request" type="sk.iway.iwcm.doc.ninja.Ninja"/>
<!doctype html>
<html class="no-js is-responsive pg-homepage" <%@ include file="includes/html-attributes.jsp" %>>
    <head>
        <%@ include file="includes/head.jsp" %>
    </head>
    <body class="is-responsive  touch touch-fields" id="nn" data-module="scrolltotop">


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

                <%@ include file="includes/header-firma.jsp" %>

            </header>
        </div>

        <div class="page " id="page" data-role="document-canvas">
            <div class="section content-section">

                <div class="grid grid--alpha">
                    <div class="grid-unit">

                    <div class="xc-page-wrapper">
                        <div class="xc-mediaitem-wrapper">
                            <div class="masthead--big" data-component="Masthead">
                            <div class="masthead-wrapper--image" id="part1">
                                <div class="masthead-image image-sources">
                                <div class="gridpart image-desktop">
                                    <img
                                    src="<iwcm:write name="perex_image"/>"
                                    data-media="(min-width: 820px)"
                                    />
                                    <p></p>
                                </div>
                                <div class="gridpart image-mobile">
                                    <img
                                    src="<iwcm:write name="perex_image"/>"
                                    data-media="(max-width: 820px)"
                                    />
                                    <p></p>
                                </div>
                                </div>
                            </div>
                            <div class="masthead-wrapper--content">
                                <div class="masthead-content">
                                    <div class="block">
                                        <h1 class="colored" data-component="ColoredText"><iwcm:write name="doc_title"/></h1>
                                        <h2 class="h2--secondary"><iwcm:write name="perex_place"/></h2>
                                        <iwcm:write name="perex_pre"/>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>

                        <%@ include file="includes/breadcrumb.jsp" %>
                        <%@ include file="includes/browser-support.jsp" %>
                        <iwcm:write name="doc_data"/>

                    </div><!--/.grid-unit-->
                </div><!--/.grid.grid--alpha-->
                    
            </div><!--/.section.content-section-->
        </div><!--/.page-->

        <%@ include file="includes/footer.jsp" %>

    </body>
</html>