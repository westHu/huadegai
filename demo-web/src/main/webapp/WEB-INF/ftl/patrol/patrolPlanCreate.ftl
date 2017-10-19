<#include "common/public.ftl">
<@header title="巡检计划创建" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
<style>
    label {
        float: left;
        margin-left: 15px;
        margin-top: 5px;
    }
    td input{background-color:#CCFFFF;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}
</style>
</@header>
<body class="sticky-header">
<section>
<@left title="导航栏"></@left>
    <div class="main-content" >
    <@notification title="通知"></@notification>
    <@pageHeading title_1="巡检计划创建"  title_3="巡检管理" title_4="巡检计划列表" title_4_url="${context.contextPath}/patrol/planList"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <form class="device-inbound-form" <#if op == '新增'> action="${context.contextPath}/patrol/planCreate" <#elseif op == '更新'> action="${context.contextPath}/patrol/planUpdate"</#if> method="post">
                        <section class="panel">
                            <header class="panel-heading">
                                采购表格
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <label class="control-label">计划名称：</label>
                                    <div class="col-md-1">
                                        <input type="hidden" class="form-control"  name="id"  id="id" value="${patrolPlan.id}">
                                        <input class="form-control" name="planName"  id="planName" <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${patrolPlan.planName}"</#if> readonly>
                                    </div>

                                    <label class="control-label">计划描述：</label>
                                    <div class="col-md-1">
                                        <input class="form-control" name="planDesc" id="planDesc" value="${patrolPlan.planDesc}">
                                    </div>

                                    <label class="control-label" style="float: left">计划创建者：</label>
                                    <div class="col-md-1">
                                        <input class="form-control" name="planCreater" id="planCreater" value="${patrolPlan.planCreater}">
                                    </div>

                                    <label class="control-label" style="float: left">起止时间</label>
                                    <div class="col-md-3">
                                        <div class="input-group input-large custom-date-range" data-date="2017-11-11" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control dpd1" name="from">
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control dpd2" name="to">
                                        </div>
                                    </div>

                                    <label class="control-label">巡检间隔：</label>
                                    <div class="col-md-1">
                                    <#--<input class="form-control" name="planPerDay" id="planPerDay" value="${patrolPlan.planPerDay}">-->
                                        <div id="spinner3">
                                            <div class="input-group" style="width:150px;">
                                                <input type="text" class="spinner-input form-control" maxlength="3" name="planPerHour" id="planPerHour" value="${patrolPlan.planPerHour}" placeholder="小时" readonly>
                                                <div class="spinner-buttons input-group-btn">
                                                    <button type="button" class="btn btn-default spinner-up">
                                                        <i class="fa fa-angle-up"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default spinner-down">
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="control-label">计划备注：</label>
                                    <div class="col-sm-4">
                                        <textarea rows="6" class="form-control my-textarea" name="planRemark" id="planRemark" style=" height: 50px;">${patrolPlan.planRemark}</textarea>
                                    </div>
                                </div>

                                <#if op == '新增'>
                                    <span class="tools pull-right">
                                        <button class="btn btn-primary" type="submit">&nbsp确认新增&nbsp</button>
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
                                巡检点列表
                                <span class="tools pull-right">
                                    <div class="btn-group">
                                        <button id="add-new" class="btn btn-primary" type="button">
                                            添加巡检点 <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </span>
                            </header>
                            <div class="panel-body">
                                <section id="unseen">
                                    <table id="plan-point-table" class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th>巡检点名称</th>
                                                <th>巡检点描述</th>
                                                <th>负责人</th>
                                                <th>坐标</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="device-point-tbody">
                                            <tr>
                                                <td><input name="" placeholder="巡检点名称"></td>
                                                <td><input name="" placeholder="巡检点描述"></td>
                                                <td><input name="" placeholder="负责人"></td>
                                                <td><input name="" placeholder="坐标"></td>
                                                <td>----</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </section>
                            </div>
                        </section>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            巡检点中设备列表
                            <span class="tools pull-right">
                                <#--<a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>-->
                                    <div class="btn-group">
                                    <button id="add-new" class="btn btn-primary" type="button">
                                        添加巡检点 <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </span>
                        </header>
                        <div class="panel-body" style="height: 400px">
                            <section id="unseen">
                                <iframe src="/baidu.com" scrolling="no" height="400px" width="100%"></iframe>
                                <#--<table id="plan-point-table" class="table table-bordered table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <th>设备编码</th>
                                        <th>设备名称</th>
                                        <th>设备规格</th>
                                        <th>设备类型</th>
                                        <th>设备状态</th>
                                    </tr>
                                    </thead>
                                    <tbody id="device-tbody">
                                    <tr>
                                        <td><input name="" placeholder="设备编码"></td>
                                        <td><input name="" placeholder="设备名称"></td>
                                        <td><input name="" placeholder="设备类别"></td>
                                        <td><input name="" placeholder="设备型号"></td>
                                        <td><input name="" placeholder="设备规格"></td>
                                    </tr>
                                    </tbody>
                                </table>-->
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
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,paging-hup,spinner"></@js_lib>
<script>
    jQuery(document).ready(function() {
        $('#add-new').click(function (e) {
            var num = recalculateTd();
            var tr ="<tr>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceName' placeholder='设备名称'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceCategory' placeholder='设备类别'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceModel' placeholder='设备型号'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceSpec' placeholder='设备规格'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceBrand' placeholder='设备品牌'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].deviceManufacturer' placeholder='设备厂家'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].pointUnitPrice' placeholder='采购价格' type='number'></td>\n" +
                        "<td><input name='devicepointDetailList["+num+"].pointNumber' placeholder='采购数量' type='number'></td>\n" +
                        "<td onclick=\"deleteDevice(this)\"><a>删除</a></td>\n" +
                    "</tr>";
            $("#device-point-tbody").append(tr);
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
        var trList = $("#device-point-table tbody tr");
        var num = 0;
        trList.each(function (i) {
            num = i;
            var tdList = $(this).children("td");
            tdList.each(function (j) {
                if (j == 0){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceName")
                }
                if (j == 1){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceCategory")
                }
                if (j == 2){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceModel")
                }
                if (j == 3){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceSpec")
                }
                if (j == 4){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceBrand")
                }
                if (j == 5){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].deviceManufacturer")
                }
                if (j == 6){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].pointUnitPrice")
                }
                if (j == 7){
                    $(this).find('input').attr('name', "devicepointDetailList["+i+"].pointNumber")
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
