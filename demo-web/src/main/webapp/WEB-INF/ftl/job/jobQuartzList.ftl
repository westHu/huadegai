<#include "common/public.ftl">
<@header title="定时任务管理" css_war = "responsive_table,gritter_css,jquery_confirm,paging-hup_css"></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="任务列表" title_3="系统设置" title_4="任务管理" title_4_url="${context.contextPath}/quartz/list" ></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增定时任务</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/quartz/create">新增定时任务</a></li>
                                    <li><a href="#">导出列表</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">保存PDF</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>任务名</th>
                                            <th>任务组</th>
                                            <th>触发器名</th>
                                            <th>触发器组</th>
                                            <th>时间设置</th>
                                            <th>创建者</th>
                                            <th>任务类型</th>
                                            <th>任务状态</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list pager.getList() as obj>
                                            <tr>
                                                <td>${obj.jobName}</td>
                                                <td>${obj.jobGroupName}</td>
                                                <td>${obj.triggerName}</td>
                                                <td>${obj.triggerGroupName}</td>
                                                <td>${obj.time}</td>
                                                <td>${obj.jobCreater}</td>
                                                <td>${obj.jobType}</td>
                                                <td>${obj.status}</td>
                                                <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="javascript:startJob(${obj.id}, '${obj.status}')" <#if obj.status == '运行中'> class="line-through"</#if>>
                                                                    &nbsp&nbsp启动任务&nbsp&nbsp
                                                                </a>
                                                            </li>
                                                            <li><a href="javascript:stopJob(${obj.id},'${obj.status}')" <#if obj.status == '停止中'> class="line-through"</#if>>
                                                                    &nbsp&nbsp暂停任务&nbsp&nbsp
                                                                </a>
                                                            </li>
                                                            <li class="divider"></li>
                                                            <li><a href="javascript:deleteJob(${obj.id})">&nbsp&nbsp删除任务&nbsp&nbsp</a></li>
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
<@js_lib js_war="gritter_script,jquery_confirm,paging-hup"></@js_lib>
<script>
    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        console.info("tip = " + tip)
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    });

    //分页
    $("#page").paging({
        pageNo: ${pager.currentPage},
        totalPage: ${pager.pageCount},
        totalSize: ${pager.totalCount},
        callback: function(num) {
            var pageSize = $('#pageSize option:selected').val();
            var pageUrl =  "${context.contextPath}/user/list?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    });

    function startJob(id, status) {
        console.info("id = " + id);
        console.info("status = " + status);
        if (id == undefined || id == '' || status == undefined || status == '') return;
        if (status == '运行中'){
            TipsNotice(null, "任务运行中，不能启动！");
            return;
        }
        $.confirm({
            icon: 'fa fa-warning',
            title: '启动提示！',
            content: '确定要启动该定时任务吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/quartz/"+id+"/start",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/quartz/list?msg=" + data.description;
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



    function stopJob(id, status) {
        console.info("id = " + id);
        console.info("status = " + status);
        if (id == undefined || id == '' || status == undefined || status == '') return;
        if (status == '停止中'){
            TipsNotice(null, "任务停止中，不能暂停！");
            return;
        }
        $.confirm({
            icon: 'fa fa-warning',
            title: '密码提示！',
            content: '确定要停止该任务吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/quartz/"+id+"/stop",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/user/list?msg=停止任务成功";
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

    function deleteJob(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '密码提示！',
            content: '确定要删除该任务吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/user/"+id+"/resetPassword",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/user/list?msg=删除任务成功";
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


    // 提示方法
    function TipsNotice(title, text) {
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
