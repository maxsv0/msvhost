$(document).ready(function() {
    table_type(2);
    table_architecture(1);

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });


    $('.bool-switch').html(function() {
        var str = '';
        if ($(this).data("value") > 0) {
            str = '<label class="switch"><input type="checkbox" checked onclick="';
            value_set = 0;
            // $(this).parent().parent().addClass("text-muted");
        } else {
            str = '<label class="switch"><input type="checkbox" onclick="';
            value_set = 1;
            // $(this).parent().parent().removeClass("text-muted");
        }
        str += 'user_toggle_submit(this,\''+$(this).data("section")+'\',\''+$(this).data("table")+'\',\''+$(this).data("id")+'\',\''+$(this).data("field")+'\',\''+value_set+'\');';
        str += '"><span class="slider round"></span></label>';
        return str;
    });


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
        price = 0;
    } else if ($('input[name=website_type]:checked').val() == "wtype2") {
        price = 0;
    } else if ($('input[name=website_type]:checked').val() == "wtype3") {
        price = 0;
    }
    $("#confirm_wtype_price1").html(price+"$");
    $("#confirm_wtype_price2").html(price+"$");

    price_env = 0;
    if ($('input[name=architecture]:checked').val() == "warch1") {
        price_env = 0;
    } else if ($('input[name=architecture]:checked').val() == "warch2") {
        price_env = 0;
    }
    $("#confirm_warch_price1").html(price_env+"$");
    $("#confirm_warch_price2").html(price_env+"$");

    var price_total = price+price_env+0;
    $("#wprice_total").html(price_total + "$");

    $("#text_website_disk").html($("#inputdisk").val()+" Gb");

    $("#confirm_website_type").html("Website '"+$("#text_website_type").html() + "'");
    $("#confirm_website_architecture").html($("#text_website_architecture").html()+" license");
    $("#confirm_website_size").html("Instance hosting '" + $("#text_website_size").html()+"'");
    $("#confirm_website_disk").html("Instance disk " + $("#text_website_disk").html());
}


function user_toggle_submit(e,section, table, id, field, value) {
    console.log(e,section, table, id, field, value);
    if ($(e).parent().parent().parent().parent().hasClass("text-muted") && field == "published") {
        $(e).parent().parent().parent().parent().removeClass("text-muted");
    } else if(field == "published"){
        $(e).parent().parent().parent().parent().addClass("text-muted");
    }

    $form = $('<form>' +
        '<input type="hidden" value="'+section+'" name="section">'+
        '<input type="hidden" value="'+table+'" name="table">'+
        '<input type="hidden" value="'+id+'" name="itemID">'+
        '<input type="hidden" value="'+id+'" name="form_id">'+
        '<input type="hidden" value="'+value+'" name="form_'+field+'">'+
        '<input type="hidden" value="1" name="ajaxcall">'+
        '<input type="hidden" value="1" name="save">'+
        '</form>');

    $.ajax({
        type: "post",
        url: "/user/",
        data: $form.serialize(),
        success: function (data) {
            var obj = JSON.parse(data);

            var msg = $("#submit_status");
            msg.removeClass("alert-danger alert-success hide");
            msg.html(obj.msg);

            if(obj.ok) {
                msg.removeClass("alert-warning").addClass("alert-success", 500);
            } else {
                msg.removeClass("alert-warning").addClass("alert-danger", 500);
            }
        },
        error: function (data) {
            console.log(data);
        },
    });
}