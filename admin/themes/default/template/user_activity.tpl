{include file='include/colorbox.inc.tpl'}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}

{* {combine_script id='activity_js_file' load='footer' path='admin/themes/default/js/user_activity.js'} *}


{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}
{combine_css id='jquery.selectize' path="themes/default/js/plugins/selectize.{$themeconf.colorscheme}.css"}

{combine_script id='LocalStorageCache' load='footer' path='admin/themes/default/js/LocalStorageCache.js'}
{combine_css path="admin/themes/default/fontello/css/animation.css" order=10}
{footer_script}
{* <!-- USERS --> *}
var usersCache = new UsersCache({
  serverKey: '{$CACHE_KEYS.users}',
  serverId: '{$CACHE_KEYS._hash}',
  rootUrl: '{$ROOT_URL}'
});

usersCache.selectize(jQuery('[data-selectize=users]'));

jQuery(".cancel-icon").click(function() {
  jQuery(".user-selecter")[0].selectize.setValue(null);
  return false;
});

{*<-- Translation keys -->*}

var actionType_add = "{'add'|translate}";
var actionType_delete = "{'deletion'|translate}";
var actionType_move = "{'move'|translate}";
var actionType_edit = "{'edit'|translate}";
var actionType_log = "{'log'|translate}";

var action_add = "{'added'|translate}";
var action_delete = "{'deleted'|translate}";
var action_move = "{'moved'|translate}";
var action_edit = "{'edited'|translate}";
var action_login = "{'logged in'|translate}";
var action_logout = "{'logged out'|translate}";

var object_user = "{'user'|translate}";
var object_album = "{'album'|translate}";
var object_photo = "{'photo'|translate}";

{*<-- Getting and Displaying Activities -->*}

get_user_activity();

function get_user_activity() {
    $.ajax({
        url: "ws.php?format=json&method=pwg.activity.getList",
        type: "POST",
        dataType: "json",
        data: {
            a: 1,
            b: 2
        },
        success: (data) => {
            console.log(data);

            setCreationDate(data.result[data.result.length-1].date, data.result[0].date);
            $(".loading").hide();
            
            data.result.forEach(line => {
                lineConstructor(line);
            });
            displayLine(data);
        }, 
        error: (e) => {
            console.log("ajax call failed");
            console.log(e);
        }

    }).done( () => {
        $("#-1").hide();
    })
}

function lineConstructor(line) {
    let newLine = $("#-1").clone();

    newLine.removeClass("hide");

    // console.log(line);
    // newLine.attr("id", line.line_id);
    newLine.attr("id", line.id);

    switch (line.object) { // La gestion du pluriel se fera ici.
        case "user":
            line.object = object_user;
        break;

        case "album":
            line.object = object_album;
        break;

        case "photo":
            line.object = object_photo;
        break;
    };

    switch (line.action) {
        case "edit":
            newLine.find(".action-type").addClass("icon-blue");
            newLine.find(".user-pic").addClass("icon-blue");
            newLine.find(".action-icon").addClass("icon-pencil");

            newLine.find(".action").html(action_edit);
            newLine.find(".action-name").html(actionType_edit);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            break;
    
        case "add":
            newLine.find(".action-type").addClass("icon-green");
            newLine.find(".user-pic").addClass("icon-green");
            newLine.find(".action-icon").addClass("icon-plus");

            newLine.find(".action").html(action_add);
            newLine.find(".action-name").html(actionType_add);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            break;
    
        case "delete":
            newLine.find(".action-type").addClass("icon-red");
            newLine.find(".user-pic").addClass("icon-red");
            newLine.find(".action-icon").addClass("icon-trash-1");

            newLine.find(".action").html(action_delete);
            newLine.find(".action-name").html(actionType_delete);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }
            
            break;
    
        case "move":
            newLine.find(".action-type").addClass("icon-yellow");
            newLine.find(".user-pic").addClass("icon-yellow");
            newLine.find(".action-icon").addClass("icon-move");

            newLine.find(".action").html(action_move);
            newLine.find(".action-name").html(actionType_move);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
            } else {
                newLine.find(".object").html(line.object);
            }

            break;

        case "login":
            newLine.find(".action-type").addClass("icon-purple");
            newLine.find(".user-pic").addClass("icon-purple");

            newLine.find(".action").html(action_login);
            newLine.find(".action-name").html(actionType_log);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
 
        case "logout":
            newLine.find(".action-type").addClass("icon-purple");
            newLine.find(".user-pic").addClass("icon-purple ");

            newLine.find(".action").html(action_logout);
            newLine.find(".action-name").html(actionType_log);

            if (line.counter > 1) {
                newLine.find(".object").html(line.object + "s");
                newLine.find(".action-icon").addClass("icon-users");
            } else {
                newLine.find(".object").html(line.object);
                newLine.find(".action-icon").addClass("icon-user-1");
            }
            
            break;
        default:
            newLine.addClass("line-color-gray");
            newLine.find(".action-name").html("Error");

            newLine.find(".object").html("ERROR ERROR")
            break;
    }

    /* Action_section */
    {* newLine.find(".action-name").html(line.action); *}
    newLine.find(".nb_items").html(line.counter);
    
    /* Date_section */
    newLine.find(".date-day").html(line.date);
    newLine.find(".date-hour").html(line.hour);

    /* User _Section */
    newLine.find(".user-pic").html(get_initials(line.username));
    newLine.find(".user-name").html(line.username);

    /* Detail_section */
    newLine.find(".detail-item-1").html(line.ip_address);
    newLine.find(".detail-item-1").attr("title", "Ip");

    if (line.detailsType == "script") {
        newLine.find(".detail-item-2").html(line.details.script);
        newLine.find(".detail-item-2").attr('title', 'script');
    } else if (line.detailsType == "method") {
        newLine.find(".detail-item-2").html(line.details.method);
        newLine.find(".detail-item-2").attr('title', 'method');
    }   
    
    if (line.details.agent) {
        newLine.find(".detail-item-3").html(line.details.agent);
        newLine.find(".detail-item-3").attr('title', line.details.agent);
    } else {
        newLine.find(".detail-item-3").remove();
    }

    displayLine(newLine);
}

function displayLine(line) {
    $(".tab").append(line);
}

function get_initials(username) {
    let words = username.toUpperCase().split(" ");
    let res = words[0][0];

    if (words.length > 1 && words[1][0] !== undefined ) {
        res += words[1][0];
    }
    return res;
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

function setCreationDate(startDate, endDate) {
    $(".start-date").html(startDate)

    $(".end-date").html(endDate)
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



{/footer_script}

<div class="container"> 

    <div class="activity-header">
        <div class="select-user">
            <span class="select-user-title"> {'Selected user'|translate} </span>
            
            <select class="user-selecter" data-selectize="users" placeholder="{'none'|translate}"
                single style="width:250px; height: 10px;"></select>
            
            <span class="icon-cancel cancel-icon"> </span>

        </div>
        <div class="acivity-time">
            <span class="acivity-time-text"> {'Activity time from'|translate}</span>
            <span class="start-date">
                <span class="icon-spin6 animate-spin"></span>
            </span>
            <span class="acivity-time-text"> {'to'|translate}</span>
            <span class="end-date">
                <span class="icon-spin6 animate-spin"></span>
            </span>
        </div>
    </div>



    <div class="tab-title">
        <div class="action-title">
            {'Action'|translate}
        </div>

        <div class="date-title">
            {'Date'|translate}
        </div>

        <div class="user-title">
            {'User'|translate}
        </div>

        <div class="detail-title">
            {'Details'|translate}
        </div>
    </div>


    <div class="tab">
    <div class="loading"> 
        <span class="icon-spin6 animate-spin"> </span>
    </div>
        <div class="line hide" id="-1">
            <div class="action-section">
                <div class="action-type">
                    <span class="action-icon"></span>
                    <span class="action-name"> Edit </span>
                </div>
                <div class="action-infos">
                    <span class="nb_items"> 1 </span>
                    <span class="object"> photo</span>
                    <span class="action"> edited </span>
                </div>
            </div>

            <div class="date-section">
                <span class="icon-clock"> </span>
                <span class="date-day">1 Janvier 1970</span>
                <span class="date-hour">a 00:00</span>
            </div> 

            <div class="user-section">
                <div class="user-pic">
                </div>
                <div class="user-name">
                    Username
                </div>
            </div>

            <div class="detail-section">
                <div class="detail-item detail-item-1">
                    detail 1
                </div>
                <div class=" detail-item detail-item-2">
                    detail 2
                </div>
                <div class="detail-item detail-item-3">
                    detail 3
                </div>
            </div>
        </div>
    </div>
</div>

<style>

.container {
    padding: 0 30px;
}

.container,
.tab {
    display: flex;
    flex-direction: column;
}

.tab-title {
    display: flex;
    flex-direction: row;
}

.hide {
    display: none !important;
}

.line {
    background: #fafafa;
    box-shadow: 0px 2px 4px #00000024;

    display: flex;
    flex-direction: row;

    height: 40px;

    align-items: center;

    margin-bottom: 10px;
}

.tab-title div {
    text-align: left;
    font-size: 1.1em;
    font-weight: bold;

    margin: 0 20px 10px 0px;

    color: #9e9e9e;

    padding-bottom: 5px;
}

.tab-title div:first-child {
    margin: 0 4px 10px 23px;

}

.tab-title .action-title, 
.line .action-section {
    min-width: 280px;
    max-width: 340px;
}

.tab-title .date-title, 
.line .date-section {
    min-width: 240px;
    max-width: 300px;
}

.tab-title .user-title, 
.line .user-section {
    min-width: 200px;
    max-width: 250px;
}


.line .action-section,
.line .date-section,
.line .user-section,
.tab-title .action-title,
.tab-title .date-title,
.tab-title .user-title {
    text-align: left;
    {* width: 22%; *}
}

.line .action-section,
.line .date-section,
.line .user-section {
    margin: 0 20px 0 0;
}

.line .detail-section,
.tab-title .detail-title {
    display: flex;
    flex-grow: 1;
    margin-right: 0;
}

.line .detail-item {
    background: #f0f0f0f0;
    margin: 0 10px 0 0;
    padding: 3px 6px;
    border-radius: 20px;

    min-width: 50px; 
    max-width: 200px;

    text-align: center;

    overflow: hidden;
    text-overflow: ellipsis;
    cursor: default;

    white-space: nowrap;

}

.action-section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.action-type {
    margin: 0 10px 0 15px;
    padding: 3px 10px;
    border-radius: 20px;

    white-space: nowrap;
}

.action-infos {
    display: flex;
    flex-direction: row;
}

.action-infos span {
    margin-right: 5px;
}

.date-section .date-day {
    font-weight: bold;
}

.user-section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.user-section .user-pic {
    width: 30px;
    height: 30px;

    min-width: 30px;

    border-radius: 50%;

    margin-right: 10px;

    display: flex;

    justify-content: center;
    align-items: center;

    font-weight: 600;
    font-size: 17px;
}

.user-section .user-name {
    font-weight: bold;
}

/* Activity Header */

.activity-header {
    display: flex;
    flex-direction: row;

    align-items: center;

    height: 100px;
    width: 100%;
}

.select-user {
    background: #fafafa;
    height: 50%;

    display: flex;
    align-items: center;

    padding: 0 20px;

    box-shadow: 0px 2px 4px #00000024;
    border-radius: 5px;
}

.select-user span {
    font-size: 15px;
    font-weight: bold;

    margin-right: 20px;
}

.acivity-time {
    margin: 0 25px;
}

.acivity-time-text {
    font-size: 13px;
    font-weight: bold;
}

.start-date, 
.end-date {
    padding: 3px 6px;
    background: #eaeaea;
    border-radius: 50px;
    margin: 5px;
}

.user-selecter {
    width: 150px;
}

/* Selectize */

.selectize-control.single .selectize-input {
    height: 30px;
    padding: 0 10px;

    display: flex;
    align-items: center;
    justify-content: left;
}

.selectize-input {
    text-align: left;
}

.selectize-control.single .selectize-input input{
    height: 30px;
}

.selectize-dropdown {
    text-align: left;
}

.cancel-icon {
    margin: 0 0 0 10px !important;

    cursor: pointer;
}

.loading {
    font-size: 25px;
}
</style>