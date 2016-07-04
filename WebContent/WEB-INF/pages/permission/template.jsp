<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="permission" varStatus="permissionindex" items="${datas}">
	<tr>
		<td>
			       ${permission.id}
			<c:if test="${permissionindex.index==0}"><input type="hidden" id="itemCount" value="${itemCount}"/></c:if>
		</td>	
		<td>${permission.name}</td>	
		<td>${permission.userId}</td>	
		<td class="tmui-tips" tip="${tz:formatDate(permission.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(permission.createTime)}
		</td>	
		<td>
			<tz:if test="${permission.isDelete==0}">
				<tz:then><a href="javascript:void(0)" opid="${permission.id}" mark="isDelete" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${permission.id}" mark="isDelete" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td>
			<tz:if test="${permission.status==0}">
				<tz:then><a href="javascript:void(0)" opid="${permission.id}" mark="status" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${permission.id}" mark="status" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td><a href="javascript:void(0);">未删除</a></td>
	</tr>
</c:forEach>
