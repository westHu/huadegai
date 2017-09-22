<#include "common/public.ftl">
<@header title="角色列表" keywords="角色列表" description="角色列表">
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
        <@pageHeading title_1="角色管理" title_2="首页" title_3="系统设置" title_4="角色管理"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增角色</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/role/create">新增角色</a></li>
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
                            <table class="table  table-hover general-table">
                                <thead>
                                    <tr>
                                        <th> 角色</th>
                                        <th class="hidden-phone">描述</th>
                                        <th>拥有资源</th>
                                        <th>权重</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list roleList as role>
                                    <tr>
                                        <td>${role.role} </td>
                                        <td class="hidden-phone">${role.description}</td>
                                        <td>${role.resourceNames}</td>
                                        <td>
                                            <div class="progress progress-striped progress-xs">
                                                <div style="width: 70%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-danger">
                                                    <span class="sr-only">70% Complete (success)</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                    操&nbsp作 <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li><a href="${context.contextPath}/role/${role.id}/update">编辑角色</a></li>
                                                    <li><a href="#myModal2" data-toggle="modal" onclick="delete_role(${role.id},this)" >删除角色</a></li>
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
                                                你确定要删除该角色吗？ <关联的用户都会失去该角色>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirm()"> 确定</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- modal -->
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2017 &copy; transfar by hup
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

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

</body>
</html>
