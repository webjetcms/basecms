<%@ page pageEncoding="windows-1250"%>
<%@
taglib uri="/WEB-INF/iwcm.tld" prefix="iwcm" %><%@
taglib uri="/WEB-INF/iway.tld" prefix="iway" %>

<div class="o-layout">
   <div class="o-layout__row">

      <div class="o-layout__col-xxl-9">
         <iwcm:write>!INCLUDE(/components/sitemap/ul_li.jsp, groupId=1, maxDepth=5, colsNum=1)!</iwcm:write>
      </div>

      <div class="o-layout__col-xxl-3">
         <div class="block block--bordered-left">
               <h4>Informace</h4>
               <ul class="link-list link-list--secundarynav">
                  <li><a href="/informace/mapa-stranek/" class="is-active">Mapa stránek</a></li>
                  <li><a href="/informace/cookies/">Cookies</a></li>
                  <li><a href="/informace/prohlaseni/">Prohlášení</a></li>
               </ul>
         </div>
      </div>

   </div>
</div>
