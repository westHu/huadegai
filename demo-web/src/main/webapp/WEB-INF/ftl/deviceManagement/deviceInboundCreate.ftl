<#include "common/public.ftl">
<@header title="设备入库" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
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
    td input{background-color: #e7e7e7;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}
</style>
</@header>
<body class="sticky-header">
<section>
<@left title="导航栏"></@left>
    <div class="main-content" >
    <@notification title="通知"></@notification>
    <@pageHeading title_1="设备入库"  title_3="设备管理" title_4="入库列表" title_4_url="${context.contextPath}/device/inbound"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <form class="device-inbound-form" <#if op == '新增'> action="${context.contextPath}/device/inbound/create" <#elseif op == '更新'> action="${context.contextPath}/device/inbound/update"</#if> method="post">
                        <section class="panel">
                            <header class="panel-heading">
                                采购表格
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <label class="control-label"  style="float: left">入库单号：</label>
                                    <div class="col-md-1">
                                        <input type="hidden" class="my-form-control"  name="id"  id="id" value="${deviceInbound.id}">
                                        <input class="my-form-control" name="inboundCode"  id="inboundCode" <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${deviceInbound.inboundCode}"</#if> readonly>
                                    </div>

                                    <label class="control-label"  style="float: left">入库单名：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="inboundName" id="inboundName" value="${deviceInbound.inboundName}">
                                    </div>

                                    <label class="control-label" style="float: left">入库人员：</label>
                                    <div class="col-md-1">
                                        <input class="my-form-control" name="inboundAgent" id="inboundAgent" value="${deviceInbound.inboundAgent}">
                                    </div>



                                    <label class="control-label"  style="float: left">入库日期：</label>
                                    <div class="col-md-1">
                                        <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="2017-12-02"  class="input-append date dpYears">
                                            <input readonly="" value="<#if deviceInbound.inboundDate??>${deviceInbound.inboundDate?string("yyyy-MM-dd")}<#else>2017-11-11</#if>" size="16" class="form-control" name="inboundDate" id="inboundDate">
                                            <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <label class="control-label" style="float: left">入库备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="my-form-control my-textarea" name="inboundRemark" id="inboundRemark">${deviceInbound.inboundRemark}</textarea>
                                    </div>
                                </div>

                                <#if op == '新增'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="button">&nbsp批量导入&nbsp</button>
                                        <button class="btn btn-primary"               >&nbsp确认入库&nbsp</button>
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
                                    <table id="device-inbound-table" class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th>设备编号</th>
                                                <th>设备名称</th>
                                                <th>设备型号</th>
                                                <th>设备规格</th>
                                                <th>设备品牌</th>
                                                <th>入库数量</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-inbound-tbody">
                                            <#if deviceInbound.deviceInboundDetailList??>
                                                <#list deviceInbound.deviceInboundDetailList as detail>
                                                    <tr>
                                                        <td>
                                                            <#--<input name="deviceInboundDetailList[${detail_index}].deviceCode" value="${detail.deviceCode}">-->
                                                            <div class="input-group">
                                                                <input name="deviceInboundDetailList[${detail_index}].deviceCode" value="${detail.deviceCode}" class="form-control" placeholder="设备编号">
                                                                <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-default"><i class="fa fa-search" onclick='searchDevice()'></i></button>
                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td><input name="deviceInboundDetailList[${detail_index}].deviceName" value="${detail.deviceName}"></td>
                                                        <td><input name="deviceInboundDetailList[${detail_index}].deviceModel" value="${detail.deviceModel}"></td>
                                                        <td><input name="deviceInboundDetailList[${detail_index}].deviceSpec" value="${detail.deviceSpec}"></td>
                                                        <td><input name="deviceInboundDetailList[${detail_index}].deviceBrand" value="${detail.deviceBrand}"></td>
                                                        <td><input name="deviceInboundDetailList[${detail_index}].inboundNumber" value="${detail.inboundNumber}"></td>
                                                        <td onclick="deleteDevice(this)"><a>删除</a></td>
                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr>
                                                    <td>
                                                        <#--<input name="deviceInboundDetailList[0].deviceCode" value="设备编号">-->
                                                        <div class="input-group">
                                                            <input name="deviceInboundDetailList[0].deviceCode" class="form-control" placeholder="设备编号">
                                                            <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-default" onclick="searchDevice()">
                                                                        <i class="fa fa-search"></i>
                                                                    </button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td><input name="deviceInboundDetailList[0].deviceName" readonly></td>
                                                    <td><input name="deviceInboundDetailList[0].deviceModel" readonly></td>
                                                    <td><input name="deviceInboundDetailList[0].deviceSpec" readonly></td>
                                                    <td><input name="deviceInboundDetailList[0].deviceBrand" readonly></td>
                                                    <td><input name="deviceInboundDetailList[0].inboundNumber" placeholder="入库数量"></td>
                                                    <td onclick="deleteDevice(this)"><a>删除</a></td>
                                                </tr>
                                            </#if>
                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </section>
                    </form>

                    <section id="search-device-section" class="panel" style="display: none">
                        <header class="panel-heading">
                            选中设备进行安装...
                            <span class="tools pull-right">
                                    <#--<a href="javascript:;" class="fa fa-chevron-down"></a>
                                    <a href="javascript:;" class="fa fa-times"></a>-->
                                        <div class="btn-group">
                                        <button id="add-new-1" class="btn btn-primary" type="button" onclick="checkDevice()">
                                            确定安装
                                        </button>
                                    </div>
                                </span>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table id="device-inbound-table-1" class="table table-bordered table-striped table-condensed" style="width: 50%">
                                    <thead>
                                    <tr>
                                        <th>设备编号</th>
                                        <th>设备名称</th>
                                        <th>设备型号</th>
                                        <th>设备规格</th>
                                        <th>设备品牌</th>
                                    </tr>
                                    </thead>
                                    <tbody id="device-inbound-tbody-1">
                                    <tr>
                                        <td>AAC</td>
                                        <td>AUSTRAL.</td>
                                        <td class="numeric">$1.38</td>
                                        <td class="numeric">-0.01</td>
                                        <td class="numeric">-0.36%</td>
                                    </tr>
                                    <tr>
                                        <td>AAC</td>
                                        <td>AUSTRAL.</td>
                                        <td class="numeric">$1.38</td>
                                        <td class="numeric">-0.01</td>
                                        <td class="numeric">-0.36%</td>
                                    </tr>
                                    <tr>
                                        <td>AAC</td>
                                        <td>AUSTRAL.</td>
                                        <td class="numeric">$1.38</td>
                                        <td class="numeric">-0.01</td>
                                        <td class="numeric">-0.36%</td>
                                    </tr>
                                    <tr>
                                        <td>AAC</td>
                                        <td>AUSTRAL.</td>
                                        <td class="numeric">$1.38</td>
                                        <td class="numeric">-0.01</td>
                                        <td class="numeric">-0.36%</td>
                                    </tr>
                                    <tr>
                                        <td>AAC</td>
                                        <td>AUSTRAL.</td>
                                        <td class="numeric">$1.38</td>
                                        <td class="numeric">-0.01</td>
                                        <td class="numeric">-0.36%</td>
                                    </tr>

                                    </tbody>
                                </table>
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
    jQuery(document).ready(function() {
        $('#add-new').click(function (e) {
            var num = recalculateTd();
            console.info("num == " + num);
            var tr ="<tr>\n" +
                        "<td><div class=\"input-group\">\n" +
                            "<input name=\"deviceInboundDetailList[0].deviceCode\" class=\"form-control\" placeholder=\"设备编号\">\n" +
                            "<span class=\"input-group-btn\">\n" +
                            "<button type=\"button\" class=\"btn btn-default\"><i class=\"fa fa-search\" onclick='searchDevice()'></i></button>\n" +
                            "</span>\n" +
                        "</div></td>\n" +
                        "<td><input name=\"devicePurchaseDetailList["+num+"].deviceName\" readonly></td>\n" +
                        "<td><input name=\"devicePurchaseDetailList["+num+"].deviceModel\" readonly></td>\n" +
                        "<td><input name=\"devicePurchaseDetailList["+num+"].deviceSpec\" readonly></td>\n" +
                        "<td><input name=\"devicePurchaseDetailList["+num+"].deviceBrand\" readonly></td>\n" +
                        "<td><input name=\"devicePurchaseDetailList["+num+"].inboundNumber\" value=\"0\"></td>\n" +
                        "<td onclick=\"deleteDevice(this)\"><a>删除</a></td>\n" +
                    "</tr>";
            $("#device-inbound-tbody").append(tr);
        });

    });
    //删除
    function deleteDevice(obj) {
        console.info("obj = " + obj);
        var tr = obj.parentNode;
        if (tr != null) {
            tr.parentNode.removeChild(tr);
        }
        //tr td input :name 重新排序
        recalculateTd();
    }

    function recalculateTd() {
        var trList = $("#device-inbound-table tbody tr");
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
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceModel")
                }
                if (j == 3){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceSpec")
                }
                if (j == 4){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].deviceBrand")
                }
                if (j == 5){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].inboundNumber")
                }
            })
        });
        return num + 1;
    }

    function searchDevice() {
        $('#search-device-section').show();
    }

    function checkDevice() {
        $('#search-device-section').hide();
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
