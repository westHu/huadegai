<#include "common/public.ftl">
<@header title="查看设备采购单" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
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

    .my-form-control {
        display: block;
        width: 100%;
        height: 27px;
        /*padding: 6px 12px;*/
        font-size: 14px;
        line-height: 1.42857143;
        color: #000000;
        background-color: #c3c3c3;
        background-image: none;
        border: 1px solid #03a806;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }

    .my-textarea {
        height: 47px;
    }

    .col-md-1 {
        width: 10% !important;
    }
    td input{background-color:#CCFFFF;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}
</style>
</@header>
<body class="sticky-header">
<section>
<@left title="导航栏"></@left>
    <div class="main-content" >
    <@notification title="通知"></@notification>
    <@pageHeading title_1="查看设备采购单"  title_3="设备管理" title_4="设备采购列表" title_4_url="${context.contextPath}/device/purchase"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <form class="device-inbound-form" <#if op == '新增'> action="${context.contextPath}/device/purchase/create" <#elseif op == '更新'> action="${context.contextPath}/device/purchase/update"</#if> method="post">
                        <section class="panel">
                            <header class="panel-heading">
                                采购表格
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <label class="control-label"  style="float: left">采购单号：</label>
                                    <div class="col-md-1">
                                        <input type="hidden" class="my-form-control"  name="id"  id="id" value="${devicePurchase.id}">
                                        <input class="my-form-control" value="${devicePurchase.purchaseCode}" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">采购单名：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control"  value="${devicePurchase.purchaseName}" disabled>
                                    </div>

                                    <label class="control-label" style="float: left">采购人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control"  value="${devicePurchase.purchaseAgent}" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">付款方式：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" value="${devicePurchase.purchasePaymentType}" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">采购日期：</label>
                                    <div class="col-md-1">
                                            <input class="my-form-control" value="${devicePurchase.purchaseDate?string("yyyy-MM-dd")}" disabled>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label"  style="float: left">采购用途：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" value="${devicePurchase.purchaseReason}" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">审核人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control"  value="${devicePurchase.purchaseAuditors!'系统默认'}" disabled>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label" style="float: left">采购备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="my-form-control my-textarea" disabled>${devicePurchase.purchaseRemark}</textarea>
                                    </div>
                                </div>

                                <span class="tools pull-right">
                                    <button class="btn btn-primary" type="button">&nbsp 生成PDF &nbsp</button>
                                </span>
                            </div>
                        </section>

                        <section class="panel">
                            <header class="panel-heading">
                                采购设备清单
                            </header>
                            <div class="panel-body">
                                <section id="unseen">
                                    <table id="device-purchase-table" class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th>设备编号</th>
                                                <th>设备名称</th>
                                                <th>设备型号</th>
                                                <th>设备规格</th>
                                                <th>设备品牌</th>
                                                <th>采购单价</th>
                                                <th>采购数量</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-purchase-tbody">
                                            <#list devicePurchase.devicePurchaseDetailList as detail>
                                                <tr>
                                                    <td>${detail.deviceCode}</td>
                                                    <td>${detail.deviceName}</td>
                                                    <td>${detail.deviceModel}</td>
                                                    <td>${detail.deviceSpec}</td>
                                                    <td>${detail.deviceBrand}</td>
                                                    <td>${detail.purchaseUnitPrice}</td>
                                                    <td>${detail.purchaseNumber}</td>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </section>
                    </form>
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
</body>
</html>
