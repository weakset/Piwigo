function setDisplayClassic() {
    console.log("DISPLAY CLASSIC");
    $(".pluginContainer").removeClass("line").removeClass("compact").addClass("classic");

    $(".pluginDesc").show();
    $(".pluginDescCompact").hide();
    $(".pluginActions").show();
    $(".pluginActionsSmallIcons").hide();

    $(".pluginMiniBoxNameCell").removeClass("pluginMiniBoxNameCellCompact");

    normalTitle();
}

function setDisplayCompact() {
    console.log("DISPLAY COMPACT");
    $(".pluginContainer").removeClass("line").addClass("compact").removeClass("classic");

    $(".pluginDesc").hide();
    $(".pluginDescCompact").show();
    $(".pluginActions").hide();
    $(".pluginActionsSmallIcons").show();

    $(".pluginMiniBoxNameCell").addClass("pluginMiniBoxNameCellCompact");

    reduceTitle()
}

function setDisplayLine() {
    console.log("DISPLAY LINE");
    $(".pluginContainer").addClass("line").removeClass("compact").removeClass("classic");

    $(".pluginDesc").show();
    $(".pluginDescCompact").hide();
    $(".pluginActions").show();
    $(".pluginActionsSmallIcons").hide();
}

function reduceTitle() {
    var x = document.getElementsByClassName("pluginMiniBoxNameCell");
    var length = 20;

    for (const div of x) {
        var text = div.innerHTML.trim()
        if (text.length > length) {
            var newText = text.substring(0, length);
            newText = newText + "...";

            div.innerHTML = newText;
            div.title =  text   
        }
    }
}

function normalTitle() {
    var x = document.getElementsByClassName("pluginMiniBoxNameCell");

    for (const div of x) {
        div.innerHTML = div.dataset.title
    }
}

function activatePlugin(id) {
    console.log("Plugin activated");
    console.log(id);

    $("#"+id+" .switch").attr("disabled", true);

    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'ws.php',
        data: { method: 'pwg.plugins.performAction', 
                action: 'activate', 
                plugin: id, 
                pwg_token: pwg_token, 
                format: 'json' },
        success: function (data) {
            console.log(data);
            console.log("it works (activated)");
        }, 
        error: function () {
            console.log("It didn't work");
        }
    }).done(function (data) {
        console.log(data);
        $("#"+id+" .switch").attr("disabled", false);
    })
}

function disactivatePlugin(id, action) {
    console.log("Plugin disactivated");
    console.log(id);
    $("#"+id+" .switch").attr("disabled", true);

    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'ws.php',
        data: { method: 'pwg.plugins.performAction', 
                action: 'deactivate', 
                plugin: id, 
                pwg_token: pwg_token, 
                format: 'json' },
        success: function (data) {
            console.log(data);
            console.log("it works (deactivated)");
        }, 
        error: function () {
            console.log("It didn't work");
        }
    }).done(function (data) {
        console.log(data);
        $("#"+id+" .switch").attr("disabled", false);
    })
}


$(document).ready(function () {

    if (!$.cookie("pwg_plugin_manager_view")) {
        $.cookie("pwg_plugin_manager_view", "tile");
    }

    if ($("#displayClassic").is(":checked")) {
        setDisplayClassic();
    };

    if ($("#displayCompact").is(":checked")) {
        setDisplayCompact();
    };

    if ($("#displayLine").is(":checked")) {
        setDisplayLine();
    };

    $("#displayClassic").change(function () {
        setDisplayClassic();
        $.cookie("pwg_plugin_manager_view", "classic");
    })

    $("#displayCompact").change(function () {
        setDisplayCompact();
        $.cookie("pwg_plugin_manager_view", "compact");
    })

    $("#displayLine").change(function () {
        setDisplayLine();
        $.cookie("pwg_plugin_manager_view", "line");
    })

    $(".switch").change(function () {
        if ($(this).find("#toggleSelectionMode").is(':checked')) {
            activatePlugin($(this).parent().parent().attr("id"));
            console.log("activatePlugin");

            $(this).parent().parent().addClass("plugin-active").removeClass("plugin-inactive");
            if ($(this).parent().parent().find(".pluginUnavailableAction").attr("href")) {
                $(this).parent().parent().find(".pluginUnavailableAction").removeClass("pluginUnavailableAction").addClass("pluginActionLevel1");
            }
        } else {
            disactivatePlugin($(this).parent().parent().attr("id"))
            console.log("disactivatePlugin");

            $(this).parent().parent().removeClass("plugin-active").addClass("plugin-inactive");
            $(this).parent().parent().find(".pluginActionLevel1").removeClass("pluginActionLevel1").addClass("pluginUnavailableAction");
        }
    })
})