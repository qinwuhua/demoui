//基础库管理
var gydwstr;
var xzqhstr;
	function jckglWqgz(){
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
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0){
 			xzqhstr= $.cookie("dist2");
 			
 		}else if(xzqhdm.length==1){
 			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		xzqhstr=xzqhdm[0] ;
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
 		
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectWqgz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'qlmc':$("#qlmc").val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'jsdj':$("#jsdj").combobox("getValue"),
				 	'akjfl':$("#akjfl").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				 	'qlbh':$("#qlbh").val(),
				 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
				 	
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:locationQl("'+row.qlbh+'","'+row.qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}if(row.sbzt2=="未上报" && row.sbthcd==7 && row.shzt=="未审核"){
						return '<a href=javascript:locationQl("'+row.qlbh+'","'+row.qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href=javascript:locationQl("'+row.qlbh+'","'+row.qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
						}else if(row.sbzt2=="未上报" && row.sbthcd==7){
							return '<span style="color:grey;">未上报</span>';
						}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
					{field:'shzt',title:'审核状态',width:80,align:'center'},
				 	{field:'gydw',title:'管养单位',width:160,align:'center'},
			        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
			        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
			        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
			        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
			        {field:'lxbm',title:'路线编码',width:120,align:'center'},
			        {field:'lxmc',title:'路线名称',width:120,align:'center'},
			        {field:'pddj',title:'评定等级',width:140,align:'center'},
			        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
			        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
	 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$('#sbzt').combobox("getValue")+
	 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&qlbh="+$("#qlbh").val();
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selectWqgzCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#wqgz1").html(msg);
		 },
	});
	}

	function jckglAbgc(){
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
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0){
 			xzqhstr= $.cookie("dist2");
 			
 		}else if(xzqhdm.length==1){
 			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		xzqhstr=xzqhdm[0] ;
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectAbgc.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				 	'bz':$("#bz").combobox("getValue"),
				 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
				},
				striped:true,
				pagination:true,
				rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}if(row.sbzt2=="未上报" && row.sbthcd==7 && row.shzt=="未审核"){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else if(row.sbzt2=="未上报" && row.sbthcd==7){
						return '<span style="color:grey;">未上报</span>';
					}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
				{field:'shzt',title:'审核状态',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'lxbm',title:'路线编号',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		        {field:'qzlc',title:'总里程',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;

	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+
	 	$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
	 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selAbgcCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthcd);
			 if(msg.qzlc!=null && msg.qzlc!=""){
				 $("#abgc2").html(msg.qzlc);
			 }else $("#abgc2").html("0");
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc3").html(msg.yhlc);
			 }else $("#abgc3").html("0");
		 },
	});
	}

	function jckglZhfz(){
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
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0){
 			xzqhstr= $.cookie("dist2");
 			
 		}else if(xzqhdm.length==1){
 			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
     		xzqhstr=xzqhdm[0] ;
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectZhfz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
				 	'bz':$("#bz").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}if(row.sbzt2=="未上报" && row.sbthcd==7 && row.shzt=="未审核"){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
						}else if(row.sbzt2=="未上报" && row.sbthcd==7){
							return '<span style="color:grey;">未上报</span>';
						}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
				{field:'shzt',title:'审核状态',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'lxbm',title:'路线编号',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		        {field:'qzlc',title:'总里程',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+
	 	$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
	 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selZhfzCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthcd);
			 if(msg.qzlc!=null && msg.qzlc!=""){
				 $("#abgc2").html(msg.qzlc);
			 }else $("#abgc2").html("0");
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc3").html(msg.yhlc);
			 }else $("#abgc3").html("0");
		 },
	});
	}
	
//基础库审核
function jckshWqgz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectJckShwqgz.do',
		 queryParams : {
			 'sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'jsdj':$("#jsdj").combobox("getValue"),
			 	'akjfl':$("#akjfl").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'qlbh':$("#qlbh").val(),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
				//return '<span style="color:grey;">已审核</span>';
				return '<a href=javascript:xgShzt2("'+row.id+'","xmk_wqgz") style="text-decoration:none;color:#3399CC; ">已审核</a>  ';
				}
			}},
			 	{field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
		        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'pddj',title:'评定等级',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&shzt="+$('#shzt').combobox("getValue")+
 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&lxbm="+$("#lxbm").val()+
 	"&qlbh="+$("#qlbh").val();
$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmjck/selectWqgzShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#wqgz1").html(msg);
	 },
});
}
function jckshAbgc(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectAbgcSh.do',
		 queryParams : {
			 'sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
				//return '<span style="color:grey;">已审核</span>';
				return '<a href=javascript:xgShzt2("'+row.id+'","xmk_abgc") style="text-decoration:none;color:#3399CC; ">已审核</a>  ';
				}
			}},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
	        {field:'qzlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+$("#xmnf").combobox("getValue")+
 	"&shzt="+$("#shzt").combobox("getValue")+"&lxjsdj="+$("#lxjsdj").combobox("getValue")+
 	"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmjck/selAbgcShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sbthcd);
		 if(msg.qzlc!=null && msg.qzlc!=""){
			 $("#abgc2").html(msg.qzlc);
		 }else $("#abgc2").html("0");
		 if(msg.yhlc!=null && msg.yhlc!=""){
			 $("#abgc3").html(msg.yhlc);
		 }else $("#abgc3").html("0");
	 },
});
}

function xgShzt2(id,xmlx){
	
	if(confirm('您确定该项目不通过审核？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmjck/xgShzt2.do",
				 dataType : 'json',
				 data : 'delstr='+id+"&shbm="+$.cookie("unit")+"&xmlx="+xmlx,
				 success : function(msg){
					 if(msg){
						 alert('修改成功！');
						 $("#grid").datagrid('reload');
					 }else{
						 alert('修改失败,请选择要审核项目！');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
	}
}

function jckshZhfz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectZhfzSh.do',
		 queryParams : {
			 'sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
				//return '<span style="color:grey;">已审核</span>';
				return '<a href=javascript:xgShzt2("'+row.id+'","xmk_zhfz") style="text-decoration:none;color:#3399CC; ">已审核</a>  ';
				}
			}},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
	        {field:'qzlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+$("#xmnf").combobox("getValue")+
 	"&shzt="+$("#shzt").combobox("getValue")+"&lxjsdj="+$("#lxjsdj").combobox("getValue")+
 	"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmjck/selZhfzShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sbthcd);
		 if(msg.qzlc!=null && msg.qzlc!=""){
			 $("#abgc2").html(msg.qzlc);
		 }else $("#abgc2").html("0");
		 if(msg.yhlc!=null && msg.yhlc!=""){
			 $("#abgc3").html(msg.yhlc);
		 }else $("#abgc3").html("0");
	 },
});
}

//审查库管理
function sckglWqgz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckwqgz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'jsdj':$("#jsdj").combobox("getValue"),
			 	'akjfl':$("#akjfl").combobox("getValue"),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'lxbm': $('#lxbm').val(),
			 	'qlbh':$("#qlbh").val(),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7 && row.sck_shzt=="未审核"){
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					//'<span style="color:grey;">编辑</span>  '+
					'<a href=javascript:xgSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7){
						return '<span style="color:grey;">未上报</span>';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
				{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
				{field:'bzls',title:'补助历史',width:60,align:'center'},
			 	{field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
		        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'pddj',title:'评定等级',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'},
		        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$('#sbzt').combobox("getValue")+
 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&bzls="+$("#bzls").combobox("getValue")+
 	"&lxbm="+$("#lxbm").val()+"&qlbh="+$("#qlbh").val();
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selectWqgzCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#wqgz1").html(msg);
	 },
});
}

function sckglAbgc(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckabgc.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7 && row.sck_shzt=="未审核"){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					//'<span style="color:grey;">编辑</span>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7){
						return '<span style="color:grey;">未上报</span>';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bzls="+$("#bzls").combobox("getValue")+
 	"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckAbgcCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}
function sckglZhfz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckzhfz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7 && row.sck_shzt=="未审核"){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					//'<span style="color:grey;">编辑</span>  '+
					'<a href=javascript:xgSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else if(row.sck_sbzt2=="未上报" && row.sck_sbthcd==7){
						return '<span style="color:grey;">未上报</span>';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bzls="+$("#bzls").combobox("getValue")+
 	"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckZhfzCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}
//审查库审核
function sckshWqgz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShwqgz.do',
		 queryParams : {
			 'sck_sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'jsdj':$("#jsdj").combobox("getValue"),
			 	'akjfl':$("#akjfl").combobox("getValue"),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'lxbm': $('#lxbm').val(),
			 	'qlbh':$("#qlbh").val(),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href=javascript:locationQl("'+row.sck_qlbh+'","'+row.sck_qlzxzh+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
				{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
				{field:'bzls',title:'补助历史',width:60,align:'center'},
			 	{field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
		        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'pddj',title:'评定等级',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'},
		        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&shzt="+$('#shzt').combobox("getValue")+
 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&bzls="+
 	$("#bzls").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&qlbh="+$("#qlbh").val();
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selectWqgzShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#wqgz1").html(msg);
	 },
});
}
function sckshAbgc(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShabgc.do',
		 queryParams : {
			 'sck_sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
			{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&shzt="+$("#shzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bzls="+$("#bzls").combobox("getValue")+
 	"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckAbgcShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}
function sckshZhfz(){
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShzhfz.do',
		 queryParams : {
			 'sck_sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'shzt':$("#shzt").combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			 	'tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
			{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&shzt="+$("#shzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+
 	"&bzls="+$("#bzls").combobox("getValue")+"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckZhfzShCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}
