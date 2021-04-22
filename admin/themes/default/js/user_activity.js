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
            // var line_id =0
            // data.result.forEach(line => {
            //     lineConstructor(line, line_id);
            //     line_id++
            // });
            // displayLine(data);
        }, 
        error: (e) => {
            console.log("ajax call failed");
            console.log(e);
        }

    }).done( () => {
        $("#-1").hide();
    })
}

function lineConstructor(line, line_id) {
    let newLine = $("#-1").clone();

    console.log(line);
    // newLine.attr("id", line.line_id);
    newLine.attr("id", line_id)

    switch (line.action) {
        case "edit":
            newLine.addClass("line-color-blue");
            newLine.find(".action-icon").addClass("icon-pencil");

            newLine.find(".action").html("edited");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            break;
    
        case "add":
            newLine.addClass("line-color-green");
            newLine.find(".action-icon").addClass("icon-plus");

            newLine.find(".action").html("added");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            break;
    
        case "delete":
            newLine.addClass("line-color-red");
            newLine.find(".action-icon").addClass("icon-trash-1");

            newLine.find(".action").html("deleted");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            
            break;
    
        case "move":
            newLine.addClass("line-color-yellow");
            newLine.find(".action-icon").addClass("icon-move");

            newLine.find(".action").html("moved");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }

            break;

        case "login":
            newLine.addClass("line-color-gray");

            newLine.find(".action").html("logged in");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
 
        case "logout":
            newLine.addClass("line-color-gray");

            newLine.find(".action").html("logged out");

            if (line.nb_items > 1) {
                newLine.find(".object").html(line.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
        default:
            newLine.addClass("line-color-gray");

            newLine.find(".object").html("ERROR ERROR")
            break;
    }

    /* Action_section */
    newLine.find(".action-name").html(line.action);
    newLine.find(".nb_items").html(line.nb_items);
    // newLine.find(".action").html(line.line_infos.action_section.action_infos.action);

    var date = line.occured_on.split(" ");

    /* Date_section */
    newLine.find(".date-day").html(date[0]);
    newLine.find(".date-hour").html(date[1]);

    /* User _Section */
    newLine.find(".user-pic").html("PHOTO LA");
    newLine.find(".user-name").html(line.username);

    /* Detail_section */
    newLine.find(".detail-item-1").html(line.details);
    // newLine.find(".detail-item-2").html(line.line_infos.detail_section.detail_2);
    // newLine.find(".detail-item-3").html(line.line_infos.detail_section.detail_3);

    displayLine(newLine);
}

function displayLine(line) {
    $(".tab").append(line);
}

function filterUsers(username) {
    let lines =  $(".line");

    showAllLines()

    for (let index = 1; index < lines.length; index++) {
        
        if (username != lines[index].children[2].children[1].innerHTML) {
            $("#" + lines[index].id).hide();
        }
    }
}

function showAllLines() {
    let lines =  $(".line");
    for (let index = 1; index < lines.length; index++) {
        $("#" + lines[index].id).show();
    }

    $("#-1").hide();
}

$(document).ready(function () {

    $('select').on('change', function (user) {
        try {
            filterUsers($(".selectize-input .item")[0].innerHTML);
        } catch (error) {
            showAllLines();
        }
    });
});

