$(function(){
	$(".tmui-tips").tmTip();
});
function loading2(target,mark){
	$.loading({target:$(target),mark:1}); 
 };
 var tzAdmin = {
		Itimer:null,
		timer:null,
		pageNo:0,
        pageSize:10,
		initPage:function(itemcount){
				$(".cpage").tzPage(itemcount, {
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
			   },
		    })
		},
	   loadData:function(pageNo,pageSize,callback){
		      var  $this=this;
			  var keyword=$("#keywords").val();
			  var model=$("#mybody").attr("data-model");
			  clearTimeout(this.Itimer);
			  this.Itimer=setTimeout(function(){
				  $.ajax({
						 type:'post',
						 beforeSend:function(){loading2($("#mybody"),3)},
						 data:{pageNo:pageNo*pageSize,pageSize:pageSize,keyword:keyword},
						 url:adminPath+"/"+model+"/template",
						 success:function(data){
							 var $data=$(data);
							 $("#mybody").html($data);
							 $this.hightLight(keyword);
							 var itemCount =$data.find("#itemcount").val();
							 if(callback)callback(itemCount);
						 }
					 });
			  },200);
		    },
	  search:function(){
				 var keyword=$("#keywords").val();
				 if(isEmpty(keyword)){
					 loading("请输入关键字... ",3);
					 $("#keywords").focus();
					 return;
				 }
				 tzAdmin.loadData(0,10,function(itemCount){
			    	  tzAdmin.initPage(itemCount);
			      });
			},
		op:function(obj){
				var $obj=$(obj);
				var opid=$obj.attr("opid");
				var mark=$obj.attr("mark");
				var val=$obj.attr("val");
				var params={};
				var model=$("#mybody").attr("data-model");
				params[mark]=val;
				params["id"]=opid;
			    //alert(JSON.stringify(params))
				clearTimeout(this.timer);
				this.timer=setTimeout(function(){
					  loading("请稍后数据提交中...",3);
					  $.ajax({
							 type:'post',
							 data:params,
							 url:adminPath+"/"+model+"/update",
							 success:function(data){
								    loading("执行成功...",3);
									if(data=="success"){
										$obj.attr({opid:opid,val:val==0?1:0}).removeClass().addClass(val==0?"red":"green").text(val==0?"否":"是");
									}
							  }					  
						});
				},200);
			},
		hightLight:function(key){
				if(isEmpty(key)) return;
				 $("#mybody").find(".keys").each(function(){
					 var  text=$(this).text();
					 var regx=new RegExp(key,"ig");
					 var nt=text.replace(regx,"<span class='red'>"+key+"</span>");
					 $(this).html(nt);
				 })
			},
		remove:function(obj){
			    $.tzConfirm({title:"友情提示",content:"您确定要删除吗?",callback:function(ok){
			    	if(ok){
			    		var $obj=$(obj);
						var opid=$obj.attr("data-opid");
						var model=$("#mybody").attr("data-model");
						var params={};
						params["id"]=opid;
						clearTimeout(this.timer);
						this.timer=setTimeout(function(){
							  $.ajax({
									 type:'post',
									 data:params,
									 url:adminPath+"/"+model+"/delete",
									 success:function(data){
										    loading("执行成功...",3);
										    $obj.parents("tr").remove();
									  }					  
								});
						
						},200);	
			    	}
			    }});
			}
      }
 var tzAjax = {
			request: function(options,params){
				//继承参数
				var opts = $.extend({},{
					path:"",
					type:"post",
					model:"",
					method:"",
					params:"",
					before:function(){loading("请稍后数据执行中...");},
					success:function(){},
					error:function(){loading("remove");},
					logout:function(){}
				},options);
				//url拼接
				if(!opts.url){
					opts.url = opts.path+"/"+opts.model+"/"+opts.method+(opts.params?"?"+opts.params:"");
				}
				$.ajax({
				    type:opts.type,
					url:opts.url,
					beforeSend:opts.before,
					error:opts.error,
					data:params,
					success:function(data){
						loading("remove");
						if(data=="logout"){
							if(opts.logout)opts.logout();
							//第一种方案：登陆弹出框
							alert("登陆弹出框在此弹出");
							//第二种方案：直接跳转
							window.location.href = opts.path+"/login";
						}else{
							if(opts.success)opts.success(data);
						}
					}
				});
			}	
		};