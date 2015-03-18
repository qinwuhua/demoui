<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配管理</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">

$(function(){
	$("#ddlYear").val();
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1; 
	for(var x=y;x>=2010;x--){
		$("#ddlYear").append("<option value="+x+">"+x+"</option>");
	}
	$("#yf"+m).attr("selected","selected");
	showAll();
});
function showAll(){
	var gydw=$.cookie("unit");
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	var tiaojian=nf+"-"+yf;
	$("#jsgl_table").datagrid({
		border : true,
		fit:true,
		loadMsg : '正在加载请稍候...',
		url:'/jxzhpt/wjxt/selectYbbList.do',
		queryParams : {
			gydw:gydw,
	    	nian:nf,
	    	yue:yf
		},
		striped : true,
		singleSelect : false,
		columns:[[
				    {field:'v_0',title:'分局(道班名称)',width:200,rowspan:2,align:'center'},
					{title:'整修路肩、边坡',width:120,align:'center'},
					{title:'开挖、清理边沟',width:120,align:'center'},
					{title:'石砌边沟修复',width:120,align:'center'},
					{title:'回填路基缺口',width:120,align:'center'},
					{title:'清理塌方',width:120,align:'center'},
					{title:'路基翻浆处理',width:120,align:'center'},
					{title:'增、修挡土墙',width:120,align:'center'},
					{title:'清理路面垃圾',width:120,align:'center'},
					{title:'路面清扫',width:120,align:'center'},
					{title:'修补油路坑槽',width:120,align:'center'},
					{title:'水泥路面灌缝',width:120,align:'center'},
					{title:'修复水泥砼路面',width:120,align:'center'},
					{title:'沥青灌缝（裂缝）',width:120,align:'center'},
					{title:'路面除冰',width:120,align:'center'},
					{title:'砂石路面扫砂/加砂',width:120,align:'center'},
					{title:'路缘带刷白',width:120,align:'center'},
					{title:'除草',width:120,align:'center'},
					{title:'花木浇灌',width:120,align:'center'},
					{title:'花木整枝、灭虫',width:120,align:'center'},
					{title:'路树整枝、灭虫',width:120,align:'center'},
					{title:'苗木补植',width:120,align:'center'},
					{title:'路树刷白',width:120,align:'center'},
					{title:'埋置示警桩',width:120,align:'center'},
					{title:'埋置公里桩/百米桩',width:120,align:'center'},
					{title:'公里桩/百米桩刷漆',width:120,align:'center'},
					{title:'油漆示警桩',width:120,align:'center'},
					{title:'油漆轮廓桩',width:120,align:'center'},
					{title:'油漆防护栏板',width:120,align:'center'},
					{title:'维护防护栏板',width:120,align:'center'},
					{title:'疏通泄水孔',width:120,align:'center'},
					{title:'安装栏板',width:120,align:'center'},
					{title:'油漆防护栏板',width:120,align:'center'},
					{title:'清理伸缩缝',width:120,align:'center'},
					{title:'桥面小型维修',width:120,align:'center'},
					{title:'油漆桥梁栏杆',width:120,align:'center'},
					{title:'桥栏刷白',width:120,align:'center'},
					{title:'涵洞洞口维修',width:120,align:'center'},
					{title:'清除涵洞',width:120,align:'center'},
					{title:'道班内业整理',width:120,align:'center'},
					{title:'交通量调查',width:120,align:'center'}
					
				],[
					{field:'v_1',title:'m2/m',width:120,align:'center'},
					{field:'v_2',title:'m',width:120,align:'center'},
					{field:'v_3',title:'m3/m',width:120,align:'center'},
					{field:'v_4',title:'m3/m',width:120,align:'center'},
					{field:'v_5',title:'m3/处',width:120,align:'center'},
					{field:'v_6',title:'m2/km',width:120,align:'center'},
					{field:'v_7',title:'m3/km',width:120,align:'center'},
					{field:'v_8',title:'m3',width:120,align:'center'},
					{field:'v_9',title:'m2/km',width:120,align:'center'},
					{field:'v_10',title:'m2/km',width:120,align:'center'},
					{field:'v_11',title:'m2',width:120,align:'center'},
					{field:'v_12',title:'m2',width:120,align:'center'},
					{field:'v_13',title:'m/km',width:120,align:'center'},
					{field:'v_14',title:'m2/km',width:120,align:'center'},
					{field:'v_15',title:'m3/km',width:120,align:'center'},
					{field:'v_16',title:'m',width:120,align:'center'},
					{field:'v_17',title:'m2',width:120,align:'center'},
					{field:'v_18',title:'m2',width:120,align:'center'},
					{field:'v_19',title:'m2',width:120,align:'center'},
					{field:'v_20',title:'株/km',width:120,align:'center'},
					{field:'v_21',title:'株/km',width:120,align:'center'},
					{field:'v_22',title:'株/km',width:120,align:'center'},
					{field:'v_23',title:'根',width:120,align:'center'},
					{field:'v_24',title:'个',width:120,align:'center'},
					{field:'v_25',title:'个',width:120,align:'center'},
					{field:'v_26',title:'根',width:120,align:'center'},
					{field:'v_27',title:'根',width:120,align:'center'},
					{field:'v_28',title:'m',width:120,align:'center'},
					{field:'v_29',title:'m/处',width:120,align:'center'},
					{field:'v_30',title:'个/座',width:120,align:'center'},
					{field:'v_31',title:'m/座',width:120,align:'center'},
					{field:'v_32',title:'m3/座',width:120,align:'center'},
					{field:'v_33',title:'m/座',width:120,align:'center'},
					{field:'v_34',title:'m2/座',width:120,align:'center'},
					{field:'v_35',title:'m/座',width:120,align:'center'},
					{field:'v_36',title:'m/座',width:120,align:'center'},
					{field:'v_37',title:'m3/道',width:120,align:'center'},
					{field:'v_38',title:'m3/道',width:120,align:'center'},
					{field:'v_39',title:'工日',width:120,align:'center'},
					{field:'v_40',title:'工日',width:120,align:'center'}
				]]
	});
}
function export_ybb(){
	var gydw=$.cookie("unit");
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	var data="gydw="+gydw+"&nian="+nf+"&yue="+yf;
	window.location.href="/jxzhpt/wjxt/export_ybb.do?"+data;
}
</script>
<div style="width:100%;">
    <div  style="height:84px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;道班养护>&nbsp;公路养护小修保养月报表</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
 						<span>年份：</span>
 						<select name="ddlYear" id="ddlYear" style="width: 60px;">
						</select>
 						<span>月份：</span>
 						<select name="ddlMonth" id="ddlMonth" style="width: 43px;">
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
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="showAll()">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="export_ybb()">导出Excel</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div style="height:430px;margin:5px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>