<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="adminstat" varStatus="adminstatindex" items="${datas}">
	<tr>
		<td>
		   ${adminstat.id}
			<input type="hidden" id="itemcount" value="${itemCount}"/>
		</td>	
		<td>${adminstat.classname}</td>	
		<td>${adminstat.userId}</td>	
		<td class="tmui-tips" tip="${tz:formatDate(adminstat.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(adminstat.createTime)}
		</td>	
		<td>${adminstat.ip}</td>	
		<td>${adminstat.username}</td>	
		<td><a href="javascript:void(0);">未删除</a></td>
	</tr>
</c:forEach>
