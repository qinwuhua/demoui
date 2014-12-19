<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理灾害防治项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript">
$(function(){
	$("#grid").datagrid({    
		url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
	    columns:[[    
	        {field:'code',title:'代号',width:100},    
	        {field:'name',title:'名字',width:100},    
	        {field:'price',title:'价格',width:100,align:'right'}    
	    ]]    
	});  
});
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
	<table align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" background="../../../images/dht_bg.jpg"  style="padding-left: 25px; background-repeat:no-repeat; height: 25px;"width="90%">
			<font color="#1a5780" style="font-size: small">路网项目</font>&nbsp;&gt;&nbsp; 
			<font color="#1a5780" style="font-size: small">项目基础库管理</font>&nbsp;&gt;&nbsp; 
			<font color="#5C5C5C" style="font-size: small">安保工程项目管理</font></td>
		</tr>
		<tr>
			<td align="left" style="padding-left:10px; padding-right:25px;">
				<fieldset style="width:1900px;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				<font style="color: #0866A0; font-weight: bold">项目信息：</font>
				</legend>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-left: 20px">
						<tbody>
							<tr>
							  <td align="right" width="80px" >管养单位：
                              </td>
                              <td align="left" colspan="3"  style="width:270px">
                              	<select id="cc" class="easyui-combobox" style="width:268px">
                              		<option>===请选择===</option>
                              		<option>嘿嘿</option>
                              	</select>
                              </td>
                              <td align="right" width="80px" >行政区划：
                              </td>
                              <td align="left" colspan="3" style="width: 270px;">
                              	<select id="ss" class="easyui-combobox" style="width:268px">
                              		<option>===请选择===</option>
                              		<option>嘿嘿</option>
                              	</select>
                              </td>
                               <td align="right" width="80px" >路线名称：
                              </td>
                              <td align="left" colspan="5"  style="width: 180px;">
                              	<input type="text" style="width:350px"/>
                              </td>
                              <td rowspan="2" align="left"  style="width:650px">
								<input type="image" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<input type="image" name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<input type="image" name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;" />
								<input type="image" name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importExcel();" style="border-width:0px;" />
                                <input type="image" name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addJck();" style="border-width:0px;" />
                                <input type="image" name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="javascript:return CheckSelect();" style="border-width:0px;" />
                                <input type="image" name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
							 </td>
                             </tr>
                             <tr>
							  <td align="right" width="80px" >项目年份：</td>
                              <td align="left"  style="width:80px">
                              	<select id="cc1" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
                              	</select>
                              </td>
                              <td align="right" width="80px" >项目状态： </td>
                              <td align="left" style="width: 80px;">
                              	<select id="ss1" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select>
                              </td>
                               <td align="right" width="80px" >审核状态：</td>
                              <td align="left"  style="width: 80px;">
                              	<select id="ss2" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
                              	</select>
                              </td>
                              <td align="right" width="80px" >审查状态：</td>
                              <td align="left"  style="width: 80px;">
                              	<select id="ss3" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" >全部</option>
                              		<option>已审查</option>
                              		<option>未审查</option>
                              	</select>
                              </td>
                              <td align="right" width="80px" >特殊地区：</td>
                              <td align="left" style="width: 70px;">
                              	<select id="ss4" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
                              	</select>
                              <td align="right" width="60px" >技术等级：</td>
                              <td align="left" style="width: 70px;">
                              	<select id="ss5" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="1">一级公路</option>
									<option value="2">二级公路</option>
									<option value="3">三级公路</option>
									<option value="4">四级公路</option>
									<option value="5">等外公路</option>
                              	</select></td>
                              	<td align="right" width="60px" >公路等级：</td>
                              	<td align="left" style="width: 80px;">
                              	<select id="ss6" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="G">国道</option>
									<option value="S">省道</option>
									<option value="X">县道</option>
									<option value="Y">乡道</option>
									<option value="C">村道</option>
									<option value="Z">专道</option>
                              	</select></td>
                             </tr>
                             
						</tbody>
					</table>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">3</span>&nbsp;】个灾害防治项目，
        					总里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">53.456</span>&nbsp;】公里，
        					隐患里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">15.100</span>&nbsp;】公里。</td>
        </tr>
         <tr>
        	<td style="padding-left: 10px;padding-top:5px;"width="90%" >
        		<table id="grid"  width="100%"  height="320px"></table>
        	</td>
        </tr>
		</table>
</body>
</html>