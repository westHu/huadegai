<#include "common/public.ftl">
<@header title="设备维修" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
<style>
    label {
        display: inline-block;
        margin-bottom: 5px;
        margin-left: 15px;
        margin-top: 5px;
        font-weight: 1000;
    }
    
    td input{background-color: #e7e7e7;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}
</style>
</@header>
<body class="sticky-header">
<section>
<@left title="导航栏"></@left>
    <div class="main-content" >
    <@notification title="通知"></@notification>
    <@pageHeading title_1="设备维修"  title_3="设备管理" title_4="维修列表" title_4_url="${context.contextPath}/device/scrap"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <form class="device-scrap-form" <#if op == '新增'> action="${context.contextPath}/device/scrap/create" <#elseif op == '更新'> action="${context.contextPath}/device/scrap/update"</#if> method="post">
                        <section class="panel">
                            <header class="panel-heading">
                                检修表格
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <label class="control-label"  style="float: left">维修单号：</label>
                                    <div class="col-md-2">
                                        <input type="hidden" class="form-control"  name="id"  id="id" value="${deviceScrap.id}">
                                        <input class="form-control" name="scrapCode"  id="scrapCode" <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${deviceScrap.scrapCode}"</#if> readonly>
                                    </div>

                                    <label class="control-label"  style="float: left">维修单名：</label>
                                    <div class="col-md-2">
                                        <input class="form-control" name="scrapName" id="scrapName" value="${deviceScrap.scrapName}">
                                    </div>

                                    <label class="control-label" style="float: left">维修人员：</label>
                                    <div class="col-md-2">
                                        <input class="form-control" name="scrapAgent" id="scrapAgent" value="${deviceScrap.scrapAgent}">
                                    </div>

                                    <label class="control-label"  style="float: left">维修日期：</label>
                                    <div class="col-md-2">
                                        <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="2017-12-02"  class="input-append date dpYears">
                                            <input readonly="" value="<#if deviceScrap.scrapDate??>${deviceScrap.scrapDate?string("yyyy-MM-dd")}<#else>2017-11-11</#if>" size="16" class="form-control" name="scrapDate" id="scrapDate">
                                            <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="control-label" style="float: left">维修备注：</label>
                                    <div class="col-sm-6">
                                        <textarea rows="4" class="form-control my-textarea" name="scrapRemark" id="scrapRemark">${deviceScrap.scrapRemark}</textarea>
                                    </div>
                                </div>

                                <#if op == '新增'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="submit">&nbsp确认维修&nbsp</button>
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
                                检修设备清单
                                <span class="tools pull-right">
                                    <div class="btn-group">
                                        <button id="add-new" class="btn btn-primary" type="button">
                                            添加设备 <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </span>
                            </header>
                            <div class="panel-body">
                                <section id="unseen">
                                    <table id="device-scrap-table" class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th>设备编号</th>
                                                <th>设备名称</th>
                                                <th>设备型号</th>
                                                <th>设备规格</th>
                                                <th>设备品牌</th>
                                                <th>检修数量</th>
                                                <th>维修数量</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-scrap-tbody">
                                            <#if deviceScrap.deviceScrapDetailList??>
                                                <#list deviceScrap.deviceScrapDetailList as detail>
                                                    <tr>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].deviceName" value="${detail.deviceName}"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].deviceCategory" value="${detail.deviceCategory}"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].deviceModel" value="${detail.deviceModel}"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].deviceSpec" value="${detail.deviceSpec}"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].deviceBrand" value="${detail.deviceBrand}"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].purchaseNumber" value="${detail.purchaseNumber}" type="number"></td>
                                                        <td><input name="deviceScrapDetailList[${detail_index}].scrapNumber" value="${detail.scrapNumber}" type="number"></td>
                                                        <td onclick="deleteDevice(this)"><a>删除</a></td>
                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr>
                                                    <td>
                                                        <input name="deviceScrapDetailList[0].deviceName" placeholder="设备名称">
                                                        <#--<div class="input-group">
                                                                <input name="deviceScrapDetailList[0].deviceCode" class="form-control" placeholder="设备编号">
                                                                <span class="input-group-btn">
                                                                        <button type="button" class="btn btn-default">
                                                                            <i class="fa fa-search"></i>
                                                                        </button>
                                                                </span>
                                                            </div>-->
                                                    </td>
                                                    <td><input name="deviceScrapDetailList[0].deviceCategory" placeholder="设备类别"></td>
                                                    <td><input name="deviceScrapDetailList[0].deviceModel" placeholder="设备型号"></td>
                                                    <td><input name="deviceScrapDetailList[0].deviceSpec" placeholder="设备规格"></td>
                                                    <td><input name="deviceScrapDetailList[0].deviceBrand" placeholder="设备品牌"></td>
                                                    <td><input name="deviceScrapDetailList[0].purchaseNumber" placeholder="检修数量" type="number"></td>
                                                    <td><input name="deviceScrapDetailList[0].scrapNumber" placeholder="维修数量" type="number"></td>
                                                    <td>----</td>
                                                </tr>
                                            </#if>
                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </section>
                    </form>

                    <section id="search-device-section" class="panel">
                        <header class="panel-heading">
                            选中设备进行报废...
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table id="device-purchaseDetail-table" class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>检修单号</th>
                                            <th>设备名称</th>
                                            <th>设备类别</th>
                                            <th>设备型号</th>
                                            <th>设备规格</th>
                                            <th>设备品牌</th>
                                            <th>设备数量</th>
                                        </tr>
                                    </thead>
                                    <tbody id="device-purchaseDetail-tbody">
                                        <#list purchaseDetailList as purchaseDetail>
                                            <tr>
                                                <td>${purchaseDetail.purchaseCode}</td>
                                                <td>${purchaseDetail.deviceName}</td>
                                                <td>${purchaseDetail.deviceCategory}</td>
                                                <td>${purchaseDetail.deviceModel}</td>
                                                <td>${purchaseDetail.deviceSpec}</td>
                                                <td>${purchaseDetail.deviceBrand}</td>
                                                <td>${purchaseDetail.purchaseNumber}</td>
                                            </tr>
                                        </#list>
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
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceName' placeholder='设备名称'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceCategory' placeholder='设备类别'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceModel' placeholder='设备模型'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceSpec' placeholder='设备规格'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].deviceBrand' placeholder='设备品牌'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].purchaseNumber' placeholder='检修数量' type='number'></td>\n" +
                        "<td><input name='devicePurchaseDetailList["+num+"].scrapNumber' placeholder='维修数量' type='number'></td>\n" +
                        "<td onclick=\"deleteDevice(this)\"><a>删除</a></td>\n" +
                    "</tr>";
            $("#device-scrap-tbody").append(tr);
        });

    });
    //删除
    function deleteDevice(obj) {
        var tr = obj.parentNode;
        if (tr != null) {
            tr.parentNode.removeChild(tr);
        }
        recalculateTd();
    }

    function recalculateTd() {
        var trList = $("#device-scrap-table tbody tr");
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
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].purchaseNumber")
                }
                if (j == 6){
                    $(this).find('input').attr('name', "devicePurchaseDetailList["+i+"].scrapNumber")
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
