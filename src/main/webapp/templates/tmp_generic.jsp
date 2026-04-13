<%
sk.iway.iwcm.Encoding.setResponseEnc(request, response, "text/html");
%><%@ page pageEncoding="utf-8" %>
<%@ taglib uri="/WEB-INF/iwcm.tld" prefix="iwcm" %>
<%@ taglib uri="/WEB-INF/iway.tld" prefix="iway" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<HTML>
<HEAD>
<TITLE><iwcm:write name="doc_title"/></TITLE>
   <meta http-equiv="Content-type" content="text/html;charset=<%=(String)request.getAttribute("SetCharacterEncodingFilter.encoding")%>">
   <link rel="stylesheet" href="<iway:request name="base_css_link"/>" type="text/css">
   <c:if test="${not empty css_link}">
      <link rel="stylesheet" type="text/css" href="<iway:request name="css_link"/>">
   </c:if>
</HEAD>

<body>

<iwcm:write name="doc_header"/><br>

<b>Navigácia: </b><iwcm:write name="navbar"/>

<table width="770" border="0" cellspacing="0" cellpadding="0" height="300">
   <tr>
      <td align="left" valign="top">
         <iwcm:write name="doc_menu"/>
      </td>
      <td>
         <iwcm:write name="doc_data"/>
      </td>
   </tr>
</table>

<iwcm:write name="doc_footer"/>

</body>

<iwcm:write name="after_body"/>

</html>
