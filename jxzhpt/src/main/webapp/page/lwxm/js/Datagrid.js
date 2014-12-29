//基础库管理
function jckglWqgz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckJck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgJck('+"'wqgz_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},  
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'xjnd',title:'修建/改建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	    ]]    
	});  
}
function jckglAbgc(){
	$("#grid").datagrid({    
		 url:"../js/lwxm2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckJck('+"'abgc_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgJck('+"'abgc_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},    
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}
function jckglZhfz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckJck('+"'zhfz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgJck('+"'zhfz_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},  
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}
//基础库审核
function jckshWqgz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:80,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
							'<a href="javascript:ckJcksh('+"'wqgz_ck.jsp','900','450'"+')" style="text-decoration:none;">详细</a>';
			}}, 
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'xjnd',title:'修建/改建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	    ]]    
	});  
}
function jckshAbgc(){
	$("#grid").datagrid({    
		 url:"../js/lwxm2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:60,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
							'<a href="javascript:ckJcksh('+"'abgc_ck.jsp','900','400'"+')" style="text-decoration:none;">详细</a>';
			}},
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}
function jckshZhfz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:60,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
							'<a href="javascript:ckJcksh('+"'zhfz_ck.jsp','900','400'"+')" style="text-decoration:none;">详细</a>';
			}},   
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}
//审查库管理
function sckglWqgz(){
	$("#grid").datagrid({    
		 url:"../js/sckgl1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckSck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgSck('+"'wqgz_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},
	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
	    ]]    
	});  
}
function sckglAbgc(){
	$("#grid").datagrid({    
		 url:"../js/sckgl2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
		    columns:[[    
		  			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
		  			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
						return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
						'<a href="javascript:ckSck('+"'abgc_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
						'<a href="javascript:xgSck('+"'abgc_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
					}},    
		  	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
		  	        {field:'gydw',title:'管养单位',width:160,align:'center'},
		  	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
		  	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
		  	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		  	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		  	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		  	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		  	        {field:'zlc',title:'总里程',width:140,align:'center'},
		  	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		  	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
		  	    ]]    
		  	});  
}
function sckglZhfz(){
	$("#grid").datagrid({    
		 url:"../js/sckgl3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckSck('+"'zhfz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgSck('+"'zhfz_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},    
	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'lxjsdj',title:'路线技术等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}
//审查库审核
function sckshWqgz(){
	$("#grid").datagrid({    
		 url:"../js/scksh1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:60,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
							'<a href="javascript:ckSck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>';
			}},   
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
	    ]]    
	});  
}
function sckshAbgc(){
	$("#grid").datagrid({    
		 url:"../js/scksh2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
		    columns:[[    
		  			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
		  			{field:'cz',title:'操作',width:60,align:'center',formatter:function(value,row,index){
		  				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
		  							'<a href="javascript:ckSck('+"'abgc_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>';
		  			}},
		  	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
		  	        {field:'gydw',title:'管养单位',width:160,align:'center'},
		  	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
		  	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
		  	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		  	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		  	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		  	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		  	        {field:'zlc',title:'总里程',width:140,align:'center'},
		  	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		  	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
		  	    ]]    
		  	});  
}
function sckshZhfz(){
	$("#grid").datagrid({    
		 url:"../js/scksh3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:60,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckSck('+"'zhfz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>';
			}},
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'lxjsdj',title:'路线技术等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}