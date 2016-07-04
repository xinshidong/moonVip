<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" adminuser="no-cache">
	<meta http-equiv="cache-control" adminuser="no-cache">
	<meta http-equiv="expires" adminuser="0">    
	<meta http-equiv="keywords" adminuser="keyword1,keyword2,keyword3">
	<meta http-equiv="description" adminuser="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
 </head>
 <body>
	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/common/left.jsp" %>
		<div class="content">
			<%@ include file="/WEB-INF/pages/common/header.jsp"%>
			<div class="content2"> 首页 > 日记管理</div>
			<div class="cnt">
				<div class="tabwrap">
					<!--表格-->
					<table class="tztab">
						<caption>
							<div class="fr sbtn">
								<input type="text" id="keywords" class="fl" placeholder="搜索的关键字..."/><a href="javascript:void(0);" onclick="tzAdmin.search(this);" class="fl"><i class="fa fa-search "></i></a>
							</div>
						</caption>
						<thead>
							<tr>
								<th>主键</th>
								<th>用户名称 <span class="up"></span> <span class="down"></span></th>	
								<th>邮箱</th>	
								<th>手机号码</th>	
								<th>创建时间</th>	
								<th>删除状态</th>	
								<th>禁止状态</th>	
								<th>操作</th>
							</tr>
						</thead>
						<!--身体部-->
						<tbody id="mybody" data-model="adminuser">
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
	 $(function(){
	       tzAdmin.loadData(0,10,function(itemCount){
			    	  tzAdmin.initPage(itemCount);
			});
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
