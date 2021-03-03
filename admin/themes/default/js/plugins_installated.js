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
    console.log("hello world");

    if ($("#displayTile").is(":checked")) {
        setDisplayTile();
    };

    if ($("#displayLine").is(":checked")) {
        setDisplayLine();
    };

    $("#displayTile").change(function () {
        setDisplayTile();
    })

    $("#displayLine").change(function () {
        setDisplayLine();
    })
})