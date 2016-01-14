<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>病害隧道月报添加</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/bhsd.js"></script>
	<script type="text/javascript">
	$(function(){
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
			var d = myDate.getDate();
			sbsj = y+"-"+m+"-"+d;
			var mystr='';
			var mystr1='';
			var mystr2='';
			var mystr3='';
			var mystr4='';
			if(m==1){
				mystr=y+'-'+m;
				mystr1=(y-1)+'-'+11;
				mystr2=(y-1)+'-'+12;
				mystr3=(y-1)+'-'+10;
				mystr4=(y-1)+'-'+9;
			}
			else if(m==2){
				mystr=y+'-'+m;
				mystr1=(y-1)+'-'+12;
				mystr2=y+'-'+1;
				mystr3=(y-1)+'-'+11;
				mystr4=(y-1)+'-'+10;
			}else if(m==3){
				mystr=y+'-'+m;
				mystr1=y+'-'+1;
				mystr2=y+'-'+2;
				mystr3=(y-1)+'-'+12;
				mystr4=(y-1)+'-'+11;
			}else if(m==4){
				mystr=y+'-'+m;
				mystr1=y+'-'+2;
				mystr2=y+'-'+3;
				mystr3=y+'-'+1;
				mystr4=(y-1)+'-'+12;
			}else{
				mystr=y+'-'+m;
				mystr1=y+'-'+(m-2);
				mystr2=y+'-'+(m-1);
				mystr3=y+'-'+(m-3);
				mystr4=y+'-'+(m-4);
			}

			$("#tj_sbyf").append("<option id="+mystr+" value="+mystr+" selected='selected'>"+mystr+"</option>");
			$("#tj_sbyf").append("<option id="+mystr2+" value="+mystr2+">"+mystr2+"</option>");
			$("#tj_sbyf").append("<option id="+mystr1+" value="+mystr1+">"+mystr1+"</option>");
			$("#tj_sbyf").append("<option id="+mystr1+" value="+mystr3+">"+mystr3+"</option>");
			$("#tj_sbyf").append("<option id="+mystr1+" value="+mystr4+">"+mystr4+"</option>");
// 			$("#tj_sbsj").text(sbsj);
// 			getYuefen();
		});
	function check(str){
		var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
		if(str.value==''){
			return;
		}
	    if( !g.test(str.value)){
	    	alert("请输入正确的金额");
	    	$(str).val('');
	    	return;
	    }else{
	    	shewcqk();
	    }
	}
	function getYuefen(){
		
		var data="jhid="+parent.parent.obj1.jhid+"&bfyf="+$("#tj_sbyf").val();
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectcgsyf.do',
			data:data,
			dataType:'json',
			success:function(msg){
				/* $("#tj_zjdw_btz").val(msg.zjdw_btz);
				$("#tjbtz").text(msg.zjdw_btz);
				$("#tj_zjdw_stz").val(msg.zjdw_stz);
				$("#tjstz").text(msg.zjdw_stz); */
				//shewcqk();
			}
		});
	}
	function shewcqk(){
		var dwb=$("#tj_zjdw_btz").val();
    	var dws=$("#tj_zjdw_stz").val();
    	var dwq=$("#tj_zjdw_qttz").val();
    	var wcb=$("#tj_wc_btz").val();
    	var wcs=$("#tj_wc_stz").val();
    	var wcq=$("#tj_wc_qttz").val();
    	if(dwb=='') dwb=0;
    	if(dws=='') dws=0;
    	if(dwq=='') dwq=0;
    	if(wcb=='') wcb=0;
    	if(wcs=='') wcs=0;
    	if(wcq=='') wcq=0;
    	if((parseFloat(dwb)+parseFloat(dws)+parseFloat(dwq))==0){
    		$("#tj_wcqk").text("0");
    	}else
    	$("#tj_wcqk").text(((parseFloat(wcb)+parseFloat(wcs)+parseFloat(wcq))/(parseFloat(dwb)+parseFloat(dws)+parseFloat(dwq))*100).toFixed(2));
    	
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
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">

            <tr>
                <td>
                    <br />
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 35px;">
                            <td  style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;width: 145px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成投资（万元）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <div>
                                <table>
                                <tr>
                                <td style="width: 157px;">部投资：<input style="width: 50px" name="WC_BTZ" type="text" id="tj_wc_btz"   onblur='check(this)'/><font color='red' size='2'>*&nbsp;</font></td>
                                <td style="width: 157px;">省投资：<input style="width: 50px" name="WC_STZ" type="text" id="tj_wc_stz" onblur='check(this)'/><font color='red' size='2'>*&nbsp;</font></td>
                                <td style="width: 157px;">其他投资：<input style="width: 50px" name="WC_QTTZ" type="text" id="tj_wc_qttz" onblur='check(this)'/><font color='red' size='2'>*&nbsp;</font></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
<!--                         <tr style="height: 35px;"> -->
<!--                             <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; -->
<!--                                 border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"> -->
<!--                                 <div> -->
<!--                                 <table> -->
<!--                                 <tr> -->
<!--                                 <td style="width: 157px;">车购税：<input style="width: 50px" name="wczj_cgs" type="text" id="wczj_cgs"   /></td> -->
<!--                                 <td style="width: 157px;">燃油税：<input style="width: 50px" name="wczj_rys" type="text" id="wczj_rys" /></td> -->
<!--                                 <td style="width: 157px;">财政：<input style="width: 50px" name="wczj_cz" type="text" id="wczj_cz"   /></td> -->
<!--                                 <td style="width: 157px;">各盟市配套资金：<input style="width: 50px" name="wczj_gmsptzj" type="text" id="wczj_gmsptzj"  /></td> -->
<!--                                 </tr> -->
<!--                                 </table> -->
<!--                                 </div> -->
<!--                             </td> -->
<!--                         </tr> -->
                        <tr style="height: 35px;">
                            <td  style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月资金到位（万元）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <div>
                                <table>
                                <tr>
                                <td style="width: 157px;">部投资：
                                <input style="width: 50px" name="ZJ_BTZ" type="text" id="tj_zjdw_btz"  onblur='check(this)' />
                                </td>
                                <td style="width: 157px;">省投资：
                                <input style="width: 50px" name="ZJ_STZ" type="text" id="tj_zjdw_stz"  onblur='check(this)' />
                                </td>
                                <td style="width: 157px;">其他投资：
                                <input style="width: 50px" name="ZJ_QTTZ" type="text" id="tj_zjdw_qttz" onblur='check(this)'/>
                                <font color='red' size='2'>*&nbsp;</font>
                                </td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                         
<!--                         <tr style="height: 35px;"> -->
<!--                             <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; -->
<!--                                 border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"> -->
<!--                                 <div> -->
<!--                                 <table> -->
<!--                                 <tr> -->
<!--                                 <td style="width: 157px;">车购税：<input style="width: 50px" name="dwzj_cgs" type="text" id="dwzj_cgs"   /></td> -->
<!--                                 <td style="width: 157px;">燃油税：<input style="width: 50px" name="dwzj_rys" type="text" id="dwzj_rys" /></td> -->
<!--                                 <td style="width: 157px;">财政：<input style="width: 50px" name="dwzj_cz" type="text" id="dwzj_cz"   /></td> -->
<!--                                 <td style="width: 157px;">各盟市配套资金：<input style="width: 50px" name="dwzj_gmsptzj" type="text" id="dwzj_gmsptzj"  /></td> -->
<!--                                 </tr> -->
<!--                                 </table> -->
<!--                                 </div> -->
<!--                             </td> -->
<!--                         </tr> -->
                         <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">上报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                 <input id="tj_sbsj" type="text" class="easyui-datebox" style="width: 100px;"></input>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" colspan="3">
                                <select id="tj_sbyf" onchange="getYuefen()"></select>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">情况说明：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                <input name="QKSM" type="text" id="tj_qksm" style="width: 350px;" />
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px;">本月完成情况（%）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;width:30px;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                <span  id="tj_wcqk" ></span>
                            </td>
                        </tr>
                        
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img id="addbtn" src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="tjwqgzyb();" />
                                <img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" id="Img2" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" onclick="closes('wqxxtj')" style="cursor: hand" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</div>

</body>
</html>