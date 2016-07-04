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
	  <!--引入左边栏   -->
	    <%@ include file="/WEB-INF/pages/common/left.jsp"%>
		<div class="content">
			<%@ include file="/WEB-INF/pages/common/header.jsp"%>
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
						<tbody id="mybody" data-model="content"> 
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
    	          console.log(itemCount);
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