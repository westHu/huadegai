<#include "common/public.ftl">
<@header title="巡检任务" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css,jquery_confirm">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="巡检任务"  title_3="巡检管理" title_4="巡检任务" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增巡检任务</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="#">新增巡检任务</a></li> <#--${context.contextPath}/patrol/taskCreate-->
                                    <li><a href="#">导入巡检任务</a></li>
                                    <li><a href="#">导出巡检任务</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>巡检任务</th>
                                            <th>描述</th>
                                            <th>创建人</th>
                                            <th>允许时间</th>
                                            <th>预计耗时</th>
                                            <th>实际时间</th>
                                            <th>巡检人员</th>
                                            <th>状态</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list pager.getList() as obj>
                                            <tr>
                                                <td>${obj.taskName}</td>
                                                <td>${obj.taskDesc}</td>
                                                <td>${obj.taskCreater}</td>
                                                <td>[${obj.taskBeginTime?string("yyyy-MM-dd HH:mm:ss")}] ~ [${obj.taskEndTime?string("yyyy-MM-dd HH:mm:ss")}]</td>
                                                <td>${obj.estimatedTime} 分钟</td>
                                                <td>[${obj.practiceBeginTime?string(" HH:mm")}] ~ [${obj.practiceEndTime?string("HH:mm")}]</td>
                                                <td>${obj.agent}</td>
                                                <td>${obj.status}</td>
                                                <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="#" >编辑巡检任务</a></li>
                                                            <li><a href="javascript:delete_patrol_task(${obj.id})" >删除巡检任务</a></li>
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

    function delete_patrol_task(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该巡检任务吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/taskDelete";
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
                                    location.href= "${context.contextPath}/patrol/taskList?msg="+data.description;
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
            var pageUrl =  "${context.contextPath}/patrol/taskList?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
