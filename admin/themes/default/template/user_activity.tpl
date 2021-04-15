{include file='include/colorbox.inc.tpl'}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}

{combine_script id='activity_js_file' load='footer' path='admin/themes/default/js/user_activity.js'}


{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}
{combine_css id='jquery.selectize' path="themes/default/js/plugins/selectize.{$themeconf.colorscheme}.css"}

{combine_script id='LocalStorageCache' load='footer' path='admin/themes/default/js/LocalStorageCache.js'}

{footer_script}
{* <!-- USERS --> *}
var usersCache = new UsersCache({
  serverKey: '{$CACHE_KEYS.users}',
  serverId: '{$CACHE_KEYS._hash}',
  rootUrl: '{$ROOT_URL}'
});

usersCache.selectize(jQuery('[data-selectize=users]'));
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
        <div class="line" id="-1">
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

.line {
    background: #fafafa;
    box-shadow: 0px 2px 4px #00000024;

    display: flex;
    flex-direction: row;

    border-radius: 5px;
    height: 40px;

    align-items: center;

    margin-bottom: 10px;
}

.tab-title div {
    text-align: left;
    font-size: 17px;
    font-weight: bold;

    margin: 0 20px 20px 0;

    border-bottom: 3px solid #9c9c9c;

    padding-bottom: 5px;
}

.tab-title .action-title, 
.line .action-section {
    min-width: 230px;
    max-width: 280px;
}

.tab-title .date-title, 
.line .date-section {
    min-width: 220px;
    max-width: 270px;
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
    width: 22%;
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

    white-space: nowrap;
}

.action-section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.action-type {
    background: #f0f0f0f0;
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
    background: #9c9c9c;

    margin-right: 10px;
}

.user-section .user-name {
    font-weight: bold;
}

/* Lines Color */

.line.line-color-green {
    border-left: 5px solid #d2ffcb;
}
.line.line-color-green .action-type {
    background: #d2ffcb;
    color: #48d73d;
}

.line.line-color-red {
    border-left: 5px solid #ffd0d0;
}
.line.line-color-red .action-type {
    background: #ffd0d0;
    color: #ff4545;
}

.line.line-color-blue {
    border-left: 5px solid #d0ebff;
}
.line.line-color-blue .action-type {
    background: #d0ebff;
    color: #2b84c3;
}

.line.line-color-yellow {
    border-left: 5px solid #ffe9ce;
}
.line.line-color-yellow .action-type {
    background: #ffe9ce;
    color: #ffae50;
}

.line.line-color-gray {
    border-left: 5px solid #a3a3a3;
}
.line.line-color-gray .action-type {
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
    padding: 0;

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

</style>