var obj=new Object();
var obj1=new Object();
function jgys(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','交工验收信息','jgys.jsp','wqxx',650,420);
	}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationQl(data.qlbh,data.qlzxzh);
}

function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wq_xx','危桥改造',"/jxzhpt/page/jhgl/jhkxx/wqgz1.jsp",'wq_xx',1000,500);
	//YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function wqxiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wq_xx','危桥改造',"wqgzsj_ck.jsp",'wq_xx',1000,500);
	//YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function reload(str){
	 parent.$('#'+str).window('reload');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','危桥改造开工','wqgzkg.jsp','wqxx',650,330);
	}
}
function ykaigong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzkg1.jsp','wqxx',650,330);
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','危桥改造完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wangong1(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','危桥改造完工','wqgzsjwg.jsp','wqxx',800,350);
		}
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','危桥改造未完工','wqgzwwg.jsp','wqxx',400,220);
	}	

function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报信息','wqgzyb.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function ybsb__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报信息','wqgzyb__ck.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function ybsb1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报信息','wqgzyb1.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function ybsb1__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报信息','wqgzyb1__ck.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxxtj','危桥改造月报添加','wqgzybtj.jsp','wqxxtj',650,340);
	//window.open("wqgzybtj.jsp");
}
function AddInfo1(){
	YMLib.UI.createWindow('wqxxtj','危桥改造月报添加','wqgzybtj1.jsp','wqxxtj',850,350);
	//window.open("wqgzybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx.jsp','wqxx',700,340);
	//window.open("wqgzybxx.jsp");
}
function Showybxx1(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx1.jsp','wqxx',700,340);
	//window.open("wqgzybxx.jsp");
}
var ybxiangxi;
function Edityb(index){
	//alert(index);
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	ybxiangxi=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg.jsp','wqxx',650,340);
}
function Edityb1(index){
	//alert(index);
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	ybxiangxi=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg1.jsp','wqxx',850,350);
}

function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglwqgz.id="+data1.id+"&gcglwqgz.jhid="+data1.jhid;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteWqgzYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					shezhi();
					$("#ybgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}
var jhid=10;
//添加月报
function tjwqgzyb(){
	if($("#tj_wc_btz").val()==''||$("#tj_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#tj_wc_stz").val()==''||$("#tj_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
		return;
	}
	if($("#tj_wc_qttz").val()==''||$("#tj_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#tj_zjdw_qttz").val()==''||$("#tj_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
	if($("#tj_bywcmc").val()==''||$("#tj_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}
	if($("#tj_kgdl").val()==''||$("#tj_kgdl").val()==null){
		alert("请您填入截至开工段落");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#tj_wc_btz").val();
	var stz=$("#tj_wc_stz").val();
	var qttz=$("#tj_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
/*	if(stz!='0'){
		alert("危桥改造项目没有省投资");
		return;
	}*/
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz);
	var zbtz=parseFloat(parent.$("#zwcbtz").html())+parseFloat(btz);
	if(parent.pfbtz<zbtz){
		if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
		}else
		return;
	}
	if(parent.pfztz<zwc){
		if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
		}else
		return;
	}
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	if(yhjb.length==11){
		yhtype='县级';
	}
	if(yhjb.length==9||yhjb.length==8||yhjb.length==2){
		yhtype='市级';
	}
	if(yhjb.length<8&&yhjb.length>2){
		yhtype='省级';
	}
	var data = "gcglwqgz.wc_btz="+$("#tj_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#tj_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#tj_bywcmc").val()+"&gcglwqgz.kgdl="+$("#tj_kgdl").val()+"&gcglwqgz.qksm="+$("#tj_qksm").val()+"&gcglwqgz.wcqk="+$("#tj_wcqk").text()
	+"&gcglwqgz.sbsj="+sbsj+"&gcglwqgz.sbyf="+$("#tj_sbyf").val()+"&gcglwqgz.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype;
//	alert(data +"----");
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxxtj');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
function tjwqgzyb1(){
	if($("#tj_wc_btz").val()==''||$("#tj_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#tj_wc_stz").val()==''||$("#tj_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
		return;
	}
	if($("#tj_wc_qttz").val()==''||$("#tj_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#tj_zjdw_qttz").val()==''||$("#tj_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
/*	if($("#tj_bywcmc").val()==''||$("#tj_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}*/
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#tj_wc_btz").val();
	var stz=$("#tj_wc_stz").val();
	var qttz=$("#tj_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	if(parent.sfylrbwqk=='是'){
		if(stz!='0'){
			alert("部危桥改造项目没有省投资");
			return;
		}
		var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz);
		var zbtz=parseFloat(parent.$("#zwcbtz").html())+parseFloat(btz);
		if(parent.pfbtz<zbtz){
			if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
			}else
			return;
		}
		if(parent.pfztz<zwc){
			if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
			}else
			return;
		}
	}else{
		if(btz!='0'){
			alert("省危桥改造项目没有部投资");
			return;
		}
		var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz);
		var zbtz=parseFloat(parent.$("#zwcbtz").html())+parseFloat(stz);
		if(parent.pfstz<zbtz){
			if(confirm("完成总省投资不能大于计划省投资"+parent.pfstz+"万元，确认保存吗")){
			}else
			//alert("完成总省投资不能大于计划省投资"+parent.pfstz+"万元，确认保存吗");
			return;
		}
		if(parent.pfztz<zwc){
			if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
			}else
			//alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
			return;
		}
	}
	
	
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	if(yhjb.length==11){
		yhtype='县级';
	}
	if(yhjb.length==9||yhjb.length==8||yhjb.length==2){
		yhtype='市级';
	}
	if(yhjb.length<8&&yhjb.length>2){
		yhtype='省级';
	}
	var data = "gcglwqgz.wc_btz="+$("#tj_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#tj_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+0+"&gcglwqgz.kgdl="+''+"&gcglwqgz.qksm="+$("#tj_qksm").val()+"&gcglwqgz.wcqk="+$("#tj_wcqk").text()
	+"&gcglwqgz.sbsj="+sbsj+"&gcglwqgz.sbyf="+$("#tj_sbyf").val()+"&gcglwqgz.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype
	+"&gcglwqgz.zjc="+$("#zjc").val()+"&gcglwqgz.xbgz="+$("#xbgz").val()+"&gcglwqgz.sbjg="+$("#sbjg").val();
//	alert(data +"----");
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzYb1.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxxtj');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}

function xgwqgzyb(){
	if($("#xg_wc_btz").val()==''||$("#xg_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#xg_wc_stz").val()==''||$("#xg_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
		return;
	}
	if($("#xg_wc_qttz").val()==''||$("#xg_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#xg_zjdw_qttz").val()==''||$("#xg_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
/*	if($("#xg_bywcmc").val()==''||$("#xg_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}*/
	if($("#xg_kgdl").val()==''||$("#xg_kgdl").val()==null){
		alert("请您填入截至开工段落");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#xg_wc_btz").val();
	var stz=$("#xg_wc_stz").val();
/*	if(stz!='0'){
		alert("危桥改造项目没有省投资");
		return;
	}*/
	var qttz=$("#xg_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz)-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.wc_stz)-parseFloat(parent.obj.wc_qttz);
	var zbtz=parseFloat(parent.$("#zwcbtz").html())-parseFloat(parent.obj.wc_btz)+parseFloat(btz);
	if(parent.pfbtz<zbtz){
		if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
		}else
		//alert("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗");
		return;
	}
	if(parent.pfztz<zwc){
		if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
		}else
		//alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
		return;
	}
	
	var data = "gcglwqgz.wc_btz="+$("#xg_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#xg_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#xg_bywcmc").val()+"&gcglwqgz.kgdl="+$("#xg_kgdl").val()+"&gcglwqgz.qksm="+$("#xg_qksm").val()+"&gcglwqgz.wcqk="+$("#xg_wcqk").text()
	+"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id+"&gcglwqgz.sbyf="+$("#xg_sbyf").val();
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateWqgzYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
function xgwqgzyb1(){
	if($("#xg_wc_btz").val()==''||$("#xg_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#xg_wc_stz").val()==''||$("#xg_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
		return;
	}
	if($("#xg_wc_qttz").val()==''||$("#xg_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#xg_zjdw_qttz").val()==''||$("#xg_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
/*	if($("#xg_bywcmc").val()==''||$("#xg_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}*/

	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#xg_wc_btz").val();
	var stz=$("#xg_wc_stz").val();
	var qttz=$("#xg_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	if(parent.sfylrbwqk=='是'){
		if(stz!='0'){
			alert("部危桥改造项目没有省投资");
			return;
		}
		var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz)-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.wc_stz)-parseFloat(parent.obj.wc_qttz);
		var zbtz=parseFloat(parent.$("#zwcbtz").html())-parseFloat(parent.obj.wc_btz)+parseFloat(btz);
		if(parent.pfbtz<zbtz){
			if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
			}else
			//alert("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗");
			return;
		}
		if(parent.pfztz<zwc){
			if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
			}else
			//alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
			return;
		}
	}else{
		if(btz!='0'){
			alert("省危桥改造项目没有部投资");
			return;
		}
		var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz)-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.wc_stz)-parseFloat(parent.obj.wc_qttz);
		var zbtz=parseFloat(parent.$("#zwcbtz").html())-parseFloat(parent.obj.wc_stz)+parseFloat(stz);
		if(parent.pfstz<zbtz){
			alert("完成总省投资不能大于计划省投资"+parent.pfstz+"万元，确认保存吗");
			return;
		}
		if(parent.pfztz<zwc){
			alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
			return;
		}
	}
	
	
	var data = "gcglwqgz.wc_btz="+$("#xg_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#xg_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+0+"&gcglwqgz.kgdl="+''+"&gcglwqgz.qksm="+$("#xg_qksm").val()+"&gcglwqgz.wcqk="+$("#xg_wcqk").text()
	+"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id+"&gcglwqgz.sbyf="+$("#xg_sbyf").val()
	+"&gcglwqgz.zjc="+$("#zjc").val()+"&gcglwqgz.xbgz="+$("#xbgz").val()+"&gcglwqgz.sbjg="+$("#sbjg").val();
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateWqgzYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}


//开工
function tjwqgzkg(){
	if($("#tj_sgdw").val()==''){
		alert("请您输入施工单位");
		return;
	}
	if($("#tj_jldw").val()==''){
		alert("请您输入监理单位");
		return;
	}
	if($("#tj_jsdw").val()==''){
		alert("请您输入建设单位");
		return;
	}
	if($("#tj_htje").val()==''){
		alert("请您输入合同金额");
		return;
	}
	if($("#tj_gys").val()==''){
		alert("请您输入概预算");
		return;
	}
	var data="gcglwqgz.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglwqgz.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglwqgz.yjjgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglwqgz.sgdw="+$("#tj_sgdw").val()+"&gcglwqgz.jldw="+$("#tj_jldw").val()+"&gcglwqgz.jsdw="+$("#tj_jsdw").val()+"&gcglwqgz.xdwh="+$("#tj_xdwh").val()+"&gcglwqgz.zljdwj="+$("#tj_zljdwj").val()
	+"&gcglwqgz.htje="+$("#tj_htje").val()+"&gcglwqgz.gys="+$("#tj_gys").val()+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzkg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//完工
function tjwqgzwg(){
	if(!confirm("确认完工吗？")){
		return;
	}
	var data="gcglwqgz.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzwg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//未完工
function tjwqgzwwg(){
	if($("#tj_wjgyy").val()==''){
		alert("请您填写未完工原因");
		return;
	}
	var data="gcglwqgz.wjgyy="+$("#tj_wjgyy").val()+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzwwg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//显示所有
function showAll(){
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
	//alert(gydwstr);
	var jgzt='0';
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglwqgz.qlbh':$('#qlbm').val(),
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	sfylrbwqk:'是',
	    	gydwtj:'and 1=1',
	    	'gcglwqgz.xzqh':xzqhstr,
	    	'gcglwqgz.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglwqgz.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong('+index+')">完工</a>  ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'完工   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
//
//显示所有
function showAll__ck(){
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

	//alert(gydwstr);
	var jgzt='0';
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-160,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglwqgz.qlbh':$('#qlbm').val(),
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	sfylrbwqk:'是',
	    	gydwtj:'and 1=1'
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb__ck('+index+')">月报</a>   ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb__ck('+index+')">月报</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
//
function showAll1(){
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
	//alert(gydwstr);
	var jgzt='0';
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglwqgz.qlbh':$('#qlbm').val(),
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	sfylrbwqk:$("#sfylrbwqk").combobox('getValue'),
	    	gydwtj:"and gydwbm like '1%'",
	    	'gcglwqgz.xzqh':xzqhstr,
	    	'gcglwqgz.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglwqgz.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb1('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong1('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wwangong('+index+')">未完工</a>  ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb1('+index+')">月报</a>   '+'完工   未完工';
	        }},
	       
	        {field:'gydw',title:'管养（监管）单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'},
	        {field:'sbnf',title:'计划下达年度',width:100,align:'center'},
	        {field:'jhxdwh',title:'计划下达文号',width:100,align:'center'},
	        {field:'qljsgm',title:'计划下达规模',width:100,align:'center',formatter:function(value,row,index){
	        	return "长"+row.jhqlqc+"m--宽"+row.jhqlqk+"m";
	        }},
	        {field:'jszt',title:'建设状态',width:120,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='0')
	        		return '未开工';
	        	else if(row.jgzt=='1')
	        		return '竣工'
	        		else return '在建';
	        }},
	        {field:'sjkgsj',title:'项目开工时间',width:100,align:'center'}
	    ]]    
	}); 
}
function showAll1__ck(){
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

	//alert(gydwstr);
	var jgzt='0';
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-160,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglwqgz.qlbh':$('#qlbm').val(),
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	sfylrbwqk:$("#sfylrbwqk").combobox('getValue'),
	    	gydwtj:"and gydwbm like '1%'"
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb1__ck('+index+')">月报</a>   ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb1__ck('+index+')">月报</a>   ';
	        }},
	       
	        {field:'gydw',title:'管养（监管）单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'},
	        {field:'sbnf',title:'计划下达年度',width:100,align:'center'},
	        {field:'jhxdwh',title:'计划下达文号',width:100,align:'center'},
	        {field:'qljsgm',title:'计划下达规模',width:100,align:'center',formatter:function(value,row,index){
	        	return "长"+row.jhqlqc+"m--宽"+row.jhqlqk+"m";
	        }},
	        {field:'jszt',title:'建设状态',width:120,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='0')
	        		return '未开工';
	        	else if(row.jgzt=='1')
	        		return '竣工'
	        		else return '在建';
	        }},
	        {field:'sjkgsj',title:'项目开工时间',width:100,align:'center'}
	    ]]    
	}); 
}
//
var ybxx;
function showYBlist(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:213,align:'center',rowspan:2,formatter:function(value,row,index){
	              		
	              		if(yhtype=='县级'){
	              			if(row.shzt=='未审核'&&row.sfsj==11)
    			        return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除</a>   '+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=11)
		    			    return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'已审核    ';

	              		}
	              		if(yhtype=='市级'){
	              			if(row.shzt=='未审核'&&row.sfsj==9)
	    			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除    </a>'+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'<a href="#" onclick="thsjyb('+index+')">退回    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=9)
	    	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'退回    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'退回    '+'已审核    ';
	              		}
	              		if(yhtype=='省级'){
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:122,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:85,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
//
function showYBlist__ck(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:213,align:'center',rowspan:2,formatter:function(value,row,index){	              			              		
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:122,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:85,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
//
function showYBlist1(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:213,align:'center',rowspan:2,formatter:function(value,row,index){
	              		
	              		if(yhtype=='县级'){
	              			if(row.shzt=='未审核'&&row.sfsj==11)
    			        return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'<a href="#" onclick="Edityb1('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除</a>   '+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=11)
		    			    return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              			return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'已审核    ';

	              		}
	              		if(yhtype=='市级'){
	              			if(row.shzt=='未审核'&&row.sfsj==9)
	    			        	return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'<a href="#" onclick="Edityb1('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除    </a>'+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'<a href="#" onclick="thsjyb('+index+')">退回    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=9)
	    	              		return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'退回    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              				return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'退回    '+'已审核    ';
	              		}
	              		if(yhtype=='省级'){
	              			return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    '+'<a href="#" onclick="Edityb1('+index+')">编辑</a>   ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
//			        {field:'bywcmc',title:'本月完成面层（公里）',width:122,align:'center',rowspan:2},
//			        {field:'kgdl',title:'截至开工段落',width:85,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}

function showYBlist1__ck(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:213,align:'center',rowspan:2,formatter:function(value,row,index){
	              			return '<a href="#" onclick="Showybxx1('+index+')">详细</a>    ';
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
//			        {field:'bywcmc',title:'本月完成面层（公里）',width:122,align:'center',rowspan:2},
//			        {field:'kgdl',title:'截至开工段落',width:85,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
//

function uploadFile(str){
	//alert(str);
	var title='';
	if(str=='sgxkwj')
		title='请选择施工许可文件';
	if(str=='jgtcwj')
		title='请选择交工通车文件';
	if(str=='jgyswj')
		title='请选择完工验收文件';
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : title,
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadWqgzFile.do"+'&flag='+'gljsjyhgl%2fwqgz%2fwqgzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

//function downFile(str){
//	if($("#xz_"+str).text()!='暂无附件'){
//		parent.window.location.href="www.baidu.com";
//		//parent.window.location.href="../../../../gcgl/downWqgzFile.do?type="+str+"&jhid="+parent.obj1.jhid;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.jhid+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteWqgzFile.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('删除成功！');
				location.reload();
			}else{
				alert('删除失败！');
			}
		}
	});	
	}
}
function jiazaifujian(data1){
	//alert(data1);
	var data=data1;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectWqgzjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text(msg.sgxkwj);
					$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=sgxkwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text(msg.jgtcwj);
					$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgtcwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text(msg.jgyswj);
					$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgyswj'+"&jhid="+parent.obj1.jhid);
				}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=9"+"&gcglwqgz.yhtype=11"+"&gcglwqgz.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=7"+"&gcglwqgz.yhtype=9"+"&gcglwqgz.jhid="+data1.jhid;
	}
	if(parent.obj1.tsdq!=null)
	if(parent.obj1.tsdq.indexOf('省直管试点县')!=-1){
		data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=7"+"&gcglwqgz.yhtype=9"+"&gcglwqgz.jhid="+data1.jhid;
	}

	if(confirm("确认上报吗？")){
		var mydate=new Date();
		var nf1=data1.sbyf.substr(0,4);
		var yf1=data1.sbyf.substr(5,data1.sbyf.length);
		cxsfcgsjd(data1.id,mydate.getFullYear(),mydate.getMonth()+1,mydate.getDate(),'gcgl_wqgz',nf1,yf1);
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbWqgzYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('上报成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('上报失败！');
				}
			}
		});	
	}	
}
function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=11"+"&gcglwqgz.yhtype=9"+"&gcglwqgz.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbWqgzYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('退回成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('退回失败！');
				}
			}
		});	
	}	
}

function fileShow11(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/queryFjByParentId2.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlzmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile11('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile11('"+data[i].id+"')>删除</a></td></tr>";
					$("#qlzmTable").append(tr);
				}
			}
		}
	});
}
function fileShow12(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/queryFjByParentId2.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#qlcmTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile11('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile11('"+data[i].id+"')>删除</a></td></tr>";
				$("#qlcmTable").append(tr);
				}
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile11(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile2.do?uploads.id="+id;
}
/**
 * 删除文件
 * @param id 文件ID
 */
function deleteFile11(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile2.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow11(parent.obj1.id,'完工桥梁正面文件');
					 fileShow12(parent.obj1.id,'完工桥梁侧面文件');
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