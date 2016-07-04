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
 </head>
 <body>
	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/common/left.jsp" %>
		<div class="content">
		    <%@ include file="/WEB-INF/pages/common/header.jsp"%>
			<div class="channel"> 首页 > 角色管理</div>
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
								<th>名称 <span class="up"></span> <span class="down"></span></th>	
								<th>用户</th>	
								<th>创建时间</th>	
								<th>删除状态</th>	
								<th>操作</th>
							</tr>
						</thead>
						<!--身体部-->
						<tbody id="mybody" data-model="role">
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
		var tzRole = {
			user:function(obj){
				var $obj = $(obj);
				var opid = $obj.data("opid");
				$.tzIframe({width:320,height:400,title:"用户分配角色",drag:false,content:adminPath+"/role/user/"+opid,callback:function(iframe,$dialog,opts){
					if(iframe){
						iframe.tzUserRole.save(opid);
					}
				}});
			},
			permission:function(obj){
				var $obj = $(obj);
				var opid = $obj.data("opid");
				$.tzIframe({width:460,height:420,title:"权限分配",drag:false,content:adminPath+"/role/permission/"+opid,callback:function(iframe,$dialog,opts){
					if(iframe){
						iframe.saveRolePermission(opid,$dialog,opts);
					}
				},loadSuccess:function(iframe){
					iframe.initPermissionTree(function(){
						//选中已授权的权限
						var arr = [2,3,1];
						for(var i=0;i<arr.length;i++){
							$(iframe.document).find("body").find(".tm-tree-checkbox[opid="+arr[i]+"]").addClass("tm-tree-checkbox-checked");
						}
					});
				}});
			},
			del:function(){
				
			}
				
		};
		$(function(){
			tzAdmin.loadData(0,10,function(itemCount){
				tzAdmin.initPage(itemCount);//分页加载一次吗
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
