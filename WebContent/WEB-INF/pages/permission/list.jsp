<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>smile</title>
	<meta http-equiv="pragma" permission="no-cache">
	<meta http-equiv="cache-control" permission="no-cache">
	<meta http-equiv="expires" permission="0">    
	<meta http-equiv="keywords" permission="keyword1,keyword2,keyword3">
	<meta http-equiv="description" permission="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
	<!-- 引入树的js和css -->
	<link rel="stylesheet" href="${basePath}/resources/sg/tree/tm_tree.css"/>
	<script type="text/javascript" src="${basePath}/resources/sg/tree/tm_tree.js"></script>
 </head>
 <body>
	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/common/left.jsp" %>
		<div class="content">
		    <%@ include file="/WEB-INF/pages/common/header.jsp"%>
			<div class="content"> 首页 > 权限管理</div>
			<div class="cnt">
				<div class="tabwrap">
					<div id="permissiontree"></div>
				</div>
			</div>   
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			function initPermissionTree(){
				tzAjax.request({
					path:adminPath,
					model:"permission",
					method:"root",
					success:function(data){
						var root  = data.root;
						var children =data.children;
						$("#permissiontree").tmTree({outhtml:"<a href='javascript:void(0);' class='remove'><i class='fa fa-remove'></i></a>",root:root,children:children,type:"checkbox",onclick:function($obj,data){
							//alert(JSON.stringify(data));
						},callback:function(opid){
							alert("您要删除的opid的是:"+opid);
							var $this = $(this);
							$.tzConfirm({callback:function(ok){
								if(ok){
									$this.closest("li").remove();
								}
							}});
						}});
					}
				});
			};
			initPermissionTree();
			//ztree/dtree----->怎么下载0----按照他的文档写出第一个tree---->分析它的数据的格式----编写java代码一对一--json--赋予ztree/dtree
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
