function setDisplayCompact() {
    $(".pluginDesc").show();
    $(".pluginDescCompact").hide();
    $(".pluginActions").show();
    $(".pluginActionsSmallIcons").hide();

    $(".PluginOptionsIcons a, .pluginActionsSmallIcons a").removeClass("biggerIcon");

    $(".pluginMiniBoxNameCell").removeClass("pluginMiniBoxNameCellCompact");
}

function setDisplayTile() {
    $(".pluginDesc").hide();
    $(".pluginDescCompact").show();
    $(".pluginActions").hide();
    $(".pluginActionsSmallIcons").show();

    $(".PluginOptionsIcons a, .pluginActionsSmallIcons a").addClass("biggerIcon");

    $(".pluginMiniBoxNameCell").addClass("pluginMiniBoxNameCellCompact");
}


$(document).ready(function () {

    if (!$.cookie("pwg_plugin_manager_view")) {
        $.cookie("pwg_plugin_manager_view", "tile");
    }

    if ($("#displayTile").is(":checked")) {
        setDisplayTile();
    };

    if ($("#displayCompact").is(":checked")) {
        setDisplayCompact();
    };

    $("#displayTile").change(function () {
        setDisplayTile();
        $.cookie("pwg_plugin_manager_view", "tile");
    })

    $("#displayCompact").change(function () {
        setDisplayCompact();
        $.cookie("pwg_plugin_manager_view", "compact");
    })
})