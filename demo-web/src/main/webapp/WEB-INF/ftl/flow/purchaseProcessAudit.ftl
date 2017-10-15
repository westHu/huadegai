<#include "common/public.ftl">
<@header title="流程审核" css_war = ""></@header>
<body class="sticky-header" xmlns="http://www.w3.org/1999/html">

<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="流程审核"  title_3="系统设置" title_4="流程审核" title_4_url="${context.contextPath}/"></@pageHeading>
        <hr/>
        <div class="wrapper">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel">
                        <header class="panel-heading">
                            审核面板
                        </header>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="row" style="padding-bottom: 10px">
                                    <label  class="col-sm-2 control-label">采购单号：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseCode}" disabled>
                                    </div>

                                    <label  class="col-sm-2 control-label">采购单名：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseName}" disabled>
                                    </div>
                                </div>

                                <div class="row" style="padding-bottom: 10px">
                                    <label  class="col-sm-2 control-label">采购人员：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseAgent}" disabled>
                                    </div>

                                    <label  class="col-sm-2 control-label">采购目的：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseReason}" disabled>
                                    </div>
                                </div>


                                <div class="row" style="padding-bottom: 10px">
                                    <label  class="col-sm-2 control-label">付款方式：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchasePaymentType}" disabled>
                                    </div>

                                    <label  class="col-sm-2 control-label">采购时间：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseDate?string("yyyy-MM-dd")}" disabled>
                                    </div>
                                </div>

                                <div class="row" style="padding-bottom: 10px">
                                    <label  class="col-sm-2 control-label">采购备注：</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" value="${devicePurchase.purchaseRemark}" disabled>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>设备名称</th>
                                        <th>设备型号</th>
                                        <th>设备规格</th>
                                        <th>采购数量</th>
                                        <th>采购价格</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#list devicePurchase.devicePurchaseDetailList as detail>
                                        <tr>
                                            <td>${detail_index + 1}</td>
                                            <td>${detail.deviceName}</td>
                                            <td>${detail.deviceModel}</td>
                                            <td>${detail.deviceSpec}</td>
                                            <td>${detail.purchaseNumber}</td>
                                            <td>${detail.purchaseUnitPrice}元</td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel">
                        <header class="panel-heading">
                            审核记录
                        </header>
                        <div class="panel-body">
                            <ul class="chats cool-chat">
                                <#list runtimes as runtime>
                                    <li <#if runtime_index / 2 == 0 >class="in"<#else>class="out"</#if>>
                                        <img src="${context.contextPath}/images/photos/user1.png" alt="" class="avatar">
                                        <div class="message">
                                            <span class="arrow"></span>
                                            <a class="name" href="#">${runtime.executed}</a>
                                            <span class="datetime">${runtime.createDate}</span>
                                            <span class="body">
                                                ${runtime.comment}
                                            </span>
                                        </div>
                                    </li>
                                </#list>
                            </ul>
                            <div class="chat-form ">
                                <form role="form" class="form-inline"  action="${context.contextPath}/device/purchase/${latestRuntime.code}/audit" method="get">
                                    <div class="col-md-9">
                                        <input type="hidden" name="name" value="devicePurchase">
                                        <input type="hidden" name="step" id="step" value="${latestRuntime.step}">
                                        <input type="hidden" name="code" value="${latestRuntime.code}">
                                        <input type="hidden" name="receipted" value="${username}">
                                        <input type="hidden" name="executed" value="${username}">
                                        <input type="hidden" name="auditOpinion" id="auditOpinion">
                                        <input type="text" name="comment" style="width: 100%" placeholder="请尽量写入您的理由..." class="form-control">
                                    </div>
                                        <button class="btn btn-primary" type="submit" onclick="setAuditOpinion(1)">同意</button>
                                        <button class="btn btn-danger"  type="submit" onclick="setAuditOpinion(-1)">拒绝</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="">
            2017 &copy; transfar by hup
        </footer>
    </div>
    <!-- main content end-->
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war=""></@js_lib>
<script>
    
    function setAuditOpinion(num) {
        if (num == 1){
            $('#auditOpinion').val("AGREE")
        }
        if (num == -1) {
            $('#auditOpinion').val("REFUSE")
        }
    }
    
</script>
</body>
</html>
