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
                                                            <li><a href="#myModalResource" data-toggle="modal" onclick="delete_resource(${resource.id}, this)" >删除</a></li>
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
                                        <!-- 删除资源  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModalResource" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认删除</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="deleteId" type="hidden"/>
                                                        你确定要删除该资源吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmDeleteResource()"> 确定</button>
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

<!--gritter script-->
<script type="text/javascript" src="${context.contextPath}/js/gritter/js/jquery.gritter.js"></script>
<script src="${context.contextPath}/js/gritter/js/gritter-init.js" type="text/javascript"></script>

<!--treetable-->
<script src="${context.contextPath}/js/jquery-treetable/javascripts/src/jquery.treetable.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>
<script>
    $(function() {
        $(".table").treetable({ expandable: true }).treetable("expandNode", 1);
    });


    //删除的标签
    var parentTR, parentTBODY;

    function delete_resource(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }
    function confirmDeleteResource() {
        var id = $('#deleteId').val().trim();
        var url = "/resource/"+id+"/delete";
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
    function TipsNotice(title, text) {
        console.info("TipsNotice");
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
