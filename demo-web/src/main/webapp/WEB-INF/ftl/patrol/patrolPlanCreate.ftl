<#include "common/public.ftl">
<@header title="巡检计划创建" css_war="data_table,gritter_css,pickers_css,paging-hup_css">
<style>
    label {
        float: left;
        margin-left: 15px;
        margin-top: 5px;
    }
    /*td input{background-color:#CCFFFF;margin-top:-1px;margin-bottom:-1px;height:35px; width:100%;border:none;}*/
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


                        <section class="panel">
                            <header class="panel-heading">
                                巡检点列表
                                <input type="hidden" id="pointIds" name="pointIds">
                            </header>
                            <div class="panel-body">
                                <section id="unseen">
                                    <table class="table table-striped table-hover table-bordered select-org-table" id="editable-sample">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>巡检点名称</th>
                                                <th>巡检点描述</th>
                                                <th>负责人</th>
                                                <th>坐标</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list pointList as point>
                                                <tr>
                                                    <td><input type="checkbox" id="point-id" value="${point.id}"></td>
                                                    <td>${point.pointName}</td>
                                                    <td>${point.pointDesc}</td>
                                                    <td>${point.pointAgent}</td>
                                                    <td>[${point.coordinateX} : ${point.coordinateY}]</td>
                                                    <td>----</td>
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
<@js_lib js_war="data_table,gritter_script,pickers_plugins,pickers_initialization,paging-hup,spinner"></@js_lib>
<script>
    jQuery(document).ready(function() {
        EditableTable.init();

        var result = new Array();


        $("tr:gt(0)").live("click",function(){
            var pointId = $(this).find("input").val();
            if($(this).hasClass("selected")){
                $(this).removeClass("selected").find(":checkbox").attr("checked",false);
                removeByValue(result, pointId);
            }else{
                $(this).addClass("selected").find(":checkbox").attr("checked",true);
                result.push(pointId);
            }
            console.debug(result.join(","));
            $('#pointIds').val(result.join(","));
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
