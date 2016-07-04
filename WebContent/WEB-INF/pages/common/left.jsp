<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="slider">
			<div class="logo">
				<a href="${basePath}/admin/index"><img src="${basePath}/resources/images/logo.png"/></a>
			</div>	
			<div class="nav">
				<ul>
				     <tz:if test="${tz:indexof(pageContext.request.requestURI,'content/list')!=-1}">
				       <tz:then><li class="items active"><a href="javascript:void(0);"><i class="fa fa-home"></i>内容管理</a></li></tz:then>
				       <tz:else><li class="items"><a href="${adminPath}/content/list"><i class="fa fa-home"></i>内容管理</a></li></tz:else>
				     </tz:if>
				     <tz:if test="${tz:indexof(pageContext.request.requestURI,'adminuser/list')!=-1}">
				       <tz:then><li class="items active"><a href="javascript:void(0);"><i class="fa fa-home"></i>用户管理</a></li></tz:then>
				       <tz:else><li class="items"><a href="${adminPath}/adminuser/list"><i class="fa fa-home"></i>用户管理</a></li></tz:else>
				     </tz:if>
				     <tz:if test="${tz:indexof(pageContext.request.requestURI,'role/list')!=-1}">
				       <tz:then><li class="items active"><a href="javascript:void(0);"><i class="fa fa-home"></i>角色管理</a></li></tz:then>
				       <tz:else><li class="items"><a href="${adminPath}/role/list"><i class="fa fa-home"></i>角色管理</a></li></tz:else>
				     </tz:if>
				     <tz:if test="${tz:indexof(pageContext.request.requestURI,'permission/list')!=-1}">
				       <tz:then><li class="items active"><a href="javascript:void(0);"><i class="fa fa-home"></i>权限管理</a></li></tz:then>
				       <tz:else><li class="items"><a href="${adminPath}/permission/list"><i class="fa fa-home"></i>权限管理</a></li></tz:else>
				     </tz:if>
					<%--  <li class="items"><a href="${adminPath}/user/list"><i class="fa fa-signal"></i>用户管理</a></li> --%>
					 <li class="items"><a href="${adminPath}/music/list"><i class="fa fa-inbox"></i>音乐管理</a></li>
				     <tz:if test="${tz:indexof(pageContext.request.requestURI,'adminstat/list')!=-1}">
				       <tz:then>
				          <li class="items active"><a href="javascript:void(0);"><i class="fa fa-home"></i>日志统计</a>
				            <ul style="display:block">
				              <tz:if test="${tz:indexof(pageContext.request.requestURI,'adminstat/contentlist')!=-1}">
				                 <tz:then>
				                      <li class="citems active"><a href="javascript:void(0)"><i class="fa fa-area-chart"></i>内容统计</a></li>
				                 </tz:then>
				                 <tz:else>
				                       <li class="citems"><a href="${adminPath}/adminstat/contentlist"><i class="fa fa-area-chart"></i>内容统计</a></li>
				                 </tz:else>
				              </tz:if>
							  <tz:if test="${tz:indexof(pageContext.request.requestURI,'adminstat/userlist')!=-1}">
				                 <tz:then>
				                      <li class="citems active"><a href="javascript:void(0)"><i class="fa fa-area-chart"></i>用户统计</a></li>
				                 </tz:then>
				                 <tz:else>
				                       <li class="citems"><a href="${adminPath}/adminstat/userlist"><i class="fa fa-area-chart"></i>用户统计</a></li>
				                 </tz:else>
				              </tz:if>
				               <li class="citems"><a href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i>日期管理</a></li>
						   </ul>
				         </li>
				       </tz:then>
				       <tz:else>
				          <li class="items"><a href="${adminPath}/adminstat/list"><i class="fa fa-home"></i>日志统计</a>
				          </li>
				       </tz:else>
				     </tz:if>		 
					 <li class="items"><a href="${adminPath}/gather/list"><i class="fa fa-send"></i>爬虫采集</a></li>
					 <li class="items">
						<a href="javascript:void(0);"><i class="fa fa-th-list"></i>表单</a>
						<ul>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
						</ul>
						<span class="numicon c5">3</span>
					 </li>
					 <li class="items">
						<a href="javascript:void(0);"><i class="fa fa-tint"></i>按钮组</a>
						<ul>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
							 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
						</ul>
						<span class="numicon c1">5</span>
					 </li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-pencil"></i>元素</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-star"></i>Addons 5</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-file-o"></i>Error</a></li>
				</ul>
			</div>
</div>