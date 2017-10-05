<#include "common/public.ftl">
<@header title="设备采购" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
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
    <@pageHeading title_1="设备采购"  title_3="设备管理" title_4="采购列表" title_4_url="${context.contextPath}/device/purchase"></@pageHeading>
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
                                        <input class="my-form-control" name="purchaseCode"  id="purchaseCode" <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${devicePurchase.purchaseCode}"</#if> readonly>
                                    </div>

                                    <label class="control-label"  style="float: left">采购单名：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseName" id="purchaseName" value="${devicePurchase.purchaseName}">
                                    </div>

                                    <label class="control-label" style="float: left">采购人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseAgent" id="purchaseAgent" value="${devicePurchase.purchaseAgent}">
                                    </div>

                                    <label class="control-label"  style="float: left">付款方式：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" list="payList" name="purchasePaymentType" id="purchasePaymentType" value="${devicePurchase.purchasePaymentType}">
                                        <datalist id="payList">
                                            <option value="货到付款">货到付款</option>
                                            <option value="TT付款">TT付款</option>
                                            <option value="分期付款">分期付款</option>
                                        </datalist>

                                    </div>

                                    <label class="control-label"  style="float: left">采购日期：</label>
                                    <div class="col-md-1">
                                        <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="2017-12-02"  class="input-append date dpYears">
                                            <input readonly="" value="<#if devicePurchase.purchaseDate??>${devicePurchase.purchaseDate?string("yyyy-MM-dd")}<#else>2017-11-11</#if>" size="16" class="form-control" name="purchaseDate" id="purchaseDate">
                                            <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label"  style="float: left">采购用途：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseReason" id="purchaseReason" value="${devicePurchase.purchaseReason}">
                                    </div>

                                    <label class="control-label"  style="float: left">审核人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseAuditors" id="purchaseAuditors" value="${devicePurchase.purchaseAuditors!'系统默认'}">
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label" style="float: left">采购备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="my-form-control my-textarea" name="purchaseRemark" id="purchaseRemark">${devicePurchase.purchaseRemark}</textarea>
                                    </div>
                                </div>

                                <#if op == '新增'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="button">&nbsp批量导入&nbsp</button>
                                        <button class="btn btn-primary"               >&nbsp确认采购&nbsp</button>
                                        <button class="btn btn-primary" type="reset">&nbsp重&nbsp置&nbsp</button>
                                    </span>
                                <#elseif op == '更新'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="submit">&nbsp 确定更新 &nbsp</button>
                                    </span>
                                </#if>
                            </div>
                        </section>


                        <section class="panel">
                            <header class="panel-heading">
                                采购设备清单
                                <span class="tools pull-right">
                                    <#--<a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>-->
                                    <div class="btn-group">
                                        <button id="add-new" class="btn btn-primary" type="button">
                                            添加设备 <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </span>
                            </header>
                            <div class="panel-body">
                                <section id="unseen">
                                    <table id="device-purchase-table" class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th>设备名称</th>
                                                <th>设备类别</th>
                                                <th>设备型号</th>
                                                <th>设备规格</th>
                                                <th>设备品牌</th>
                                                <th>设备厂家</th>
                                                <th>采购单价</th>
                                                <th>采购数量</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-purchase-tbody">
                                            <#if devicePurchase.devicePurchaseDetailList??>
                                                <#list devicePurchase.devicePurchaseDetailList as detail>
                                                    <tr>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceName"  value="${detail.deviceName}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceCategory" value="${detail.deviceCategory}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceModel" value="${detail.deviceModel}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceSpec" value="${detail.deviceSpec}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceBrand" value="${detail.deviceBrand}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].deviceManufacturer" value="${detail.deviceManufacturer}"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].purchaseUnitPrice" value="${detail.purchaseUnitPrice}" type="number"></td>
                                                        <td><input name="devicePurchaseDetailList[${detail_index}].purchaseNumber" value="${detail.purchaseNumber}" type="number"></td>
                                                        <td onclick="deleteDevice(this)"><a>删除</a></td>
                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr>
                                                    <td><input name="devicePurchaseDetailList[0].deviceName" placeholder="设备名称"></td>
                                                    <td><input name="devicePurchaseDetailList[0].deviceCategory" placeholder="设备类别"></td>
                                                    <td><input name="devicePurchaseDetailList[0].deviceModel" placeholder="设备型号"></td>
                                                    <td><input name="devicePurchaseDetailList[0].deviceSpec" placeholder="设备规格"></td>
                                                    <td><input name="devicePurchaseDetailList[0].deviceBrand" placeholder="设备品牌"></td>
                                                    <td><input name="devicePurchaseDetailList[0].deviceManufacturer" placeholder="设备厂家"></td>
                                                    <td><input name="devicePurchaseDetailList[0].purchaseUnitPrice" placeholder="采购价格" type="number"></td>
                                                    <td><input name="devicePurchaseDetailList[0].purchaseNumber" placeholder="采购数量" type="number"></td>
                                                    <td>----</td>
                                                </tr>
                                            </#if>
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
<script>
    jQuery(document).ready(function() {
        $('#add-new').click(function (e) {
            var num = recalculateTd();
            var tr ="<tr>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceName' placeholder='设备名称'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceCategory' placeholder='设备类别'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceModel' placeholder='设备型号'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceSpec' placeholder='设备规格'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceBrand' placeholder='设备品牌'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceManufacturer' placeholder='设备厂家'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].purchaseUnitPrice' placeholder='采购价格' type='number'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].purchaseNumber' placeholder='采购数量' type='number'></td>\n" +
                        "<td onclick=\"deleteDevice(this)\"><a>删除</a></td>\n" +
                    "</tr>";
            $("#device-purchase-tbody").append(tr);
        });

    });
    //删除
    function deleteDevice(obj) {
        var tr = obj.parentNode;
        if (tr != null) {
            tr.parentNode.removeChild(tr);
        }
        //tr td input :name 重新排序
        recalculateTd();
    }

    function recalculateTd() {
        var trList = $("#device-purchase-table tbody tr");
        var num = 0;
        trList.each(function (i) {
            num = i;
            var tdList = $(this).children("td");
            tdList.each(function (j) {
                if (j == 0){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceName")
                }
                if (j == 1){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceCategory")
                }
                if (j == 2){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceModel")
                }
                if (j == 3){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceSpec")
                }
                if (j == 4){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceBrand")
                }
                if (j == 5){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceManufacturer")
                }
                if (j == 6){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].purchaseUnitPrice")
                }
                if (j == 7){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].purchaseNumber")
                }
            })
        });
        return num + 1;
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

</script>
</body>
</html>
