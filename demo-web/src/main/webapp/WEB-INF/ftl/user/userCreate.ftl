<#include "common/public.ftl">
<@header title="新增用户" keywords="新增用户" description="新增用户">
<!--responsive table-->
<link href="${context.contextPath}/css/jquery.stepy.css" rel="stylesheet">
<!--treeview-->
<link href="${context.contextPath}/js/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
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

                                            <!--登录名-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">登录名</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input  class="form-control" name="username" placeholder="登录名,用于登录 " />
                                                </div>
                                            </div>

                                            <#--邮箱-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">邮箱</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="email" type="email" placeholder="邮箱"/>
                                                </div>
                                            </div>

                                            <#--手机号码-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">手机号码</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input  class="form-control" name="mobile" data-mask="199-9999-9999" placeholder="手机号码" />
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="联系信息">
                                            <legend>Personal Information...</legend>

                                            <#--真实名称-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">真实名称</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input  class="form-control" name="realName" placeholder="真实姓名，用于显示" />
                                                </div>
                                            </div>

                                            <#--身份证-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">身份证</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="identityCardNo" data-mask="999999 99999999 9999" placeholder="用于身份核实"  />
                                                </div>
                                            </div>

                                            <#--联系地址-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">联系地址</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <textarea class="form-control" name="address" rows="5" cols="60" ></textarea>
                                                </div>
                                            </div>

                                            <!--头像问题另外处理-->
                                            <!--<div class="form-group">
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
                                                                <input type="file" class="default" name="avatarPhoto"/>
                                                           </span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> 移除</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>-->
                                        </fieldset>
                                        <fieldset title="组织权限信息">
                                            <legend>Permission Information...</legend>

                                            <#--所属组织-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">所属组织</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input id="organization"  class="form-control" value="${user.organizationName}" onclick="$('#treeView').show()" autocomplete="off">
                                                    <input id="organizationId" name="organizationId" style="display: none;">
                                                    <div id="treeView" style="display: none;"></div>
                                                </div>
                                            </div>

                                            <#--角色列表-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">角色列表</label>
                                                <div class="col-lg-4 icheck ">
                                                    <#list roleList as role>
                                                        <div class="square-red">
                                                            <div class="checkbox ">
                                                                <input tabindex="3" type="checkbox" name="roleIdsStr" value="${role.id}" >
                                                                <label>${role.description}</label>
                                                            </div>
                                                        </div>
                                                    </#list>
                                                </div>
                                            </div>

                                            <#--协议-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">协议</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <label class="radio">
                                                        <input type="radio" name="optionsRadios" value="option1" checked>
                                                        我已阅读并同意《设计本网服务协议》 </label>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <button class="finish btn btn-info btn-extend"> Finish!</button>
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
<!--bootstrap input mask-->
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
<!--icheck -->
<script src="${context.contextPath}/js/iCheck/jquery.icheck.js"></script>
<script src="${context.contextPath}/js/icheck-init.js"></script>
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
            backColor: "#a7a7a7",
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
