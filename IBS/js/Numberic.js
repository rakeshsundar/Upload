$(document).ready(function () {
    $(".numericOnly").bind('keypress', function (e) {
        if (e.keyCode == '9' || e.keyCode == '16') {
            return;
        }
        var code;
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;
        if (e.which == 46)
            return true;
        if (code == 8 || code == 46)
            return true;
        if (code < 48 || code > 57)
            return false;
        if (code < 48 || code > 57)
            return false;

    });

    // Disable paste
    $(".numericOnly").bind("paste", function (e) {
        e.preventDefault();
    });

    $(".numericOnly").bind('mouseenter', function (e) {
        var val = $(this).val();
        if (val != '0') {
            val = val.replace(/[^0-9]+/g, "")
            $(this).val(val);
        }
    });
});