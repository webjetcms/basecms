<%@ page pageEncoding="windows-1250" trimDirectiveWhitespaces="true" %>
<% sk.iway.iwcm.Encoding.setResponseEnc(request, response, "text/html");%>
<%@page import="sk.iway.iwcm.doc.DocDetails"%>
<%@ taglib uri="/WEB-INF/iwcm.tld" prefix="iwcm" %>
<%@ taglib uri="/WEB-INF/iway.tld" prefix="iway" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ninja" scope="request" type="sk.iway.iwcm.doc.ninja.Ninja"/>
<!doctype html>
<html amp lang="${ninja.temp.lngIso}">
    <head>
        <%@ include file="includes/amp-head.jsp" %>
    </head>
    
    <body class="ly-amp">
        <div class="content">
            <nav>
                <a href="/">
                    <amp-img class="logo" width="32" height="32" src="${ninja.temp.basePathImg}logo.png"></amp-img>
                </a>
                <%-- Virtualna hlavicka zo sablony,v idealnom pripade mat v hlavicke iba menu komponentu --%>
                <logic:notEmpty name="doc_header">
                <ul>
                    <li>
                        <span></span><span></span><span></span>
                        <iwcm:write name="doc_header"/>
                    </li>
                </ul>
                <div id="closemenu">&#215;</div>
                </logic:notEmpty>
            </nav>

            <h1><iwcm:write name="doc_title" /></h1>

            <amp-social-share type="linkedin" width="35" height="25" data-param-text="<iwcm:write name="doc_title" />" data-param-url="${ninja.page.url}"></amp-social-share>
            <amp-social-share type="facebook" width="35" height="25" data-param-app_id="2398783253682911" data-param-text="<iwcm:write name="doc_title" />" data-param-url="${ninja.page.url}"></amp-social-share>
            <amp-social-share type="twitter" width="35" height="25" data-param-text="<iwcm:write name="doc_title" />" data-param-url="${ninja.page.url}"></amp-social-share>
            <amp-social-share type="email" width="35" height="25" data-param-text="<iwcm:write name="doc_title" />" data-param-url="${ninja.page.url}"></amp-social-share>

            <div class="amp-alert">
                <svg class="icon icon-info">
                    <use xlink:href="#icon-info"></use>
                </svg>
                <svg style="position: absolute; width: 0; height: 0; overflow: hidden" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <defs>
                    <symbol id="icon-info" viewBox="0 0 32 32">
                        <title>info</title>
                        <path d="M14 9.5c0-0.825 0.675-1.5 1.5-1.5h1c0.825 0 1.5 0.675 1.5 1.5v1c0 0.825-0.675 1.5-1.5 1.5h-1c-0.825 0-1.5-0.675-1.5-1.5v-1z"></path>
                        <path d="M20 24h-8v-2h2v-6h-2v-2h6v8h2z"></path>
                        <path d="M16 0c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16zM16 29c-7.18 0-13-5.82-13-13s5.82-13 13-13 13 5.82 13 13-5.82 13-13 13z"></path>
                    </symbol>
                </defs>
                </svg>
                <span>
                    <iwcm:text key="amp.template.showClassic.info"/>
                </span>
                <br>
                <a href="${ninja.page.url}?forceBrowserDetector=pc" class="link" title="<iwcm:text key="amp.template.showClassic"/>">
                    <iwcm:text key="amp.template.showClassic"/>
                </a>
            </div>

            <iwcm:write name="doc_data" />

        </div>

        <logic:notEmpty name="doc_footer"> 
        <footer>
            <iwcm:write name="doc_footer"/>
        </footer>
        </logic:notEmpty>
    </body>
</html>