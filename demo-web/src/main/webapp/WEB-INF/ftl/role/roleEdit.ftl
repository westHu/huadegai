<#include "common/public.ftl">
<@header title="新增角色" css_war="multi-select,treeview"></@header>
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
        <@pageHeading title_1="${op}角色"  title_3="系统设置" title_4="角色管理" title_4_url="${context.contextPath}/role"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading">
                        ${op}角色
                    </header>
                    <div class="panel-body">
                        <form id="roleEditForm" class="form-horizontal" action="${context.contextPath}/role/create" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">角色名称</label>
                                <div class="col-lg-4">
                                    <input type="hidden" name="id" value="${role.id}">
                                    <input class="form-control" name="role" value="${role.role}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">角色描述</label>
                                <div class="col-lg-4">
                                    <input class="form-control" name="description"  value="${role.description}">

                                </div>
                            </div>

                             <#--资源列表-->
                            <div class="form-group">
                                <label class="col-md-2 col-sm-2 control-label">资源列表</label>
                                <div class="col-md-6 col-sm-6">
                                    <input id="resourceNames"  class="form-control" value="${role.resourceNames}" onclick="$('#treeView-panel').show()" autocomplete="off">
                                    <input id="resourceIds" name="resourceIdsStr" style="display: none;" value="${role.resourceIdsStr}" >
                                    <div id="treeView-panel" class="panel" style="display: none;">
                                        <div class="panel-heading">
                                            资源列表图
                                            <span class="tools pull-right">
                                                <button class="btn btn-primary" type="button" onclick="$('#treeView').treeview('checkAll', { silent: true })">全&nbsp选</button>
                                                <#--<button class="btn btn-primary" type="button" onclick="$('#treeView').treeview('uncheckAll', { silent: true })">反&nbsp选</button>-->
                                                <button class="btn btn-primary" type="button" onclick="$('#treeView').treeview('collapseAll', { silent: true })">折&nbsp叠</button>
                                                <button class="btn btn-primary" type="button" onclick="$('#treeView').treeview('expandAll', { levels: 2, silent: true })">展&nbsp开</button>
                                                <button class="btn btn-primary" type="button" onclick="checkResourceList($('#treeView').treeview('getChecked',''))">确&nbsp定</button>
                                                <button class="btn btn-primary" type="button" onclick="$('#treeView-panel').hide()">取&nbsp消</button>
                                            </span>
                                        </div>
                                        <div id="treeView" class="panel-body"></div>
                                    </div>
                                </div>
                            </div>

                            <#--<div class="form-group">
                                <label class="control-label col-sm-2">资源列表</label>
                                <div class="col-md-9">
                                    <select multiple="multiple" class="multi-select" id="my_multi_select2"
                                            name="resourceNames">
                                        <#list resourceTreeList as two >
                                            <optgroup label="${two.name}">
                                                <#list two.sonResourceList as son >
                                                    <option>${son}</option>
                                                </#list>
                                            </optgroup>
                                        </#list>

                                    </select>
                                </div>
                            </div>-->
                            <span class="tools pull-right">
                                <button class="btn btn-info">&nbsp确&nbsp定&nbsp</button>
                            </span>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
        </section>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2017 &copy; transfar by hup
        </footer>
        <!--footer section end-->
    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="multi-select,treeview"></@js_lib>
<script>
    $("#resourceNames").click(function() {
        var options = {
            bootstrap : true,
            showTags : true,
            levels : 2,
            showCheckbox : true,
            multiSelect : true,
            color: "black",
            backColor: "#a7a7a7",
            showBorder: true,
            showTags: true,
            highlightSelected: true,
            selectedColor: "yellow",
            selectedBackColor: "dark",
            checkedIcon : "glyphicon glyphicon-check",
            data : ${resourceTree},
            onNodeChecked: function(event, data){
                //选中父节点，则自动选择子节点
                if(data.nodes != null)
                {
                    var arrayInfo = data.nodes;
                    for (var i = 0; i < arrayInfo.length; i++) {
                        // $('#treeview1').treeview('checkNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                        $('#treeView').treeview('toggleNodeChecked', [ arrayInfo[i].nodeId, { silent: true } ]);
                    }
                }
            },
            onNodeUnchecked: function(event, data){
                //取消选中父节点，则自动取消选择子节点
                if(data.nodes != null)
                {
                    var arrayInfo = data.nodes;
                    for (var i = 0; i < arrayInfo.length; i++) {
                        // $('#treeview1').treeview('checkNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                        $('#treeView').treeview('toggleNodeChecked', [ arrayInfo[i].nodeId, { silent: true } ]);
                    }
                }
            }
        };
        $('#treeView').treeview(options);
    });

    function checkResourceList(obj) {
        var resourceId = new Array();
        var resourceName = new Array();
        var nodeId = new Array();
        //如果全部资源，则只要把所有的菜单加入即可
        for (var i = 0; i < obj.length; i++){
            if (obj[i].nodeId == 0) { //全部资源
                for (var i = 0; i < obj.length; i++){
                    if (obj[i].type == 'menu' && obj[i].nodeId != 0){  //所有的菜单加入
                        resourceName.push(obj[i].text);
                        resourceId.push(obj[i].id);
                        nodeId.push(obj[i].nodeId);
                    }
                }
                $("#resourceNames").val(resourceName.join(","));
                $("#resourceIds").val(resourceId.join(","));
                $("#treeView-panel").hide();

                return;
            }
        }

        //如果不是全部资源， 则先加入菜单，然后加入按钮（核实该按钮的菜单是否选中，选中则不加入，没选中则加入）
        for (var i = 0; i < obj.length; i++){
            if (obj[i].type == 'menu'){  //所有的菜单先加入
                resourceName.push(obj[i].text);
                resourceId.push(obj[i].id);
                nodeId.push(obj[i].nodeId);
            }
        }
        for (var i = 0; i < obj.length; i++){
            if (obj[i].type == 'button' && nodeId.indexOf(obj[i].parentId) == -1) { //按钮，并且它的菜单没被选中
                resourceName.push(obj[i].text);
                resourceId.push(obj[i].id);
            }
        }
        $("#resourceNames").val(resourceName.join(","));
        $("#resourceIds").val(resourceId.join(","));
        $("#treeView-panel").hide();
        return;
    }

</script>
</body>
</html>
