<#include "common/public.ftl">
<@header title="待办任务列表" css_war="paging-hup_css">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" style="min-height: 800px">
        <@notification title="通知"></@notification>
        <@pageHeading title_1="任务管理"  title_3="消息管理" title_4="任务管理" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="mail-box">
                <aside class="mail-nav mail-nav-bg-color">
                    <header class="header"> <h4>任务导航</h4> </header>
                    <div class="mail-nav-body">
                        <ul class="nav nav-pills nav-stacked mail-navigation">
                            <li <#if request.status == 'todo'>class="active"</#if>><a href="${context.contextPath}/task/list?status=todo"> <i class="fa fa-inbox"></i>待办任务<span class="label label-danger pull-right inbox-notification">...</span></a></li>
                            <li <#if request.status == 'done'>class="active"</#if>><a href="${context.contextPath}/task/list?status=done"> <i class="fa fa-envelope-o"></i>历史任务<span class="label label-danger pull-right inbox-notification">...</span></a></li>
                            <li><a href="#"> <i class="fa fa-certificate"></i>定时任务</a></li>
                            <li><a href="#"> <i class="fa fa-file-text-o"></i>起草任务</a></li>
                            <li><a href="#"> <i class="fa fa-trash-o"></i>回收站</a></li>
                        </ul>
                    </div>
                </aside>
                <section class="mail-box-info">
                    <header class="header">
                        任务管理
                    </header>
                    <div class="col-sm-12">
                        <section class="mail-list">
                            <section class="panel">
                                <div class="panel-body">
                                    <form class="form-horizontal adminex-form" action="" method="get">
                                        <div class="form-group">
                                            <div class="col-lg-10">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <input type="hidden" name="status" value="${request.status}">
                                                        <input type="text" class="form-control" name="code" value="${request.code}" placeholder="业务编码...">
                                                    </div>
                                                    <button class="btn btn-default" type="submit">查询</button>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </section>

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>业务编码</th>
                                    <th>任务名称</th>
                                    <th>任务链接</th>
                                    <#--<th>任务状态</th>-->
                                    <th>任务执行人</th>
                                    <#--<th>紧急状态</th>-->
                                    <th>时间</th>
                                <#--<th>操作</th>-->
                                </tr>
                                </thead>
                                <tbody>
                                <#list pager.getList() as obj>
                                <tr>
                                    <td>${obj.code}</td>
                                    <td>${obj.name}</td>
                                    <td>${obj.url}</td>
                                    <#--<td>${obj.status}</td>-->
                                    <td>${obj.owner}</td>
                                    <#--<td>${obj.emergencyState}</td>-->
                                    <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <#--<td>
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
                                </td>-->
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        <@hup_pagination  showBegin = "${ (pager.currentPage-1) * pager.pageSize + 1 }"  showEnd = "${pager.currentPage * pager.pageSize}"></@hup_pagination>
                        </section>

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
<@js_lib js_war="paging-hup"></@js_lib>
<script>
    //分页
    $("#page").paging({
        pageNo: ${pager.currentPage},
        totalPage: ${pager.pageCount},
        totalSize: ${pager.totalCount},
        callback: function(num) {
            var pageSize = $('#pageSize option:selected').val();
            var pageUrl =  "${context.contextPath}/task/list?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
