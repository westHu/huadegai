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
</style>
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="设备采购"  title_3="设备管理" title_4="设备采购" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <#--<div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            展示面板
                            ${base}asdad
                        </header>
                        <div class="panel-body">
                            <form class="device-inbound-form"
                                  <#if op == '新增'>
                                    action="${context.contextPath}/device/inbound"
                                  <#elseif op == '更新'>
                                    action="${context.contextPath}/device/update"
                                  </#if>
                                  method="post">
                                <div class="row">
                                    <label class="control-label"  style="float: left">设备编码：</label>
                                    <div class="col-md-1">
                                        <input type="hidden" class="my-form-control"  name="id"  id="id" value="${device.id}">
                                        <input type="text" class="my-form-control"
                                               <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${device.deviceCode}"</#if>
                                               name="deviceCode"  id="deviceCode" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">设备名称：</label>
                                    <div class="col-md-1">
                                        &lt;#&ndash;<p class="form-control-static" style="margin-top: 5px;">水泵3#</p>&ndash;&gt;
                                        <input type="text" class="my-form-control" name="deviceName" id="deviceName" value="${device.deviceName}">
                                    </div>

                                    <label class="control-label" style="float: left">设备型号：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceModel" id="deviceModel" value="${device.deviceModel}">
                                    </div>
                                    <label class="control-label"  style="float: left">设备规格：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceSpec" id="deviceSpec" value="${device.deviceSpec}">
                                    </div>

                                    <label class="control-label"  style="float: left">设备大类：</label>
                                    <div class="col-md-1">
                                        <select class="my-form-control" name="deviceBgType" id="deviceBgType" value="${device.getDeviceBgType()}">
                                            <#list deviceBgType as bgType>
                                                <option value="${bgType}"  <#if device.deviceBgType == bgType>selected</#if> >${bgType.value}</option>
                                            </#list>
                                        </select>
                                    </div>

                                    <label class="control-label" style="float: left">设备子类：</label>
                                    <div class="col-md-1">
                                        <select class="my-form-control" name="deviceSmType" id="deviceSmType"  >
                                        <#list deviceSmType as smType>
                                            <option value="${smType}" <#if device.deviceSmType == smType>selected</#if> >${smType.value}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label"  style="float: left">设备品牌：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceBrand" id="deviceBrand" value="${device.deviceBrand}">
                                    </div>

                                    <label class="control-label"  style="float: left">设备厂家：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceVender" id="deviceVender" value="${device.deviceVender}">
                                    </div>
                                    <label class="control-label" style="float: left">设备原值：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceValue" id="deviceValue" value="${device.deviceValue}??'100.0'">
                                    </div>

                                    <label class="control-label"  style="float: left">设备价格：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="devicePrice" id="devicePrice" value="${device.devicePrice}" >
                                    </div>
                                    <!--设备新增不现实状态，默认都是入库&ndash;&gt;
                                    <#if op == '更新'>
                                        <label class="control-label" style="float: left">设备状态：</label>
                                        <div class="col-md-1">
                                            <input type="text" class="my-form-control" name="deviceStatus" id="deviceStatus" value="${device.deviceStatus}">
                                        </div>
                                    </#if>
                                    <label class="control-label" style="float: left">能源类型：</label>
                                    <div class="col-md-1">
                                        <select class="my-form-control" name="energyType" id="energyType" value="${device.energyType}">
                                            <option value="水">水</option>
                                            <option value="电">电</option>
                                            <option value="气">气</option>
                                            <option value="燃">燃</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="row">
                                    <label class="control-label"  style="float: left">隶属单位：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceUnit" id="deviceUnit" value="${device.deviceUnit}">
                                    </div>

                                    <label class="control-label"  style="float: left">采购日期：</label>
                                    <div class="col-md-1">
                                        &lt;#&ndash;<input type="text" class="my-form-control" >&ndash;&gt;
                                            <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="12-02-2017"  class="input-append date dpYears">
                                                <input type="text" readonly=""value="<#if device.devicePurchaserDate??>${device.devicePurchaserDate?string("yyyy-MM-dd")}<#else>2017-11-11</#if>" size="16" class="form-control" name="devicePurchaserDate" id="devicePurchaserDate">
                                                <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                    </div>

                                    <label class="control-label" style="float: left">采购人员：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="devicePurchaserAgent" id="devicePurchaserAgent" value="${device.devicePurchaserAgent}" >
                                    </div>

                                    <label class="control-label" style="float: left">安装地址：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="installAddress" id="installAddress" value="${device.installAddress}" >
                                    </div>

                                    <label class="control-label"  style="float: left">设备用途：</label>
                                    <div class="col-md-2">
                                        <input type="text" class="my-form-control" name="deviceFunction" id="deviceFunction" value="${device.deviceFunction}" >
                                    </div>
                                </div>

                                <!--************** 第四行 ***************** &ndash;&gt;
                                <div class="row" style="width: 90%">
                                    <label class="control-label" style="float: left">设备备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="my-form-control my-textarea" id="remark">${device.remark}</textarea>
                                    </div>
                                </div>
                                <#if op == '新增'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="button">&nbsp批量导入&nbsp</button>
                                        <button class="btn btn-primary" type="submit">&nbsp设备入库&nbsp</button>
                                        <button class="btn btn-primary" type="reset">&nbsp重&nbsp置&nbsp</button>
                                    </span>
                                <#elseif op == '更新'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="submit">&nbsp更新设备&nbsp</button>
                                    </span>
                                </#if>

                            </form>
                        </div>
                    </section>
                </div>
            </div>-->

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
                                            <th>付款方式</th>
                                            <th>采购时间</th>
                                            <th>备注</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list page.getList() as obj>
                                            <tr>
                                                <td>${obj.purchaseCode}</td>
                                                <td>${obj.purchaseName}</td>
                                                <td>${obj.purchaseAgent}</td>
                                                <td>${obj.paymentType}</td>
                                                <td>${obj.purchaseDate?string("yyyy-MM-dd")}</td>
                                                <td>${obj.remark}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="#" >查看设备</a></li>
                                                            <li><a href="${context.contextPath}/device/${obj.id}/update?currentPage=${page.currentPage}&pageSize=${page.pageSize}" >编辑设备</a></li>
                                                            <li><a href="#myModal2" data-toggle="modal" onclick="delete_device(${obj.id},this)" >删除设备</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#myModal3" data-toggle="modal" onclick="resetPwd(${obj.id})" >复制设备</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                        <!-- 删除设备  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认删除</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="deleteId" type="hidden"/>
                                                        你确定要删除该设备吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmDeleteDevice()"> 确定</button>
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

    function delete_device(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }

    function confirmDeleteDevice() {
        var id = $('#deleteId').val().trim();
        var url =  "/device/"+id+"/delete";
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
            var pageUrl =  "${context.contextPath}/device/inbound?currentPage="+num+"&pageSize="+pageSize;
            console.info(pageUrl)
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
