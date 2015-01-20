<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>

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
<script type="text/javascript">
	var qdStr;
	var zdStr;
	$(function(){
		$("#save_button").click(function(){
			var datas="lxbm="+$("#lxbm").val()+"&qdzh="+$("#qdzh").val()+"&zdzh="+$("#zdzh").val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/onceAbgc.do',
				dataType:'json',
		        data:datas,
				success:function(msg){
					if(Boolean(msg)){
						saveAbgc();
					}else{
						alert('该项目已添加过，请勿重复添加！');
					}
				}
			});
		});
		$("#qx_window").click(function(){
			parent.$('#jck_add').window('destroy');
		});	
		autoCompleteLXBM();
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/xmjck/abgcGpsroad.do";
		$("#lxbm").autocomplete(url, {
			multiple : false,
			minChars :2,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 50,
	  		extraParams : {
	  			/*dist:$.cookie("dist"),*/
	  			lxbm:function() {
	  				var d = $("#lxbm").val();
	  				return d;
	  			}
	  		},
	  		dataType : 'json',// 返回类型
	  		// 对返回的json对象进行解析函数，函数返回一个数组
	  		parse : function(data) {
	  			var aa = [];
	  			aa = $.map(eval(data), function(row) {
	  					return {
	  						data : row,
	  						value : row.lxbm.replace(/(\s*$)/g,""),
	  						result : row.lxbm.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {

					if(item==undefined) return ;
					$("#lxmc,#xzqhdm,#xzqhmc#qdzh,#zdzh,#zlc,#xjnd,#lxjsdj,#gydw,#gydwbm,#qd,#zd").attr("value",'');
					$("#lxmc").html(item.lxmc);
					$("#xzqhdm").html(item.xzqhdm);
					$("#xzqhmc").html(item.xzqhmc);
					$("#qdzh").val(parseFloat(item.qdzh));
					$("#zdzh").val(parseFloat(item.zdzh));
					$("#zlc").html((parseFloat($("#zdzh").val())*1000-parseFloat($("#qdzh").val())*1000)/1000);
					$("#xjnd").html(item.gjxjnd);
					$("#lxjsdj").html(item.lxjsdj);
					$("#gydw").html(item.gydw);
					$("#gydwbm").val(item.gydwbm);
					qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh);
					$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
					$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
				});
	}
	function saveAbgc(){
		if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
			alert("对不起，起点桩号不能小于"+qdStr+"！");
			return false;
		}
		if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
			alert("对不起，止点桩号不能大于"+zdStr+"！");
			return false;
		}
		if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
			alert("对不起，起点桩号不能大于止点桩号！");
			return false;
		}
		if(parseFloat($("#yhlc").val())*1000>parseFloat($("#zlc").html())*1000){
			alert("对不起，隐患里程不能大于总里程！");
			return false;
		}
		var data ="lxbm="+$("#lxbm").val()+"&lxmc="+$("#lxmc").html()+"&gydw="+$("#gydw").html()+"&gydwbm="+$("#gydwbm").val()+"&qdzh="+$("#qdzh").val()
		+"&zdzh="+$("#zdzh").val()+"&qzlc="+$("#zlc").html()+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&gjxjnd="+$("#xjnd").html()+
		"&lxjsdj="+$("#lxjsdj").html()+"&yhlc="+$("#yhlc").val()+"&xmnf="+$("#xmnf").val()+"&xmtype="+$("#xmzt").val()+"&yhnr="+$("#yhnr").val()+"&bz="+$("#bz").val()
		+"&tbbmbm="+$.cookie("unit")+"&sbthcd="+$.cookie("unit2").length;
		alert(data);
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmjck/insertAbgc.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					parent.$("#grid").datagrid('reload');
					alert("保存成功！");
					parent.$('#jck_add').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
		var zlc=(parseFloat($("#zdzh").val())*1000000000000-parseFloat($("#qdzh").val())*1000000000000)/1000000000000;
		$("#zlc").html(zlc);
	}
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxbm" id="lxbm" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="gydw"></span>
					<input type="text" id="gydwbm" style="display:none"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 156px" onblur="changeZlc()"/><br/>
					<span id="qd"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 156px" onblur="changeZlc()"/><br/>
					<span id="zd"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zlc" style="font-size: 14px">0</span>&nbsp;公里</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 25px;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="xzqhdm" style="font-size: 14px"></span></td>
				<td style="background-color: #ffffff; height: 25px;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="xzqhmc"></span></td>
					<td style="background-color: #ffffff; height: 25px;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="xjnd" style="font-size: 14px"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxjsdj"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="yhlc"id="yhlc" style="width: 156px" value="0"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf">
						<option selected value="2015年">2015年</option>
						<option value="2014年">2014年</option>
						<option value="2013年">2013年</option>
						<option value="2012年">2012年</option>
						<option value="2011年">2011年</option>
						<option value="2010年">2010年</option>
					</select>
					</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmzt">
						<option selected value="未上报">未上报</option>
						<option value="已上报">已上报</option>
						<option value="已入库">已入库</option>
						<option value="已下达">已下达</option>
					</select>	
				</td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;width:15%" align="left"></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2" id="yhnr" style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2"  id="bz"style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>