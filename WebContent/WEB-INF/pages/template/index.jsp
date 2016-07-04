<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>smile</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
 	<link rel="stylesheet" href="${rootPath}/resources/css/global.css">
 	<link rel="stylesheet" href="${rootPath}/resources/css/UI.css">
</head>
<body>
    <div class="content">
    	<div class="wth1200 clearfix">
        	<div class="fl cont_left">
        		<ul>
	                <c:forEach items="${contents}" var="content">
	               		<li><a href="${basePath}/${content.staticLink}" target="_blank">${content.title}</a></li> 
	                </c:forEach>
        		</ul>
            </div>
            <div class="fr cont_right">
                <div class="personal">
                    <p>
                        <a href="javascript:void(0)" class="user_img"><img src="../images/user_img.jpg" width="100" height="100"></a>
                    </p>
                    <p><a href="javascript:void(0)" class="font18">我要去蹦极</a></p>
                    <a href="javascript:void(0)" class="add_tb">+</a>
                    <div class="attention_box clearfix">
                        <a href="javascript:void(0)" class="fens">
                            <i>粉丝</i><br>
                            <b>3</b>
                        </a>
                        <a href="javascript:void(0)" class="guanz">
                            <i>关注</i><br>
                            <b>15</b>
                        </a>
                    </div>
                </div>
                <div class="praise_box clearfix">
                    <a href="javascript:void(0)" class="fens">
                        <i>已赞</i><br>
                        <b>350</b>
                    </a>
                    <a href="javascript:void(0)" class="guanz">
                        <i>评论</i><br>
                        <b>65</b>
                    </a>
                </div>
            </div>
        </div>
    </div> 
</body>
</html>