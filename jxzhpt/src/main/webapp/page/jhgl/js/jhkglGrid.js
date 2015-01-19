var gridObj;

//工程路面改建——计划库资金下达
function gclmgjxm_zjxd(){
	var grid = {id : 'grid',url : '../js/gclmgjxm.json',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:990,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '<a href="javascript:openDialog('+"'gclmgj_zjxd','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>';
		    	}
		    },
		    {field:'zjxf',title:'资金下发',width:60,align:'center',formatter:function(value,row,index){
		    	return '<a href="javascript:openDialog('+"'gclmgj_zjxd','工程改造路面改建项目资金下达','../zjxd/gclmgj.jsp'"+')" style="text-decoration:none;">资金下发</a>';
		    }},
		    {field : 'c4',title : '建设状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '未开工';
				}
		    },
		    {field : 'c5',title : '最近年份历史修建记录',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '有';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqhmc',title : '行政区划名称',width : 100,align : 'center'},
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center'},
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center'},
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]]
	};
	gridBind(grid);
}
//养护大中修
function yhdzxxm(){
	var grid={id:'grid',url:'../js/yhdzx.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:75,align:'center',formatter:function(value,row,index){
		        	  return '定位    '+'<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;">详细</a>';
			      }},
			      {field:'lxbm',title:'路线编码',width:80,align:'center'},
			      {field:'lxmc',title:'路线名称',width:80,align:'center'},
			      {field:'gydw',title:'管养单位',width:150,align:'center'},
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
			      {field:'qdzh',title:'起点桩号',width:60,align:'center'},
			      {field:'zdzh',title:'止点桩号',width:60,align:'center'},
			      {field:'lc',title:'里程',width:60,align:'center'},
			      {field:'hdlc',title:'核对里程',width:80,align:'center'},
			      {field:'jsdj',title:'技术等级',width:80,align:'center'},
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center'},
			      {field:'gcfl',title:'工程分类',width:80,align:'center'},
			      {field:'ztz',title:'总投资',width:80,align:'center'},
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center'}
		]]
	};
	gridBind(grid);
}
//养护大中修——资金下达
function yhdzxxm_zjxd(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:75,align:'center',formatter:function(value,row,index){
		        	  return '定位    '+'详细 ';
			      }},
			      {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
			    	  return '<a href="javascript:void()">资金下发</a>';
			      }},
			      {field:'jszt',title:'建设状态',width:80,align:'center'},
			      {field:'sbnf',title:'上报年费',width:80,align:'center'},
			      {field:'lxbm',title:'路线编码',width:80,align:'center'},
			      {field:'lxmc',title:'路线名称',width:80,align:'center'},
			      {field:'gydw',title:'管养单位',width:150,align:'center'},
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
			      {field:'qdzh',title:'起点桩号',width:60,align:'center'},
			      {field:'zdzh',title:'止点桩号',width:60,align:'center'},
			      {field:'lc',title:'里程',width:60,align:'center'},
			      {field:'hdlc',title:'核对里程',width:80,align:'center'},
			      {field:'jsdj',title:'技术等级',width:80,align:'center'},
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center'},
			      {field:'gcfl',title:'工程分类',width:80,align:'center'},
			      {field:'ztz',title:'总投资',width:80,align:'center'},
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center'}
		]]
	};
	gridBind(grid);
}

//红色旅游公路项目
function hslyglxm(){
	var grid={id:'grid',url:'../js/hslygl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'hslygl_xx','红色旅游公路项目计划详情','../jhkxx/hslygl.jsp'"+')" style="text-decoration:none;">详细</a>    '+'<a href="javascript:openDialog('+"'hslygl_bj','红色旅游公路项目计划详情'"+')" style="text-decoration:none;">编辑</a>    '+'删除';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'c4',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划年份';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	        {field:'kgn',title:'开工年',width:80,align:'center'},
	        {field:'wgn',title:'完工年',width:80,align:'center'},
	    ]]
	};
	gridBind(grid);
}
//资金下达——红色旅游公路项目
function hslyglxm_zjxd(){
	var grid={id:'grid',url:'../js/hslygl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'hslygl_zjxd','红色旅游公路项目计划详情','../jhkxx/hslygl.jsp'"+')" style="text-decoration:none;">详细</a>';
	        }},
	        {field:'c5',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'hslygl_zjxd','红色旅游公路项目计划详情','../zjxd/hslygl.jsp'"+')" style="text-decoration:none;">资金下发</a>';
	        }},
	        {field:'zjzt',title:'在建状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '未开工';
	        }},
	        {field:'c4',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划年份';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	        {field:'kgn',title:'开工年',width:80,align:'center'},
	        {field:'wgn',title:'完工年',width:80,align:'center'},
	    ]]
	};
	gridBind(grid);
}
//战备公路项目
function zbglxm(){
	var grid={id:'grid',url:'../js/zbgl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:openDialog('+"'zbgl_xx','战备公路项目计划详情','../jhkxx/zbgl.jsp'"+')" style="text-decoration:none;">详细</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zbgl_bj','战备公路项目计划详情'"+')" style="text-decoration:none;">编辑</a>    ';
	        	result+='删除';
	        	return result;
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'xzdj',title:'行政等级',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'lmkd',title:'路面宽度',width:100,align:'center'},
	        {field:'jsfa',title:'技术方案',width:82,align:'center'},
	        {field:'jhnf',title:'计划年份',width:82,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	    ]]
	};
	gridBind(grid);
}
//战备公路项目
function zbglxm_zjxd(){
	var grid={id:'grid',url:'../js/zbgl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:openDialog('+"'zbgl_zjxd','战备公路项目计划详情','../jhkxx/zbgl.jsp'"+')" style="text-decoration:none;">详细</a>';
	        	return result;
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'xzdj',title:'行政等级',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'lmkd',title:'路面宽度',width:100,align:'center'},
	        {field:'jsfa',title:'技术方案',width:82,align:'center'},
	        {field:'jhnf',title:'计划年份',width:82,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	    ]]
	};
	gridBind(grid);
}
/**
 * dataGrid绑定数据方法
 * @param grid 为dataGrid配置的JSON对象
 * id：table的id
 * url：数据路径
 * striped：斑马线效果
 * pagination：是否显示分页工具栏
 * rownumbers：是否显示行号
 * pageNumber：初始化页码
 * pageSize：初始化页面大小
 * height:初始化高度
 * columns：数据
 * queryParams:参数
 */
function gridBind(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns
	});
}