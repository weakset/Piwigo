{include file='include/colorbox.inc.tpl'}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}

{combine_script id='activity_js_file' load='footer' path='admin/themes/default/js/user_activity.js'}

<div class="container"> 

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
        <div class="line" id="0">
            <div class="action-section">
                <div class="action-type">
                    <span class="icon-pencil"> </span>
                    <span class="action-name"> Edition </span>
                </div>
                <div class="action-infos">
                    <span class="nb_item"> 50 </span>
                    <span class="object"> photos </span>
                    <span class="action"> édités </span>
                </div>
            </div>

            <div class="date-section">
                <span class="icon-clock"> </span>
                <span class="date-day">15 Janvier 2020</span>
                <span class="date-hour">à 8:45</span>
            </div> 

            <div class="user-section">
                <div class="user-pic">
                </div>
                <div class="user-name">
                    Jean-fred
                </div>
            </div>

            <div class="detail-section">
                <div class="detail-item">
                    detail 1
                </div>
                <div class="detail-item">
                    detail 2
                </div>
                <div class="detail-item">
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
}

.tab-title div {
    text-align: left;
    font-size: 17px;
    font-weight: bold;

    margin: 0 20px 20px 0;

    border-bottom: 3px solid #9c9c9c;

    padding-bottom: 5px;
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
}

.action-section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.action-type {
    background: #f0f0f0f0;
    margin: 0 10px 0 25px;
    padding: 3px 6px;
    border-radius: 20px;
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

    border-radius: 50%;
    background: #9c9c9c;

    margin-right: 10px;
}

.user-section .user-name {
    font-weight: bold;
}


</style>