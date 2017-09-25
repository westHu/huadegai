<#include "common/public.ftl">
<@header title="设备入库" keywords="设备入库" description="设备入库">
<!--responsive table-->
<link href="${context.contextPath}/css/table-responsive.css" rel="stylesheet" />
<!--gritter css-->
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/gritter/css/jquery.gritter.css" />

<!--pickers css-->
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-datepicker/css/datepicker-custom.css" />
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-timepicker/css/timepicker.css" />
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />

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

    .col-md-1 {
        width: 10% !important;
    }
</style>
</@header>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <@left title="导航栏"></@left>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <@notification title="通知"></@notification>
        <!-- header section end-->

        <!-- page heading start-->
        <@pageHeading title_1="设备入库" title_2="首页" title_3="设备管理" title_4="设备入库"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            展示面板
                        </header>
                        <div class="panel-body">
                            <form class="device-inbound-form" action="${context.contextPath}/device/inbound" method="post">
                                <div class="row">
                                    <label class="control-label"  style="float: left">设备编码：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" value="系统生成" name="deviceCode" value="${device.deviceCode}" disabled>
                                    </div>

                                    <label class="control-label"  style="float: left">设备名称：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceName" value="${device.deviceName}">
                                    </div>

                                    <label class="control-label" style="float: left">设备型号</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceModel" value="${device.deviceModel}">
                                    </div>
                                    <label class="control-label"  style="float: left">设备规格：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceSpec" value="${device.deviceSpec}">
                                    </div>

                                    <label class="control-label"  style="float: left">设备大类：</label>
                                    <div class="col-md-1">
                                        <select class="my-form-control" name="deviceBgType" value="${device.deviceBgType}">
                                            <#list deviceBgType as bgType>
                                                <option value="${bgType}">${bgType.value}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <label class="control-label" style="float: left">设备子类</label>
                                    <div class="col-md-1">
                                        <select class="my-form-control" name="deviceSmType" value="${device.deviceSmType}">
                                        <#list deviceSmType as smType>
                                            <option value="${smType}">${smType.value}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="control-label"  style="float: left">设备品牌：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceBrand" value="${device.deviceBrand}">
                                    </div>
                                    <label class="control-label"  style="float: left">设备厂家：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceVender" value="${device.deviceVender}">
                                    </div>
                                    <label class="control-label" style="float: left">设备原值</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceValue" value="100.0">
                                    </div>
                                    <label class="control-label"  style="float: left">设备价格：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="devicePrice" value="${device.devicePrice}">
                                    </div>
                                    <label class="control-label"  style="float: left">设备用途：</label>
                                    <div class="col-md-2">
                                        <input type="text" class="my-form-control" name="deviceFunction" value="${device.deviceFunction}">
                                    </div>
                                </div>


                                <div class="row">
                                    <label class="control-label"  style="float: left">隶属单位：</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="deviceUnit" value="${device.deviceUnit}">
                                    </div>
                                    <label class="control-label"  style="float: left">采购日期：</label>
                                    <div class="col-md-1">
                                        <#--<input type="text" class="my-form-control" >-->
                                            <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="12-02-2017"  class="input-append date dpYears">
                                                <input type="text" readonly="" value="2017-11-11" size="16" class="form-control" name="devicePurchaserDate">
                                                <span class="input-group-btn add-on">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                    </div>
                                    <label class="control-label" style="float: left">采购人员</label>
                                    <div class="col-md-1">
                                        <input type="text" class="my-form-control" name="devicePurchaserAgent" value="${device.devicePurchaserAgent}">
                                    </div>
                                </div>
                                <span class="tools pull-right">
                                    <button class="btn btn-info" type="button">&nbsp批量导入&nbsp</button>
                                    <button class="btn btn-info" type="submit">&nbsp设备入库&nbsp</button>
                                    <button class="btn btn-info" type="reset">&nbsp重&nbsp置&nbsp</button>
                                </span>
                            </form>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">导入导出</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
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
                                            <th>编号</th>
                                            <th>名称</th>
                                            <th>型号</th>
                                            <th>规格</th>
                                            <th>大类</th>
                                            <th>子类</th>
                                            <th>品牌</th>
                                            <th>厂家</th>
                                            <th>采购日期</th>
                                            <th>采购人</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#--<#list userList as user>
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>*******</td>
                                                <td class="numeric">********</td>
                                                <td class="numeric">${user.roleNames}</td>
                                                <td class="numeric">${user.organizationName}</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">...</td>
                                                <td class="numeric">
                                                &lt;#&ndash;<a href="javascript:void(0)" class="pop pop_recharge" data-toggle='modal' data-target="#user-recharge" data-id="${user.id}">充值</a>&ndash;&gt;
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-success btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="${context.contextPath}/user/${user.id}/update">编辑用户</a></li>
                                                            <li><a href="#myModal2" data-toggle="modal" onclick="delete_user(${user.id},this)" >删除用户</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#myModal3" data-toggle="modal" onclick="resetPwd(${user.id})" >重置密码</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>-->
                                        <!-- 删除用户  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认删除</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="deleteId" type="hidden"/>
                                                        你确定要删除该用户吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirm()"> 确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->


                                        <!-- 重置密码  Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal3" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                        <h4 class="modal-title">确认重置密码</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input id="resetPwdId" type="hidden"/>
                                                        你确定要重置该用户的密码吗？
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="confirmReset()"> 确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->
                                    </tbody>
                                </table>
                            </section>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2017 &copy; tansfar by hup
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<!--gritter script-->
<script type="text/javascript" src="${context.contextPath}/js/gritter/js/jquery.gritter.js"></script>
<script src="${context.contextPath}/js/gritter/js/gritter-init.js" type="text/javascript"></script>

<!--pickers plugins-->
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<!--pickers initialization-->
<script src="${context.contextPath}/js/pickers-init.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<script>
    //删除的标签
    var parentTR, parentTBODY;

    function delete_user(id, inputObj) {
        $('#deleteId').val(id);
        //如果后台成功则调用下列参数进行页面删除
        var parentTD = inputObj.parentNode.parentNode.parentNode.parentNode;
        parentTR = parentTD.parentNode;
        parentTBODY = parentTR.parentNode;
    }
    function confirm() {
        var id = $('#deleteId').val().trim();
        var url = "/user/"+id+"/delete";
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

    //重置密码js
    function resetPwd(id) {
        $('#resetPwdId').val(id);
    }
    function confirmReset() {
        var id = $('#resetPwdId').val().trim();
        var url = "/user/"+id+"/resetPassword";
        $.ajax({
            url: url,
            type: 'post',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data) {
                TipsNotice(null, data.description);
            }
        });
    }












    function TipsNotice(title, text) {
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image: 'images/notice.jpg',
            sticky: false,
            time: 3000,
            speed:5000,
            position: 'bottom-right',
            class_name: 'gritter-light'
        });
    }

</script>
</body>
</html>
