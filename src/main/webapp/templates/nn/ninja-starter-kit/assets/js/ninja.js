$(document).ready(function() {

    // Ninja.init({
    //     debug:true
    // });

    
    var menuToggler = $(".c-main-navigation__toggler");
    $(menuToggler).attr("href","javascript:;");
    $(menuToggler).on("click", function(){
        $(this).parent("li").toggleClass("c-main-navigation__expanded");
        $(".c-main-navigation.submenu-overlay").toggleClass("is-active");
    });

    $(".c-main-navigation.submenu-overlay").on("click", function(){
        $(menuToggler).parent("li").removeClass("c-main-navigation__expanded");
        $(".c-main-navigation.submenu-overlay").removeClass("is-active");
    });

});