<#include "common/public.ftl">
<@header title="设备采购" css_war="responsive_table,gritter_css,pickers_css,jquery_confirm,paging-hup_css">
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
                                    <li><a href="#">导入采购单</a></li>
                                    <li><a href="#">导出采购单</a></li>
                                    <li><a href="#">打印采购单</a></li>
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
                                        <#list pager.getList() as obj>
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
                                                            <li><a href="${context.contextPath}/device/purchase/${obj.id}/update?currentPage=${pager.currentPage}&pageSize=${pager.pageSize}" >编辑采购单</a></li>
                                                            <li><a href="javascript:delete_device_purchase(${obj.id})" >删除采购单</a></li>
                                                            <li class="divider"></li>
                                                            <li>
                                                                <#if obj.purchaseStatus?? && obj.purchaseStatus == '创建完成' && canAuditors?contains(obj.purchaseAgent)>
                                                                    <a href="${context.contextPath}/device/purchase/${obj.purchaseCode}/audit?name=devicePurchase&step=1&code=${obj.purchaseCode}&members=${obj.purchaseAuditors}&auditOpinion=AGREE">提交审核</a>
                                                                </#if>
                                                            </li>
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
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,jquery_confirm,paging-hup">
<script src="${context.contextPath}/js/encrypt/base64.js"></script>
</@js_lib>
<script>
    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        console.info("tip = " + tip)
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    });

    function delete_device_purchase(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该采购单吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        $.ajax({
                            url: "/device/purchase/"+id+"/delete",
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href = "${context.contextPath}/device/purchase/list?msg=" + (new Base64()).encode("设备采购单删除成功");
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
            var pageUrl =  "${context.contextPath}/device/purchase/list?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
