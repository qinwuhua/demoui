<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公路水毁抢修人财物投入情况</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/trqk.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">

$(function(){
	$("#jsgl_table").datagrid({
		border : true,
		fit : true,
		//fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectJsList.do',
		queryParams : {
			'param.name' : $('#jsgl_name').val(),
			'param.descr' : $("#jsgl_descr").val()
		},
		striped : true,
		singleSelect : false,
		columns:[[
		    {title:'操作',width:200,rowspan:2,align:'center'},
			{title:'单位',width:300,rowspan:2,align:'center'},
			{title:'抢修人数(工日)',width:300,rowspan:2,align:'center'},
			{title:'材料',width:600,colspan:6,align:'center'},
			{title:'设备(台班)',width:400,colspan:5,align:'center'},
			{title:'投入抢修经费(万元)',width:300,rowspan:2,align:'center'},
			{title:'填报时间',width:300,rowspan:2,align:'center'},
			{title:'填报单位',width:300,rowspan:2,align:'center'},
			{title:'统计人',width:300,rowspan:2,align:'center'},
			{title:'审核人',width:300,rowspan:2,align:'center'}
		],[
			{title:'沥青(吨)',width:100,align:'center'},
			{title:'水泥(吨)',width:100,align:'center'},
			{title:'沙石(立方)',width:100,align:'center'},
			{title:'编织袋(个)',width:100,align:'center'},
			{title:'工业盐(吨)',width:100,align:'center'},
			{title:'沥青冷补料',width:100,align:'center'},
			{title:'挖掘机 	',width:100,align:'center'},
			{title:'装载机',width:100,align:'center'},
			{title:'自卸汽车',width:100,align:'center'},
			{title:'抽水台班',width:100,align:'center'},
			{title:'设备台班小计',width:100,align:'center'}
		]]
	});
});

$(function(){
	$("#ddlYear").val();
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1; 
	for(var x=y;x>=2010;x--){
		$("#ddlYear").append("<option value="+x+">"+x+"</option>");
	}
	$("#yf"+m).attr("selected","selected");
});
</script>
<div style="width:100%;">
    <div  style="height:104px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;灾毁情况统计>&nbsp;公路水毁抢修人财物投入情况</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
 						<span>管养单位：</span>
 						<select id="unit" style="width:150px;">
 						</select>
 						<span>上报年份：</span>
        				<select name="ddlYear" id="ddlYear" style="width: 60px;">
						</select>
						<span>上报月份：</span>
						<select name="ddlMonth" id="ddlMonth">
							<option id="yf1" value="1">01</option>
							<option id="yf2" value="2">02</option>
							<option id="yf3" value="3">03</option>
							<option id="yf4" value="4">04</option>
							<option id="yf5" value="5">05</option>
							<option id="yf6" value="6">06</option>
							<option id="yf7" value="7">07</option>
							<option id="yf8" value="8">08</option>
							<option id="yf9" value="9">09</option>
							<option id="yf10" value="10">10</option>
							<option id="yf11" value="11">11</option>
							<option id="yf12" value="12">12</option> 
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="false" iconCls="icon-search">查　询</a>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="false" iconCls="icon-add" onclick="trqkadd()">添加</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="false" iconCls="icon-excel">导出Excel</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div style="height:500px;margin:5px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>