<#include "common/public.ftl">
<@header title="资源列表" css_war = "responsive_table,treetable,gritter_css,jquery_confirm"></@header>
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
        <@pageHeading title_1="资源列表"  title_3="系统设置" title_4="资源管理" title_4_url="${context.contextPath}/resource" ></@pageHeading>
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
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/resource/${resource.id}/appendChild">添加子节点</a></li>
                                                            <li><a href="${context.contextPath}/resource/${resource.id}/update">修改</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="javascript:delete_resource(${resource.id})"  >删除</a></li>
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
<@js_lib js_war="gritter_script,treetable,jquery_confirm">
<script src="${context.contextPath}/js/encrypt/base64.js"></script>
</@js_lib>
<script>
    $(function() {
        $(".table").treetable({ expandable: true }).treetable("expandNode", 1);

        //显示小提示
        var tip = '${msg}';
        console.info("tip = " + tip)
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    });

    function delete_resource(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该资源吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/resource/"+id+"/delete",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/resource/list?msg=" + (new Base64()).encode("资源删除成功");
                                }

                            }
                        });
                    }
                },
                cancel: {
                    text: "取消",
                    btnClass: 'btn-primary',
                    keys: ['esc'],
                    /*action:function () {
                        console.info("你点击了取消按钮！")
                    }*/
                }
            }
        });
    }



    function TipsNotice(title, text) {
        console.info("TipsNotice");
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image: '${absolutePath}/images/notice.jpg',
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
