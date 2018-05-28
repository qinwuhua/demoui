<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾毁恢复</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>

	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('xmnf','项目年份',new Date().getFullYear());
			//loadBmbm3('gcfl','养护大中修工程分类');
			loadjhxdwh("jhxdwh",'gs_zhhf');
			
			//YMLib.Var.jdbs=2;
			queryXmlist();
			
			
		});
		function queryXmlist(){
			
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			var jsxz="灾毁恢复";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var params={'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh
			};
	
			loadTj();
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/jhcx/queryXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-155,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'cz',title:'操作',width:130,align:'center',
							formatter: function(value,row,index){
								var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','gs_zhhf','jhcx'"+')" >项目详情</a>'
									return result;
							}
							},
							{field:'xmnf',title:'项目年份',width:60,align:'center'},
							{field:'xmbm',title:'项目编码',width:110,align:'center'},
							{field:'xmmc',title:'项目名称',width:400,align:'center'},
							{field:'gydw',title:'管养单位',width:180,align:'center'},
							{field:'xzqh',title:'行政区划',width:100,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:280,align:'center'}
			    ]]
			}); 
		}
		
		
		function loadTj(){
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			var jsxz="灾毁恢复";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var params={'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/jhcx/getTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#xdzbz").html(msg.xdzbz);$("#xdbb").html(msg.xdbb);$("#xdsb").html(msg.xdsb);$("#xddf").html(msg.xddf);
					$("#dwzbz").html(msg.dwzbz);$("#dwbb").html(msg.dwbb);$("#dwsb").html(msg.dwsb);$("#dwdf").html(msg.dwdf);
					$("#bfzbz").html(msg.bfzbz);$("#bfbb").html(msg.bfbb);$("#bfsb").html(msg.bfsb);$("#bfdf").html(msg.bfdf);
					$("#tjzbz").html(msg.tjzbz);$("#tjbb").html(msg.tjbb);$("#tjsb").html(msg.tjsb);$("#tjdf").html(msg.tjdf);
				}
			});
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
		<div id="p_top">计划查询>&nbsp;普通国省道>&nbsp;灾毁恢复</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:4px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="28">
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:165px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 80px;"></select></td>
								<td align="right">项目编码：</td>
        						<td><input name="xmbm" type="text" id="xmbm" style="width:140px;" /></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
<!--         						<td align="right">建设性质：</td> -->
<!-- 								<td><select name="gcfl" id="gcfl" style="width:80px;" ></select></td> -->
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<table>
                   			<tr>
	                		<td colspan="2">共有项目【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】个。</td>
	                		</tr>
                   			<tr>
	                		<td>下达补助【<span id="xdzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="xdbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="xdsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="xddf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">到位补助【<span id="dwzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="dwbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="dwsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="dwdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
	                		<tr>
	                		<td>拨付补助【<span id="bfzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="bfbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="bfsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="bfdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">调剂补助【<span id="tjzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="tjdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
                   		</table>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
