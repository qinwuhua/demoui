/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	loadUnit(id,$.cookie("unit"));
}
/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	loadDist(id,"360000");
}
function jhnf(id,url){
	$('#'+id).combobox({    
	    url:url,
	    valueField:'text',    
	    textField:'text'   
	}); 
}
function AddWqgz(){
	openDialog("wqgz_xx", "添加危桥改造计划库信息", "../add/wqgzAdd.jsp");
}
function AddAbgc(){
	openDialog("abgc_xx", "添加安保工程计划库信息", "../add/abgcAdd.jsp");
}
function Addzhfz(){
	openDialog("zhfz_xx", "添加灾害防治计划库信息", "../add/zhfzAdd.jsp");
}
//步骤(xx,sh)   点击详细时对应的ID   资金下达的ID
var bz,xxId,zjId;
/**
 * 弹出详细信息层
 * @param id ID
 * @param title 标题
 * @param href url路径
 */
function openDialog(id,title,href){
	bz=id.substring(id.indexOf('_')+1);
	rowDate = gridObj.datagrid("getSelected");
	xxId=rowDate.id;
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
	}).dialog("setTitle",title).dialog("open");
}
function openAdd(id,title,href){
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true
	}).dialog("setTitle",title).dialog("open");
}
function openZjxd(id,title,href,width,height,zjid){
	zjId=zjid;
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : width,
		height : height,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
		onClose:function(){
			//$('#'+id).dialog('destroy',false);
		}
	}).dialog("setTitle",title).dialog("open");
}
function addZjxd(){
	var zjxd={'zjxd.xmid':xxId,'zjxd.xdnf':$('#zjxdnf').combobox("getValue"),'zjxd.xdzj':$('#xdzj').val(),
			'zjxd.sfzj':$('input[name="rList"]:checked').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').html()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/addZjxd.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			alert("添加成功！");
		}
	});
}
function closeWindow(id){
	$('#'+id).dialog("close");
}
function queryZjxdList(url){
	var params={'zjxd.xmid':xxId};
	$('#zjxdList').datagrid({
		url : url,
		queryParams : params,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 3,
		height : 138,
		width : 900,
		columns : [[
		{field : 'cz',title : '操作',width : 115,align : 'center',
			formatter : function(value, row, index) {
				var p1="'zjxd',",p2="'资金下达',",p3="'../zjxd/zjxd_edit.jsp',",p4="'800',",
					p5="'250'",p6=",'"+row.id+"'";
				var result = '<a href="javascript:openZjxd('+p1+p2+p3+p4+p5+p6+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				result += '<a href="javascript:dropZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '上报年份',width : 150,align : 'center',
			formatter : function(value, row, index) {
				if (row.sfzj == "0") {
					return "否";
				} else {
					return "是";
				}
			}
		},
		{field:'xdnf',title : '下达年份',width : 150,align : 'center'}, 
		{field : 'xdzj',title : '下达资金',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]]
	});
}
function dropZjxdById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropZjxdById.do',
		dataType:'json',
		data:'zjxd.id='+id,
		success:function(data){
			if(data.result=="true"){
				alert("删除成功！");
				$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
			}else{
				alert("删除失败！");
			}
		}
	});
}
function editZjxd(){
	var zjxd={'zjxd.id':zjId,'zjxd.xdnf':$('#zjxdnf').combobox('getValue'),
			'zjxd.xdzj':$('#xdzj').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').html()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZjxdById.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			if(data.result=="true"){
				alert("修改成功！");
				closeWindow('zjxd');
				$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
			}else{
				alert("修改失败！");
			}
		}
	});
}