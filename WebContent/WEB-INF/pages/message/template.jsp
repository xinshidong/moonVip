<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="message" varStatus="messageindex" items="${datas}">
	<tr>
		<td>
			${message.id}
			<input type="hidden" id="itemcount" value="${itemCount}"/>
		</td>	
		<td>${message.name}</td>	
		<td>${message.userId}</td>	
		<td class="tmui-tips" tip="${tz:formatDate(message.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(message.createTime)}
		</td>	
		<td>${message.isDelete}</td>	
		<td>${message.status}</td>	
		<td><a href="javascript:void(0);">未删除</a></td>
	</tr>
</c:forEach>
