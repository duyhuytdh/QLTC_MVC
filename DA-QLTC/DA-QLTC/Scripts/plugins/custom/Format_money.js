// Format so tien
function Format_money() {
    var lst_str = $('.format_money');
    for (var i = 0; i < lst_str.length; i++) {
        $(lst_str[i]).val(getFormatedNumberString($(lst_str[i]).val().split(",").join("").split(".").join()));
    }
    $(".format_money").keyup(function (e) {
        if (e.keyCode != 17 && e.keyCode != 16 && e.keyCode != 37 && e.keyCode != 39 && e.keyCode != 36) {
            $(this).val(formatString($(this).val()));
        }
    });
}