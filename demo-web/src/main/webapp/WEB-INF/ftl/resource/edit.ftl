<#include "common/public.ftl">
<@header title="新增角色" keywords="新增角色" description="新增角色">



<!--icheck-->
<link href="${context.contextPath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/minimal/red.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/minimal/green.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/minimal/yellow.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/minimal/purple.css" rel="stylesheet">

<link href="${context.contextPath}/js/iCheck/skins/square/square.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/square/red.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/square/green.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/square/blue.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/square/yellow.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/square/purple.css" rel="stylesheet">

<link href="${context.contextPath}/js/iCheck/skins/flat/grey.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/flat/red.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/flat/blue.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
<link href="${context.contextPath}/js/iCheck/skins/flat/purple.css" rel="stylesheet">

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
        <@pageHeading title_1="角色管理" title_2="首页" title_3="系统设置" title_4="新增角色"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading">
                        角色管理
                    </header>
                    <div class="panel-body">
                        <form id="roleEditForm" class="form-horizontal" action="${context.contextPath}/resource/${parent.id}/appendChild" method="post">
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">父节点</label>
                                <div class="col-lg-10">
                                    <p class="form-control-static"><#if parent ?? >${parent.name}<#else>没有父节点</#if></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">子名称</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" name="name" value="${resource.name}">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">资源类型</label>

                                <div class="col-lg-4 icheck ">

                                    <div class="square">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio"  name="type" value="${resource.type}" checked>
                                            <label>菜单 </label>
                                        </div>
                                    </div>
                                    <div class="square-red">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio"  name="type" value="${resource.type}">
                                            <label>按钮 </label>
                                        </div>
                                    </div>

                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">URL路径</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" name="url" value="${resource.url}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">权限字符串</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" name="permission" value="${resource.permission}">
                                </div>
                            </div>

                            <span class="tools pull-right">
                                <button class="btn btn-info" type="submit">&nbsp确&nbsp定&nbsp</button>
                            </span>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
        </section>
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

<!--icheck -->
<script src="${context.contextPath}/js/iCheck/jquery.icheck.js"></script>
<script src="${context.contextPath}/js/icheck-init.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

</body>
</html>
