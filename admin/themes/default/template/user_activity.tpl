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
        <div class="line" id="-1">
            <div class="action-section">
                <div class="action-type">
                    <span class="action-icon"> </span>
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

.tab-title .action-title, 
.line .action-section {
    min-width: 220px;
}

.tab-title .date-title, 
.line .date-section {
    min-width: 220px;
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
    margin: 0 10px 0 15px;
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

/* Actions color */

.action-type.action-color-green {
    background: #d2ffcb;
    color: #48d73d;
}

.action-type.action-color-red {
    background: #ffd0d0;
    color: #ff4545;
}

.action-type.action-color-blue {
    background: #d0ebff;
    color: #2b84c3;
}

.action-type.action-color-yellow {
    background: #ffe9ce;
    color: #ffae50;

}

.action-type.action-color-gray {
    background: #a3a3a3;
    color: black ;
}

</style>