<%@ page pageEncoding="windows-1250" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<title>${ninja.page.doc.title} | ${ninja.temp.group.siteName}</title>

<meta name="description" content="${ninja.page.seoDescription}" />
<meta name="author" content="${ninja.temp.group.author}" />
<meta name="developer" content="${ninja.temp.group.developer}" />
<meta name="generator" content="${ninja.temp.group.generator}" />
<meta name="copyright" content="${ninja.temp.group.copyright}" />
<meta name="robots" content="${ninja.page.robots}" />

<meta property="og:title" content="${ninja.page.seoTitle}" />
<meta property="og:description" content="${ninja.page.seoDescription}" />
<meta property="og:url" content="${ninja.page.url}" />
<meta property="og:image" content="${ninja.page.urlDomain}${ninja.page.seoImage}" />
<meta property="og:site_name" content="${ninja.temp.group.siteName}" />
<meta property="og:type" content="website" />
<meta property="og:locale" content="${ninja.temp.lngIso}" />

<%--<link rel="alternate" hreflang="" href="" />--%>
<link rel="canonical" href="${ninja.page.url}" />

<%-- <% if (ninja.amp.enabled) { %> --%>
<c:if test="${requestScope.doc_temp_name == 'Blog template'}">
    <link rel="amphtml" href="${ninja.page.url}?forceBrowserDetector=amp" />
</c:if>
<%-- <% } %> --%>

${ninja.temp.insertTouchIconsHtml}
<link rel="icon" href="${ninja.temp.basePathImg}favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ninja.temp.basePath}assets/_framework/rel/stylesheet/nn-core-min.css" />

<c:choose>
    <c:when test="${ninja.userAgent.blind}">
        <iwcm:combine type="css" set="">
            ${ninja.temp.basePathCss}blind-friendly.min.css
        </iwcm:combine>
    </c:when>
    <c:otherwise>
        <iwcm:combine type="css" set="">
            ${ninja.temp.basePathCss}ninja.min.css
            ${ninja.temp.basePathCss}shame.css
            <iwcm:write name="base_css_link"/>
            <iwcm:write name="css_link"/>
        </iwcm:combine>
    </c:otherwise>
</c:choose>

${ninja.webjet.insertJqueryFake}
<iwcm:write name="group_htmlhead_recursive"/>
<iwcm:write name="html_head"/>