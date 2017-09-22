<#include "common/public.ftl">
<@header title="新增用户" keywords="新增用户" description="新增用户">
<!--responsive table-->
<link href="${context.contextPath}/css/jquery.stepy.css" rel="stylesheet">
<!--file upload-->
<link rel="stylesheet" type="text/css" href="${context.contextPath}/css/bootstrap-fileupload.min.css" />
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
        <@pageHeading title_1="用户管理" title_2="首页" title_3="系统设置" title_4="新增用户"></@pageHeading>
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
                                                    <input type="text" class="form-control" name="username" placeholder="LoginName" value="${user.username}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">邮箱</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="email" type="email" placeholder="Email" value="${user.email}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">手机号码</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="mobile" name="mobile" class="form-control" value="${user.mobile}"/>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="联系信息">
                                            <legend>Personal Information...</legend>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">真实名称</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="real Name" name="realName" class="form-control" value="${user.realName}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">身份证</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" placeholder="Identity Card No" name="identityCardNo" class="form-control" value="identityCardNo"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">联系地址</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <textarea name="address" rows="5" cols="60" class="form-control">${user.address}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">头像</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" />
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                           <span class="btn btn-default btn-file">
                                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> 选择图片</span>
                                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> 更换</span>
                                                                <input type="file" class="default" />
                                                           </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> 移除</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="组织权限信息">
                                            <legend>Permission Information...</legend>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">所属组织</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="text" id="organization"  class="form-control" value="${user.organizationName}" onclick="$('#treeView').show()" autocomplete="off">
                                                    <input type="text" id="organizationId" name="organizationId" style="display: none;">
                                                    <div id="treeView" style="display: none;"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">角色列表</label>
                                            <#list roleList as role>
                                                <div class="col-md-6 col-sm-6">
                                                    <label class="checkbox"><input type="checkbox" name="roleIdsStr" value="${role.id}" <#if user.roleIds?seq_contains(role.id)> checked </#if> >${role.description}</label>
                                                </div>
                                            </#list>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">协议</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <label class="radio">
                                                        <input type="radio" name="optionsRadios" value="option1" checked>
                                                        我已阅读并同意《设计本网服务协议》 </label>
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
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer class="sticky-footer">
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
<script src="${context.contextPath}/js/jquery.validate.min.js"></script>
<script src="${context.contextPath}/js/jquery.stepy.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<#--treeview-->
<script src="${context.contextPath}/js/bootstrap-treeview/js/bootstrap-treeview.min.js"></script>
<link href="${context.contextPath}/js/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
<!--file upload-->
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-fileupload.min.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<script>
    /*=====STEPY WIZARD WITH VALIDATION====*/
    $(function() {
        $('#stepy_form').stepy({
            backLabel: 'Back',
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
                'email': 'required',
                'mobile': 'required'
            },
            messages: {
                'username': {
                    required: '登录名是必填的!'
                },
                'email': {
                    required: '邮箱是必填的!'
                },
                'mobile': {
                    required: '手机是必填的!'
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
