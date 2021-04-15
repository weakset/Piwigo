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
            
            data.result.forEach(line => {
                lineConstructor(line)
            });
            displayLine(data)
        }, 
        error: () => {
            console.log("ajax call failed");
        }

    })
}

function lineConstructor(line) {
    defaultLine = document.getElementById("-1").clone();

    console.log(defaultLine);

    // displayLine(newLine)
}

function displayLine(line) {
    document.getElementsByClassName("tab").innerHTML += line
}

$(document).ready(function () {
    console.log("hello world!");
})