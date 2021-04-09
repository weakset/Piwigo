get_user_activity();

function get_user_activity() {
    $.ajax({
        url: "ws.php?format=json&method=pwg.getActivityInfos",
        type: "POST",
        dataType: "json",
        data: {
            a: 1,
            b: 2
        },
        success: (data) => {
            console.log(data);
            displayData(data)
        }, 
        error: () => {
            console.log("ajax call failed");
        }

    })
}

function displayData(data) {
    console.log("data displayed");
}

$(document).ready(function () {
    console.log("hello world!");
})