$(function() {
	var qx=getQxfromSession('qx3').split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01010801'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '普通国省道',
				selected: j==1?true:false,
				iconCls:'icon-none'
			});
			$("#left_menu1").append('<ul id="tree01010801"></ul>');
			createMenunew('01010801');
			j++;
		}
    	if(qx[i]=='01010802'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '农村公路',
				selected: j==1?true:false,
				iconCls:'icon-none'
			});
			$("#left_menu2").append('<ul id="tree01010802"></ul>');
			createMenunew('01010802');
			j++;
		}
    }
	
	menuQx();
	
});


function menuQx(){
	var qx=selQxByUser2(parent.$.cookie("roleid"));//parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}


function selQxByUser2(roleid){
	var qx4= new Array();
	$.ajax({
		type : "POST",
		url : "../../xtgl/selQxByUser2.do",
		dataType : 'json',
		data :"param.roleid="+roleid,
		async: false ,
		success : function(msg){
			if(msg){
				for(var i=0;i<msg.length;i++){
					//第4层
					if(msg[i].id.length==10) qx4. push(msg[i].id);
				}
	     	 }
		 }
	});
	return qx4;
}

