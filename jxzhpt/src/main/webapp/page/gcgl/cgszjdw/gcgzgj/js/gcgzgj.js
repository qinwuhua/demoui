var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建开工详情','gcgzgjxx.jsp','wqxx',700,450);
	//window.open("gcgzgjxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','gcgzgjzjdw.jsp','wqxx1',800,500);
	//window.open("gcgzgjzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','gcgzgjzjdwtj.jsp','wqxx',500,220);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','gcgzgjzjdwxg.jsp','wqxx',500,220);
}

//添加车购税
function tjgcgzgjcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	if($("#tj_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglgcgzgj.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglgcgzgj.tbr="+$.cookie("truename")+"&gcglgcgzgj.tbsj="+tbsj+"&gcglgcgzgj.tbyf="+$("#tj_tbyf").val()
	+"&gcglgcgzgj.jhid="+parent.parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzgjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('该月车购税可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xggcgzgjcgs(){
	var data="gcglgcgzgj.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id+"&gcglgcgzgj.tbyf="+$("#xg_tbyf").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateGcgzgjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
	
}
function delCgs(index){
	var data1=$("#zjgrid").datagrid('getRows')[index];
	var data="gcglgcgzgj.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteGcgzgjCgs.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#zjgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}

function showAll(){
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
	var jgzt='0';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
  				return '定位    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
  			}},
  			{field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'ylmlx',title:'原路面类型',width:100,align:'center'}
	    ]]    
	}); 
}

function showAllZJ(){
	var jhid=parent.obj1.id;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzgjCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid
		},
	    columns:[[
				{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
					if(row.sbsj==""||row.sbyf>row.tbyf){
		        		return '<a href="#" onclick="editCgs('+index+')">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')">删除</a>   ';
		        	}
		        	else return '编辑   '+'删除';
				}},
				{field:'tbyf',title:'填报月份 ',width:140,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:140,align:'center'},
				{field:'tbr',title:'填报人 ',width:140,align:'center'},
				{field:'cgsdwzj',title:'车购税到位资金(万元)',width:150,align:'center'}
	    ]]    
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzgjFile.do"+'&flag='+'cgszjdw%2fgcgzgj%2fgcgzgjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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

function downFile(str){
	if($("#xz_"+str).text()=='下载附件'){
		parent.window.location.href="../../../../gcgl/downGcgzgjFile.do?type="+str+"&jhid="+parent.obj1.id;
	}
	else return;
}
function deleteFile(str){
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.id+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteGcgzgjFile.do',
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
function jiazai(ooo){
//	alert(ooo);
	var data=ooo;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectGcgzgjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text("下载附件");
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text("下载附件");
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text("下载附件");
				}
			}
	});	
}