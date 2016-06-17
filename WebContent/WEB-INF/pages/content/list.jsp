<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>inde.jsp</title>
<%@ include file="/WEB-INF/pages/common/common.jsp"%>
<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
 </head>
 <body>
	<div class="wrap">
		<div class="slider">
			<div class="logo">
				<a href="#"><img src="${basePath}/resources/images/logo.png"/></a>
			</div>
			<div class="nav">
				<ul>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-home"></i>首页</a></li>
					 <li class="items active"><a href="javascript:void(0);"><i class="fa fa-signal"></i>统计报表</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
					 <li class="items">
						<a href="javascript:void(0);"><i class="fa fa-th-list"></i>表单</a>
						<ul>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
						</ul>
						<span class="numicon c5">3</span>
					 </li>
					 <li class="items">
						<a href="javascript:void(0);"><i class="fa fa-tint"></i>按钮组</a>
						<ul>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
						</ul>
						<span class="numicon c1">5</span>
					 </li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-pencil"></i>元素</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-star"></i>Addons 5</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-file-o"></i>Error</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="header">
				<ul class="fl">
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-user"></i>欢迎Smile来到cms后台</a></li>
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-envelope"></i>消息5个!</a></li>
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-cog"></i>设置</a></li>
					 <li class="titems"><a href="${basePath}/logout"><i class="fa fa-share-alt"></i>退出</a></li>	
				</ul>
				<div class="fr sbtn none">
					<input type="text" class="fl" placeholder="搜索的关键字..."/><a href="#" class="fl"><i class="fa fa-search "></i></a>
				</div>
			</div>
			<div class="channel"> Home > Table</div>
			<div class="cnt">
				<div class="tabwrap">
					<!--表格-->
					<table class="tztab">
						<caption>2016 年度一周统计报表数据
							<div class="fr sbtn">
								<input type="text" id="keywords" class="fl" placeholder="搜索的关键字..."/><a href="javascript:void(0);" onclick="tzAdmin.search(this);" class="fl"><i class="fa fa-search "></i></a>
							</div>
						</caption>
						<thead>
							<tr>
							    <th>主键</th>
								<th>标题 <span class="up"></span> <span class="down"></span></th>	
								<th>栏目</th>	
								<th>作者</th>	
								<th>创建时间</th>	
								<th>是否置顶</th>	
								<th>是否精华</th>	
								<th>删除状态</th>	
								<th>是否评论</th>	
								<th>发布状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<!--身体部-->
						<tbody id="mybody"> 
						    <tr>
						       <td id="loading" colspan="50"></td>
						    </tr>
						</tbody>					   
					</table>
					<div class="cpage"></div>
				</div>
			</div>
		</div>
	</div>
 <script type="text/javascript">
 function loading2(target,mark){
	$.loading({target:$(target),mark:1}); 
 };
 var tzAdmin = {
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
			  var keyword=$("#keywords").val();
			  $.ajax({
					 type:'post',
					 beforeSend:function(){loading2($("#mybody"),3)}, 
					 data:{pageNo:pageNo*pageSize,pageSize:pageSize,keyword:keyword},
					 url:adminPath+"/content/template",
					 success:function(data){
						 var $data=$(data);
						 $("#mybody").html($data);
						 var itemCount =$data.find("#itemcount").val();
						 if(callback)callback(itemCount);
						
					 }
				 });
			},
			search:function(){
				 var keyword=$("#keywords").val();
				 if(isEmpty(keyword)){
					 loading("请输入关键字... ",3);
					 $("#keywords").focus();
					 if(window.sessionStorage){
						 alert($("#mybody").html(sessionStorage.getItem("sessiondata_html")));
						 $("#mybody").html(sessionStorage.getItem("sessiondata_html"));
					 }
					 return;
				 }
				 tzAdmin.loadData(0,10,function(itemCount){
			    	  tzAdmin.initPage(itemCount);
			      });
			}
      }
      tzAdmin.loadData(0,10,function(itemCount){
    	  tzAdmin.initPage(itemCount);
    	  if(window.sessionStorage)sessionStorage.setItem("sessiondata_html",$("#mybody").html());
      });

	$(function(){
		$(".nav").find("li.items").find("a").click(function(){
			var len = $(this).next().length;
			if(len>0){
				$(this).next().stop(true,true).slideToggle()
				.end().parents("li")
				.addClass("active")
				.siblings().removeClass("active")
				.find("ul").slideUp("slow");
			}
		});
	}); 
 
 </script>
</body>
</html>