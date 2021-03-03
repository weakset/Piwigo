function setDisplayTile() {
    console.log("displayTile");
    $(".pluginDesc").show();
    $(".pluginActions").show();
    $(".pluginActionsSmallIcons").hide();
}

function setDisplayLine() {
    console.log("displayLine");
    $(".pluginDesc").hide();
    $(".pluginActions").hide();
    $(".pluginActionsSmallIcons").show();
}


$(document).ready(function () {

    if (!$.cookie("pwg_plugin_manager_view")) {
        $.cookie("pwg_plugin_manager_view", "tile");
    }

    if ($("#displayTile").is(":checked")) {
        setDisplayTile();
    };

    if ($("#displayLine").is(":checked")) {
        setDisplayLine();
    };

    $("#displayTile").change(function () {
        setDisplayTile();
        $.cookie("pwg_plugin_manager_view", "tile");
    })

    $("#displayLine").change(function () {
        setDisplayLine();
        $.cookie("pwg_plugin_manager_view", "line");
    })
})