<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面升级资金下达</title>
</head>
<body>
	<div style="text-align: center;">
		<table width="97%" height="90%" cellpadding="0" cellspacing="0"
			border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 25px;">
							<td colspan="6"
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
								工程改造路面升级项目基本信息</td>
						</tr>
						<tr style="height: 30px;">
							<td
								style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								路线名称</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="lxmc"></span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								路线编码</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="lxbm"></span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								原技术等级</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
								<span id="jsdd"></span>
							</td>
						</tr>
						<tr style="height: 30px;">
							<td
								style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								起点桩号</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="qdzh">0</span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								止点桩号</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="zdzh">0</span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								起止里程</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
								<span id="qzlc">0</span>（公里）
							</td>
						</tr>
						<tr style="height: 30px;">
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								管养单位</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="gydwxx"></span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								行政区划代码</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
								<span id="xzqhdm"></span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								行政区划</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
								<span id="xzqhmc"></span>
							</td>
						</tr>
						<tr style="height: 50px;">
							<td
								style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								项目里程</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<span id="yhlc">0</span>（公里）
							</td>
							<td
								style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								&nbsp;</td>
							<td colspan="3"
								style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
								&nbsp;</td>
						</tr>
						<tr style="height: 50px;">
							<td
								style="border-top: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
								病害内容</td>
							<td colspan="5"
								style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
								<span id="bhnr"></span>&nbsp;
							</td>
						</tr>
						<tr style="height: 50px;">
							<td
								style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-top: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;"
								class="style1">备&nbsp;&nbsp;&nbsp; 注</td>
							<td colspan="5"
								style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; text-align: left; padding-left: 10px;"
								class="style1"><span id="bz"></span>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="45" align="left" background="../images/page/jt.jpg"
					style="padding-left: 15px; font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat; background-position: left center; background-repeat: no-repeat;">
					工程改造路面升级项目资金下达信息</td>
			</tr>
			<tr>
				<td style="text-align: left; padding-left: 20px; font-size: 12px;">
					共有【&nbsp;<span id="lblTzCount"
					style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个下发信息，项目总投资【&nbsp;<span
					id="lblxfzjzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
				</td>
			</tr>
			<tr>
				<td align="center">
					<table id="zjxdList" width="100%" height="90%" cellpadding="0" cellspacing="0" border="1" style="padding-top: 10px;"></table>
				</td>
			</tr>
		</table>
		<table width="97%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
				<td align="center">
					<table>
						<tr>
							<td>
								<a href="javascript:openZjxd('zjxd','资金下达','../zjxd/zjxd.jsp','800','250')"">
									<img id="imgAdd"   onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianj2.gif'" alt="添加"
										onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianj1.gif'"
										src="${pageContext.request.contextPath}/images/Button/tianj1.gif" style="border-width: 0px; cursor: hand;" />
								</a>
							</td>
							<td><a href="javascript:closeWindow('zjxd_gclmsj')" onclick="Return()"> <img
									src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回"
									onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
									onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'"
									style="border: 0">
							</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div id="zjxd" style="font-size: 12px;width:90%;"></div>
	<script type="text/javascript">
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcsjById.do',
		data:"jh.id="+xxId,
		dataType:'json',
		success:function(data){
			$('#lxmc').html(data.plan_lx_gcsjs[0].lxmc);
			$('#lxbm').html(data.plan_lx_gcsjs[0].lxbm);
			$('#jsdd').html(data.plan_lx_gcsjs[0].yjsdj);
			$('#qdzh').html(data.plan_lx_gcsjs[0].qdzh);
			$('#zdzh').html(data.plan_lx_gcsjs[0].zdzh);
			$('#qzlc').html(data.plan_lx_gcsjs[0].qzlc);
			$('#gydwxx').html(data.plan_lx_gcsjs[0].gydw);
			$('#xzqhdm').html(data.plan_lx_gcsjs[0].xzqhdm);
			$('#xzqhmc').html(data.plan_lx_gcsjs[0].xzqhmc);
			$('#ylmlx').html(data.plan_lx_gcsjs[0].ylmlx);
			$('#yhlc').html(data.plan_lx_gcsjs[0].yhlc);
			$('#bhnr').html(data.plan_lx_gcsjs[0].bhnr);
		}
	});
	queryZjxdList('../../../jhgl/queryZjxdByXmId.do');
	queryZjxdSumByXmid();
	</script>
</body>
</html>