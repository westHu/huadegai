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
    <@pageHeading title_1="设备采购"  title_3="设备管理" title_4="设备采购" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <form class="device-inbound-form" <#if op == '新增'> action="${context.contextPath}/device/purchase/create" <#elseif op == '更新'> action="${context.contextPath}/device/purchase/update"</#if> method="post">
                        <section class="panel">
                            <header class="panel-heading">
                                展示面板${base}
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <label class="control-label"  style="float: left">采购单号：</label>
                                    <div class="col-md-1">
                                        <input type="hidden" class="my-form-control"  name="id"  id="id" value="${purchase.id}">
                                        <input class="my-form-control"
                                               <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${purchase.purchaseCode}"</#if>
                                               name="purchaseCode"  id="purchaseCode" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">采购单名：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseName" id="purchaseName" value="${purchase.purchaseName}">
                                    </div>

                                    <label class="control-label" style="float: left">采购人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseAgent" id="purchaseAgent" value="${purchase.purchaseAgent}">
                                    </div>

                                    <label class="control-label"  style="float: left">付款方式：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="paymentType" id="paymentType" value="${purchase.paymentType}">
                                    </div>

                                    <label class="control-label"  style="float: left">采购日期：</label>
                                    <div class="col-md-1">
                                        <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="12-02-2017"  class="input-append date dpYears">
                                            <input readonly=""value="<#if purchase.purchaseDate??>${purchase.purchaseDate?string("yyyy-MM-dd")}<#else>2017-11-11</#if>" size="16" class="form-control" name="purchaseDate" id="purchaseDate">
                                            <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label"  style="float: left">采购用途：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="purchaseFunction" id="purchaseFunction" value="${purchase.auditors}">
                                    </div>

                                    <label class="control-label"  style="float: left">审核人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="auditors" id="auditors" value="${purchase.auditors!' 系统默认'}">
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label" style="float: left">采购备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="my-form-control my-textarea" name="remark" id="remark">${purchase.remark}</textarea>
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
                                            <button class="btn btn-primary" type="submit">&nbsp更新设备&nbsp</button>
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
                                                <#--<th>采购单号</th>-->
                                                <th>设备编号</th>
                                                <th>设备名称</th>
                                                <th>采购单价</th>
                                                <th>采购数量</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-purchase-tbody">
                                            <tr data-id="1">
                                                <#--<td><input value="xxxxxxx"></td>-->
                                                <td><input value="AAC"></td>
                                                <td><input value="AUSTRALIAN AGRICULTURAL COMPANY LIMITED."></td>
                                                <td><input value="1.38"></td>
                                                <td><input value="12"></td>
                                                <td><a href='javascript：deleteDevice(this)'>删除</a></td>
                                            </tr>
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
            console.info("num == " + num);
            var tr ="<tr>\n" +
                    "<td><input name=\"devicePurchaseDetailList["+num+"].deviceCode\" value=\"设备编码\"></td>\n" +
                    "<td><input name=\"devicePurchaseDetailList["+num+"].deviceName\" value=\"设备名称\"></td>\n" +
                    "<td><input name=\"devicePurchaseDetailList["+num+"].purchaseUnitPrice\" value=\"0.00\"></td>\n" +
                    "<td><input name=\"devicePurchaseDetailList["+num+"].purchaseNumber\" value=\"0\"></td>\n" +
                    "<td><a href='javascript：deleteDevice(this)'>删除</a></td>\n" +
                    "</tr>";
            $("#device-purchase-tbody").append(tr);
        });

    });

    /*function delete(obj) {
        var tr = this.getRowObj(obj);
        if (tr != null) {
            tr.parentNode.removeChild(tr);
        }
    }
    //得到行对象
    function getRowObj(obj) {
        var i = 0;
        while (obj.tagName.toLowerCase() != "tr") {
            obj = obj.parentNode;
            if (obj.tagName.toLowerCase() == "table") return null;
        }
        return obj;
    }*/
    /*function dbl_c() {
        $("#retable tbody tr").find("td:gt(2)").dblclick(function() {
            var td = $(this);
            // 根据表格文本创建文本框 并加入表表中--文本框的样式自己调整
            var text = td.text();
            var txt = $("<input type='text' class='edit_text'>").val(text);
            txt.blur(function() {
                // 失去焦点，保存值。于服务器交互自己再写,最好ajax
                var newText = $(this).val();
                // 移除文本框,显示新值
                $(this).remove();
                td.text(newText);
            });
            td.text("");
            td.append(txt);
            txt.focus();
        });
    }*/
    function recalculateTd() {
        var trList = $("#device-purchase-table tbody tr");
        var num = 0;
        trList.each(function (i) {
            num = i;
            var tdList = $(this).children("td:lt(4)");
            tdList.each(function (j) {
                if (j == 0){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceCode")
                }
                if (j == 1){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceName")
                }
                if (j == 2){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].purchaseUnitPrice")
                }
                if (j == 3){
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
