<#include "common/public.ftl">
<@header title="流程定义列表" css_war="data_table,icheck,jquery_confirm"></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" style="min-height: 800px">
        <@notification title="通知"></@notification>
        <@pageHeading title_1="流程定义"  title_3="消息管理" title_4="流程定义" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="mail-box">
                <aside class="mail-nav mail-nav-bg-color">
                    <header class="header"> <h4>流程定义</h4> </header>
                    <div class="mail-nav-body">
                        <ul class="nav nav-pills nav-stacked mail-navigation">
                            <#list processDefinitions as definition>
                                <li <#if definition.name == name>class="active"</#if> ><a href="${context.contextPath}/process/definitionList?name=${definition.name}"> <i class="fa fa-envelope-o"></i> ${definition.nameDesc}</a></li>
                            </#list>
                        </ul>
                    </div>
                </aside>
                <section class="mail-box-info">
                    <header class="header">
                        流程步骤
                    </header>
                    <div class="row">
                        <div class="col-sm-12">
                            <section class="mail-list">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>流程步骤</th>
                                        <th>流程编码</th>
                                        <th>节点描述</th>
                                        <th>流程执行人</th>
                                        <th>流程规则</th>
                                        <th>日期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list definitionsByName as obj>
                                    <tr>
                                        <td>第[${obj.step}]步<#if obj.step == 1>-起始<#elseif obj.step == -1>-结束</#if></td>
                                        <td>${obj.name}</td>
                                        <td>${obj.stepDesc}</td>
                                        <td>${obj.members}, ${obj.groups}</td>
                                        <td>${obj.rule} <#if obj.rule == 'ONE'>（所有的执行者只要有一个人执行即可）</#if></td>
                                        <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                        <td>
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                    操&nbsp作 <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li><a href="javascript:updateDefinition(${obj.id})">编辑该节点</a></li>
                                                    <li><a href="javascript:delete_process(${obj.id})">删除该节点</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="javascript:copyDefinition(${obj.id})">复制该节点</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    </#list>
                                    </tbody>
                                </table>
                                <span id="definition-panel" class="col-md-8" style="display: none">
                                    <section class="panel">
                                        <header class="panel-heading">
                                            展示面板
                                        </header>
                                        <div class="panel-body">
                                            <form class="form-horizontal" role="form">
                                                <div class="row" style="padding-bottom: 10px">
                                                    <label  class="col-sm-2 control-label">流程名称：</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" class="form-control" id="name" readonly>
                                                    </div>

                                                    <label  class="col-sm-2 control-label">流程描述：</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" class="form-control" id="nameDesc" readonly>
                                                    </div>
                                                </div>

                                                <div class="row" style="padding-bottom: 10px">
                                                    <label  class="col-sm-2 control-label">流程步骤：</label>
                                                    <div class="col-sm-4">
                                                        <#--<input type="text" class="form-control" id="step">-->
                                                        <div id="spinner3">
                                                            <div class="input-group">
                                                                <input type="text" id="step" class="spinner-input form-control" maxlength="3" readonly>
                                                                <div class="spinner-buttons input-group-btn">
                                                                    <button type="button" class="btn btn-default spinner-up">
                                                                        <i class="fa fa-angle-up"></i>
                                                                    </button>
                                                                    <button type="button" class="btn btn-default spinner-down">
                                                                        <i class="fa fa-angle-down"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <label  class="col-sm-2 control-label">步骤描述：</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" class="form-control" id="stepDesc">
                                                    </div>
                                                </div>

                                                <div class="row" style="padding-bottom: 10px">
                                                    <label  class="col-sm-2 control-label">审核人员：</label>
                                                    <div class="col-sm-4">
                                                        <#--<input type="text" class="form-control" id="members">-->
                                                        <div class="input-group">
                                                            <input id="members" name="members" class="form-control" placeholder="用户名" readonly>
                                                            <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#username-myModal">
                                                                        <i class="fa fa-search"></i>
                                                                    </button>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <label  class="col-sm-2 control-label">审核组：</label>
                                                    <div class="col-sm-4">
                                                        <#--<input type="text" class="form-control" id="groups">-->
                                                        <div class="input-group">
                                                            <input id="groups" name="groups" class="form-control" placeholder="组织机构" readonly>
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#groups-myModal">
                                                                    <i class="fa fa-search"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="padding-bottom: 10px">
                                                    <label  class="col-sm-2 control-label">审核规则：</label>
                                                    <div class="col-sm-4">
                                                        <#--<input type="text" class="form-control" id="rule">-->
                                                            <select class="form-control input-sm m-bot15" id="rule" name="rule">
                                                                <option value="ALL">全部的通过</option>
                                                                <option value="ONE">至少通过一个</option>
                                                                <option value="LEADER">机构的领导通过</option>
                                                            </select>
                                                    </div>

                                                    <label  class="col-sm-2 control-label">流程状态：</label>
                                                    <div class="col-sm-4 icheck">
                                                        <#--<input type="text" class="form-control" id="status">-->
                                                            <div class="square-purple">
                                                                <div class="checkbox">
                                                                    <input tabindex="3" type="checkbox" name="status" id="status" value="是否可用" checked>
                                                                    <label>状态</label>
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <br>
                                                 <span class="tools pull-right">
                                                    <button class="btn btn-primary" type="submit" >确认修改</button>
                                                    <button class="btn btn-primary" type="submit" >取消</button>
                                                </span>
                                            </form>
                                        </div>
                                    </section>
                                </div>

                                <!--username Modal -->
                                <div class="modal fade" id="username-myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="width: 50%">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                        <span class="tools pull-right">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="selectUser()"> 确定</button>
                                                        </span>
                                                <h4 class="modal-title">用户名</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-striped table-hover table-bordered select-username-table" id="editable-sample">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>用户名</th>
                                                            <th>昵称</th>
                                                            <th>邮箱</th>
                                                            <th>电话</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list users as user>
                                                            <tr class="">
                                                                <td><input type="checkbox"></td>
                                                                <td>${user.username}</td>
                                                                <td>${user.realName}</td>
                                                                <td>${user.email}</td>
                                                                <td class="center">${user.mobile}</td>
                                                            </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- modal -->


                                <!--Organization Modal -->
                                <div class="modal fade" id="groups-myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="width: 50%">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <span class="tools pull-right">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="selectOrg()"> 确定</button>
                                                </span>
                                                <h4 class="modal-title">组织机构</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-striped table-hover table-bordered select-org-table" id="editable-sample-2">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>名称</th>
                                                            <th>描述</th>
                                                            <th>领导</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list organizations as organization>
                                                            <tr>
                                                                <td><input type="checkbox"></td>
                                                                <td>${organization.name}</td>
                                                                <td>${organization.description}</td>
                                                                <td>${organization.leaders}</td>
                                                            </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- modal -->


                            </section>

                        </div>
                    </div>
                </section>
            </div>

        </div>
        <footer class="sticky-footer">
            2017 &copy; transfar by hup</a>
        </footer>
    </div>
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="spinner,data_table,icheck,jquery_confirm"></@js_lib>
<script>
    jQuery(document).ready(function() {
        EditableTable.init();
        EditableTable2.init();
    })



    //选中用户名
    function selectUser() {
        var data = [];
        $(".select-username-table tbody tr").find(":checkbox:checked").each(function () {
            var val = $(this).parent().next().text();
            data.push(val);
        });
        $('#members').val(data);
    }

    //选中组织机构
    function selectOrg() {
        var data = [];
        $(".select-org-table tbody tr").find(":checkbox:checked").each(function () {
            var val = $(this).parent().next().text();
            data.push(val);
        });
        $('#groups').val(data);
    }


    function updateDefinition(id) {
        if (id == undefined || id == '')
            return
        var url = "/process/"+id+"/definition";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                if (data.status == "0") {
                    $('#definition-panel').show();
                    $('#name').val(data.result.name);
                    $('#nameDesc').val(data.result.nameDesc);
                    $('#step').val(data.result.step);
                    $('#stepDesc').val(data.result.stepDesc);
                    $('#members').val(data.result.members);
                    $('#groups').val(data.result.groups);
                    $('#rule').val(data.result.rule);
                    $('#status').val(data.result.status);
                }
            }
        });
    }

    function delete_process(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该流程节点吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/process/"+id+"/definitionDelete";
                        $.ajax({
                            url: url,
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.reload();
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


</script>

</body>
</html>
