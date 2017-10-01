<#include "common/public.ftl">
<@header title="新增角色" css_war="multi-select"></@header>
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
        <@pageHeading title_1="${op}角色"  title_3="系统设置" title_4="角色管理" title_4_url="${context.contextPath}/role"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading">
                        ${op}角色
                    </header>
                    <div class="panel-body">
                        <form id="roleEditForm" class="form-horizontal" action="${context.contextPath}/role/create" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">角色名称</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" name="role">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">角色描述</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" name="description">

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">资源列表</label>
                                <div class="col-md-9">
                                    <select multiple="multiple" class="multi-select" id="my_multi_select2"
                                            name="resourceNames">
                                        <#list resourceTreeList as two >
                                            <optgroup label="${two.name}">
                                                <#list two.sonResourceList as son >
                                                    <option>${son}</option>
                                                </#list>
                                            </optgroup>
                                        </#list>

                                    </select>
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
<@js_lib js_war="multi-select"></@js_lib>
<script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<!--multi-select-->
<script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script src="${context.contextPath}/js/multi-select-init.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

</body>
</html>
