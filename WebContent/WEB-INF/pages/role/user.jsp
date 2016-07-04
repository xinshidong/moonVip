<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>smile</title>
	<meta http-equiv="pragma" role="no-cache">
	<meta http-equiv="cache-control" role="no-cache">
	<meta http-equiv="expires" role="0">    
	<meta http-equiv="keywords" role="keyword1,keyword2,keyword3">
	<meta http-equiv="description" role="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
	<style type="text/css">
	 	.box{height:360px;overflow:auto;}
		#userbox li{height:25px;padding:5px;border-bottom:1px dotted #ccc;}
		#userbox li .num{display:inline-block;max-width:60px;height:25px;text-align:right;padding:0 2px;}
		#userbox li .chk{position:relative;top:2px;}
		#userbox li:hover{background:#333;color:#fff;cursor:pointer;}
		#userbox li.on{background:#333;color:#fff;}
	</style>
 </head>
 <body>
	<div class="box">
<!--  		<a href="">全选</a> -->
<!--  		<a href="">反选</a> -->
		<ul id="userbox">
			<c:forEach items="${datas}" var="user" varStatus="uindex">
				<li>
					<span class="num chk"><input type="checkbox" class="check" value="${user.id}"/></span>
					<span class="num">${uindex.count}:</span>
					${user.username}【${user.email}】
				</li>
			</c:forEach>
		</ul>
	 <script type="text/javascript">
	    var tzUserRole={
	       init:function(){
	    		$("#userbox").find("li").on("click",function(){
	    			$(this).toggleClass("on").find(".check").filter(function(){
	    				$(this).prop("checked",!$(this).prop("checked"));
	    			}) 
	    		});
	    	},
	       save:function(roleId){
	    		var arr=[];
	    		var $checked=$("#userbox").find(".check:checked");
	    		if($checked.length==0){
	    			loading("请选择一个用户进行操作....",4);
	    			return;
	    		}
	    	    $checked.each(function(){
						arr.push($(this).val()); 
				});
	    	    tzAjax.request({
					path:adminPath,
					model:"role",
					method:"saveUserRole",
					success:function(data){
						if(data=="success"){
							loading("角色分配成功",4);
							$checked.parents("li").fadeOut("slow",function(){
								$(this).remove();
							});
						}
					}
				 },{users:arr.toString(),rid:roleId});
	    	}
	    	
	    }
	    tzUserRole.init();
	 </script>
	</div>
 </body>
</html>
