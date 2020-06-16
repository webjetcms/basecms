<%@ page pageEncoding="windows-1250" %>

<%@ include file="includes/breadcrumb.jsp" %>
<%@ include file="includes/browser-support.jsp" %>
<%@ include file="data/alert-covid-19.jsp" %>

<div class="o-layout">
    <div class="o-layout__row">

        <div class="o-layout__col-xxl-3 o-layout__col-xl-4">
            <div class="block block--bordered-left">
                <h2 data-component="ColoredText">Pojištìní</h2>
                <h4>Jistota<br>pro život</h4>
                <div class="image--roundedcorners">
                <img src="https://www.nn.cz/images/cz/hp/95011919_l.jpg"/>
                </div>
                <p>Klidná budoucnost pro vás<br>i vaše blízké.</p>
                <p><a href="#" class="c-link">Více o pojištìní</a></p>
            </div>
            </div>
            
            <div class="o-layout__col-xxl-3 o-layout__col-xl-4">
            <div class="block block--bordered-left">
                <h2 data-component="ColoredText">Penze</h2>
                <h4>Doplòkové<br>penzijní spoøení</h4>
                <div class="image--roundedcorners">
                <img src="https://www.nn.cz/images/cz/banners/penze_279x187.jpg"/>
                </div>
                <p>Spoøení na penzi<br>se státním pøíspìvkem.</p>
                <p><a href="#" class="c-link">Více o spoøení</a></p>
            </div>
            </div>
            
            <div class="o-layout__col-xxl-3 o-layout__col-xl-4">
            <div class="block block--bordered-left">
                <h2 data-component="ColoredText">Investice</h2>
                <h4>Správa<br>investièního majetku</h4>
                <div class="image--roundedcorners">
                <img src="https://www.nn.cz/images/cz/hp/ma27577_l.jpg"/>
                </div>
                <p>Investované peníze<br>v dobrých rukou.</p>
                <p><a href="#" class="c-link">Více o investování</a></p>
            </div>
            </div>

        <div class="o-layout__col-xxl-3">
            <%@ include file="data/cta-contact.jsp" %>
        </div>

    </div>
</div>

<hr class="devider--page-orange-minimal margin-bottom-30">

<div class="o-layout">
    <div class="o-layout__row">
        <div class="o-layout__col-xl-4">
            <%@ include file="data/blog-post.jsp" %>
        </div>
        <div class="o-layout__col-xl-8">
            <%@ include file="data/news.jsp" %>
        </div>
    </div>
</div>