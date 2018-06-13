<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公路建设资金使用情况明细表</title>
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
		loadUnit1("gydw",$.cookie("unit"));
		loadBmbm('nf','项目年份',new Date().getFullYear());
		var yf=new Date().getMonth()+1;
		var day=new Date().getDate();
		if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
		loadBmbm3('xmnf','项目年份',new Date().getFullYear());
 		loadBmbm3('xmlx','报表项目类型');
 		$(".n").html($("#nf").combo('getValue'));
		$(".sn").html($("#nf").combo('getValue')-1);
		$(".ssn").html($("#nf").combo('getValue')-2);
		$(".sssn").html($("#nf").combo('getValue')-3);
		if($.cookie('unit')=='36'){
			 $("#sfxszrc2").attr("checked","checked");  
			  $("#sfxszrc1").removeAttr("checked");  
		}else{
			 $("#sfxszrc1").attr("checked","checked");  
			 $("#sfxszrc2").removeAttr("checked");  
		}
		//showBb();
	});
		
	var datalist="";var k=0;
	function showBb(){
		
		var tbody = $("#bblist");
				tbody.empty();

		loadjzt();
		var xzqhdm=$("#gydw").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		
		var nf=$("#nf").combobox('getValue');
		$(".n").html($("#nf").combo('getValue'));
		$(".sn").html($("#nf").combo('getValue')-1);
		$(".ssn").html($("#nf").combo('getValue')-2);
		$(".sssn").html($("#nf").combo('getValue')-3);
		var gydw="";if($.cookie('unit').substr(0,1)=='1') gydw='1';if($.cookie('unit').substr(0,1)=='2') gydw='2';
		$("#sn").html($("#nf").combo('getValue')-1);
		$("#ssn").html($("#nf").combo('getValue')-2);
		$.ajax({
			url:"/jxcsxm/tjbb/getZjsymxb.do",
			data:'flag=0&nf='+nf+"&gydw="+xzqhstr+"&yf="+$("#yf").combobox('getValue')
			+"&xmlx="+getValuesById("xmlx")
			+"&xmnf="+getValuesById("xmnf")+"&sfxszrc="+$("input[name='sfxszrc']:checked").val(),
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalists=msg;
				disLoadjzt();
				if (msg != null) {
					k=0;
					datalist=JSON.stringify(msg);
					
					for ( var i = 0; i < msg.length; i++) {
						var tr="";
						if(msg[i].sfhj=='是')
						tr="<tr height='28' style='background: #FFF5EE;font-weight: 800;'>";
						else
						tr="<tr height='28'>";
						tr+="<td>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"
						+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
						+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"
						+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td>"
						+"<td>"+msg[i].v_8+"</td>"+"<td>"+msg[i].v_9+"</td>"
						+"<td>"+msg[i].v_10+"</td>"+"<td>"+msg[i].v_11+"</td>"
						+"<td>"+msg[i].v_12+"</td>"+"<td>"+msg[i].v_13+"</td>"
						+"<td>"+msg[i].v_14+"</td>"+"<td>"+msg[i].v_15+"</td>"
						+"<td>"+msg[i].v_16+"</td>"+"<td>"+msg[i].v_17+"</td>"
						+"<td>"+msg[i].v_18+"</td>"+"<td>"+msg[i].v_19+"</td>"
						+"<td>"+msg[i].v_20+"</td>"+"<td>"+msg[i].v_21+"</td>"
						+"<td>"+msg[i].v_22+"</td>"+"<td>"+msg[i].v_23+"</td>"
						+"<td>"+msg[i].v_24+"</td>"+"<td>"+msg[i].v_25+"</td>"
						+"<td>"+msg[i].v_26+"</td>"+"<td>"+msg[i].v_27+"</td>"
						+"<td>"+msg[i].v_28+"</td>"+"<td>"+msg[i].v_29+"</td>"
						+"<td>"+msg[i].v_30+"</td>"+"<td>"+msg[i].v_31+"</td>"
						+"<td>"+msg[i].v_32+"</td>"+"<td>"+msg[i].v_33+"</td>"
						+"<td>"+msg[i].v_34+"</td>"+"<td>"+msg[i].v_35+"</td>"
						+"<td>"+msg[i].v_36+"</td>"+"<td>"+msg[i].v_37+"</td>"+"<td>"+msg[i].v_38+"</td>"
						+"<td>"+msg[i].v_39+"</td>"+"<td>"+msg[i].v_40+"</td>";
						tr+="</tr>";
						tbody.append(tr);
					}
					if(msg.length==1000){
						var tr="<tr height='28'><td colspan='36'>数据太多，请导出表格查看...</td></tr>";
						tbody.append(tr);
					}
					
				}
			}
		});
	}
	
	function exportBb(){
		if(datalist==""){
			alert("请您先查询报表数据");
			return;
		}
		
		var xzqhdm=$("#gydw").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		
		var nf=$("#nf").combobox('getValue');
		var gydw="";if($.cookie('unit').substr(0,1)=='1') gydw='1';if($.cookie('unit').substr(0,1)=='2') gydw='2';
		var data="flag=1&nf="+nf+"&bbsj="+$("#nf").combobox('getValue')+"-"+$("#yf").combobox('getValue')+"&gydw="+$.cookie("truename")
		//+"&xmlx="+getValuesById("xmlx")
		;
		loadjzt();
		 $.post('/jxcsxm/xtgl/exportBb_set.do',{gydw:xzqhstr},function(){
			window.location.href='/jxcsxm/tjbb/getZjsymxb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',30000);
		
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
					<div id="righttop" style="width:4020px;">
						<div id="p_top">当前位置>&nbsp;统计报表>&nbsp;公路建设资金使用情况明细表</div>
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
					
								<tr height="28" >
									<td align="right">管养单位：</td>
	        						<td><select id="gydw" style="width:165px;"></select></td>
	        						
        							<td align="right">计划年份：</td>
        							<td><select id="xmnf" style="width: 80px;"></select></td>
        							<td align="right">是否显示自然村明细：</td>
        							<td>
	        							<span class="radioSpan">
	        								<input type="radio" name="sfxszrc" value="Y"  id='sfxszrc1'>是</input>
							                <input type="radio" name="sfxszrc" value="N" id='sfxszrc2'>否</input>
							            </span>
        							</td>
       							</tr>
        					<tr height="28">
        							<td align="right">项目类型：</td>
        							<td><select id="xmlx" style="width: 165px;"></select></td>
									<td align="right">报表年份：</td>
        							<td><select id="nf" style="width: 80px;"></select></td>
									<td align="right">报表月份：</td>
        							<td><select id="yf" style="width: 80px;"></select></td>
        							
        							
								</tr>
        					
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:showBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
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
                	<div id="gddiv" style="width:100%;height: 450px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:4000px;height:'+($(window).height()-160)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="100%">
								<caption align="top" style="font-size:large;font-weight: bolder;"> 公路建设资金使用情况明细表</caption>
								<tbody id='biaotou'>
									<tr>
									<td colspan="13">投资计划</td>
									<td colspan="28">资金</td>
									</tr>
									<tr>
									<td rowspan="3">序号</td>
									<td rowspan="3">项目单位</td>
									<td rowspan="3">项目名称</td>
									<td rowspan="3">计划文号</td>
									<td colspan="4">以前年度计划</td>
									<td colspan="4">本年计划</td>
									<td rowspan="3">合计</td>
									<td colspan="7">结转</td>
									<td colspan="4">本年拨入</td>
									<td colspan="4">本年拨出</td>
									<td colspan="8">当年结存</td>
									<td colspan="4">调剂</td>
									<td rowspan="3">备注</td>
									</tr>
									<tr>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">小计</td>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">小计</td>
									
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">合计</td>
									
									<td colspan="3">其中</td>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">合计</td>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">合计</td>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">合计</td>
									<td colspan="4">其中</td>
									<td rowspan="2">部补</td>
									<td rowspan="2">省补</td>
									<td rowspan="2">地方</td>
									<td rowspan="2">合计</td>
									</tr>
									<tr>
									<td><span class='sssn'></span>及以前</td>
									<td><span class='ssn'></span></td>
									<td><span class='sn'></span></td>
									<td><span class='sssn'></span>及以前</td>
									<td><span class='ssn'></span></td>
									<td><span class='sn'></span></td>
									<td><span class='n'></span></td>
									</tr>
									
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
