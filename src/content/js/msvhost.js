$(document).ready(function() {
    table_type(2);
    table_architecture(1);

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
});

function table_highlight(id, index) {
    // check for disabled
    var isDisabled = false;
    $("#table_"+id).find("input").each(function (){
        if ($(this).val() == id+index) {
            if ($(this).prop('disabled')) isDisabled = true;
        }
    });
    if (isDisabled) return;

    // clean current color
    $("#table_"+id).find("tr").not(':first').each(function (){
        $(this).find("td").css("background-color", "")
    });
    $("#table_"+id).find("input").each(function (){
        if ($(this).val() == id+index) {
            $(this).prop("checked", "checked");
        } else {
            $(this).prop("checked", false);
        }
    });

    $("#table_"+id).find("tr").each(function (){
        $(this).find("td").eq(index).css("background-color", "#f3bb45")
    });

    wizard_update_texts();
}

function table_type(index) {
    table_highlight("wtype", index);
}
function table_architecture(index) {
    table_highlight("warch", index);
}

function wizard_update_texts() {
    $('#text_website_size').html($("#inputserver").val());
    $('#text_website_location').html($("#inputserverzone").val());

    title_name = "title_" + $('input[name=architecture]:checked').val();
    $("#text_website_architecture").html($("#"+title_name).html());

    title_name = "title_" + $('input[name=website_type]:checked').val();
    $("#text_website_type").html($("#"+title_name).html());

    var price = 0;
    if ($('input[name=website_type]:checked').val() == "wtype1") {
        price = 19;
    } else if ($('input[name=website_type]:checked').val() == "wtype2") {
        price = 44;
    } else if ($('input[name=website_type]:checked').val() == "wtype3") {
        price = 44;
    }
    $("#confirm_wtype_price1").html(price+"$");
    $("#confirm_wtype_price2").html(price+"$");

    var price_total = price+5.75;
    $("#wprice_total").html(price_total + "$");

    $("#text_website_disk").html($("#inputdisk").val()+" Gb");

    $("#confirm_website_type").html("Website '"+$("#text_website_type").html() + "'");
    $("#confirm_website_architecture").html("Instance type '"+$("#text_website_architecture").html()+"'");
    $("#confirm_website_size").html("Instance hosting '" + $("#text_website_size").html()+"'");
    $("#confirm_website_disk").html("Instance disk " + $("#text_website_disk").html());
}