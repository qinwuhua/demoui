<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾毁重建项目</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			//根据用户等级展示按钮
			if(userPanduan($.cookie("unit2"))=="省"){
				$.each($("img[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("img[name='dishi']"),function(index,item){
					$(item).hide();
				});
			}else if(userPanduan($.cookie("unit2"))!="省"){
				$.each($("img[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("img[name='dishi']"),function(index,item){
					$(item).show();
				});
			}
			loadTsdq("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit")); 
			loadBmbm2('jsdj','技术等级');
			YMLib.Var.jdbs=1;
			if(userPanduan($.cookie("unit2"))!="省"){
				loadBmbm2('sqzt','申请状态地市');
			}else{
				loadBmbm2('sqzt','申请状态省');
			}
			queryShxm();
			
		});
		function queryShxm(){
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsq.do";
			var params={'xmlx':5,'gydwdm':getgydw('gydw'),'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValue"),'sqzt':-1,
					'jdbs':YMLib.Var.jdbs,'lsjl':$('#lsjl').combobox("getValue")};
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			grid.queryParams=params;
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.ylxbh+"'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/shxm_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{field:'lsjl',title:'是否有历史记录',width:150,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center'},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'ylxbh',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'lc',title:'里程',width:100,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{field:'gq',title:'工期',width:100,align:'center'},
				{field:'ntz',title:'拟投资',width:100,align:'center'}]];
			gridBind(grid);
		}
		function openSh(){
			openWindow("shxmadd","添加灾毁重建项目","shxmAdd.jsp",980,400);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;灾毁重建项目管理</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        <tr>
        	<td align="left" style="padding-left: 10px; padding-right: 10px;">
        		<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
	       			<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
	       				<font style="color: #0866A0; font-weight: bold"></font>
	      			</legend>
	       			<div>
	       				<p style="margin:8px 0px 8px 20px;">
	       					<span>管养单位：</span>
	       					<select id="gydw" style="width:237px;"></select>
	       					<span>&nbsp;行政区划：</span>
	       					<select id="xzqh" style="width:170px;"></select>
	       					<span>&nbsp;特殊地区：</span>
							<select name="tsdq" class="easyui-combobox" id="tsdq" style="width:150px;"></select>
	       				</p>
	       				<p style="margin:8px 0px 8px 20px;">
	       					<span>项目名称：</span>
	       					<input name="xmmc" id="xmmc" style="width:80px;" type="text"/>
							<span>&nbsp;技术等级:</span>
							<select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select>
							<span>&nbsp;上报状态：</span>
	      					<select id="sqzt" class="easyui-combobox" name="jhzt" style="width: 70px;"></select>
	      					<span>&nbsp;历史记录：</span>
       						<select id="lsjl" class="easyui-combobox" style="width: 70px;">
       							<option value="" selected="selected">全部</option>
       							<option value="是">是</option>
       							<option value="否">否</option>
       						</select>
							<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
							<img id="tj" name="dishi" alt="添加" onclick="openSh()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/>
							<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
							<img id="sc" name="dishi" alt="删除" onclick="deleteSh()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'">
							<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
			                <img id="th" name="sheng" alt="退回" onclick="" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'"/>
	       				</p>
	       			</div>
	       		</fieldset>
        	</td>
        </tr>
        <tr>
            <td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            	<div><table id="grid"></table></div>
    		</td>
    	</tr>
	</table>
</body>
</html>