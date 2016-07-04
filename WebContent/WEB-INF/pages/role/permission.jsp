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
	<!-- 引入树的js和css -->
	<link rel="stylesheet" href="${basePath}/resources/sg/tree/tm_tree.css"/>
	<script type="text/javascript" src="${basePath}/resources/sg/tree/tm_tree.js"></script>
	<style type="text/css">#permissiontree{height:420px;overflow-y: auto;}</style>
 </head>
 <body>
 	<div id="permissiontree"></div>
 	<script type="text/javascript">
	 	function initPermissionTree(callback){
			tzAjax.request({
				path:adminPath,
				model:"permission",
				method:"root",
				success:function(data){
					var root  = data.root;
					var children =data.children;
					$("#permissiontree").tmTree({root:root,children:children,type:"checkbox",onclick:function($obj,data){
						permissions = data.checkArr.opid;
					},callback:function(opid){
						var $this = $(this);
						$.tzConfirm({callback:function(ok){
							if(ok){
								$this.closest("li").remove();
							}
						}});
					}});
					if(callback)callback();
				}
			});
		};
 	
 	var permissions = "";
 	function saveRolePermission(roleId,$dialog,opts){
 		if(isEmpty(permissions)){
 			loading("请选择一个权限进行操作..",4);
 			return;
 		}
 		tzAjax.request({
 			path:adminPath,
 			model:"role",
 			method:"saveRolePermission",
 			success:function(data){
 				if(data=="success"){
 					parent.loading("权限分配成功...",4);
 					$dialog.next().remove();//阴影层
 					$dialog.remove();//弹窗
 				}
 			}
 		},{rid:roleId,permissions:permissions});
 	}
	</script>	
 </body>
</html>
