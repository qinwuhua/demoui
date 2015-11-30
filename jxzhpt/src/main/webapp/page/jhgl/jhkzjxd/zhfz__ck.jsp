<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾害防治项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_zhfz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			sbnf("sbnf");
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','公路等级');
			tsdq('ddlTSDQ');
			var jh={jhnf:$('#sbnf').combobox('getValue'),jh_sbthcd:6,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			queryMessage(jh,lx);
			zhfzxm_zjxd1(jh,lx);
		});
		function searchZhfz(){
			var jh={jhnf:null,sbzt:'1',spzt:null,jh_sbthcd:6,kgzt:null,jgzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
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
			
			queryMessage(jh,lx);
			zhfzxm_zjxd1(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function queryMessage(jh,lx){
			var param={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
					"lx.lxbm":lx.lxbm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumZhfz.do',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.id>0){
						$('#lblCount').html(data.id);
						$('#pfztz').html(data.pfztz);
						$('#stz').html("0");
						$('#btz').html(data.jhsybzje);
						$('#dftz').html(data.jhsydfzcje);
						$('#xdzj').html(data.spzt);
					}else{
						$('#lblCount').html("0");
						$('#pfztz').html("0");
						$('#btz').html("0");
						$('#stz').html("0");
						$('#dftz').html("0");
						$('#xdzj').html("0");
					}
				}
			});
		}
		function exportExcelZjxd(){
			var gydwbm=getgydw("gydw");
			var xzqhdm=getxzqhdm('xzqh');
			var gydwdm=$.cookie("unit");
			var param="jh.jh_sbthcd=6"+"&lx.gydwdm="+gydwdm+"&lx.gydwbm="+gydwbm+"&lx.xzqhdm="+xzqhdm+
						"&lx.lxmc="+$('#txtRoad').val()+"&lx.lxjsdj="+$("#ddlPDDJ").combo("getValue")+
						"&lx.lxbm="+$("#ddlGldj").combo("getValue")+"&lx.tsdq="+$('#ddlTSDQ').combo("getValue")+
						"&jh.sbnf="+$('#sbnf').combobox('getValue');
			if($('#ddlSHZT').combo("getValue")=="未开工"){
				param+="&jh.kgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="在建"){
				param+="&jh.kgzt=1&jh.jgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="竣工"){
				param+="&jh.jgzt=1";
			}
			window.location.href="/jxzhpt/jhgl/exportZhfzZjxdExcel.do?"+param;
		}
		
		function zhfzxm_zjxd1(jh,lx){
			var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
					"lx.lxbm":lx.lxbm,"lx.lxjsdj":lx.lxjsdj,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
			var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
				pageNumber:1,pageSize:10,height:$(window).height()-150,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result='';
			        	result+='<a href="javascript:locationXm1('+"'"+row.jckzhfz.lxbm+"',"+"'"+row.jckzhfz.qdzh+"',"+"'"+row.jckzhfz.zhzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
			        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
			        	return result;
			        }},
			        {field:'zjxf',title:'资金下达',width:80,align:'center',formatter:function(value,row,index){
			        	return '<a href="javascript:openDialog('+"'zjxd_zhfz','灾害防治项目计划详情','../zjxd/zhfz__ck.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下达</a>';
			        }},
			        {field:'c4',title:'建设状态',width:80,align:'center',
			        	formatter:function(value,row,index){
			        		if(row.kgzt=='0' && row.jgzt=='0')
			        			return '未开工';
			        		else if(row.kgzt=='1' && row.jgzt=='0')
			        			return '在建';
			        		else if(row.kgzt=='1' && row.jgzt=='1')
			        			return '竣工';
			        	}
			        },
			        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
			        	if(row.sfylsjl=='无')
			        		return '无';
			        	else if(row.sfylsjl=='有')
			        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'zhfz'"+",'灾害防治历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
			        }},
			        {field:'sbnf',title:'上报年份',width:80,align:'center'},
			        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
			        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			        {field:'gydw',title:'管养单位',width:150,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.gydw;
						}
			        },
			        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.xzqhmc;
						}
			        },
			        {field:'lxbm',title:'路线编码',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.lxbm;
						}
			        },
			        {field:'lxmc',title:'路线名称',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.lxmc;
						}
			        },
			        {field:'qdzh',title:'起点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.qdzh;
						}
			       },
			        {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	   formatter : function(value, row, index) {
							return row.jckzhfz.zdzh;
						}
			    	},
			        {field:'jsgm',title:'建设规模',width:60,align:'center',
			    		formatter : function(value, row, index) {
							return row.jckzhfz.yhlc;
						}
			    	},
			        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
			    ]],
			    onClickRow:function(rowIndex,rowDate){
					if(oldIndex!=-1){
						gridObj.datagrid("unselectRow",oldIndex);
					}
					selRow.push(rowIndex);
					gridObj.datagrid("selectRow",rowIndex);
					oldIndex=rowIndex;
				}
			};
			gridBind(grid);
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库资金下达>&nbsp;灾害防治项目</div>
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
        						<select id="gydw" style="width:227px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span style=" vertical-align:middle;">上报年份：</span>
        						<select id="sbnf" style="width: 80px; vertical-align:middle;"></select>
								<span style=" vertical-align:middle;">&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:80px; vertical-align:middle;">
								</select>
								<span style=" vertical-align:middle;">&nbsp;建设状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" class="easyui-combobox" style="width:70px; vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未开工">未开工</option>
									<option value="在建">在建</option>
									<option value="竣工">竣工</option>
								</select>
								<span style=" vertical-align:middle;">&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:65px; vertical-align:middle;">
								</select>
								<span style=" vertical-align:middle;">&nbsp;公路等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:104px; vertical-align:middle;"></select>
								<span>&nbsp;是否有补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<img onclick="searchZhfz()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
<%--         						<img alt="导出模版" onclick="exportExcelZjxd()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
<%-- 								<img alt="导入" onclick="importData_jh('zhfz_zjxd')" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> --%>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目，
        			批复总投资【&nbsp;<span id="pfztz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="btz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中省投资【&nbsp;<span id="stz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="dftz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="xdzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	<div id="zjxd_zhfz" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>