<#include "common/public.ftl">
<@header title="新增角色" css_war="icheck"></@header>
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
        <@pageHeading title_1="${op}资源"  title_3="系统设置" title_4="资源管理" title_4_url="${context.contextPath}/resource"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading">
                        资源管理
                    </header>
                    <div class="panel-body">
                        <form id="resourceEditForm" class="form-horizontal"
                              <#if op == "新增子节点">action="${context.contextPath}/resource/${parent.id}/appendChild"</#if>
                              <#if op == "修改">action="${context.contextPath}/resource/${resource.id}/update"</#if>
                               method="post">
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">父节点</label>
                                <div class="col-lg-10">
                                    <p class="form-control-static">
                                        <#if op == '新增子节点'> <#if parent??>${parent.name}<#else>没有父节点</#if> </#if>
                                        <#if op == '修改'>${resource.parentName}</#if>
                                    </p>
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
                                            <input tabindex="3" type="radio"  name="type" value="menu" <#if resource.type?? &&  resource.type== "menu">checked</#if> >
                                            <label>菜单 </label>
                                        </div>
                                    </div>
                                    <div class="square-red">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio"  name="type" value="button" <#if resource.type?? &&  resource.type== "button">checked</#if>>
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
<@js_lib js_war="icheck"></@js_lib>
</body>
</html>
