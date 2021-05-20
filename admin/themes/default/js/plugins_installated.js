function setDisplayClassic() {
    console.log("DISPLAY CLASSIC");

    $(".pluginDesc").show();
    $(".pluginDescCompact").hide();
    $(".pluginActions").show();
    $(".pluginActionsSmallIcons").hide();

    $(".pluginMiniBoxNameCell").removeClass("pluginMiniBoxNameCellCompact");

    normalTitle();
}

function setDisplayCompact() {
    console.log("DISPLAY COMPACT");

    $(".pluginDesc").hide();
    $(".pluginDescCompact").show();
    $(".pluginActions").hide();
    $(".pluginActionsSmallIcons").show();

    $(".pluginMiniBoxNameCell").addClass("pluginMiniBoxNameCellCompact");

    reduceTitle()
}

function setDisplayLine() {
    console.log("DISPLAY LINE");
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
})