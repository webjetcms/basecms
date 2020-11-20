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
<html class="no-js pg-homepage" <%@ include file="includes/html-attributes.jsp" %>>
    <head>
        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        <div class="ly-page-wrapper">

            <%@ include file="includes/blind-friendly-panel.jsp" %>
            <header class="ly-header">
                    <%@ include file="includes/header.jsp" %>
                </header><!--/.ly-header-->

            <div class="container-fuid">

                

                <main class="ly-content-wrapper">

                    

                    <div class="ly-content">
                        <div class="container my-4">
                        <%@ include file="includes/breadcrumb.jsp" %>
                        </div>

                            <%-- <%@ include file="includes/browser-support.jsp" %> --%>

                         <div class="container mt-3">
                           <div class="row">
                              <div class="col-12">
                                 <iwcm:write name="doc_data"/>
                              </div>
                           </div>
                         </div>


                    </div><!--/.ly-content-->

                </main><!--/.ly-content-wrapper-->

                <footer class="ly-footer" id="blindBlock-footer">
                    <%@ include file="includes/footer.jsp" %>
                </footer><!--/.ly-footer-->

            </div><!--/.container-->

        </div> <!--/.ly-page-wrapper-->

    </body>
</html>