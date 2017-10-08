<#include "common/public.ftl">
<@header title="短信模板" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
<style>

    label {
        display: inline-block;
        margin-bottom: 5px;
        margin-left: 15px;
        margin-top: 5px;
        font-weight: 1000;
    }

    .row {
        margin-bottom: 5px;
    }

</style>
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="短信模板"  title_3="消息管理" title_4="短信管理" title_4_url="${context.contextPath}/smsMessage"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增模板</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="#">新增模板</a></li>
                                    <li><a href="#">导入模板</a></li>
                                    <li><a href="#">导出模板</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">打印列表</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>模板编码</th>
                                            <th>模板内容</th>
                                            <th>状态</th>
                                            <th>创建日期</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list page.getList() as obj>
                                            <tr>
                                                <td>${obj.id}</td>
                                                <td>${obj.code}</td>
                                                <td>${obj.content}</td>
                                                <td>${obj.status}</td>
                                                <td>${obj.createDate?string("yyyy-MM-dd")}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="#" >编辑模板</a></li>
                                                            <li><a href="#deleteSmsTemplate" data-toggle="modal" onclick="delete_smsTemplate(${obj.id},this)" >删除模板</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                        <!-- 删除采购单 Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="deleteSmsTemplate" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认删除</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="deleteId" type="hidden"/>
                                                        你确定要删除该采购单吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmDeleteSmsTemplate()"> 确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->
                                    </tbody>
                                </table>

                                <@hup_pagination  showBegin = "${ (page.currentPage-1) * page.pageSize + 1 }"  showEnd = "${page.currentPage * page.pageSize}"></@hup_pagination>
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
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,paging-hup"></@js_lib>
<script>
    //删除的标签
    var parentTR, parentTBODY;
    function delete_smsTemplate(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }

    function confirmDeleteSmsTemplate() {
        var id = $('#deleteId').val().trim();
        var url =  "/smsMessage/smsTemplate/"+id+"/delete";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                TipsNotice(null, data.description);
                if (data.status == "0") {
                    parentTBODY.removeChild(parentTR);
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
        pageNo: ${page.currentPage},
        totalPage: ${page.pageCount},
        totalSize: ${page.totalCount},
        callback: function(num) {
            //alert(num)
            var pageSize = $('#pageSize option:selected').val();
            console.info(pageSize);
            var pageUrl =  "${context.contextPath}/smsMessage/smsTemplateList?currentPage="+num+"&pageSize="+pageSize;
            console.info(pageUrl)
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
