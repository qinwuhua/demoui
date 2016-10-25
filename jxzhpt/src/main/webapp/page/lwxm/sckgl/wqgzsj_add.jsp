<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript" src="../js/wqsj.js"></script>
<script type="text/javascript">
var xmkid;
var bzls='';
var sfylrbwqk;
var sfkxg; 
$(function(){
	$("#jsxz").combobox({onChange:function (n,o) {setbz();}});
	$("#sfylrbwqk").combobox({onChange:function (n,o) {setbz();}});
	$("#scakjfl").combobox({onChange:function (n,o) {setbz();}});
	xxId=newGuid();
// 	xmnf1("scxmnf");
	autoCompleteQLBH();
	loadUploadify();
	var str,time;
	time=new Date();
	str=time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate();$("#rksj").html(str);
	$("#save_button").click(function(){
		if($("#qlbh").val()==null || $("#qlbh").val()==''){
			alert("请填写桥梁编码！");
			$("#qlbh").focus();
			return false;
		}
		if($("#scqlqc").val()==null || $("#scqlqc").val()=='' || isNaN($("#scqlqc").val()) || parseFloat($("#scqlqc").val())<=0){
			alert("请填写正确的桥梁全长！");
			$("#scqlqc").focus();
			return false;
		}
		if($("#scqlqk").val()==null || $("#scqlqk").val()=='' || isNaN($("#scqlqk").val()) || parseFloat($("#scqlqk").val())<=0){
			alert("请填写正确的桥梁全宽！");
			$("#scqlqk").focus();
			return false;
		}
		var flag=true;
		$("input[name='bitian']").each(function(){
	        if ($(this).val() == ""||$(this).val() == null){
	        	alert("请将页面除备注外的信息填写完整。");
	        	flag=false;
	        	return false;
	        }
	    });
		if(!flag)
			return;
		
		var datas="lxbm="+$("#lxbm").html()+"&qlzxzh="+$("#qlzxzh").html()+"&qlbh="+$("#qlbh").val()+"&scxmnf="+$("#scxmnf").val();
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmsck/onceSckWqgz.do',
			dataType:'json',
	        data:datas,
			success:function(msg){
				if(Boolean(msg)){
					bzWqgz();
				}else{
					alert("该项目已添加，请勿重复添加！");
					return;
				}
			}
		});
	});
	$("#qx_window").click(function(){
		$.ajax({
			type:'post',
//			url:'/jxzhpt/qqgl/queryFileByXmbm.do',
//			data:'file.parentid='+xmbm+'&file.filetype='+type,
//			dataType:'json',
			url:'/jxzhpt/wqgzsj/deleteqlzpbyxmbm.do',
			dataType:'json',
			data:'jckjckwqgzsj.id='+xxId,
			success:function(data){
				parent.$('#sck_add').window('destroy');
			}
		});
	});	
});
function autoCompleteQLBH(){
	var url = "/jxzhpt/wqgzsj/JckWqgzRoad1.do";
	$("#qlbh").autocomplete(url, {
		multiple : false,
		minChars :4,
		multipleSeparator : ' ',
		mustMatch: true,
  		cacheLength : 0,
  		delay : 200,
  		max : 150,
  		extraParams : {
  			qlbh:function() {
  				var d = $("#qlbh").val();
  				return d;
  			},
  			gydw:function() {
  				var d = $.cookie("unit2");
  				if(d=='_____36') return "";
  				else return d;
  			},
  			xzqhdm:function() {
  				var d = $.cookie("dist");
  				if(d=='360000') return "";
  				else return d;
  			}
  		},
  		dataType : 'json',// 返回类型
  		// 对返回的json对象进行解析函数，函数返回一个数组
  		parse : function(data) {
  			var aa = [];
  			aa = $.map(eval(data), function(row) {
  					return {
  						data : row,
  						value : row.qlbh.replace(/(\s*$)/g,""),
  						result : row.qlbh.replace(/(\s*$)/g,"")
  					};
  				});
  			return aa;
  		},
  		formatItem : function(row, i, max) {
  			return row.qlbh.replace(/(\s*$)/g,"")+"("+row.qlzxzh+")"+"<br/>"+row.qlmc.replace(/(\s*$)/g,"");
  		}
  	}).result(
			function(e, item) {

				if(item==undefined) return ;
				$("#qlmc,#qlzxzh,#gydw,#xzqhdm,#xzqhmc,#lxmc,#lxbm").attr("value",'');
				fileShow2(item.id,"桥梁正面文件");
				fileShow3(item.id,"桥梁侧面文件");
				xmkid=item.id;
				sfylrbwqk=item.sfylrbwqk;
				$("#sfylrbwqk").combobox("setValue",item.sfylrbwqk);
/* 				if(item.sfylrbwqk=='是'){
					sfkxg='是';
					$("#sf1").attr('style','height: 30px;');
					
				}else{
					sfkxg='否';
					$("#sf1").attr('style','height: 30px;display: none;');
				} */
				$("#qlmc").html(item.qlmc);
				$("#qlzxzh").html(item.qlzxzh);
				$("#gydw").html(item.gydw);
				$("#xzqhmc").html(item.xzqhmc);
				$("#xzqhdm").html(item.xzqhdm);
				$("#lxmc").html(item.lxmc);
				$("#lxbm").html(item.lxbm);
				$("#kjzc").html(item.kjzc);
				$("#qlqc").html(item.qlqc);
				$("#qlkd").html(item.qlkd);
				$("#dkzdkj").html(item.dkzdkj);
				$("#jsdj").html(item.jsdj);
				$("#pddj").html(item.pddj);
				$("#xjgjnd").html(item.xjgjnd);
				$("#akjfl").html(item.akjfl);
				$("#scakjfl").combobox('setValue',item.akjfl);
			
				scakjfl=item.akjfl;
				$("#sbjgxs").html(item.sbjgxs);
				$("#xmnf").html(item.xmnf);
				$("#xmtype").html(item.xmtype);
				$("#bhnr").html(item.bhnr);
				$("#bz").html(item.bz);
				$("#tsdq").html(item.tsdq);
				$("#qlyhgcs").html(item.qlyhgcs);
				$("#qljggcs").html(item.qljggcs);
				$("#xmrksj").html(item.xmrksj);
				$("#czyjhjy").html(item.czyjhjy);
				$("#sqs").html(item.sqs);$("#xsq").html(item.xsq);$("#szxz").html(item.szxz);
				$("#synf").html(item.synf);$("#sjhspl").html(item.sjhspl);$("#qxjkuan").html(item.qxjkuan);
				$("#qxjkong").html(item.qxjkong);$("#zqks").html(item.zqks);$("#qmjk").html(item.qmjk);$("#kydwlx").html(item.kydwlx);
				$("#thdj").html(item.thdj);$("#glqlyt").html(item.glqlyt);$("#qdlx").html(item.qdlx);
				$("#qtlx").html(item.qtlx);$("#pzlx").html(item.pzlx);
				$("#scqlqc").val(item.qlqc);$("#scqlqk").val(item.qlkd);$("#scsjhspl").val(item.sjhspl);$("#sck_sbjgxs").val(item.sbjgxs);
				$("#scthdj").val(item.thdj);
				if($.trim(item.jsdj)=='一类')
					$("#jsdj").html('一级公路');
				else	if($.trim(item.jsdj)=='二类')
					$("#jsdj").html('二级公路');
				else if($.trim(item.jsdj)=='三类')
					$("#jsdj").html('三级公路');
				else if($.trim(item.jsdj)=='四类')
					$("#jsdj").html('四级公路');
				else{
					$("#ydgldj").combobox('setValue',"等外公路");
				}	
				
				
				$("#scsqs").val(item.sqs);$("#scxsq").val(item.xsq);
				$("#scszxz").val(item.szxz);
				setbz();
				xmkid=item.id;
			});
}
var xmkid;
var scakjfl;
function saveWqgz(){
	var flag=true;
	/* 	if($("#faspsj").datebox('getValue')==''){
			alert("请选择方法审批时间");
			return;
		}
		if($("#scjhnf").combobox('getValue')==''){
			alert("请选择项目年份");
			return;
		} */
	    $("input[name='bitian']").each(function(){
	        if ($(this).val() == ""||$(this).val() == null){
	        	alert("请将页面除备注外的信息填写完整。");
	        	flag=false;
	        	return false;
	        }
	    });
	    if(flag==false){
	    	return;
	    }
	
	var sbthcd=$.cookie("unit2").length;
	if($.cookie("unit2")=="______36"){
		sbthcd=7;
	}
	var sfbk=$("#sfylrbwqk").combobox('getValue');
	if($("#nsqbbz").val()==''||$("#ztz").val()==''){
		alert("总投资或补助金额未填写正确");
		return
	}
	var nsqbbz1=$("#nsqbbz").val();
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat(nsqbbz1)>parseFloat(trzjdx)){
			alert("请按提示填写正确的值");
			$("#nsqbbz").val('');
			return;
		}
	}
	if(parseFloat($("#nsqbbz").val())>parseFloat($("#ztz").val())){
		alert("总投资不能小于补助金额");
		return;
	}
	var cjqz = $("#cjqz1").combobox('getValue')+$("#cjqz").val();
	var data ="jckwqgzsj.xmkid="+xmkid+"&jckwqgzsj.fapgdw="+$("#fapgdw").val()+"&jckwqgzsj.fascdw="+$("#fascdw").val()+
	"&jckwqgzsj.faspsj="+$("#faspsj").datebox('getValue')+"&jckwqgzsj.spwh="+$("#spwh").val()+"&jckwqgzsj.tzgs="+''+
	"&jckwqgzsj.jsxz="+$("#jsxz").combobox("getValue")+"&jckwqgzsj.jsnr="+$("#jsnr").val()+"&jckwqgzsj.scbz="+$("#scbz").val()+
	"&jckwqgzsj.scbmbm="+$.cookie("unit")+"&jckwqgzsj.qlbh="+$("#qlbh").val()+"&jckwqgzsj.lxbm="+$("#lxbm").html()+"&jckwqgzsj.qlzxzh="+$("#qlzxzh").html()+
	"&jckwqgzsj.sck_sbthcd="+sbthcd+"&jckwqgzsj.bzls="+bzls+"&jckwqgzsj.scxmnf="+$("#scxmnf").val()+"&jckwqgzsj.scqlqc="+$("#scqlqc").val()+"&jckwqgzsj.scqlqk="+$("#scqlqk").val()
	+"&jckwqgzsj.sjdwmc="+$("#sjdwmc").val()+"&jckwqgzsj.scakjfl="+$("#scakjfl").combobox('getValue')
	+"&jckwqgzsj.hzdj="+$("#hzdj").val()+"&jckwqgzsj.scsjhspl="+$("#scsjhspl").val()+"&jckwqgzsj.sck_sbjgxs="+$("#sck_sbjgxs").val()
	+"&jckwqgzsj.kjzh="+$("#kjzh1").val()+"*"+$("#kjzh2").val()+"&jckwqgzsj.ztz="+$("#ztz").val()+"&jckwqgzsj.sck_xbjgxs="+$("#sck_xbjgxs").val()
	+"&jckwqgzsj.sgtpfsj="+''+"&jckwqgzsj.pfwh="+''+"&jckwqgzsj.zgq="+$("#zgq").val()+"&jckwqgzsj.sckid="+xxId
	+"&jckwqgzsj.nsqbbz="+$("#nsqbbz").val()+"&jckwqgzsj.rksj="+$("#rksj").html()+"&jckwqgzsj.cjqz="+cjqz
	+"&jckwqgzsj.scthdj="+$("#scthdj").val()+"&jckwqgzsj.qljc="+$("#qljc").val()+"&jckwqgzsj.ydgldj="+$("#ydgldj").combobox('getValue')+"&jckwqgzsj.zdezj="+zdezj
	+"&jckwqgzsj.sjsd="+$("#sjsd").val()+"&jckwqgzsj.scsqs="+$("#scsqs").val()+"&jckwqgzsj.scxsq="+$("#scxsq").val()+"&jckwqgzsj.scszxz="+$("#scszxz").val()+"&jckwqgzsj.sfylrbwqk="+sfbk+"&jckwqgzsj.sfkxg="+"是"+"&jckwqgzsj.nsqsjl="+$("#nsqsjl").val();
	$.ajax({
		type:'post',
		url:'/jxzhpt/wqgzsj/insertSckwqgz.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.sckglWqgz();
				alert("保存成功！");
				parent.$('#sck_add').window('destroy');
				
			}else{
				alert('保存失败！');
			}
		}
	});   
}
function bzWqgz(){
	var datas="lxbm="+$("#lxbm").html()+"&qlzxzh="+$("#qlzxzh").html()+"&qlbh="+$("#qlbh").val();
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmsck/bzWqgz.do',
		dataType:'json',
        data:datas,
		success:function(msg){
			if(Boolean(msg)){
				bzls="无";
				saveWqgz();
			}else{
				if(confirm('该项目有补助历史，你确定继续提交吗？')){
					bzls="有";
					saveWqgz();
				}
			}
		}
	});
}

function loadUploadify(){
	
	$("#uploadSjt").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '../../../js/uploader/uploadify.swf',
		'script' : '../../../jhgl/uploadWqgzFile.do',
		'cancelImg' : '../../../js/uploader/cancel.png',
		'queueID' : 'fileQueue1',
		'fileDataName' : 'uploadSjt',
		'auto' : false,
		'multi' : false,
		'buttonImg': '../../../js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 100000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'uploads.parentid':xxId,
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			sjtfileShow();
		},
		onError : function(event, queueID, fileObj) {
			alert("文件:" + fileObj.name + "上传失败");
		},
		onCancel : function(event, queueID, fileObj) {
		},
		onQueueFull : function(event, queueSizeLimit) {
			alert("最多支持上传文件数为：" + queueSizeLimit);

		}
	});
}
function newGuid()
{
    var guid = "";
    for (var i = 1; i <= 32; i++){
      var n = Math.floor(Math.random()*16.0).toString(16);
      guid +=   n;
    }
    return guid;    
}
var xxId;

function sjtfileShow(){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xxId,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
					'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
					"<a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}
				}
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function downFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 sjtfileShow();
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
var nsqbbz;
function getBbz(){
	 $.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/lwBzbz.do',
			data:"bzbz.xmlx="+"危桥"+"&bzbz.lx="+$("#jsxz").combobox('getValue'),
			dataType:'json',
			async:false,
			success:function(data){
				var bz=data.bz;
				var bl=data.bl;
				var fd=data.fd;
				var bzzj=(parseFloat($('#scqlqc').val())*1000000000000000*parseFloat($('#scqlqk').val())*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
				nsqbbz=bzzj.toFixed(3);
				zdezj=bzzj.toFixed(3);
				setnsqbbz();
			}
		}); 
}
function getSbz(){
	 $.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/lwBzsbz.do',
			data:"planwqgzsj.tsdq="+$("#tsdq").html()+"&planwqgzsj.sck_qlbh="+$("#qlbh").val()+"&planwqgzsj.akjfl="+$("#scakjfl").combobox('getValue')+"&planwqgzsj.jsxz="+$("#jsxz").combobox('getValue')
			+"&planwqgzsj.scqlqc="+$("#scqlqc").val()+"&planwqgzsj.scqlqk="+$("#scqlqk").val(),
			dataType:'json',
			async:false,
			success:function(data){
				nsqbbz=data.shengbz;
				trzjdx=data.shengbz;
				zdezj=data.shengbz;
				$("#trzjdx").html("小于等于"+trzjdx);
			}
		}); 
}
function setbz(){
	var sfbk=$("#sfylrbwqk").combobox('getValue');
	if(sfbk=='是'){
		getBbz();
	}else{
		getSbz();
	}
	setshengjl();
}
//查询省奖励资金
function setshengjl(){
	var dkkj=parseInt($("#kjzh1").val())*parseInt($("#kjzh2").val());
	
	var kjfl="";
	var kj1=0;var kj2=0;
	if(parseInt($("#kjzh2").val())>150)
		kj1=5;
	if(dkkj>1000)
		kj2=5;
	
	if(parseInt($("#kjzh2").val())>=40 && parseInt($("#kjzh2").val())<=150)
		kj1=4;
	if(dkkj>=100 && dkkj<=1000)
		kj2=4;
	if(parseInt($("#kjzh2").val())>=20 && parseInt($("#kjzh2").val()) < 40)
		kj1=3;
	if(dkkj>30 && dkkj<100)
		kj2=3;
	if(parseInt($("#kjzh2").val())>=5 && parseInt($("#kjzh2").val()) < 20)
		kj1=2;
	if(dkkj>=8 && dkkj<=30)
		kj2=2;
	if((parseInt($("#kjzh2").val()) < 5)){
		kj1=1;
		kj2=1;
	}
	if(kj1>kj2){
		if(kj1==1)
			kjfl='涵洞';
		if(kj1==2)
			kjfl='小桥';
		if(kj1==3)
			kjfl='中桥';
		if(kj1==4)
			kjfl='大桥';
		if(kj1==5)
			kjfl='特大桥';
	}else{
		if(kj2==1)
			kjfl='涵洞';
		if(kj2==2)
			kjfl='小桥';
		if(kj2==3)
			kjfl='中桥';
		if(kj2==4)
			kjfl='大桥';
		if(kj2==5)
			kjfl='特大桥';
	}
		
	
	
	
	/* if((parseInt($("#kjzh2").val())>150)||(dkkj>1000))
		kjfl="特大桥";
	if((parseInt($("#kjzh2").val())>=40 && parseInt($("#kjzh2").val())<=150)||(dkkj>=100 && dkkj<=1000))
		kjfl="大桥";
	if((parseInt($("#kjzh2").val())>=20 && parseInt($("#kjzh2").val()) < 40)||(dkkj>30 && dkkj<100))
		kjfl="中桥";
	if((parseInt($("#kjzh2").val())>=5 && parseInt($("#kjzh2").val()) < 20)||(dkkj>=8 && dkkj<=30))
		kjfl="小桥";
	if((parseInt($("#kjzh2").val()) < 5))
		kjfl="涵洞"; */
	
	$("#scakjfl").combobox('setValue',kjfl);
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsjlbyid1.do",
		 dataType : 'json',
		 data : 'planwqgzsj.id='+xmkid+"&planwqgzsj.akjfl="+kjfl+"&planwqgzsj.scqlqc="+$("#scqlqc").val()+"&planwqgzsj.scqlqk="+$("#scqlqk").val(),
		 success : function(item){
			 $("#nsqsjl").val(item.nsqsjl);
		 }
	 });
}


var zdezj;
var trzjdx;
function setnsqbbz(){
	var ztz=$("#ztz").val();
	if(ztz!=null&&ztz!=''){
		if(parseFloat(ztz)*0.6<parseFloat(nsqbbz)){
			trzjdx=Math.round(parseFloat(ztz)*0.6);
		}
		else{
			trzjdx=Math.round(parseFloat(nsqbbz));
		}
	}else{
		trzjdx=Math.round(parseFloat(nsqbbz));
	}

	if($("#sfylrbwqk").combobox('getValue')=='是')
	$("#trzjdx").html("小于等于"+trzjdx);
	else
		$("#trzjdx").html("小于等于或大于"+nsqbbz);
}
function checksfzq(){
	var nsqbbz1=$("#nsqbbz").val();
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat(nsqbbz1)>parseFloat(trzjdx)){
			alert("请按提示填写正确的值");
			$("#nsqbbz").val('');
		}
	}
	
}
function upload(id){
	$("#"+id).uploadifySettings('scriptData',{'jh.sbnf':$('#scxmnf').val(),'uploads.parentid':xxId});
	$('#'+id).uploadifyUpload();
}
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
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目基本信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:16%" align="right">桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:17%" align="left">
					<input type="text" name="qlbh"id="qlbh" style="width: 120px" /></td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qlmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养（监管）单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<input type="text" id="gydwbm" style="display:none"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="qlkd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术状况评定：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sbjgxs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmtype"></span></td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sqs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xsq"></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="szxz"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按建筑材料和&nbsp;&nbsp;<br>使用年限分类：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="synf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率(年)：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjhspl"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkuan"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净空（米）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkong"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">主桥孔数（孔）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zqks"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥面净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qmjk"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨越地物类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kydwlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="thdj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路桥梁用途：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="glqlyt"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥墩类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qdlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥台类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qtlx"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">铺装类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pzlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">入库时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmnf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁养护工程师：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlyhgcs"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁监管工程师：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qljggcs"></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhnr"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置意见和建议：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="czyjhjy"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁正面照片：</td>
				<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="qlzmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁侧面照片：</td>
				<td id="td_wgys" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="2">
						<tbody id="qlcmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="scqlqc" style="width: 120px" onchange="setbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="scqlqk" id="scqlqk" style="width: 120px" onchange="setbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="scxmnf" name='bitian' maxlength="4" style="width: 120px"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估(设计)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="fapgdw" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审核(批复)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="fascdw" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案(施工图)批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="faspsj" class="easyui-datebox" style="width: 150px"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="spwh" style="width: 120px" /></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsxz" class="easyui-combobox" data-options="panelHeight:'50'" onchange="setbz()">
						<option value="加固改造"selected>加固改造</option>
						<option value="拆除重建">拆除重建</option>
					</select>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">荷载等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="hzdj" style="width: 120px" /></td>
			</tr>

			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="scsjhspl" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径组合：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="kjzh1" style="width: 50px" />*<input type="text" name='bitian' id="kjzh2" style="width: 50px" onchange="setshengjl()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="sck_sbjgxs" style="width: 120px" />
				</td>
				
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">下部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="sck_xbjgxs" style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总工期：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bitian' id="zgq" style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">重建桥址：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='cjqz1' class='easyui-combobox' style="width: 80px;">
						<option value="原桥址上游">原桥址上游</option>
						<option value="原桥址下游">原桥址下游</option>
					</select><input type="text" name='bitian' id="cjqz" style="width: 45px;vertical-align: middle;" />米</td>
			</tr>
			<tr style="height: 30px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scthdj" name='bitian' style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁基础：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="qljc" name='bitian' style="width: 120px" /></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">引道行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='ydgldj' class='easyui-combobox' data-options="panelHeight:'100'" >
						<option value="一级公路">一级公路</option>
						<option value="二级公路">二级公路</option>
						<option value="三级公路">三级公路</option>
						<option value="四级公路">四级公路</option>
					</select>
					</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					 <select id='scakjfl' class='easyui-combobox' data-options="panelHeight:'100'" >
						<option value="特大桥">特大桥</option>
						<option value="大桥">大桥</option>
						<option value="中桥">中桥</option>
						<option value="小桥">小桥</option>
						<option value="涵洞">涵洞</option>
					</select> 
				</td>
				<td  style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%; " align="right">是否入部危桥库：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 100px">
						<option value="否">否</option>
						<option value="是" selected>是</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sjsd" name='bitian' style="width: 120px" />
				</td>
			</tr>
			<tr style="height: 30px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总投资（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="ztz" name='bitian' style="width: 115px" onchange="setnsqbbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请部（省）级补助资金（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="nsqbbz" name='bitian' style="width: 100px" onblur="checksfzq()"/><br><span style="color: red" id='trzjdx'></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请省奖励资金(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" style="width: 100px" id='nsqsjl' disabled="disabled"/><br><span id="trshengjl" style="color: red"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="scsqs" name='bitian' style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="scxsq" name='bitian' style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="scszxz" name='bitian' style="width: 120px" />
				</td>
			</tr>
			
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea name='bitian' id="jsnr"rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea name='bitian' id="scbz"rows="2" style="width:99%"></textarea>
				</td>
			</tr>
				<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工图（初步）<br>设计批复文件：</td>
				<td id="td_sjsgt" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
					<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjt" id="uploadSjt" /></td>
								<td><div id="fileQueue1" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload('uploadSjt')"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>