<#import "/macro.ftl" as m >
<@m.page_header title="用户列表 " selected='home' subselected=""  css="msgList" requirejs="userList"/>

<!--右边内容 start-->
<div class="main-detail">
    <div class="main-warp">
        <div class="main-title">
        <#--<input type="text" value="${usedDate}">-->
            <#--<h2 class="fl">首页</h2>-->
        </div>
        <!--  右侧自适应内容块主体 start  -->
        <div id="container-sms" style="height:250px;width: 48%;float:left;margin:5px"></div>
        <div id="container-app" style="height:250px;width: 48%;float:right;margin:5px"></div>
        <div id="container-pie" style="height:250px;width: 48%;float:left;margin:5px"></div>
        <div id="container-sta" style="height:250px;width: 48%;float:right;margin:5px"></div>
    </div>
</div>

