$(function(){
	$(".tmui-tips").tmTip();
});
/*function loading2(target,mark){
	$.loading({target:$(target),mark:1}); 
};
var tzAdmin = {
	initPage:function(itemCount){
		$(".cpage").tzPage(itemCount, {
			num_edge_entries : 1, //边缘页数
			num_display_entries :4, //主体页数
			num_edge_entries:5,
			current_page:0,
			showGo:true,
			showSelect:true,
			items_per_page : 10, //每页显示X项
			prev_text : "前一页",
			next_text : "后一页",
			callback : function(pageNo,psize){//回调函数
				tzAdmin.loadData(pageNo,psize);
			}
		});
	},
	loadData:function(pageNo,pageSize,callback){
		var keyword = $("#keywords").val();
		var model = $("#tbody").data("model");
		$.ajax({
			type:"post",
			beforeSend:function(){loading2($("#tbody"),4);},
			url:adminPath+"/"+model+"/template",
			data:{pageNo:pageNo*pageSize,pageSize:pageSize,keyword:keyword},
			success:function(data){
				var $data = $(data);
				$("#tbody").html($data);
				var itemCount = $data.find("#itemCount").val();
				if(callback)callback(itemCount);
			}
		});
	},
	search:function(){
//		var keyword = $("#keywords").val();
//			if(isEmpty(keyword)){
//				loading("请输入关键字...",3);
//				$("#keywords").focus();
//				return;
//			}
		tzAdmin.loadData(0,10,function(itemCount){
			tzAdmin.initPage(itemCount);//分页加载一次吗
		});
	}	
};
*/
