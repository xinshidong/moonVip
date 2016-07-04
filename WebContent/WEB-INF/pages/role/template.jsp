<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="role" varStatus="roleindex" items="${datas}">
	<tr>
		<td>
			${role.id}
			<c:if test="${roleindex.index==0}"><input type="hidden" id="itemCount" value="${itemCount}"/></c:if>
		</td>	
		<td>${role.name}</td>	
		<td>${role.userId}</td>	
		<td class="tmui-tips" tip="${tz:formatDate(role.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(role.createTime)}
		</td>	
		<td>
			<tz:if test="${role.isDelete==0}">
				<tz:then><a href="javascript:void(0)" opid="${role.id}" mark="isDelete" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${role.id}" mark="isDelete" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td>
			<a href="javascript:void(0);" data-opid="${role.id}"  onclick="tzRole.user(this)"><i class="fa fa-user"></i>&nbsp;&nbsp;用户分配角色</a>
			<a href="javascript:void(0);" data-opid="${role.id}"  onclick="tzRole.permission(this)"><i class="fa fa-send"></i>&nbsp;&nbsp;授权</a>
		</td>
	</tr>
</c:forEach>
