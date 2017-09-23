<#include "common/public.ftl">
<@header title="新增用户" keywords="新增用户" description="新增用户">
    <link href="${context.contextPath}/css/jquery.stepy.css" rel="stylesheet">
</@header>

<body class="sticky-header">
<section>
    <!-- left side start-->
    <@left title="导航栏"></@left>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">
            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--search start-->
            <form class="searchform" action="index.index.ftl" method="post">
                <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
            </form>
            <!--search end-->

            <!--notification menu start -->
            <@notification title="通知"></@notification>
            <!--notification menu end -->
        </div>
        <!-- header section end-->

        <!-- page heading start-->
        <#--<div class="page-heading">
            <h3>
                用户组管理
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="#">用户组</a>
                </li>
                <li class="active">用户操作</li>
            </ul>
        </div>-->
        <!-- page heading end-->
        <hr/>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="fw-title">创建用户</h4>
                    <div class="box-widget">
                        <div class="widget-head clearfix">
                            <div id="top_tabby" class="block-tabby pull-left">
                            </div>
                        </div>
                        <div class="widget-container">
                            <div class="widget-block">
                                <div class="widget-content box-padding">
                                    <form id="stepy_form" class=" form-horizontal left-align form-well" action="${context.contextPath}/user/create" method="post">
                                        <fieldset title="登录信息">
                                            <legend>Login Information...</legend>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">登录名</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="username" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">邮箱</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="email" type="email"/>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="联系信息">
                                            <legend>Personal Information...</legend>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">真实名称</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="real Name" name="realName" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">联系方式</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="mobile" name="mobile" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">联系地址</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <textarea name="address" rows="5" cols="60" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="组织权限信息">
                                            <legend>Permission Information...</legend>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">所属组织</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" id="organization"   class="form-control" value="" onclick="$('#treeView').show()" autocomplete="off">
                                                    <input type="text" id="organizationId" name="organizationId" style="display: none;">
                                                    <div id="treeView" style="display: none;"></div>
                                                </div>


                                                <#--<label class="col-md-2 col-sm-2 control-label">所属组织</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="Text Input" class="form-control">
                                                </div>-->
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">角色列表</label>
                                                <#list roleList as role>
                                                    <div class="col-md-6 col-sm-6">
                                                        <label class="checkbox"><input type="checkbox" name="roleIdsStr" value="${role.id}">${role.description}</label>
                                                    </div>
                                                </#list>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">Radio</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <label class="radio">
                                                        <input type="radio" name="optionsRadios" value="option1" checked>
                                                        Option one is this and that—be sure to include why it's great </label>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <button type="submit" class="finish btn btn-info btn-extend"> Finish!</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            用户组列表
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <th>登录名</th>
                                        <th>密码</th>
                                        <th class="numeric">盐值</th>
                                        <th class="numeric">角色列表</th>
                                        <th class="numeric">所属公司</th>
                                        <th class="numeric">真实名称</th>
                                        <th class="numeric">联系方式</th>
                                        <th class="numeric">联系地址</th>
                                        <th class="numeric">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list userList as user>
                                    <tr>
                                        <td>${user.username}</td>
                                        <td>*******</td>
                                        <td class="numeric">********</td>
                                        <td class="numeric">${user.roleNames}</td>
                                        <td class="numeric">${user.organizationName}</td>
                                        <td class="numeric">...</td>
                                        <td class="numeric">...</td>
                                        <td class="numeric">...</td>
                                        <td class="numeric">
                                            <#--<a href="javascript:void(0)" class="pop pop_recharge" data-toggle='modal' data-target="#user-recharge" data-id="${user.id}">充值</a>-->
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                    操&nbsp作 <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li><a href="${context.contextPath}/user/${user.id}/update">编辑用户</a></li>
                                                    <li><a href="#">删除用户</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">重置密码</a></li>
                                                </ul>
                                            </div>
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
        <footer class="sticky-footer">
            2017 &copy; transfar by <a href="http://www.mycodes.net/" target="_blank">hup</a>
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${context.contextPath}/js/jquery.validate.min.js"></script>
<script src="${context.contextPath}/js/jquery.stepy.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<script src="${context.contextPath}/js/bootstrap-treeview/js/bootstrap-treeview.min.js"></script>
<link href="${context.contextPath}/js/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<script>
    /*=====STEPY WIZARD WITH VALIDATION====*/
    $(function() {
        $('#stepy_form').stepy({
            backLabel: 'Previous',
            nextLabel: 'Next',
            errorImage: true,
            block: true,
            description: true,
            legend: true,
            titleClick: true,
            titleTarget: '#top_tabby',
            validate: true
        });
        $('#stepy_form').validate({
            errorPlacement: function(error, element) {
                $('#stepy_form div.stepy-error').append(error);
            },
            rules: {
                'username': 'required',
                'email': 'required'
            },
            messages: {
                'username': {
                    required: 'Username field is required!'
                },
                'email': {
                    required: 'Email field is requerid!'
                }
            }
        });
    });



    /*var data1 = [];

    $(function() {
        $.ajax({
            type : "post",
            url : "/receiverShow/findTree.action",
            success : function(data, status) {
                if (status == "success") {
                    data1 = eval("[" + data + "]");
                }
            },
            error : function() {
                toastr.error('Error');
            },
        });
    });

    function buildDomTree() {
        var data = [];
        var root = "所有分类";
        function walk(nodes, data) {
            if (!nodes) {
                return;
            }
            $.each(nodes, function(id, node) {
                var obj = {
                    id : id,
                    text : node.name != null ? node.name : root
                    // 										tags : [ node.isLeaf == true ? node.
                    // 												+ ' child elements'
                    // 												: '' ]
                };
                if (node.isLeaf = true) {
                    obj.nodes = [];
                    walk(node.children, obj.nodes);
                }
                data.push(obj);
            });
        }

        walk(data1, data);
        return data;
    }*/

    $("#organization").click(function() {
        var options = {
            bootstrap : true,
            showTags : true,
            levels : 5,
            showCheckbox : true,
            color: "black",
            backColor: "#65CEA7",
            showBorder: true,
            showTags: true,
            highlightSelected: true,
            selectedColor: "yellow",
            selectedBackColor: "dark",
            //checkedIcon : "glyphicon glyphicon-check",
            data : defaultData,
            onNodeSelected : function(event, data) {
                $("#organization").val(data.text);
                $("#organizationId").val(data.id);
                $("#treeView").hide();
            }
        };

        $('#treeView').treeview(options);
    });




    var defaultData = [
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
