<#include "common/public.ftl">
<@header title="巡检计划创建" css_war="pickers_css,jquery_easyui">
<style>
    label {
        float: left;
        margin-left: 15px;
        margin-top: 5px;
    }
    /*td input{background-color:#CCFFFF;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}*/
    .datagrid-row {
        height: 30px;
    }
    .datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber{
        text-overflow: ellipsis;
    }
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
                <form class="device-inbound-form" <#if op == '新增'> action="${context.contextPath}/patrol/planCreate" <#elseif op == '更新'> action="${context.contextPath}/patrol/planUpdate"</#if> method="post">
                    <div class="col-sm-12">
                        <section class="panel">
                                <header class="panel-heading">
                                    巡检计划表格
                                </header>
                                <div class="panel-body">
                                    <div class="row">
                                        <label class="control-label">计划名称：</label>
                                        <div class="col-md-2">
                                            <input type="hidden" class="form-control"  name="id"  id="id" value="${patrolPlan.id}">
                                            <input class="form-control" name="planName"  id="planName" <#if op = '新增'>value=".系统生成"<#elseif op = '更新'>value="${patrolPlan.planName}"</#if> readonly>
                                        </div>

                                        <label class="control-label">计划描述：</label>
                                        <div class="col-md-2">
                                            <input class="form-control" name="planDesc" id="planDesc" value="${patrolPlan.planDesc}" required>
                                        </div>

                                        <label class="control-label" style="float: left">起止时间</label>
                                        <div class="col-md-3">
                                            <div class="input-group input-large custom-date-range" data-date="2017-11-11" data-date-format="yyyy-mm-dd">
                                                <input type="text" class="form-control dpd1" name="planBegin" required>
                                                <span class="input-group-addon">To</span>
                                                <input type="text" class="form-control dpd2" name="planEnd" required>
                                            </div>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="control-label" style="float: left">计划创建者：</label>
                                        <div class="col-md-2">
                                            <input class="form-control" name="planCreater" id="planCreater" value="${patrolPlan.planCreater}">
                                        </div>


                                        <label class="control-label">巡检间隔（小时）：</label>
                                        <div class="col-md-2">
                                        <#--<input class="form-control" name="planPerDay" id="planPerDay" value="${patrolPlan.planPerDay}">-->
                                            <div id="spinner3">
                                                <div class="input-group" style="width:150px;">
                                                    <input type="text" class="spinner-input form-control" maxlength="3" name="planPerHour" id="planPerHour" value="${patrolPlan.planPerHour}" placeholder="小时" readonly required>
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
                                        <div class="col-sm-6">
                                            <textarea rows="4" class="form-control my-textarea" name="planRemark" id="planRemark" style=" height: 50px;">${patrolPlan.planRemark}</textarea>
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
                    </div>
                    <div class="col-sm-6">
                        <section class="panel">
                            <header class="panel-heading">
                                巡检点表格
                                <input id="pointDetailIds" type="hidden" name="pointDetailIds">
                            </header>
                            <table id="point-dg"  style="width:100%;height:400px" idField="id"
                                   data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,pagination:true,url:'${context.contextPath}/patrol/pointListJson',method:'get'">
                                <thead>
                                <tr>
                                    <th data-options="field:'pointName',width:40,align:'left'">名称</th>
                                    <th data-options="field:'pointDesc',width:60,align:'left',
                                                            formatter: function(value,row,index){return '<span  title='+value+'>'+value+'</span>'}">描述</th>
                                    <th data-options="field:'pointAgent',width:40,align:'left'">负责人</th>
                                    <th data-options="field:'coordinateX',width:40,align:'left'">坐标</th>
                                    <th data-options="field:'coordinateY',width:40,align:'left'">坐标</th>
                                </tr>
                                </thead>
                            </table>
                        </section>

                    </div>
                    <div class="col-sm-6">
                        <section class="panel">
                            <header class="panel-heading">
                                巡检设备表格
                            </header>
                            <table id="point-detail-dg"  style="width:100%;height:400px" idField="id"
                               data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,pagination:true,url:'${context.contextPath}/patrol/pointDetailListJson',method:'get'">
                            <thead>
                            <tr>
                                <th data-options="field:'ck',checkbox:true"></th>
                                <th data-options="field:'deviceCode',width:60,align:'left'">设备编码</th>
                                <th data-options="field:'deviceName',width:60,align:'left'">设备名称</th>
                                <th data-options="field:'deviceModel',width:40,align:'left'">设备型号</th>
                                <th data-options="field:'deviceSpec',width:40,align:'left'">设备规格</th>
                                <th data-options="field:'deviceBrand',width:40,align:'left'">设备品牌</th>
                            </tr>
                            </thead>
                        </table>
                        </section>
                    </div>
                </form>
            </div>
        </div>
        <footer>
            2017 &copy; tansfar by hup
        </footer>
    </div>
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="pickers_plugins,pickers_initialization,spinner,jquery_easyui"></@js_lib>
<script>
    jQuery(document).ready(function() {
        $('#point-dg').datagrid({
            onClickRow: function (index, row) {  //easyui封装好的时间（被单机行的索引，被单击行的值）
                //展示巡检点设备详情
                var queryParams = $('#point-detail-dg').datagrid('options').queryParams;
                queryParams.pointId = row["id"];
                $('#point-detail-dg').datagrid('options').queryParams=queryParams;
                $("#point-detail-dg").datagrid('reload');
            }
        });
        var pointDetailIdArr = new Array();
        $('#point-detail-dg').datagrid({
            onSelect: function (index, row) {
                console.info("选中--" + row["id"]);
                pointDetailIdArr.push(row["id"]);
                $('#pointDetailIds').val(pointDetailIdArr.join(","));
            },
            onUnselect: function (index, row) {
                console.info("取消--" + row["id"]);
                removeByValue(pointDetailIdArr, row["id"]);
                $('#pointDetailIds').val(pointDetailIdArr.join(","));
            }
        });
    })

    function removeByValue(arr, val) {
        for(var i=0; i<arr.length; i++) {
            if(arr[i] == val) {
                arr.splice(i, 1);
                break;
            }
        }
    }

</script>
</body>
</html>
