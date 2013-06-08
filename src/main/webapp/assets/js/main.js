$(document).ready(function () {
    //highlight current / active link
    $('ul.main-menu li a').each(function () {
        if (String(window.location).indexOf($($(this))[0].href) == 0)
            $(this).parent().addClass('active');
    });

    //animating menus on hover
    $('ul.main-menu li:not(.nav-header)').hover(function () {
            $(this).animate({'margin-left': '+=5'}, 300);
        },
        function () {
            $(this).animate({'margin-left': '-=5'}, 300);
        });

    docReady();
});

function docReady(){
    //uniform - styler for checkbox, radio and file input
    $("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();

    //tooltip
    $('[rel="tooltip"],[data-rel="tooltip"]').tooltip({"placement":"bottom",delay: { show: 400, hide: 200 }});

    //rich text editor
    $('.cleditor').cleditor();
}