<#include "common/public.ftl">
<@header title="设备采购" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="设备采购"  title_3="设备管理" title_4="设备采购" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增采购</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/device/purchase/create">新增采购</a></li>
                                    <li><a href="#">导入设备</a></li>
                                    <li><a href="#">导出设备</a></li>
                                    <li><a href="#">打印列表</a></li>
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
                                            <th>采购单号</th>
                                            <th>采购单名称</th>
                                            <th>采购人员</th>
                                            <th>采购原因</th>
                                            <th>付款方式</th>
                                            <th>采购时间</th>
                                            <th>采购备注</th>
                                            <th>采购状态</th>
                                            <th>审核人员</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list page.getList() as obj>
                                            <tr>
                                                <td>${obj.purchaseCode}</td>
                                                <td>${obj.purchaseName}</td>
                                                <td>${obj.purchaseAgent}</td>
                                                <td>${obj.purchaseReason}</td>
                                                <td>${obj.purchasePaymentType}</td>
                                                <td>${obj.purchaseDate?string("yyyy-MM-dd")}</td>
                                                <td>${obj.purchaseRemark}</td>
                                                <td>${obj.purchaseStatus}</td>
                                                <td>${obj.purchaseAuditors}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/device/purchase/${obj.id}/view" >查看采购单</a></li>
                                                            <li><a href="${context.contextPath}/device/purchase/${obj.id}/update?currentPage=${page.currentPage}&pageSize=${page.pageSize}" >编辑采购单</a></li>
                                                            <li><a href="#deleteDevicePurchase" data-toggle="modal" onclick="delete_device_purchase(${obj.id},this)" >删除采购单</a></li>
                                                            <li class="divider"></li>
                                                            <li>
                                                                <#if obj.purchaseStatus?? && obj.purchaseStatus == '创建' && canAuditors?contains(obj.purchaseAgent)>
                                                                    <a href="${context.contextPath}/device/purchase/${obj.purchaseCode}/audit?name=devicePurchase&step=1&code=${obj.purchaseCode}&members=${obj.purchaseAuditors}&auditOpinion=AGREE">提交审核</a>
                                                                </#if>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                </td>
                                            </tr>
                                        </#list>
                                        <!-- 删除采购单 Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="deleteDevicePurchase" class="modal fade">
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
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmDeletePurchase()"> 确定</button>
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
    function delete_device_purchase(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }

    function confirmDeletePurchase() {
        var id = $('#deleteId').val().trim();
        var url =  "/device/purchase/"+id+"/delete";
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
            var pageUrl =  "${context.contextPath}/device/purchase?currentPage="+num+"&pageSize="+pageSize;
            console.info(pageUrl)
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
