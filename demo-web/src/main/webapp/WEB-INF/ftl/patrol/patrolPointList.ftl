<#include "common/public.ftl">
<@header title="巡检点" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css,jquery_confirm">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="巡检点"  title_3="巡检管理" title_4="巡检点" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增巡检点</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="javascript:$('#add-point-panel').show()">新增巡检点</a></li>
                                    <li><a href="#">导入巡检点</a></li>
                                    <li><a href="#">导出巡检点</a></li>
                                </ul>
                            </div>
                            <section id="add-point-panel" class="panel" style="display: none;">
                                <div class="panel-body">
                                    <form class="form-horizontal adminex-form" action="${context.contextPath}/patrol/pointCreate" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">巡检点名称：</label>
                                            <div class="col-lg-2">
                                                <div>
                                                    <input type="text" class="form-control" id="pointName" name="pointName"  placeholder="巡检点名称" required autocomplete="off">
                                                </div>
                                            </div>
                                            <label class="col-sm-1 control-label">巡检点描述：</label>
                                            <div class="col-lg-2">
                                                <div>
                                                    <input type="text" class="form-control" id="pointDesc" name="pointDesc"  placeholder="巡检点描述" required autocomplete="off">
                                                </div>
                                            </div>

                                            <label class="col-sm-1 control-label">巡检点坐标：</label>
                                            <div class="col-sm-1">
                                                <div>
                                                    <input type="text" class="form-control" id="coordinateX" name="coordinateX" placeholder="X坐标" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div>
                                                    <input type="text" class="form-control" id="coordinateY" name="coordinateY" placeholder="Y坐标" required>
                                                </div>
                                            </div>
                                            <button class="btn btn-default" type="submit">新增</button>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>巡检点</th>
                                            <th>描述</th>
                                            <th>负责人</th>
                                            <th>坐标</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list pager.getList() as obj>
                                            <tr>
                                                <td>${obj.pointName}</td>
                                                <td>${obj.pointDesc}</td>
                                                <td>${obj.pointDesc}</td>
                                                <td>[X: ${obj.coordinateX}; Y: ${obj.coordinateY}]</td>
                                                <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td><button type="button" class="btn btn-default btn-sm" onclick="delete_point(${obj.id})">删除巡检点</button></td>
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


    function delete_point(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该巡检点吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/pointDelete";
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
                                    location.reload();
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
            var pageUrl =  "${context.contextPath}/patrol/pointList?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
