<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="adminuser" varStatus="adminuserindex" items="${datas}">
	<tr>
		<td>
			${adminuser.id}
			<c:if test="${adminuserindex.index==0}"><input type="hidden" id="itemCount" value="${itemCount}"/></c:if>
		</td>	
		<td>${adminuser.username}</td>	
		<td>${adminuser.email}</td>	
		<td>${adminuser.telephone}</td>	
		<td class="tmui-tips" tip="${tz:formatDate(adminuser.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(adminuser.createTime)}
		</td>	
		<td>
			<tz:if test="${adminuser.isDelete==0}">
				<tz:then><a href="javascript:void(0)" opid="${adminuser.id}" mark="isDelete" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${adminuser.id}" mark="isDelete" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td>
			<tz:if  test="${adminuser.forbiden==0}">
				<tz:then><a href="javascript:void(0)" opid="${adminuser.id}" mark="forbiden" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${adminuser.id}" mark="forbiden" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td><a href="javascript:void(0);" data-opid="${adminuser.id}" onclick="tzAdmin.remove(this)">删除</a></td>
	</tr>
</c:forEach>