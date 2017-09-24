<#include "common/public.ftl">
<@header title="新增用户" keywords="新增用户" description="新增用户">
<#--treeview-->
<link href="${context.contextPath}/js/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
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
        <@pageHeading title_1="组织管理" title_2="首页" title_3="系统设置" title_4="组织管理"></@pageHeading>
        <!-- page heading end-->
        <hr/>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-right" id="nestable_list_menu">
                        <button type="button" class="btn btn-success" data-action="expand-all">Expand All</button>
                        <button type="button" class="btn btn-warning" data-action="collapse-all">Collapse All</button>
                    </div>
                </div>
            </div>

            <br>
            <div class="row">
                <div class="col-lg-6">
                    <section class="panel">
                        <header class="panel-heading">
                           组织机构树
                        </header>
                        <div class="panel-body">
                            <div id="organizationTree"></div>
                        </div>
                    </section>

                </div>
                <div class="col-lg-6">
                    <section class="panel">
                        <header class="panel-heading">
                           展示面板
                        </header>
                        <div class="panel-body">
                            <form id="organizationForm" class="form-horizontal" action="${context.contextPath}/role/create" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">组织名称</label>
                                    <div class="col-lg-4">
                                        <input type="hidden" class="form-control" id="organizationId">
                                        <input type="text" class="form-control" id="organizationName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">组织描述</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" id="organizationDesc">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">子节点</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" id="sonLeaf">

                                    </div>
                                </div>

                                <span class="tools pull-right">
                                    <button class="btn btn-info" type="button" disabled>新增子节点</button>
                                    <button class="btn btn-info" type="button">&nbsp修&nbsp改&nbsp</button>
                                    <button class="btn btn-info" type="button">&nbsp删&nbsp除&nbsp</button>
                                </span>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer class="sticky-footer">
            2014 &copy; transfar by hup
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

<#--treeview-->
<script src="${context.contextPath}/js/bootstrap-treeview/js/bootstrap-treeview.min.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<script>

    $(function(){

        var options = {
            bootstrap : true,
            showTags : true,
            levels : 5,
            showCheckbox : true,
            color: "black",
            backColor: "#EFF0F4",
            showBorder: true,
            showTags: true,
            highlightSelected: true,
            selectedColor: "#000000",
            selectedBackColor: "#03a806",
            checkedIcon : "glyphicon glyphicon-check",
            data : orgData,
            onNodeSelected : function(event, data) {
                showTab(data.id,data.text,data.text);
            }
        };
        $('#organizationTree').treeview(options);
    });

    function showTab(id, name, desc) {
        $('#organizationId').val(id);
        $('#organizationName').val(name);
        $('#organizationDesc').val(desc);
    }

    var orgData = [
        {
            id:1,
            text: '集团本部',
            href: '#parent1',
            tags: ['4'],
            nodes: [
                {
                    id:2,
                    text: '支付公司',
                    href: '#child1',
                    tags: ['2'],
                    nodes: [
                        {
                            id:3,
                            text: '技术研发部',
                            href: '#grandchild1',
                            obj:'[{"name":13},{"desc":14}]',
                            tags: ['0']
                        },
                        {
                            id:4,
                            text: '市场销售部',
                            href: '#grandchild2',
                            tags: ['0']
                        }
                    ]
                },
                {
                    id:5,
                    text: '物流公司',
                    href: '#child2',
                    tags: ['0']
                }
            ]
        },
        {
            id:6,
            text: '集团党委',
            href: '#parent2',
            tags: ['0']
        }
    ];


</script>
</body>
</html>
