var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号

function sbnf(id){
	var myDate = new Date();
	var years=[];
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
}
//工程路面升级
function gclmsjxm(jh,lx){
	selectRow={};//每次查询清空选择数据
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情','../jhkxx/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if(row.jh_sbthcd==0){
					result+='<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情','../edit/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
					var id="'"+row.id+"'";
					result+='<a href="javascript:dropGcsjs()" style="text-decoration:none;color:#3399CC;">移除</a>';
				}else{
					result+='<a style="text-decoration:none;">编辑</a>    ';
					result+='<a style="text-decoration:none;">移除</a>';
				}
				return result;
			}},
			{field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
				var result;
				if(row.sbzt=="0" && row.jh_sbthcd==0){
					result="未上报";
				}
				else if(row.sbzt=="0" && row.jh_sbthcd==2){
					result="已上报";
				}
				else if(row.sbzt=="1" && row.spzt=="0"){
					result="未审批";
				}
				else if(row.sbzt=="1" && row.spzt=="1"){
					result="已审批";
				}
				return result;
			}},
//			{field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//				var id="'"+row.id+"'";
//        		return '<a href="javascript:openZjxd('+"'gclmsj_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//			}},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		  	{field:'gydw',title:'管养单位',width:150,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].gydw;
		    	}
		  	},
		  	{field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xzqhmc;
		    	}
		  	},
		  	{field:'lxbm',title:'路线编码',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxbm;
		    	}
		  	},
		  	{field:'lxmc',title:'路线名称',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxmc;
		    	}
		  	},
		  	{field:'qdzh',title:'起点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].qdzh;
		    	}
		  	},
		  	{field:'zdzh',title:'止点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].zdzh;
		    	}
		  	},
		  	{field:'xmlc',title:'项目里程',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xmlc;
		    	}
		  	},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'}
	    ]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function gclmsjxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result="";
				result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openDialog('+"'gclmsj_sb','工程改造路面升级项目计划详情','../jhkxx/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if(row.jh_sbthcd==0)
					result+='<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情','../edit/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
				else
					result+='<a style="text-decoration:none;">编辑</a>';
				return result;
			}},
			{field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				var result;
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit")) && row.jh_sbthcd==2){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>    |    ';
					result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit")) && row.jh_sbthcd==4){
					result='<a style="text-decoration:none;">已上报</a>';
				}
				
				if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==0){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
				}else if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==2){
					result='<a style="text-decoration:none;">已上报</a>';
				}
				return result;
			}},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		  	{field:'gydw',title:'管养单位',width:150,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].gydw;
		    	}
		  	},
		  	{field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xzqhmc;
		    	}
		  	},
		  	{field:'lxbm',title:'路线编码',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxbm;
		    	}
		  	},
		  	{field:'lxmc',title:'路线名称',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxmc;
		    	}
		  	},
		  	{field:'qdzh',title:'起点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].qdzh;
		    	}
		  	},
		  	{field:'zdzh',title:'止点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].zdzh;
		    	}
		  	},
		  	{field:'xmlc',title:'项目里程',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xmlc;
		    	}
		  	},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'}
	    ]],
	    onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function gclmsjxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a style="text-decoration:none;color:#3399CC;">定位</a>   ';
				result+='<a href="javascript:openDialog('+"'gclmsj_sh','工程改造路面升级项目计划详情','../jhkxx/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if(row.jh_sbthcd==2)
					result+='<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情','../edit/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
				else
					result+='<a style="text-decoration:none;">编辑</a>';
				return result;
			}},
			{field:'c1',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
				var result;
				if(row.spzt=="0"){
					result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
					result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else if(row.spzt=="1"){
					result="已审批";
				}
				return result;
			}},
			{field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		  	{field:'gydw',title:'管养单位',width:150,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].gydw;
		    	}
		  	},
		  	{field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xzqhmc;
		    	}
		  	},
		  	{field:'lxbm',title:'路线编码',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxbm;
		    	}
		  	},
		  	{field:'lxmc',title:'路线名称',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxmc;
		    	}
		  	},
		  	{field:'qdzh',title:'起点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].qdzh;
		    	}
		  	},
		  	{field:'zdzh',title:'止点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].zdzh;
		    	}
		  	},
		  	{field:'xmlc',title:'项目里程',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xmlc;
		    	}
		  	},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'}
	    ]],
	    onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function gclmsjxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openDialog('+"'zjxd_gclmsj','工程改造路面升级项目计划详情','../jhkxx/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
				return result;
			}},
			{field:'c1',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:openDialog('+"'zjxd_gclmsj','工程改造路面升级项目资金下达','../zjxd/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
			}},
			{field:'kgzt',title:'建设状态',width:80,align:'center',
				formatter:function(value,row){
					if(value=='0' && row.jgzt=='0')
						return '未开工';
					else if(value=='1' && row.jgzt=='0')
						return '在建';
					else if(value=='1' && row.jgzt=='1')
						return '竣工';
				}
			},
			{field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		  	{field:'gydw',title:'管养单位',width:150,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].gydw;
		    	}
		  	},
		  	{field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xzqhmc;
		    	}
		  	},
		  	{field:'lxbm',title:'路线编码',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxbm;
		    	}
		  	},
		  	{field:'lxmc',title:'路线名称',width:80,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].lxmc;
		    	}
		  	},
		  	{field:'qdzh',title:'起点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].qdzh;
		    	}
		  	},
		  	{field:'zdzh',title:'止点桩号',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].zdzh;
		    	}
		  	},
		  	{field:'xmlc',title:'项目里程',width:60,align:'center',
		  		formatter : function(value, row, index) {
		    		return row.plan_lx_gcsjs[0].xmlc;
		    	}
		  	},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'}
	    ]],
	    onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function querySumMessage(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumMessage.do',
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			$('#lblZLC').html(data.plan_lx_gcsjs[0].qzlc);
			$('#lblXMLC').html(data.plan_lx_gcsjs[0].xmlc);
			$('#lblZTZ').html(data.pftz);
			$('#lblBTZ').html(data.jhsybbzje);
			$('#lblDFTZ').html(data.jhsydfzczj);
		}
	});
}
function queryGcsjXx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcsjById.do',
		data:"jh.id="+id,
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
			$('#yjsdjxx').html(data.plan_lx_gcsjs[0].yjsdj);
			$('#ylmlx').html(data.plan_lx_gcsjs[0].ylmlx);
			$('#yhlc').html(data.plan_lx_gcsjs[0].yhlc);
			$('#bhnr').html(data.plan_lx_gcsjs[0].bhnr);
			$('#fapgdw').html(data.fapgdw);
			$('#fascdw').html(data.fascdw);
			$('#faspsj').html(data.faspsj);
			$('#spwh').html(data.spwh);
			$('#tzgs').html(data.tzgs);
			$('#jsxz').html(data.jsxz);
			$('#jsnr').html(data.jsnr);
			$('#jhnf').html(data.jhnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#xdsj').html(data.xdsj);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#jsjsbz').html(data.jsjsbz);
			$('#ql').html(data.ql);
			$('#ql_m').html(data.ql_m);
			$('#sd').html(data.sd);
			$('#sd_m').html(data.sd_m);
			$('#hd').html(data.hd);
			$('#ljtsf').html(data.ljtsf);
			$('#dc').html(data.dc);
			$('#jc').html(data.jc);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#pftz').html(data.pftz);
			$('#jhsybzje').html(data.jhsybzje);
			$('#jhsydfzcje').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#sftqss').html(data.sftqss);
			$('#jhxdwh').html(data.jhxdwh);
			$('#gksjwh').html(data.gksjwh);
			$('#sjpfwh').html(data.sjpfwh);
			$('#sfgyhbm').html(data.sfgyhbm);
			$('#gksjwh').html(data.gksjwh);
			$('#remarks').html(data.remarks);
			if(data.gkbgmc!=null){
				var mc="'"+data.gkbgmc+"'";
				$('#td_gkbg').html('<a href="javascript:downGkwj('+mc+')">'+data.gkbgmc+'</a>');
			}
			if(data.sjsgtmc!=null){
				var mc="'"+data.sjsgtmc+"'";
				$('#td_sjt').html('<a href="javascript:downSjt('+mc+')">'+data.sjsgtmc+'</a>');
			}
		}
	});
}
function dropGcsjs(){
	if(confirm("确认要移除选中计划？")){
		var sel=gridObj.datagrid("getSelections");
		var id="";
		$.each(sel,function(index,item){
			if(index==sel.length-1){
				id+=item.id;
			}else{
				id+=item.id+",";
			}
		});
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropGcsjById.do',
			dataType:'json',
			data:'jh.id='+id,
			success:function(data){
				if(data.jh && data.lx){
					var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
							"jh.jhwgsj":null,"jh.pfztz":null,
							"lx.gydw":null,"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
					alert("移除成功！");
					gridObj.datagrid("reload",params);
				}
			},
			error:function(){
				alert("移除失败！");
			}
		});
	}
}
function editGcsj(){
	var jh={'jh.id':$('#jhid').val() ,'jh.jhnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox("getValue"),'jh.jhwgsj':$('#jhwgsj').datebox("getValue"),
			'jh.xdsj':$('#xdsj').datebox("getValue"),'jh.xmwybh':$('#xmwybh').val(),
			'jh.xmmc':$('#xmmc').val(),'jh.sjdw':$('#sjdw').val(),'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.jsjsbz':$('#jsjsbz').val(),'jh.ql':$('#ql').val(),'jh.ql_m':$('#ql_m').val(),
			'jh.sd':$('#sd').val(),'jh.sd_m':$('#sd_m').val(),'jh.hd':$('#hd').val(),
			'jh.ljtsf':$('#ljtsf').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
			'jh.lqlm':$('#lqlm').val(),'jh.snlm':$('#snlm').val(),'jh.gjhjsdj':$('#gjhjsdj').val,
			'jh.sftqss':$('#sftqss').val(),'jh.pfwh':$('#pfwh').val(),'jh.pfsj':$('#pfsj').datebox('getValue'),
			'jh.pftz':$('#pftz').val(),'jh.jhsybbzje':$('#jhsybbzje').val(),
			'jh.jhsydfzczj':$('#jhsysbzje').val(),'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.sfsqablbz':$('#sfsqablbz').val(),'jh.ablbzsqwh':$('#ablbzsqwh').val(),
			'jh.gksjwh':$('#gksjwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),'jh.sfgyhbm':$('#sfgyhbm').val(),
			'jh.remarks':$('#remarks').val()
		};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editGcsjById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#gclmsj_xx').dialog('close');
		}
	});
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
	    columns:grid.columns,
	    onSelect:grid.onSelect,
	    onClickRow:grid.onClickRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editGcsjStatus.do',
		dataType:'json',
		data:jh,
		async:false,
		success:function(data){
			if(data.result){
				result = true;
			}else{
				result = false;
			}
		},
		error:function(){
			result=false;
		}
	});
	return result;
}
function downGkwj(file){
	window.location.href="/jxzhpt/jhgl/queryWjById.do?jh.id="+xxId+"&jh.gkbgmc="+file;
}
function downSjt(file){
	window.location.href="/jxzhpt/jhgl/queryWjById.do?jh.id="+xxId+"&jh.sjsgtmc="+file;
}
function exportSj(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}