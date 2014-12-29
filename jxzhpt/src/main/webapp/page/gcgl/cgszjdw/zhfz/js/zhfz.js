function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','灾害防治开工详情','zhfzxx.jsp','wqxx',700,450);
	//window.open("zhfzxx.jsp");
}
function zjdw(){
	YMLib.UI.createWindow('wqxx','车购税资金到位情况','zhfzzjdw.jsp','wqxx',800,450);
	//window.open("abgczjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','zhfzzjdwtj.jsp','wqxx',700,240);
}
function editCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','zhfzzjdwxg.jsp','wqxx',700,240);
}
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/zhfz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
			 {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="zjdw()">资金到位</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'zlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'jsdj',title:'路线技术等级',width:100,align:'center'},
	    ]]    
	}); 
}

function showAllZJ(){
	$('#zjgrid').datagrid({    
	    url:'js/wqgz1.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="editCgs()">编辑</a>    '+'<a href="#" >删除</a>   ';
	        }},
	        {field:'tbyf',title:'填报月份 ',width:140,align:'center'},
	        {field:'tbsj',title:'填报时间 ',width:140,align:'center'},
	        {field:'tbr',title:'填报人 ',width:140,align:'center'},
	        {field:'cgsdwzj',title:'车购税到位资金(万元)',width:150,align:'center'}
	    ]]    
	}); 
}