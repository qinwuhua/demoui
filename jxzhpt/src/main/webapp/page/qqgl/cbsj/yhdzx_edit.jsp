<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryCbsjByXmbm.do',
				data:'cbsj.xmlx='+4+'&cbsj.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#cbsj').form("load",data);
					$('#span_qdzh').html(data.gpsqdzh);
					$('#span_zdzh').html(data.gpszdzh);
					$('#ylxbh').val(data.ghlxbh);
					$('#jdbs').val(parent.YMLib.Var.jdbs);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
					$('#sfbj').val(1);
				}
			});
			loadFileUpload();
		});
		function loadFileUpload(){
			$("#uploadSjpf").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/uploadSjpf.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadSjpf',
				'auto' : false,
				'multi' : false,
				'buttonImg': '../../../js/uploader/bdll.png',
				'simUploadLimit' : 3,
				'sizeLimit' : 20000000,
				'queueSizeLimit' : 5,
				'fileDesc' : '支持格式:xls',
				'fileExt' : '',
				'height' : 30,
				'width' : 92,
				'scriptData' : {
					'cbsj.xmbm':parent.YMLib.Var.xmbm
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
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
		function uploadYhdzx(){
			var submit=true;
			submit = validateText('qdzh','number',submit);
			submit = validateText('zdzh','number',submit);
			if(!submit){
				return;
			}
			if(zhuanghao()){
				$('#cbsj').ajaxSubmit({
					dataType:'json',
					success:function(msg){
						if(msg.result){
							alert("修改成功！");
							closeWindow("yhdzxedit");
						}
					},
					error:function(msg){
						alert("修改失败！");
					}
				});
			}
		}
		function zhuanghao(){
			if(Number($('#qdzh').val())<Number($('#span_qdzh').html())){
				alert("起点桩号不能小于"+$('#span_qdzh').html());
				return false;
			}else if(Number($('#zdzh').val())>Number($('#span_zdzh').html())){
				alert("止点桩号不能大于"+$('#span_zdzh').html());
				return false;
			}else if(Number($("#zdzh"))<Number($('#qdzh').val())){
				alert("止点桩号不能小于起点桩号");
				return false;
			}else{
				return true;
			}
		}
	</script>
</head>
<body style="font-size: 12px;">
	<div>
		<form id="cbsj" action="../../../qqgl/updateCbsj.do">
			<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						养护大中修项目 — 初步设计或施工图设计
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						项目编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmbm1" name="xmbm" style="width: 120px;" disabled="disabled" type="text"/>
						<input id="xmbm" name="xmbm" type="hidden"/>
						<input id="id" name="id" type="hidden">
						<input id="jdbs" name="jdbs" type="hidden"/>
						<input id="xmlx" name="xmlx" value="4" type="hidden"/>
						<input id="sfbj" name="sfbj" value="1" type="hidden"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						项目名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmmc" name="xmmc" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsdw" name="jsdw" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						行政区划
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xzqh" name="xzqh" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						建设技术等级
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsjsdj" name="jsjsdj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						原路线编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ylxbh" name="ylxbh" type="text" style="width:120px;"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						起点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="qdzh" name="qdzh" onchange="querymc('qdzh')" style="width:120px;" type="text"/>
						<br/><span style="font-size: small;color: red;">起点桩号不能小于</span><span id="span_qdzh" style="font-size: small;color: red;"></span>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						讫点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="zdzh" name="zdzh" onchange="querymc('zdzh')" style="width: 120px;" type="text"/>
						<br/><span style="font-size:small; color: red;">止点桩号不能大于</span><span id="span_zdzh" style="font-size: small;color: red;"></span>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lc" name="lc" onchange="querymc('zdzh')" style="width: 100px;" type="text"/>&nbsp; Km
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						起点名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="qdmc" name="qdmc" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						讫点名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="zdmc" name="zdmc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						技术等级及里程
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						高速公路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc" name="mc" style="width:125px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						基层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc" name="jc" style="width:125px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						垫层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc" name="dc" style="width:125px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc_lc" name="mc_lc" style="width:125px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						基层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc_lc" name="jc_lc" style="width:125px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						垫层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc_lc" name="dc_lc" style="width:125px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						开工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="kgsj" name="kgsj" style="width:125px;" class="easyui-datebox" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						完工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="wgsj" name="wgsj" style="width: 125px;" class="easyui-datebox" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						工期
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gq" name="gq" style="width:120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						设计单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjdw" name="sjdw" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						设计批复文号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjpfwh" name="sjpfwh" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="pfsj" name="pfsj" style="width:120px;" class="easyui-datebox" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设性质
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsxz" name="jsxz" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
				</tr>
				<tr style="height: 70px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设方案
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<textarea id="jsfa" name="jsfa" style="width: 650px;height: 50px;"></textarea>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						上传设计批复文件
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjpf" id="uploadSjpf" /></td>
								<td><div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="$('#uploadSjpf').uploadifyUpload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="height: 30px;text-align: center;">
					<td colspan="6" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;padding-left: 10px;">
						<img onclick="uploadYhdzx()" alt="确定" style="text-align:center;" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' "/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>