<#include "common/public.ftl">
<@header title="用户管理" css_war = "responsive_table,gritter_css,jquery_confirm"></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="用户列表" title_3="系统设置" title_4="用户管理" title_4_url="${context.contextPath}/user" ></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增用户</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/user/create">新增用户</a></li>
                                    <li><a href="#">打印列表</a></li>
                                    <li><a href="#">导出列表</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">保存PDF</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>登录名</th>
                                            <th>昵称</th>
                                            <th>邮箱</th>
                                            <th>角色列表</th>
                                            <th>所属公司</th>
                                            <th>联系方式</th>
                                            <th>联系地址</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list userList as user>
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>${user.realName}</td>
                                                <td>${user.email}</td>
                                                <td>${user.roleNames}</td>
                                                <td>${user.organizationName}</td>
                                                <td>${user.mobile}</td>
                                                <td>${user.address}</td>
                                                <td>
                                                <#--<a href="javascript:void(0)" class="pop pop_recharge" data-toggle='modal' data-target="#user-recharge" data-id="${user.id}">充值</a>-->
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/user/${user.id}/update">编辑用户</a></li>
                                                            <li><a href="javascript:delete_user(${user.id})">删除用户</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="javascript:resetPwd(${user.id})">重置密码</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </section>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2017 &copy; tansfar by hup
        </footer>
        <!--footer section end-->
    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="gritter_script,jquery_confirm">
    <script src="${context.contextPath}/js/encrypt/base64.js"></script>
</@js_lib>
<script>
    $(function () {
        //显示小提示
        var tip = '${msg}';
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    })

    function delete_user(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该用户吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/user/"+id+"/delete",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/user?msg=" + (new Base64()).encode("用户删除成功");
                                }

                            }
                        });
                    }
                },
                cancel: {
                    text: "取消",
                    btnClass: 'btn-primary',
                    keys: ['esc'],
                    /*action:function () {
                        console.info("你点击了取消按钮！")
                    }*/
                }
            }
        });
    }


    //删除的标签
    var parentTR, parentTBODY;
    function delete_user11(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }
    //确认删除
    function confirm() {
        var id = $('#deleteId').val().trim();
        var url = "/user/"+id+"/delete";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                TipsNotice(null, data.description);
                if (data.status == "0") {
                    parentTBODY.removeChild(parentTR);
                }

            }
        });
    }
    //重置密码js
    function resetPwd(id) {
        $('#resetPwdId').val(id);
    }
    function confirmReset() {
        var id = $('#resetPwdId').val().trim();
        var url = "/user/"+id+"/resetPassword";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                TipsNotice(null, data.description);
            }
        });
    }
    // 提示方法
    function TipsNotice(title, text) {
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image: '${absolutePath}/images/notice.jpg',
            sticky: false,
            time: 3000,
            speed:5000,
            position: 'bottom-right',
            class_name: 'gritter-light'
        });
    }



</script>
</body>
</html>
