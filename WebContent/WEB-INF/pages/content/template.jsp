<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="content" varStatus="contentIndex" items="${datas}">
						      <tr >
								<td>${content.id}
							    	<input type="hidden" id="itemcount" value="${itemCount}"/>
								</td>
								<td>${content.title}</td>	
								<td>${content.channelId}</td>	
								<td>${content.userId}</td>	
								<%-- <td>${tz:formatDate(content.createTime,'yyyy-MM-dd HH:mm:ss')}</td> --%>
								<td class="tmui-tips" tip="${tz:formatDate(content.createTime,'yyyy-MM-dd HH:mm:ss')}">
								    ${tz:timeFormat(content.createTime)}
								</td>	
								<td>${content.isTop}</td>	
								<td>${content.push}</td>	
								<td>${content.isDelete}</td>	
								<td>${content.isComment}</td>	
								<td>${content.status}</td>	
								<td><a href="javascript:void(0);">未删除</a></td>		   
							 </tr>
</c:forEach>	
