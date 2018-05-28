<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>计划执行情况表</title>
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
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #FFEBCD;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #FFEBCD;padding:3px 7px 2px 7px;}
		
		
		-->
		
		
		
	</style>
	<script type="text/javascript">
	$(function(){
		loadDist1("xzqh",$.cookie("dist"));
		loadUnit1("gydw",$.cookie("unit"));
		loadBmbm3('jhnf','项目年份',new Date().getFullYear());
		loadBmbm3('xmlx','报表项目类型');
		loadjhxdwh("jhxdwh",'gs_all');
		var nf=new Date().getFullYear()
		var yf=new Date().getMonth()+1 < 10 ? '0'+(new Date().getMonth()+1):new Date().getMonth()+1;
		var day=new Date().getDate() < 10 ? '0'+new Date().getDate():new Date().getDate();
		
		$("#bbsj").datebox("setValue",nf+"-"+yf+"-"+day);
		
	});
		
	function queryBb(){
// 		alert($("input[name='pxfs']:checked").val());
		
		
		YMLib.Var.flag='';
		openWindow("字段选择","/jxcsxm/page/tjbb/jhzxqkb_zd.jsp",500,380);

	}
	var str1="";var str2="";var datalist;
	function showBb(str){
		
		var tbody = $("#bblist");
				tbody.empty();

		loadjzt();

		var ss=str.split(",");
		
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
		
		var gydwdm=$("#gydw").combotree("getValues");
		if(gydwdm.length==0){
			gydwstr= $.cookie("unit2");
			
		}else if(gydwdm.length==1){
			if(gydwdm[0].substr(gydwdm[0].length-2,gydwdm[0].length)=="00") gydwdm[0]=gydwdm[0].substr(0,gydwdm[0].length-2);
			if(gydwdm[0].substr(gydwdm[0].length-2,gydwdm[0].length)=="00") gydwdm[0]=gydwdm[0].substr(0,gydwdm[0].length-2);
			gydwstr=gydwdm[0] ;
		}else{
			gydwstr= gydwdm.join(',');
		}
		
		var jhxdwh=$("#jhxdwh").combobox("getText");
		if(jhxdwh.substr(0,1)==',')
			jhxdwh=jhxdwh.substr(1,jhxdwh.length);
		
		var xmlx=$("#xmlx").combobox("getValues").join(",");
		if(xmlx.substr(0,1)==',')
			xmlx=xmlx.substr(1,xmlx.length);
		
		//var gydw="";if($.cookie('unit').substr(0,1)=='1') gydw='1';if($.cookie('unit').substr(0,1)=='2') gydw='2';
		
		$.ajax({
			url:"/jxcsxm/tjbb/getJhzxqkb.do",
			data:'flag=0&jhnf='+getValuesById("jhnf")+"&jhxdwh="+jhxdwh+"&xmlx="+xmlx+"&xzqhdm="+xzqhstr+"&xmmc="+$("#xmmc").val()+"&sbthcd="+$.cookie("unit2").length+"&pxfs="+$("input[name='pxfs']:checked").val()+"&gydw="+gydwstr+"&bbsj="+$("#bbsj").datebox("getValue"),
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr height='28'>";
						for ( var j = 0; j < ss.length; j++) {
							tr+="<td>"+msg[i][ss[j]]+"</td>";
						}
						tr+="</tr>";
					
						tbody.append(tr);
					}
				}
			}
		});
	}
	
	function exportBb(){
		if(str1==""||str2==""){
			alert("请您先查询报表数据");
			return;
		}
		
		
		  var data="flag=1&ssbb=jhzxqkb"+"&sbthcd="+$.cookie("unit2").length;
			loadjzt();
			 $.post('/jxcsxm/xtgl/exportBb_set.do',{nameValue:str1,colValue:str2},function(){
				window.location.href='/jxcsxm/tjbb/getJhzxqkb.do?'+data;
			 }); 
			 setTimeout('disLoadjzt()',4000);
		
		
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
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;统计报表>&nbsp;计划执行情况表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					
								<tr height="28">
									<td align="right">行政区划：</td>
	        						<td><select id="xzqh" style="width:160px;"></select></td>
									
									<td align="right">计划年份：</td>
        							<td><select id="jhnf" style="width: 100px;"></select></td>
									<td align="right">计划文号：</td>
        							<td><select id="jhxdwh" style="width: 120px;"></select></td>
									<td align="right">排序方式：</td>
        							<td>
	        							<span class="radioSpan">
	        								<input type="radio" name="pxfs" value="wh" checked="checked">文号</input>
							                <input type="radio" name="pxfs" value="xm">项目</input>
							            </span>
        							</td>
									
								
								</tr>
        					
        					<tr height="28">
        					<td align="right">管养单位：</td>
       						<td><select id="gydw" style="width:160px;"></select></td>
							<td align="right">项目类型：</td>
      						<td><select id="xmlx" style="width: 100px;"></select></td>
							<td align="right">项目名称：</td>
     							<td><input type="text" id="xmmc" style="width: 118px;"></td>
     						<td align="right">报表时间：</td>	
     							<td><input type="text"  class='easyui-datebox'  id="bbsj" style="width: 118px;"></td>
       						</tr>
        					
        					<tr height="28">
                           	<td colspan="8">
                           		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
                           		<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:exportBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">导出报表</a>
							</td>
                            </tr>
							</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 430px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-160)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="100%">
								<caption align="top" style="font-size:large;font-weight: bolder;"> 计划执行情况表</caption>
								<tbody id='biaotou'>
									
								</tbody>
								<tbody id="bblist"></tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>