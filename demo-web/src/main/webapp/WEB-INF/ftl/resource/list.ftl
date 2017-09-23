<#include "common/public.ftl">
<@header title="资源列表" keywords="资源列表" description="资源列表">
<!--jquery.treetable-->
<link rel="stylesheet" href="${context.contextPath}/js/jquery-treetable/stylesheets/jquery.treetable.css">
<link rel="stylesheet" href="${context.contextPath}/js/jquery-treetable/stylesheets/jquery.treetable.theme.default.css">
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
        <@pageHeading title_1="资源管理" title_2="首页" title_3="系统设置" title_4="资源管理"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                           资源列表
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>类型</th>
                                            <th>URL路径</th>
                                            <th>权限字符串</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list resourceList as resource>
                                            <tr data-tt-id='${resource.id}' <#if resource.rootNode == false >data-tt-parent-id='${resource.parentId}'</#if> >
                                                <td class="numeric">${resource.name}</td>
                                                <td class="numeric">${resource.type.info}</td>
                                                <td class="numeric">${resource.url}</td>
                                                <td class="numeric">${resource.permission}</td>
                                                <td class="numeric">
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/resource/${resource.id}/appendChild">添加子节点</a></li>
                                                            <li><a href="${context.contextPath}/resource/${resource.id}/update">修改</a></li>
                                                            <li class="divider"></li>
                                                            <li><a class="deleteBtn" href="#" data-id="${resource.id}">删除</a></li>
                                                        </ul>
                                                    </div>

                                                    <#--<shiro:hasPermission name="resource:create">
                                                        <#if resource.type != 'button'>
                                                            <a href="${context.contextPath}/resource/${resource.id}/appendChild">添加子节点</a>
                                                        </#if>
                                                    </shiro:hasPermission>

                                                    <shiro:hasPermission name="resource:update">
                                                        <a href="${context.contextPath}/resource/${resource.id}/update">修改</a>
                                                    </shiro:hasPermission>

                                                    <#if resource.rootNode == false>
                                                        <shiro:hasPermission name="resource:delete">
                                                            <a class="deleteBtn" href="#" data-id="${resource.id}">删除</a>
                                                        </shiro:hasPermission>
                                                    </#if>-->
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
            2017 &copy; transfar by hup
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--treetable-->
<script src="${context.contextPath}/js/jquery-treetable/javascripts/src/jquery.treetable.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>
<script>
    $(function() {
        $(".table").treetable({ expandable: true }).treetable("expandNode", 1);
        $(".deleteBtn").click(function() {
            if(confirm("确认删除吗?")) {
                location.href = "${context.contextPath}/resource/"+$(this).data("id")+"/delete";
            }
        });
    });
</script>
</body>
</html>
