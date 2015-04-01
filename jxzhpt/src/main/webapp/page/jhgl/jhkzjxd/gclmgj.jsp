<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcgj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			gydwComboxTree("gydw");
			xzqhComboxTree("xzqh");
			loadBmbm('ddlPDDJ','技术等级');
			loadBmbm('ddlGldj','公路等级');
			tsdq('ddlTSDQ');
			var jh={sbnf:null,sbzt:"1",spzt:"1",jh_sbthcd:6};
			var lx={gydw:null,gydwdm:filterGydwdm($.cookie("unit")),lxmc:null,xzqhmc:null,yjsdj:null,lxbm:null};
			sbnf("sbnf");
			queryMessage(jh,lx);
			gclmgjxm_zjxd(jh,lx);
		});
		function searchGcgj(){
			var jh={jhnf:null,sbzt:"1",spzt:"1",jh_sbthcd:6,kgzt:null,jgzt:null};
			var lx={gydw:$("#gydw").combo("getText"),gydwdm:$("#gydw").combo("getValue"),lxmc:null,xzqhmc:null,xzqhdm:$("#xzqh").combo("getValue"),yjsdj:null,lxbm:null};
			lx.gydwdm = filterGydwdm(lx.gydwdm);
			lx.xzqhdm=filterXzqhdm(lx.xzqhdm);
			if($("#sbnf").combo("getValue")!=""){
				jh.sbnf=$("#sbnf").combo("getValue");
			}
			if($('#txtlxmc').val()!=""){
				lx.lxmc=$('#txtlxmc').val();
			}
			if($("#ddlPDDJ").combo("getValue")!=""){
				lx.yjsdj= $("#ddlPDDJ").combo("getValue");
			}
			if($("#ddlGldj").combo("getValue")!=""){
				lx.lxbm=$("#ddlGldj").combo("getValue");
			}
			if($('#ddlTSDQ').combo("getValue")!=''){
				lx.tsdqbm=$('#ddlTSDQ').combo("getValue");
			}
			if($('#ddlSHZT').combobox('getValue')=='未开工'){
				jh.kgzt="0";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=='在建'){
				jh.kgzt="1";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=='竣工'){
				jh.kgzt="1";
				jh.jgzt="1";
			}
			gclmgjxm_zjxd(jh,lx);
			queryMessage(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function queryMessage(jh,lx){
			var param={'lx.gydwdm':lx.gydwdm,'jh.sbnf':jh.sbnf,'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,
					'jh.jh_sbthcd':jh.jh_sbthcd,"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt};
			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumGcgj.do',
				data:param,
				dataType:'json',
				success:function(data){
					$('#lblCount').html(data.id);
					$('#lblXDZJ').html(data.pfztz);
				}
			});
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库资金下达>&nbsp;工程改造路面改建项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:237px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:214px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span style="vertical-align:middle;">上报年份：</span>
        						<select id="sbnf" style="width: 80px;vertical-align:middle;"></select>
								<span style="vertical-align:middle;">&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:80px;vertical-align:middle;">
								</select>
								<span style="vertical-align:middle;">&nbsp;建设状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" class="easyui-combobox" style="width:70px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未开工">未开工</option>
									<option value="在建">在建</option>
									<option value="竣工">竣工</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" class="easyui-combobox" style="width:65px;vertical-align:middle;">
								</select>
								<span style="vertical-align:middle;">&nbsp;公路等级：</span>
								<select name="ddlGldj" id="ddlGldj" class="easyui-combobox" style="width:104px;vertical-align:middle;">
								</select>
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchGcgj()" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个路面改建项目，
        			下发资金共【&nbsp;<span id="lblXDZJ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	<div id="zjxd_gclmgj" style="text-align: left;font-size: 12px;width:100%;"></div>
</body>
</html>