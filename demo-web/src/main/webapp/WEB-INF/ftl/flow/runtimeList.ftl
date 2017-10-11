<#include "common/public.ftl">
<@header title="流程运行列表" css_war="">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" style="min-height: 800px">
        <@notification title="通知"></@notification>
        <@pageHeading title_1="任务管理"  title_3="消息管理" title_4="流程运行" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="mail-box">
                <aside class="mail-nav mail-nav-bg-color">
                    <header class="header"> <h4>流程运行</h4> </header>
                    <div class="mail-nav-body">
                        <ul class="nav nav-pills nav-stacked mail-navigation">

                            <#list processRuntimes as runtime>
                                <li><a href="${context.contextPath}/process/${runtime.name}/runtimeView"> <i class="fa fa-envelope-o"></i> ${runtime.code}</a></li>
                            </#list>

                           <#-- <li class="active"><a href="mail.html"> <i class="fa fa-inbox"></i> 待办任务  <span class="label label-danger pull-right inbox-notification">4</span></a></li>
                            <li><a href="#"> <i class="fa fa-envelope-o"></i> 历史任务</a></li>
                            <li><a href="#"> <i class="fa fa-certificate"></i> 定时任务</a></li>
                            <li><a href="#"> <i class="fa fa-file-text-o"></i> 起草任务 <span class="label label-info pull-right inbox-notification">34</span></a></li>
                            <li><a href="#"> <i class="fa fa-trash-o"></i> 回收站</a></li>-->
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
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#--<#list definitionsByName as obj>
                                        <tr>
                                            <td>第[${obj_index + 1}]步</td>
                                            <td>${obj.name}-${obj.step}</td>
                                            <td>${obj.stepDesc}</td>
                                            <td>${obj.user}, ${obj.group}</td>
                                            <td>${obj.rule} <#if obj.rule == 'ONE'>（所有的执行者只要有一个人执行即可）</#if></td>
                                            <td>
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                        操&nbsp作 <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li><a href="javascript:updateDefinition(${obj.id})">编辑该节点</a></li>
                                                        <li><a href="#myModal2" data-toggle="modal" onclick="delete_process(${obj.id},this)" >删除该节点</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#myModal3" data-toggle="modal" onclick="resetPwd(${obj.id})" >复制该节点</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </#list>-->
                                    </tbody>
                                </table>
                                <section class="panel">
                                    <header class="panel-heading">
                                        展示面板
                                    </header>
                                    <div class="panel-body">
                                        dothing
                                    </div>
                                </section>
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
<@js_lib js_war=""></@js_lib>
<script>
    jQuery(document).ready(function() {

    })

    function updateDefinition(id) {
        if (id == undefined || id == '')
            return
        var url = "/process/"+id+"/definitionUpdate";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                if (data.status == "0") {
                    //dothing
                }
            }
        });
    }
</script>


</body>
</html>
