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
    <body class="is-responsive touch touch-fields" id="nn" data-module="scrolltotop">

        <div data-module="mainNavigation" class="c-main-navigation">
            <header>
                
                <div class="c-main-navigation__skip">
                    <span class="u-screen-reader">Jd�te p��mo na:</span>
                    <a href="#page" class="u-screen-reader u-screen-reader--focusable">Obsah</a>
                </div>

                <nav class="c-main-navigation__main">
                    <ul>
                        <li class="c-main-navigation__logo">
                            <a href="/">
                                <img src="/templates/ninja-starter-kit/assets/images/logo-nn.png"/>
                            </a>
                        </li>
                        <li class="c-main-navigation__menu u-textalign-center">
                            <h2 class="u-margin--none" data-component="ColoredText">Spokojen� penze</h2>
                        </li>
                        <li class="c-main-navigation__login">
                            <a href="#" class="c-button u-margin-top">V�ce informac� o penzi</a>
                            <a href="#" class="c-button c-button--secondary">Zavolejte mi</a>
                        </li>
                    </ul>
                </nav>

            </header>
        </div>

        <div class="page" id="page" data-role="document-canvas">
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

                    <%@ include file="includes/browser-support.jsp" %>
                    <iwcm:write name="doc_data"/>

                    </div><!--/.grid-unit-->
                </div><!--/.grid.grid--alpha-->
                    
            </div><!--/.section.content-section-->
        </div><!--/.page-->

        <div class="section footer-section">

            <div class="footer-section-wrapper">

            <iwcm:write name="doc_footer"/>

            <div class="block">
                <div class="o-layout">
                    <div class="o-layout__row">
                
                        <div class="o-layout__col-xxl-6">
                            <h4>NN Finance, s.r.o.</h4>
                            <p class="u-font-size-s">N�dra�n� 344/25, 150&nbsp;00 Praha 5 � Sm�chov<br>Zapsan� v&nbsp;obchodn�m rejst��ku <br>veden�m M�stsk�m soudem v&nbsp;Praze,<br>odd�l C, vlo�ka 197953., <br>I�: 24265870, <br>DI�: CZ699004730</p>
                            <p class="u-font-size-s">NN Finance s.r.o. je zprost�edkovatelem dopl�kov�ho <br>penzijn�ho spo�en� pro NN Penzijn� spole�nost, a.s..</p>
                        </div>
    
                        <div class="o-layout__col-xxl-6">
                            <h4>NN Penzijn� spole�nost, a.s.</h4>
                            <p class="u-font-size-s">N�dra�n� 344/25, 150&nbsp;00 Praha 5 � Sm�chov<br>
                            zapsan� v&nbsp;obchodn�m rejst��ku <br>veden�m M�stsk�m soudem v&nbsp;Praze, <br>odd�l B, vlo�ka 3019<br>I�: 63078074<br></p>
                            
                            <p class="u-font-size-s">Tento materi�l m� pouze informa�n� charakter a NN Penzijn� spole�nost, a. s. ani jin� osoba nenese ��dnou zodpov�dnost za ztr�tu, kter� by mohla �ten��i p��padn� vzniknout pou�it�m informac� uveden�ch v&nbsp;tomto materi�lu.</p>
                        </div>
                
                    </div>
                </div>
            </div>

            </div>

            <hr class="hidden-mobile" />

            <div class="footer-section-wrapper">

                <div class="link-list-group--inline">
                    
                    <ul class="link-list--inline link-list--alpha">
                        <li><a href="NN Penzijn� spole�nost">NN Penzijn� spole�nost</a></li>
                    </ul>
                    
                    <ul class="link-list--inline link-list--beta">
                        <li><a href="https://spokojenapenze.cz/zasady-pouzivani-cookies/">Cookies</a></li>
                    </ul>

                </div>

            </div>

            <hr />

            <div class="footer-section-wrapper">
                <div class="icons icons--trust-builder">
                    <div class="c-list-icon c-list-icon--medium">
                        <a href="#" class="c-list-icon__link"><span aria-hidden="true" class="c-icon c-icon--facebook c-list-icon__icon u-color--medium-grey"></span></a>
                    </div>
                </div>
            </div>

        </div>

        <script src="${ninja.temp.basePathJs}plugins/jquery.min.js"></script>
        <script src="${ninja.temp.basePathJs}plugins/radio.js"></script>
        <script src="${ninja.temp.basePath}assets/_framework/js/nn-min.js"></script>
        <script src="${ninja.temp.basePathJs}ninja.js"></script>

        <div class="c-main-navigation submenu-overlay"></div>

    </body>
</html>