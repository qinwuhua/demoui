<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadTsdq("tsdq");
			loadBmbm2('yjsdj','技术等级');
			loadBmbm2('gjhjsdj','技术等级');
			loadBmbm2('gldj','公路等级');
			queryLmsj();
		});
		function queryLmsj(){
			grid.id="grid";
			grid.url="../../../qqgl/queryCbsj.do";
			var params={'cbsj.xmlx':1,'cbsj.xzqhdm':getxzqhdm('xzqh'),'cbsj.ghlxbh':$('#txtlxbm').val(),
					'cbsj.xjsdj':$('#yjsdj').combo("getValue"),'cbsj.jsjsdj':$('#gjhjsdj').combo("getValue"),
					'cbsj.sbzt':-1,'cbsj.shzt':-1};
			if($('#sbzt').combo("getText")=="未上报"){
				params['cbsj.sbzt']=0;
			}else if($('#sbzt').combo("getText")=="已上报"){
				params['cbsj.sbzt']=1;
				params['cbsj.shzt']=0;
			}else if($('#sbzt').combo("getText")=="已审核"){
				params['cbsj.shzt']=1;
			}
			grid.queryParams=params;
			grid.height=$(window).height()-180;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result="";
						if(row.sbzt==0){
							result='<a href="javascript:openWindow('+"'lmsjedit'"+','+"'升级改造工程项目'"+','+
								"'/jxzhpt/page/qqgl/cbsj/lmsj_edit.jsp'"+',980,400)" style="color:blue;">编辑</a>';
						}else{
							result='<a style="color:black;">编辑</a>';
						}
						result+='&nbsp;|&nbsp;<a href="javascript:openWindow('+"'lmsjxx'"+','+"'升级改造工程项目'"+','+
								"'/jxzhpt/page/qqgl/cbsj/lmsj_xx.jsp'"+',980,400)" style="color:blue;">详细</a>';
						return result;
					}
				},
				{field:'sbzt',title:'上报状态',width:100,align:'center',
					formatter: function(value,row,index){
						var result="";
						if(row.sbzt==0){
							result="未上报";
						}else if(row.sbzt==1){
							result = row.shzt==1 ? "已审核" : "已上报";
						}
						return result;
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center'},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'ghlxbh',title:'规划路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'jsxz',title:'建设性质',width:150,align:'center'},
				{field:'lj',title:'路基（m3）',width:100,align:'center'},
				{field:'ql',title:'桥梁(延米/座)',width:100,align:'center'},
				{field:'hd',title:'涵洞（(米/座)）',width:100,align:'center'},
				{field:'mc',title:'面层（类型/公里）',width:100,align:'center'},
				{field:'jc',title:'基基（公里）',width:100,align:'center'},
				{field:'dc',title:'垫基（公里）',width:100,align:'center'},
				{field:'sd',title:'隧道（延米/座）',width:100,align:'center'},
				{field:'dq',title:'大桥(名称/长度/单跨)',width:150,align:'center'},
				{field:'sdmc',title:'隧道(名称/双幅长度/类型)',width:150,align:'center'},
				{field:'kgsj',title:'开工时间',width:100,align:'center'},
				{field:'wgsj',title:'完工时间',width:100,align:'center'},
				{field:'gq',title:'工期',width:100,align:'center'},
				{field:'sjdw',title:'设计单位',width:100,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'pfsj',title:'批复时间',width:100,align:'center'},
				{field:'jaf',title:'建安费',width:100,align:'center'}]];
			gridBind(grid);
		}
		function deleteLmsj(){
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/deleteCbsjByXmbm.do',
					data:'cbsj.xmlx='+1+'&cbsj.xmbm='+xmbm,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("删除成功!");
							queryLmsj();
						}
					}
				});
			}else{
				alert("请选择要删除的信息！");
			}
		}
		function batchSb(){
			if(selArray.length!=0){
				var xmbm="",sbzt="",shzt="";
				var sels =$('#grid').datagrid("getSelections");
				$.each(sels,function(index,item){
					if(index==sels.length-1){
						xmbm+=item.xmbm;
						sbzt+="1";
					}else{
						xmbm+=item.xmbm+",";
						sbzt+="1,";
					}
				});
				$.ajax({
					type:'post',
					url:'../../../qqgl/shCbsjByXmbm.do',
					data:'xmlx='+1+'&xmbm='+xmbm+'&sbzt1='+sbzt,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("上报成功!");
							queryLmsj();
						}
					}
				});
			}else{
				alert("请选择要审核的信息！");
			}
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;初步设计或施工图设计申请>&nbsp;升级改造工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:160px;"></select>
        						<span>&nbsp;规划路线编码：</span>
        						<input name="txtlxbm" type="text" id="txtlxbm" style="width:100px;" />
								<span>&nbsp;原技术等级：</span>
								<select name="yjsdj" id="yjsdj" class="easyui-combobox" style="width:70px;"></select>
								<span>&nbsp;建设技术等级：</span>
								<select name="yjsdj" id="gjhjsdj" class="easyui-combobox" style="width:70px;"></select>
								<span>&nbsp;是否有补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:69px;">
									<option value="" selected="selected">全部</option>
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>&nbsp;特殊地区：</span>
								<select name="tsdq" id="tsdq" class="easyui-combobox" style="width:160px;"></select>
								<span>&nbsp;上报状态：</span>
        						<select id="sbzt" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="-1">全部</option>
									<option value="0">未上报</option>
									<option value="1">已上报</option>
									<option value="4">已审核</option>
								</select>
								<img onclick="queryLmsj()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
								<img onclick="batchSb()" id="btnShangbao" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img onclick="deleteLmsj()" alt="删除" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<!-- <tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold; color: #FF0000">0</span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
