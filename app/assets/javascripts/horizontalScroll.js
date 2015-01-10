$(function() {
var totalWidth = $("#main-content > .row [class^=col-lg]").length * $("#main-content > .row [class^=col-lg]").width();
    $('#main-content > .row').css('width', totalWidth + 'px');
});