<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾害防治月报列表</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/zhfz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#gydw').combotree({   
				url:"js/gydw.json"
			}); 
			showYBlist();
		});
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
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	            <td height="25" align="left" background="${pageContext.request.contextPath}/images/dht_bg.jpg" style="padding-left: 25px; background-repeat: no-repeat; font-size: 12px;">
	                <a style="color: #1a5780" href="#">工程管理</a> &nbsp;>&nbsp;
	                <a style="color: #1a5780" href="#">项目进度管理</a>
	            	<font style="color: #5C5C5C;">&nbsp;>&nbsp;灾害防治月报上报</font>
	            </td>
        	</tr>
        	<tr>
				<td height="45" align="left" background="${pageContext.request.contextPath}/images/jt.jpg"
					style="padding-left: 15px; font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat; background-position: left center; background-repeat: no-repeat;">
					灾害防治项目审查库信息
				</td>
			</tr>
             <tr>
                <td>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                width: 15%; padding-left: 10px;">
                                灾害防治项目审查信息
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                路线名称
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_LXMC">文坊-冷水</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                路线编码
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_LXBM">Y51636068</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                管养单位
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_GYDW">鹰潭市贵溪市交通局</span>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                起点桩号
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_QDZH">30.018</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                止点桩号
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_ZDZH">36.913</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                总里程
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_ZLC">6.895</span>
                                公里
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                行政区划代码
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_XZQHDM">360681</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                行政区划名称
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_XZQHMC">鹰潭市贵溪市</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                修建/改建年度
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_XJND">2006</span>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                路线技术等级
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="lblLXJSDJ">三级公路</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                建设规模
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_YHLC">2</span>
                                公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                特殊地区
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="lblTSDQ">罗霄山山脉</span>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                项目年份
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_XMNF">2014</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                项目状态
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_XMTYPE">待上报</span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                &nbsp;
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                灾害内容
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_ZHNR">g</span>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF; padding-right: 5px;">
                                备&nbsp;&nbsp;&nbsp; 注
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                text-align: left; padding-left: 10px;">
                                <span id="Lab_BZ">g</span>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="45" align="left" background="../images/page/jt.jpg" style="padding-left: 15px;
                    font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat;
                    background-position: left center; background-repeat: no-repeat;">
                    灾害防治项目月报信息
                </td>
            </tr>
            <tr>
                <td height="30" align="left" style="font-size: 12px;">
                    项目计划下达资金共【<span id="lblXDZJ" style="color: Red; font-weight: bold;">1300</span>】万元，
                    累计拨付资金共【<span id="lblBFZJ" style="color: Red; font-weight: bold;">8</span>】万元。
                    其中，2014年计划下达资金为【<span id="lblBNXDZJ" style="color: Red;
                        font-weight: bold;">0</span>】万元， 已拨付【<span id="lblBNBFZJ" style="color: Red; font-weight: bold;">0</span>】万元。
                </td>
            </tr>
            <tr>
                <td align="center">
                    
                            <table  id="ybgrid">



        </table>
        <table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px;
            height: 45px;" cellspacing="0" cellpadding="0">
            <tr style="height: 30px;">
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <a href="javascript:void(0)" onclick="window.close();">
                                    <img onclick="closes('wqxx')" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" style="border: 0" /></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    </div>

	</center>
</body>
</html>