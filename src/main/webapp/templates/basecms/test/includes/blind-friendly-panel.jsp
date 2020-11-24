<%@ page pageEncoding="windows-1250" %>
<c:if test="${ninja.userAgent.blind}">
    <div id="blindBlock-top">
        <address>Aktu�lna str�nka: <a href="${ninja.page.url}">${ninja.page.doc.title} | ${ninja.temp.group.author}</a></address>
        <p><strong>Zobrazuje sa optimalizovan� verzia str�nky pre slabo vidiacich alebo �pecializovan� �i star�ie prehliada�e.</strong></p>
        <p><a href="${ninja.page.urlPath}?forceBrowserDetector=pc">Prejs� na grafick� verziu</a></p>
        <hr />
        <p><em>Za�iatok str�nky, titulka:</em></p>
        <p><a href="#blindBlock-next">Pokra�uj v ��tan�</a> alebo presko� na <a href="#blindBlock-navigation">Hlavn� navig�ciu</a>.</p>
        <div id="blindBlock-next">
            <p><em>�al�ie mo�nosti:</em></p>
            <ul>
                <li><a href="#blindBlock-top">Za�iatok str�nky</a></li>
                <li><a href="#blindBlock-navigation">Hlavn� navig�cia</a></li>
                <li><a href="#blindBlock-breadcrumb">Cesta k str�nke</a></li>
                <li><a href="#blindBlock-article">Obsah str�nky</a></li>
                <li><a href="#blindBlock-sidebar">Bo�n� panel</a></li>
                <li><a href="#blindBlock-footer">P�ti�kov� inform�cie</a></li>
            </ul>
        </div>
    </div>
</c:if>