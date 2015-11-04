var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumShuih(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumShuih.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				$('#lblZLC').html(data.shuihs[0].qzlc);
				$('#lblXMLC').html(data.shuihs[0].yhlc);
				$('#lblZTZ').html(data.pfztz);
				$('#lblBTZ').html(data.jhsybzje);
				$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblCount').html("0");
				$('#lblZLC').html("0");
				$('#lblXMLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
}
function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('shuih_xx','灾毁重建',"/jxzhpt/page/jhgl/jhkxx/shxm.jsp",'shuih_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('shuih_edit','灾毁重建',"/jxzhpt/page/jhgl/edit/shxm.jsp",'shuih_edit',1000,500);
}
function shxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-170,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm('+"'"+row.shuihs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	return result;
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd==2) || (roleName()=="省级" && row.jh_sbthcd<4)){
					result="未上报";
				}else if((roleName()=="县级" && row.jh_sbthcd==2) || (roleName()=="市级" && row.jh_sbthcd==4)){
					result="已上报";
				}else if((row.jh_sbthcd==4)){
					result="未审核";
				}else if((row.jh_sbthcd==6)){
					result="已审核";
				}else if((roleName()=="市级" && row.jh_sbthcd==0)){
					result="待上报";
				}
				return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
	        {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'省补助金额(万元)',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.shuihs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function openAddSjlx(id,nf){
	YMLib.Var.NF=nf;
	YMLib.Var.ID=id;
	YMLib.UI.createWindow('add_shuihlx','添加路线',"/jxzhpt/page/jhgl/add/shuihlxAdd.jsp",'addshuihlx',900,350);
}
function shxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm('+"'"+row.shuihs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	}else{
	        		result+="编辑";
	        	}
	        	return result;
	        }},
	        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<4)){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
					if(roleName()!="县级")
						result+='    |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else{
					result='已上报';
				}
	        	return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
	        {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'省补助金额(万元)',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.shuihs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function shxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm('+"'"+row.shuihs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if($.cookie("unit")=="36" && row.jh_sbthcd==4 && row.spzt=="0")
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	return result;
	        }},
	        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if($.cookie("unit")=="36" && row.jh_sbthcd<=4 && row.spzt=='0'){
	        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
	        		result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
	        	}else if($.cookie("unit")!="36"){
	        		result="审批     |  退回";
	        	}else if(row.spzt=='1'){
	        		result="已审批";
	        	}
	        	return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
	        {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'省补助金额(万元)',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.shuihs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function shxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-150,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm('+"'"+row.shuihs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下达',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zjxd_shxm','灾毁重建计划详情','../zjxd/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下达</a>';
	        }},
	        {field:'sbzt',title:'建设状态',width:80,align:'center',
	        		formatter:function(value,row,index){
	        			if(row.kgzt=='0' && row.jgzt=='0')
	        				return '未开工';
	        			else if(row.kgzt=='1' && row.jgzt=='0')
	        				return '在建';
	        			else if(row.kgzt=='1' && row.jgzt=='1')
	        				return '竣工';
	        		}
	        },
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
	        {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'省补助金额(万元)',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.shuihs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function queryShuihById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryShuihById.do',
		dataType:'json',
		data:"jh.id="+id,
		success:function(data){
			//基础
			$('#lxmc').html(data.shuihs[0].lxmc);
			$('#lxbm').html(data.shuihs[0].lxbm);
			$('#jsdd').html(data.shuihs[0].jsdd);
			$('#qdzh').html(data.shuihs[0].qdzh);
			$('#zdzh').html(data.shuihs[0].zdzh);
			$('#qzlc').html(data.shuihs[0].qzlc);
			$('#gydwxx').html(data.shuihs[0].gydw);
			$('#xzqhdm').html(data.shuihs[0].xzqhdm);
			$('#xzqhmc').html(data.shuihs[0].xzqhmc);
			$('#yjsdj').html(data.shuihs[0].yjsdj);
			$('#ylmlx').html(data.shuihs[0].ylmlx);
			$('#yhlc').html(data.shuihs[0].yhlc);
			$('#bhnr').html(data.shuihs[0].bhnr);
			
			//计划
			$('#jhnf').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#jhxdsj').html(data.xdsj);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#dc').html(data.dc);
			$('#jc').html(data.jc);
			$('#mc').html(data.mc);
			$('#lmkd').html(data.lmkd);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#pfztz').html(data.pfztz);
			$('#bbz').html(data.jhsybzje);
			$('#dfzc').html(data.jhsydfzcje);
			$('#lblSFSQABLBZ').html(data.sfsqablbz);
			$('#lblABLBZWH').html(data.ablbzsqwh);
			$('#sftqss').html(data.sftqss);
			$('#jhxdwh').html(data.jhxdwh);
			$('#gkpfwh').html(data.gksjwh);
			$('#sjpfwh').html(data.sjpfwh);
			$('#sfgydbm').html(data.sfgydbm);
			$('#lblJHRemarks').html(data.jhbz);
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
function dropShuih(id,readLoad){
	if(confirm("确认要移除选中计划？")){
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropShuihById.do',
			dataType:'text',
			data:'jh.id='+id,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
						"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				if(readLoad=="true"){
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
function dropShuihs(){
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
			url:'../../../jhgl/dropShuihById.do',
			dataType:'json',
			data:'jh.id='+id,
			success:function(data){
				if(data.jh && data.lx){
					var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"lx.gydw":null,
							"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
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
function editShuih(){
	if(lxztz()){
		var jh={'jh.id':$('#jhid').val(),'jh.sbnf':$('#editsbnf').combobox('getValue'),
				'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
				'jh.xdsj':$('#jhxdsj').datebox('getValue'),'jh.xmmc':$('#xmmc').val(),
				'jh.yhlb':$('#yhlb').val(),'jh.sjdw':$('#sjdw').val(),'jh.sjpfdw':$('#sjpfdw').val(),
				'jh.sjlmlx':$('#sjlmlx').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
				'jh.mc':$('#mc').val(),'jh.lmkd':$('#lmkd').val(),'jh.pfwh':$('#pfwh').val(),
				'jh.pfsj':$('#pfsj').datebox('getValue'),'jh.pfztz':$('#pfztz').val(),
				'jh.jhsybzje':$('#bbz').val(),'jh.jhsydfzcje':$('#dfzc').val(),
				'jh.sfsqablbz':$('#lblSFSQABLBZ').val(),'jh.ablbzsqwh':$('#lblABLBZWH').val(),
				'jh.sftqss':$('#sftqss').val(),'jh.jhxdwh':$('#jhxdwh').val(),
				'jh.gksjwh':$('#gkpfwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),
				'jh.sfgyhbm':$('#sfgyhbm').val(),'jh.jhbz':$('#lblJHRemarks').val()
		};
		$.ajax({
			type:'post',
			url:'../../../jhgl/editShuihById.do',
			dataType:'text',
			data:jh,
			success:function(data){
				alert("修改成功！");
				parent.$('#grid').datagrid('reload');
				parent.$('#shuih_edit').window('destroy');
			}
		});
	}else{
		alert("批复总投资计算不正确！");
	}
}
/**
 * 对每一条路线的总投资进行验证
 */
function lxztz(){
	var lxCount = ($('#tr_scxx').index()-1)/6;
	var result=false,fdbz=0,ztz=0.0;//result：是否符合标准;fdbz：投资金额的浮动标准;ztz：总投资金额，每条路线累计相加
	for(var i=0;i<lxCount;i++){
		var lx={'lx.lxbm':$('#lxbm'+i).html(),'lx.qdzh':$('#qdzh'+i).html(),'lx.zdzh':$('#zdzh'+i).html(),
				'lx.gydwdm':$.cookie("unit"),'lx.yhlc':$('#yhlc'+i).html(),'lx.qzlc':$('#qzlc'+i).html(),
				'lx.jhid':$('#editsbnf').combobox('getValue'),'lx.xzqhdm':$('#xzqhdm'+i).html(),
				'lx.yjsdj':$('#yjsdjxx'+i).html(),'xmlx':'灾毁重建'};
		$.ajax({
			type:'post',
			url:'../../../jhgl/verifyLx.do',
			async:false,
			data:lx,
			dataType:'json',
			success:function(data){
				ztz=Number(ztz)+Number(data.je);
				fdbz=data.fdbz;
			}
		});
	}
	if($('#pfztz').val()>=(ztz-fdbz) && $('#pfztz').val()<=(Number(ztz)+Number(fdbz))){
		result=true;
	}else{
		result=false;
		return result;
	}
	if($('#pfztz').val()==Number($('#bbz').val())+Number($('#dfzc').val())){
		result=true;
	}else{
		result=false;
	}
	return result;
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
	    onClickRow:grid.onClickRow,
	    view:grid.view,
	    detailFormatter:grid.detailFormatter,
	    onExpandRow:grid.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editShuihStatus.do',
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
	window.location.href="/jxzhpt/jhgl/queryShuihwjById.do?jh.id="+xxId+"&jh.gkbgmc="+file;
}
function downSjt(file){
	window.location.href="/jxzhpt/jhgl/queryShuihwjById.do?jh.id="+xxId+"&jh.sjsgtmc="+file;
}
function exportSh(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}
