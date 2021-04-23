{include file='include/colorbox.inc.tpl'}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}

{combine_script id='activity_js_file' load='footer' path='admin/themes/default/js/user_activity.js'}


{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}
{combine_css id='jquery.selectize' path="themes/default/js/plugins/selectize.{$themeconf.colorscheme}.css"}

{combine_script id='LocalStorageCache' load='footer' path='admin/themes/default/js/LocalStorageCache.js'}
{combine_css path="admin/themes/default/fontello/css/animation.css"}
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

{/footer_script}

<div class="container"> 

    <div class="activity-header">
        <div class="select-user">
            <span class="select-user-title"> Selected user </span>

            {* <select class="user-selecter" name="users">
                <option>--Select option--</option>
                <option> Eren </option>
                <option> Mikasa</option>
                <option> Rivaille</option>
                <option> Armin</option>
                <option> Zoe</option>
            </select> *}

            
            <select class="user-selecter" data-selectize="users" placeholder="{'Select user'|translate}"
                single style="width:250px; height: 10px;"></select>
            
            <span class="icon-cancel cancel-icon"> </span>

        </div>
        <div class="acivity-time">
            <span class="acivity-time-text"> Activity time from</span>
            <span class="start-date"> 1 January 1970 </span>
            <span class="acivity-time-text"> to </span>
            <span class="end-date"> 15 April 2021 </span>
        </div>
    </div>



    <div class="tab-title">
        <div class="action-title">
            Action
        </div>

        <div class="date-title">
            Date
        </div>

        <div class="user-title">
            User
        </div>

        <div class="detail-title">
            Detail
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
    min-width: 230px;
    max-width: 280px;
}

.tab-title .date-title, 
.line .date-section {
    min-width: 240px;
    max-width: 280px;
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

/* Lines Color */

.line.line-color-green {
    border-left: 5px solid #d2ffcb;
}
.line.line-color-green .action-type,
.line.line-color-green .user-pic{
    background: #d2ffcb;
    color: #48d73d;
}

.line.line-color-red {
    border-left: 5px solid #ffd0d0;
}
.line.line-color-red .action-type,
.line.line-color-red .user-pic {
    background: #ffd0d0;
    color: #ff4545;
}

.line.line-color-blue {
    border-left: 5px solid #d0ebff;
}
.line.line-color-blue .action-type,
.line.line-color-blue .user-pic {
    background: #d0ebff;
    color: #2b84c3;
}

.line.line-color-yellow {
    border-left: 5px solid #ffe9ce;
}
.line.line-color-yellow .action-type,
.line.line-color-yellow .user-pic {
    background: #ffe9ce;
    color: #ffae50;
}

.line.line-color-gray {
    border-left: 5px solid #a3a3a3;
}
.line.line-color-gray .action-type,
.line.line-color-gray .user-pic {
    background: #a3a3a3;
    color: black;
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