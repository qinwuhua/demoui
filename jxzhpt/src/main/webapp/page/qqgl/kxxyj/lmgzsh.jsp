<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/kxxyj/js/kxxyj.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<script type="text/javascript">
		$(function(){
			tsdqdx("tsdq");
			if($.cookie("unit2").length!=7){
				//alert($.cookie("unit2").length);
				title='上报状态';
				$("#shenPi,#thxj,#thwsh").attr('style','display:none');
				$('#sqzttext').html('上报状态');
				$("#sqzt1").attr('style','display:none');
				$("#sqzt2").attr('style','');
			}else{
				title='审核状态';
				$('#sqzttext').html('审核状态');
				$("img[name='bxs']").attr('style','');
				$("#shangbao").attr('style','display:none');
				$("#sqzt1").attr('style','');
				$("#sqzt2").attr('style','display:none');
			}
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadGldj('gldj');
			//tsdq("tsdq");
			//xmnf("xmnf");
			//loadBmbm3('lsxmlx','历史项目类型');  
			loadBmbm3('lsxmnf','历史项目年份');  
			loadBmbm3('lsxmlx','历史项目类型');
			urlxmnf("xmnf",getUrlParame('id'));
			//showAlllmsh();
			setTimeout("showAlllmsh()",'1700');
		});
		
		function shangB(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要审核项目！");
				return;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].sbzt1=='1'){
					alert("对不起，项目已审核！");
					return;
				}
			}
			if($.cookie("unit2").length!=7) {
				alert("您无审核项目权限！");
				return;
			}
			var id=rows[0].id;
			var xmbm=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
				xmbm+=","+rows[i].xmbm ;
			}
			if(confirm('您确定审核该项目？')){
				var data = "lxsh.id="+id+"&lxsh.xmbm="+xmbm;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/shlmgzkxx.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 alert('审核成功！');
							 $("#datagrid").datagrid('reload');
						 }else{
							 alert('审核失败,请选择要上报项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
			}
		} 
		
		function tuiHui(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回项目！");
				return;
			}
			if($.cookie("unit2").length!=7){
				alert("您不是省级用户");
				return;
			}
			var id=rows[0].id;
			var xmbm=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				xmbm+=","+rows[i].xmbm;
			}
			for(var i=0;i<rows.length;i++){
			if(rows[i].sbzt1=='1'){
				//
				var data = "lxsh.xmbm="+xmbm;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/lmgzsfcb.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 if(confirm('您确定将该项目退回未审核状态？')){
										$.ajax({
											 type : "POST",
											 url : "/jxzhpt/qqgl/thLmgzkxx1.do",
											 dataType : 'json',
											 data : data,
											 success : function(msg){
												 if(msg){
													 alert('退回成功！');
													 $("#datagrid").datagrid('reload');
												 }else{
													 alert('退回失败！');
												 }
											 },
											 error : function(){
												 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
											 }
										});
								}
							 
						 }else{
							 alert('项目已经进行初步设计上报，无法退回！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
				
				//
				return;
			}
			if(rows[i].tbbmbm==$.cookie("unit")){
				alert("对不起，由您添加的项目无法退回！");
				return;
			}
			}	
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			var sbthcd=0;
			sbthcd=$.cookie("unit2").length+2;
			var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
			if(confirm('您确定退回该项目？')){
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/thLmgzkxx.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('退回成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('退回失败！');
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
			}
		}
	</script>
			<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;工程可行性研究报告>&nbsp;<span id="bstext"></span>>&nbsp;路面改造工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99%; text-align: left; vertical-align: middle;padding-bottom:7px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
        						<!-- <td>管养单位：</td>
        						<td colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td> 
        						<td>行政区划：</td>
        						<td colspan="3" style="width:220px;"><select id="xzqh" style="width:220px;"></select></td>
        						<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
        						<td>建设技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox"></select></td>-->
								<td align="right">行政区划：</td>
        						<td colspan="3" ><select id="xzqh" style="width:260px;"></select></td>
        						<td align="right">项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td align="right">建设技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:77px;" class="easyui-combobox"></select></td>
								<td align="right">现技术等级：</td>
								<td><select name="jsjsdj" id="jsjsdj" style="width:65px;" class="easyui-combobox"></select></td>
								 
        					</tr>
        					<tr height="32">
        						
        						<!-- <td>审核状态：</td>
        						<td><select id="sbzt" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option>
								</select></td> 
								<td>技术等级：</td>
								<td><select name="jsjsdj" id="jsjsdj" style="width:65px;" class="easyui-combobox"></select></td>
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:88px;" ></select></td>
        						<td>原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
        						<td>是否有历史记录：</td>
        						<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td> -->
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width:72px;">
								</select></td>
								<td align="right">行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:80px;" class="easyui-combobox"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
								<td align="right">原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:75px;" /></td>
        						<td align="right">规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:60px;" /></td>
        						
        					</tr>
        					<tr height="32">
        					
        					<td align="right">规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:70px;" /></td>
        						<td align="right">是否有历史记录：</td>
        						<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:97px;" ></select></td>
								<td align="right"><span id='sqzttext'>审核状态：</span>   </td>
        						<td>
        						<span id='sqzt1'>
        						<select id="shzt"  style="width:77px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option> 
								</select>
        						</span>
        						<span id='sqzt2' >
        						<select id="sbzt"  style="width:77px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未上报</option>
									<option value="1">已上报</option> 
								</select>
        						</span>
								
								</td>
        						<td align="right">项目库类型：</td>
								<td>
									<select id='xmklx' class="easyui-combobox" style="width: 65px;">
										<option value="">请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
									</select>
								</td>
                             </tr>
							<tr height="32">
							<!-- 筛选历史条件 -->
								<td align="right">历史项目类型：</td>
								<td>
									<select id='lsxmlx' class="easyui-combobox" style="width: 70px;">
									</select>
								</td>
								<td align="right">历史计划年份：</td>
								<td>
									<select id='lsxmnf' class="easyui-combobox" style="width: 80px;">
									</select>
								</td>
								</tr>
								<td colspan="10">
        						<img onclick="showAlllmsh()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
<!--         						<img   id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="dckxxModule('lmgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" /> -->
								<img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="dckxxModule('lmgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
<!-- 								<img id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importlmgzkxx('lmgzsh')" style="border-width:0px;vertical-align:middle;" /> -->
								<img  id="shangbao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangbaokxx();" style="border-width:0px;vertical-align:middle;" />
								<img onclick="shangB();"  id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" style="border-width:0px;vertical-align:middle;" />
								<img id="thxj" src="../../../images/thxj1.jpg" onmouseover="this.src='../../../images/thxj2.jpg'" onmouseout="this.src='../../../images/thxj1.jpg'   " src=""  onclick="rollback();" style="border-width:0px;vertical-align:middle;" />
								<img id="thwsh" src="../../../images/thwsh1.jpg" onmouseover="this.src='../../../images/thwsh2.jpg'" onmouseout="this.src='../../../images/thwsh1.jpg'   " src=""  onclick="thwshkxx();" style="border-width:0px;vertical-align:middle;" />
								</td>
							</tr>
                          </table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
<!--         	<tr> -->
<!--         		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;"> -->
<!--         			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目， -->
<!--         			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。 -->
<!--         		</td> -->
<!--         	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            		<div>
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<!-- <div id="abgc_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="abgc_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
