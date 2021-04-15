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
            data.result.forEach(line => {
                lineConstructor(line);
            });
            displayLine(data);
        }, 
        error: () => {
            console.log("ajax call failed");
        }

    }).done( () => {
        $("#-1").hide();
    })
}

function lineConstructor(line) {
    let newLine = $("#-1").clone();

    newLine.attr("id", line.line_id);

    switch (line.line_infos.action_section.action_type) {
        case "Edit":
            newLine.addClass("line-color-blue");
            newLine.find(".action-icon").addClass("icon-pencil");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
            }
            break;
    
        case "Add":
            newLine.addClass("line-color-green");
            newLine.find(".action-icon").addClass("icon-plus");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
            }
            break;
    
        case "Delete":
            newLine.addClass("line-color-red");
            newLine.find(".action-icon").addClass("icon-trash-1");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
            }
            
            break;
    
        case "Move":
            newLine.addClass("line-color-yellow");
            newLine.find(".action-icon").addClass("icon-move");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
            }

            break;

        case "Login":
            newLine.addClass("line-color-gray");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
 
        case "Logout":
            newLine.addClass("line-color-gray");

            if (line.line_infos.action_section.action_infos.nb_items > 1) {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.line_infos.action_section.action_infos.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
        default:
            newLine.addClass("line-color-gray");

            newLine.find(".object").html("ERROR ERROR")
            break;
    }

    /* Action_section */
    newLine.find(".action-name").html(line.line_infos.action_section.action_type);
    newLine.find(".nb_items").html(line.line_infos.action_section.action_infos.nb_items);
    newLine.find(".action").html(line.line_infos.action_section.action_infos.action);

    /* Date_section */
    newLine.find(".date-day").html(line.line_infos.date_section.date_day);
    newLine.find(".date-hour").html(line.line_infos.date_section.date_hour);

    /* User _Section */
    newLine.find(".user-pic").html(line.line_infos.user_section.user_pic);
    newLine.find(".user-name").html(line.line_infos.user_section.user_name);

    /* Detail_section */
    newLine.find(".detail-item-1").html(line.line_infos.detail_section.detail_1);
    newLine.find(".detail-item-2").html(line.line_infos.detail_section.detail_2);
    newLine.find(".detail-item-3").html(line.line_infos.detail_section.detail_3);

    displayLine(newLine);
}

function displayLine(line) {
    $(".tab").append(line);
}

$(document).ready(function () {
    console.log("hello world!");

    $(".item").change(function (user) {
        console.log(user);
    })
})