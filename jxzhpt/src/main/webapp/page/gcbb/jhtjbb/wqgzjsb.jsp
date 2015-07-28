<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			setjhxdnf();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2("xzdj","公路等级");
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
				$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
			}
			//$("#yf"+m).attr("selected","selected");
			showAll();
		});
		function setjhxdnf(){
			$("#ddlYear1").combotree({    
				checkbox: true,
				async: false,
			    url: '/jxzhpt/xmjzbb/setjhxdnf.do',    
			    required: false,
			    multiple:true
			});
			
		}
		var fls=1;
		function showAll(){
			var myDate = new Date();
			var y = myDate.getFullYear();
			var nf=$("#ddlYear").val();
			var xmnf=$("#ddlYear1").combotree("getValues");
			if(fls==1){
				xmnf=y;
				fls++;
			}
			if(xmnf.length==0){
				alert("请选择项目年份");
				return;
			}
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
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
			var xzdj=$("#xzdj").combobox("getValue");
			var data="nf="+nf+"&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&xmnf="+xmnf;
			//alert(data);
			var tbody = $("#wqgzlist");
			tbody.empty();
			$.ajax({
				url:"/jxzhpt/gcybb/getWqgzjsb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
								tbody.append("<tr><td>"+(i+1)+"</td><td>"+msg[i].XIAN+"</td><td>"+msg[i].SFLXS+"</td><td>"
										+msg[i].SFPKX+"</td><td>"+msg[i].SFYZY+"</td><td>"
										+msg[i].XZQHDM+"</td><td>"+msg[i].XZQHMC+"</td><td>"
										+msg[i].LXBM+"</td><td>"+msg[i].LXMC+"</td><td>"
										+msg[i].QLZH+"</td><td>"+msg[i].QLBM+"</td><td>"
										+msg[i].QLMC+"</td><td>"+msg[i].XDSJ+"</td><td>"
										+msg[i].JHKGSJ+"</td><td>"+msg[i].JHWCSJ+"</td><td>"
										+msg[i].YJJGSJ+"</td><td>"+msg[i].QLQC+"</td><td>"
										+msg[i].QLQK+"</td><td>"+msg[i].JSXZ+"</td><td>"
										+msg[i].PFWH+"</td><td>"+msg[i].ZTZ+"</td><td>"
										+msg[i].ZYTZ+"</td><td>"+msg[i].STZ+"</td><td>"
										+msg[i].SJKGSJ+"</td><td>"+msg[i].SJWGSJ+"</td><td>"
										+msg[i].JSDW+"</td><td>"+msg[i].SJDW+"</td><td>"
										+msg[i].SGDW+"</td><td>"+msg[i].JLDW+"</td><td>"
										+msg[i].SJQLQC+"</td><td>"+msg[i].SJQLQK+"</td><td>"
										+msg[i].SFBNWC+"</td><td>"+msg[i].ZJZ+"</td><td>"
										+msg[i].ZJM+"</td><td>"+msg[i].WKGZ+"</td><td>"
										+msg[i].WKGM+"</td><td>"+msg[i].WCZTZ+"</td><td>"
										+msg[i].WCBTZ+"</td><td>"+msg[i].WCQTTZ+"</td><td>"+msg[i].BNWCTZ+"</td><td>"
										+msg[i].WJGYY+"</td><td>"+msg[i].SFJGYS+"</td><td>"
										+msg[i].SFCCLQ+"</td><td>"+msg[i].XDBTZ+"</td><td>"
										+msg[i].DWBTZ+"</td><td>"+msg[i].BDWL+"</td><td>"
										+msg[i].XDSTZ+"</td><td>"+msg[i].DWSTZ+"</td><td>"
										+msg[i].SDWL+"</td><td>"+msg[i].XDDFZJ+"</td><td>"
										+msg[i].DWDFZJ+"</td><td>"+msg[i].DFDWL+"</td><td>"
										+msg[i].YJBZ+"</td><td>"+msg[i].BZ+"</td></tr>");
							}
						}
					}
			});
		}
	function exportWqgzyb(){
		var myDate = new Date();
		var y = myDate.getFullYear();
		var nf=$("#ddlYear").val();
		var xmnf=$("#ddlYear1").combotree("getValues");
		if(fls==1){
			xmnf=y;
			fls++;
		}
		if(xmnf.length==0){
			alert("请选择项目年份");
			return;
		}
		var gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
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
		var xzdj=$("#xzdj").combobox("getValue");
		var data="flag=flag&nf="+nf+"&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&xmnf="+xmnf;
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getWqgzjsb.do?'+data;
		 });
	}	
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
table {
	border-collapse:collapse;
}
table thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
table tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  style="height: 30px">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;危桥改造统计月报表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:40px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>项目年份：</span>
        						<select  id="ddlYear1" style="width: 80px;"></select>
        						<span>截止年份：</span>
		 						<select name="ddlYear" id="ddlYear" style="width: 50px;">
								</select>
        						<span>行政等级：</span>
        						<input type="text" id="xzdj" style="width:50px;">

       								<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
								    <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        					</p>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-130)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table width="4800px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">市农村公路危桥改造工程项目建设表 </caption>
								<thead>
									<tr>
										<td rowspan="3" style="width: 125px">序号</td>
										<td rowspan="3" style="width: 125px">县（市、区）</td>
										<td rowspan="3" style="width: 125px">是否17个罗宵山区连片特困县</td>
										<td rowspan="3" style="width: 125px">是否38个原中央苏区和特困片区县</td>
										<td rowspan="3" style="width: 125px">是否54个赣南等原中央苏区县</td>
										<td colspan="18" >计划情况</td>
										<td colspan="20">建设进展情况</td>
										<td colspan="10" >资金落实情况</td>
										<td rowspan="3">备注</td>
										
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px">行政区划代码</td>
										<td rowspan="2" style="width: 125px">行政区划名称</td>
										<td rowspan="2" style="width: 125px">路线编码</td>
										<td rowspan="2" style="width: 125px">路线名称</td>
										<td rowspan="2" style="width: 125px">桥梁桩号</td>
										<td rowspan="2" style="width: 125px">桥梁编码</td>
										<td rowspan="2" style="width: 125px">桥梁名称</td>
										<td rowspan="2" style="width: 125px">计划下达时间</td>
										<td rowspan="2" style="width: 125px">计划开工时间</td>
										<td rowspan="2" style="width: 125px">计划完成时间</td>
										<td rowspan="2" style="width: 125px">预计竣工时间</td>
										<td rowspan="2" style="width: 125px">桥长(延米)</td>
										<td rowspan="2" style="width: 125px">宽度(米)</td>
										<td rowspan="2" style="width: 125px">建设性质</td>
										<td rowspan="2" style="width: 125px">施工图批复文号</td>
										<td rowspan="2" style="width: 125px">总投资(万元)</td>
										<td rowspan="2" style="width: 125px">其中中央投资(万元)</td>
										<td rowspan="2" style="width: 125px">其中省补资金(万元)</td>
										<td rowspan="2" style="width: 125px">实际开工时间</td>
										<td rowspan="2" style="width: 125px">工程竣工时间</td>
										<td rowspan="2" style="width: 125px">建设单位</td>
										<td rowspan="2" style="width: 125px">设计单位</td>
										<td rowspan="2" style="width: 125px">施工单位</td>
										<td rowspan="2" style="width: 125px">监理单位</td>
										<td rowspan="2" style="width: 125px">实际建成桥长（米）</td>
										<td rowspan="2" style="width: 125px">实际建成桥宽（米）</td>
										<td rowspan="2" style="width: 125px">是否本年完成</td>
										<td rowspan="2" style="width: 125px">在建(座)</td>
										<td rowspan="2" style="width: 125px">延米</td>
										<td rowspan="2" style="width: 125px">未开工(座)</td>
										<td rowspan="2" style="width: 125px">延米</td>
										<td rowspan="2" style="width: 125px">完成总投资（万元）</td>
										<td rowspan="2" style="width: 125px">完成中央投资(万元)</td>
										<td rowspan="2" style="width: 125px">完成地方自筹(万元)</td>
										<td rowspan="2" style="width: 125px">本年完成投资（万元）</td>
										<td rowspan="2" style="width: 125px">未完成原因</td>
										<td rowspan="2" style="width: 125px">是否交工验收</td>
										<td rowspan="2" style="width: 125px">是否拆除老桥</td>
										<td colspan="3" style="width: 125px">车购税补助资金</td>
										<td colspan="3" style="width: 125px">省级补助资金</td>
										<td colspan="3" style="width: 125px">地方配套资金</td>
										<td rowspan="2" style="width: 125px">以奖代补资金(万元)</td>

									</tr>
									<tr>
										<td style="width: 80px">计划补助资金</td>
										<td style="width: 80px">到位金额(万元)</td>
										<td style="width: 80px">到位率(%)</td>
										<td style="width: 80px">计划补助资金</td>
										<td style="width: 80px">到位金额(万元) </td>
										<td style="width: 80px">到位率(%)</td>
										<td style="width: 80px">应配套资金(万元)</td>
										<td style="width: 80px">到位金额(万元)</td>
										<td style="width: 80px">到位率(%)</td>

									</tr>
									<tr>
									<td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td>
									<td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td>
									<td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td>
									<td>31</td><td>32</td><td>33</td><td>34</td><td>35</td><td>36</td><td>37</td><td>38</td><td>39</td><td>40</td>
									<td>41</td><td>42</td><td>43</td><td>44</td><td>45</td><td>46</td><td>47</td><td>48</td><td>49</td><td>50</td>
									<td>51</td><td>52</td><td>53</td><td></td>
									</tr>
								</thead>
								<tbody id="wqgzlist">
								
								</tbody>
								
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