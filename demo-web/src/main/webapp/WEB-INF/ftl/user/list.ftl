<#include "common/public.ftl">
<@header title="新增用户" keywords="新增用户" description="新增用户">
<!--responsive table-->
<link href="${context.contextPath}/css/table-responsive.css" rel="stylesheet" />
<!--gritter css-->
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/gritter/css/jquery.gritter.css" />
</@header>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <@left title="导航栏"></@left>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <@notification title="通知"></@notification>
        <!-- header section end-->

        <!-- page heading start-->
        <@pageHeading title_1="用户管理" title_2="首页" title_3="系统设置" title_4="用户管理"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
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
                            <#--<span class="tools pull-right">
                                <a href="1" class="fa fa-download"></a>
                                <a href="2" class="fa fa-print"></a>
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                            </span>-->
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>登录名</th>
                                            <th>密码</th>
                                            <th class="numeric">盐值</th>
                                            <th class="numeric">角色列表</th>
                                            <th class="numeric">所属公司</th>
                                            <th class="numeric">真实名称</th>
                                            <th class="numeric">联系方式</th>
                                            <th class="numeric">联系地址</th>
                                            <th class="numeric">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list userList as user>
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>*******</td>
                                                <td class="numeric">********</td>
                                                <td class="numeric">${user.roleNames}</td>
                                                <td class="numeric">${user.organizationName}</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">
                                                <#--<a href="javascript:void(0)" class="pop pop_recharge" data-toggle='modal' data-target="#user-recharge" data-id="${user.id}">充值</a>-->
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/user/${user.id}/update">编辑用户</a></li>
                                                            <li><a href="#myModal2" data-toggle="modal" onclick="delete_user(${user.id},this)" >删除用户</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#myModal3" data-toggle="modal" onclick="resetPwd(${user.id})" >重置密码</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                        <!-- 删除用户  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认删除</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="deleteId" type="hidden"/>
                                                        你确定要删除该用户吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirm()"> 确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->


                                        <!-- 重置密码  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal3" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认重置密码</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="resetPwdId" type="hidden"/>
                                                        你确定要重置该用户的密码吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmReset()"> 确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->
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
<script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<!--gritter script-->
<script type="text/javascript" src="${context.contextPath}/js/gritter/js/jquery.gritter.js"></script>
<script src="${context.contextPath}/js/gritter/js/gritter-init.js" type="text/javascript"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<script>
    //删除的标签
    var parentTR, parentTBODY;

    function delete_user(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }
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












    function TipsNotice(title, text) {
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image: 'images/notice.jpg',
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
