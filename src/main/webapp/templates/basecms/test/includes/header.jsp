<%@ page pageEncoding="windows-1250"  import="sk.iway.iwcm.*,sk.iway.iwcm.doc.*"%>

<c:if test="${ninja.userAgent.blind}">
    <a href="${ninja.page.urlPath}?forceBrowserDetector=blind">Textov� verzia str�nky</a>
</c:if>
<iwcm:write name="doc_header"/>
    