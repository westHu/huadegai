<#include "common/public.ftl">
<@header title="更新用户" css_war = "stepy,treeview,icheck"></@header>
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
    <@pageHeading title_1="更新用户" title_3="系统设置" title_4="用户管理" title_4_url="${context.contextPath}/user"></@pageHeading>
        <!-- page heading end-->
        <hr/>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="fw-title">更新用户</h4>
                    <div class="box-widget">
                        <div class="widget-head clearfix">
                            <div id="top_tabby" class="block-tabby pull-left">
                            </div>
                        </div>
                        <div class="widget-container">
                            <div class="widget-block">
                                <div class="widget-content box-padding">
                                    <form id="stepy_form_1" class=" form-horizontal left-align form-well" action="${context.contextPath}/user/update" method="post">
                                        <fieldset title="登录信息">
                                            <legend style="padding-left: 80px;">登录信息</legend>
                                            <!--登录名-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">登录名</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input type="hidden" name="id" value="${user.id}"/>
                                                    <input type="hidden" name="username" value="${user.username}"/>
                                                    <p class="form-control-static">${user.username}</p>
                                                </div>
                                            </div>

                                        <#--邮箱-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">邮箱</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="email" type="email" value="${user.email}"/>
                                                </div>
                                            </div>

                                        <#--手机号码-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">手机号码</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="mobile" data-mask="199-9999-9999" value="${user.mobile}" />
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset title="联系信息">
                                            <legend style="padding-left: 80px;">联系信息</legend>

                                        <#--真实名称-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">昵称</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input  class="form-control" name="realName" value="${user.realName}"/>
                                                </div>
                                            </div>

                                        <#--身份证-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">身份证</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" name="identityCardNo" data-mask="999999 99999999 9999" value="330825199903213972"/>
                                                </div>
                                            </div>

                                        <#--联系地址-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">联系地址</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <textarea class="form-control" name="address" rows="5" cols="60" >${user.address}</textarea>
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
                                            <legend style="padding-left: 80px;">组织权限信息</legend>
                                        <#--所属组织-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">所属组织</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input id="organization"  class="form-control" value="${user.organizationName}" onclick="$('#treeView-panel').show()" autocomplete="off">
                                                    <input id="organizationId" name="organizationId" style="display: none;" value="${user.organizationId}">
                                                    <div id="treeView-panel" class="panel" style="display: none;">
                                                        <div class="panel-heading">
                                                            组织机构图
                                                            <span class="tools pull-right">
                                                                <button class="btn btn-primary" type="button" onclick="$('#treeView-panel').hide()">取&nbsp消</button>
                                                            </span>
                                                        </div>
                                                        <div id="treeView" class="panel-body"></div>
                                                    </div>
                                                </div>
                                            </div>

                                        <#--角色列表-->
                                            <div class="form-group">
                                                <label class="col-md-2 col-sm-2 control-label">角色列表</label>
                                                <div class="col-lg-4 icheck ">
                                                <#list roleList as role>
                                                    <div class="square-red">
                                                        <div class="checkbox ">
                                                            <input tabindex="3" type="checkbox" name="roleIdsStr" value="${role.id}"  <#if user.roleIds?seq_contains(role.id)>checked</#if>>
                                                            <label>${role.description}</label>
                                                        </div>
                                                    </div>
                                                </#list>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <button class="finish btn btn-info btn-extend"> 确认更新!</button>
                                        <div class="stepy-error-1"></div>
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
<@js_lib js_war="validate_stepy,treeview,input_mask,icheck"></@js_lib>
<script>
    /*=====STEPY WIZARD WITH VALIDATION====*/
    $(function() {
        $('#stepy_form_1').validate({
            errorPlacement: function(error, element) {
                $('#stepy_form_1 div.stepy-error-1').append(error);
            },
            rules: {
                'username': 'required',
                'email': 'required',
                'mobile': 'required',
                'organizationId':'required',
                'roleIdsStr':'required'
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
                },
                'organizationId': {
                    required: '组织机构是必填的!'
                },
                'roleIdsStr': {
                    required: '角色是必填的!'
                }
            }
        });
    });

    $("#organization").click(function() {
        var options = {
            bootstrap : true,
            showTags : true,
            levels : 5,
            //showCheckbox : true,
            color: "black",
            backColor: "#a7a7a7",
            showBorder: true,
            showTags: true,
            highlightSelected: true,
            selectedColor: "yellow",
            selectedBackColor: "dark",
            multiSelect:true,
            checkedIcon : "glyphicon glyphicon-check",
            data : ${organizationTree},
            onNodeSelected : function(event, data) {
                $("#organization").val(data.text);
                $("#organizationId").val(data.id);
                $("#treeView-panel").hide();
            }
        };

        $('#treeView').treeview(options);
    });

</script>

</body>
</html>
