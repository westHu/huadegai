<#include "common/public.ftl">
<@header title="巡检计划" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css,jquery_confirm">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="巡检计划"  title_3="巡检管理" title_4="巡检计划" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增巡检计划</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/patrol/planCreate">新增巡检计划</a></li>
                                    <li><a href="#">导入巡检计划</a></li>
                                    <li><a href="#">导出巡检计划</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>巡检计划</th>
                                            <th>描述</th>
                                            <th>创建人</th>
                                            <th>开始时间</th>
                                            <th>结束时间</th>
                                            <th>时间间隔</th>
                                            <th>状态</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list pager.getList() as obj>
                                            <tr>
                                                <td>${obj.planName}</td>
                                                <td>${obj.planDesc}</td>
                                                <td>${obj.planCreater}</td>
                                                <td>${obj.planBegin?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>${obj.planEnd?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>${obj.planPerHour} 小时</td>
                                                <td><#if obj.status == true>启用<#else>停用</#if></td>
                                                <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="#" >编辑巡检计划</a></li>
                                                            <li><a href="javascript:delete_patrol_plan(${obj.id})" >删除巡检计划</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="javascript:execute_plan(${obj.id})" >开启执行</a></li>
                                                            <li><a href="javascript:close_plan(${obj.id})" >关闭执行</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                                <@hup_pagination  showBegin = "${ (pager.currentPage-1) * pager.pageSize + 1 }"  showEnd = "${pager.currentPage * pager.pageSize}"></@hup_pagination>
                            </section>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer>
            2017 &copy; tansfar by hup
        </footer>
    </div>
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,paging-hup,jquery_confirm"></@js_lib>
<script>
    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        console.info("tip = " + tip)
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    });

    function delete_patrol_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/planDelete";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        console.info("postData= " + postData);
                        $.ajax({
                            url: url,
                            type: 'delete',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
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


    function execute_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '启动提示！',
            content: '确定要启动该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/executePlan";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        $.ajax({
                            url: url,
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
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


    function close_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '关闭提示！',
            content: '确定要关闭该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/closePlan";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        $.ajax({
                            url: url,
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
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
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image:  '${absolutePath}/images/notice.jpg',
            sticky: false,
            time: 3000,
            speed:5000,
            position: 'bottom-right',
            class_name: 'gritter-light'
        });
    }

</script>

<script>
    //分页
    $("#page").paging({
        pageNo: ${pager.currentPage},
        totalPage: ${pager.pageCount},
        totalSize: ${pager.totalCount},
        callback: function(num) {
            var pageSize = $('#pageSize option:selected').val();
            var pageUrl =  "${context.contextPath}/patrol/planList?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
