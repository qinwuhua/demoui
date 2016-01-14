<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var nameValue;
		var colValue;
		var tableValue;
		var tableCol;
		var gydw=parent.YMLib.Var.gydw;
		var xzqhdm=parent.YMLib.Var.xzqhdm;
		var kgzt=parent.YMLib.Var.kgzt;
		var lxmc=parent.YMLib.Var.lxmc;
		var lxbm=parent.YMLib.Var.lxbm;
		var xmlx=parent.YMLib.Var.xmlx;
		var xmnf=parent.YMLib.Var.xmnf;
		var jhnf=parent.YMLib.Var.jhnf;
		$("#save_button").click(function(){
			nameValue=new Array();
			colValue= new Array();
			tableValue=new Array();
			tableCol=new Array();
			parent.YMLib.Var.sqlcol="";
			parent.YMLib.Var.tablecol="";
				 var checkboxes1 = document.getElementsByName("checkbox1"); 
				 var v1=parseFloat(checkboxes1.length);
				$("input[name=checkbox1]:checked").each(function(i,e){	
					colValue.push(this.value);
			    	nameValue.push(this.nextSibling.nodeValue);
			    	parent.YMLib.Var.sqlcol+=this.value+" v_"+i+",";
			    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
				});
			var checkboxes2 = document.getElementsByName("checkbox2");
			var v2=parseFloat(checkboxes2.length);
			$("input[name=checkbox2]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
			$("input[name=checkbox3]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1+v2)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
				parent.YMLib.Var.sqlcol=parent.YMLib.Var.sqlcol.substring(0,parent.YMLib.Var.sqlcol.length-1);
				parent.YMLib.Var.tablecol=parent.YMLib.Var.tablecol.substring(0,parent.YMLib.Var.tablecol.length-1);
				
			parent.$("#grid").datagrid({    
					 url:'/jxzhpt/zdycx/selZdy.do', 
					 queryParams: {
					    	gydw: function(){
					    		if(gydw.substr(gydw.length-2,2)=='00'){
					    			gydw=gydw.substr(0,gydw.length-2);
					    			if(gydw.substr(gydw.length-2,2)=='00'){
					    				gydw=gydw.substr(0,gydw.length-2);
					    			}
					    		}
					    		return gydw;
					    	},
					    	xzqhdm:function(){
						 			if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
						 				xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
						    			if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
						    				xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
						    			}
						    		}
// 						 			alert(xzqhdm);
						 		 	return xzqhdm;
						 	    }, 
					    	kgzt:kgzt,
					    	lxmc:lxmc,
					    	lxbm:lxbm,
					    	xmlx:xmlx,
					    	xmnf:xmnf,
					    	jhnf:jhnf
						},
					striped:true,
				    pagination:true,
				    rownumbers:true,
				    pageNumber:1,
				    pageSize:10,
				    height:345,
				    width:1154,
			}); 
 			var this_width;
			if (nameValue.length > 7) {

				this_width = 120;
			} else {
				this_width = 1080 / (nameValue.length) - 10;
			}
			for ( var i = 0; i < nameValue.length; i++) {
				var obj;
				obj = {
					field : colValue[i],
					title : nameValue[i],
					align : 'center',
					width : this_width
				};
				tableValue.push(obj);
			}
		 	var options =parent.$("#grid").datagrid("options");
			tableCol.push(tableValue);
			options.columns = tableCol;
			parent.$('#grid').datagrid(options); 
			parent.$('#zd_bhsd').window('destroy');
		});
		
		$("#qx_window").click(function(){
			parent.$('#zd_bhsd').window('destroy');
		});	
	
		// 全选
		$("#qx").bind("click", function () {
            $("[name = checkbox1]:checkbox").attr("checked", true);
            $("[name = checkbox2]:checkbox").attr("checked", true);
            $("[name = checkbox3]:checkbox").attr("checked", true);
        }); 

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox1]:checkbox").attr("checked", false);
            $("[name = checkbox2]:checkbox").attr("checked", false);
            $("[name = checkbox3]:checkbox").attr("checked", false);
        });

        // 反选
        $("#fx").bind("click", function () {
            $("[name = checkbox1]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox2]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox3]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器1
        $("#qx1").bind("click", function () {
        	$(".part1").attr("checked", true);
        });
        $("#bx1").bind("click", function () {
            $(".part1").attr("checked", false);
        });
        $("#fx1").bind("click", function () {
            $(".part1").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器2
        $("#qx2").bind("click", function () {
        	$(".part2").attr("checked", true);
        });
        $("#bx2").bind("click", function () {
            $(".part2").attr("checked", false);
        });
        $("#fx2").bind("click", function () {
            $(".part2").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器3
        $("#qx3").bind("click", function () {
        	$(".part3").attr("checked", true);
        });
        $("#bx3").bind("click", function () {
            $(".part3").attr("checked", false);
        });
        $("#fx3").bind("click", function () {
            $(".part3").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
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

<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;"align="center" >
					<input  type="radio" value="qx" name="radio" id="qx"/>全选
					<input  type="radio" value="fx" name="radio" id="fx"/>反选
					<input  type="radio" value="bx" name="radio" id="bx"/>不选
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;width:32%" align="center">项目基本信息</td>
				<td colspan="2" style="background-color: #ffffff;width:36%" align="center">年度计划</td>
				<td colspan="2"  style="background-color: #ffffff;width:32%" align="center">施工进展</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio1" id="qx1"/>全选
					<input  type="radio" value="fx" name="radio1" id="fx1"/>反选
					<input  type="radio" value="bx" name="radio1" id="bx1"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio2" id="qx2"/>全选
					<input  type="radio" value="fx" name="radio2" id="fx2"/>反选
					<input  type="radio" value="bx" name="radio2" id="bx2"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio3" id="qx3"/>全选
					<input  type="radio" value="fx" name="radio3" id="fx3"/>反选
					<input  type="radio" value="bx" name="radio3" id="bx3"/>不选</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="lxmc" name="checkbox1" class="part1"/>路线名称</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="lxbm" name="checkbox1" class="part1"/>路线编码</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="sjdw" name="checkbox2" class="part2"/>设计单位</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="sjpfdw" name="checkbox2" class="part2"/>设计批复单位</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="xdsj" name="checkbox3" class="part3"/>计划下达时间</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sjkgsj" name="checkbox3" class="part3"/>实际开工时间</td>
					
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="gydw" name="checkbox1" class="part1"/>管养单位</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="xzqhmc" name="checkbox1" class="part1"/>行政区划</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="pfwh" name="checkbox2" class="part2"/>批复文号</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="pfsj" name="checkbox2" class="part2"/>批复时间</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="yjjgsj" name="checkbox3" class="part3"/>预计完工时间</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sgdw" name="checkbox3" class="part3"/>施工单位</td>			
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sdmc" name="checkbox1" class="part1"/>隧道名称</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sddm" name="checkbox1" class="part1"/>隧道编号</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="pfztz" name="checkbox2" class="part2"/>批复总投资</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="jhsybzje" name="checkbox2" class="part2"/>计划使用部补助金额</td>
					<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="jldw" name="checkbox3" class="part3"/>监理单位</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="jsdw" name="checkbox3" class="part3"/>建设单位</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="qlzxzh" name="checkbox1" class="part1"/>隧道中心桩号</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sdkd" name="checkbox1" class="part1"/>隧道宽度</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="jhsydfzcje" name="checkbox2" class="part2"/>计划使用地方自筹资金</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="sfsqablbz" name="checkbox2" class="part2"/>是否申请按比例补助</td>
					<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="htje" name="checkbox3" class="part3"/>合同金额(万元)</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="gys" name="checkbox3" class="part3"/>概预算(万元)</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="sdcd" name="checkbox1" class="part1"/>隧道全长</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="faspsj" name="checkbox1" class="part1"/>方案审批时间</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="ablbzsqwh" name="checkbox2" class="part2"/>按比例补助申请文号</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="sbnf" name="checkbox2" class="part2"/>上报年份</td>
					<td colspan="2"style="background-color: #ffffff;width:32%" align="left"></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="xmnf" name="checkbox1" class="part1"/>项目年份</td>
				<td style="background-color: #ffffff;width:16%" align="left">
					<input  type="checkbox" value="jsxz" name="checkbox1" class="part1"/>建设性质</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="jhkgsj" name="checkbox2" class="part2"/>计划开工时间</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<input  type="checkbox" value="jhwgsj" name="checkbox2" class="part2"/>计划完工时间</td>
				<td colspan="2"style="background-color: #ffffff;width:32%" align="left"></td>	
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>