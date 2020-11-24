<%@ page pageEncoding="windows-1250" %>
<meta charset="utf-8">
<script async src="https://cdn.ampproject.org/v0.js"></script>

<title>${ninja.page.doc.title} | ${ninja.temp.group.author}</title>

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

<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">

<%-- Link default URL --%>
<link rel="canonical" href="${ninja.page.url}" />

<%-- Link valid font --%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

<%-- FAVICON --%>
<link rel="icon" href="${ninja.temp.basePathImg}favicon.ico" type="image/x-icon" />

<%-- AMP COMPONENTS --%>
<script async custom-element="amp-image-lightbox" src="https://cdn.ampproject.org/v0/amp-image-lightbox-0.1.js"></script>
<script async custom-element="amp-lightbox-gallery" src="https://cdn.ampproject.org/v0/amp-lightbox-gallery-0.1.js"></script>
<script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
<script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
<script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>
<%-- <script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script> --%>

<%-- Styles --%>
<style amp-custom>
    <jsp:include page="${ninja.temp.basePathCss}/ninja.amp.css"/>
</style>

<%-- AMP boilerplate --%>
<%@ include file="amp-boilerplate.jsp" %>

<script type="application/ld+json">
    {
        "@context": "http://schema.org/",
        "@type": "WebSite",
        "name": "Interway",
        "alternateName": "Interway, a.s.",
        "url": "https://www.interway.sk",
        "potentialAction": {
            "@type": "SearchAction",
            "target": "https://www.interway.sk/vysledky-vyhladavania.html?words={search_term_string}",
            "query-input": "required name=search_term_string"
        }
    }
</script>