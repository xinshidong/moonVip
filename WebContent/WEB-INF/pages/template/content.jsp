<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="Generator" content="EditPlus®">
 	<meta name="Author" content="">
 	<meta name="Keywords" content="">
 	<meta name="Description" content="">
 	<title>${content.title}-smile博客</title>
 	<link rel="stylesheet" href="http://localhost:8080/moonVip/resources/css/global.css">
 	<link rel="stylesheet" href="http://localhost:8080/moonVip/resources/css/UI.css">
</head>
<body>
   	${username}
	${age}
    <div class="content">
    	<div class="wth1200 clearfix">
        	<div class="fl cont_left">
                <div class="cont_head">
                    <div class="conte_title overflow">${content.title}</div>
                    <div class="Classification">
                        <span class="tage">原创作品</span>
                        <span>分类：<a href="javascript:void(0);">${content.categoryName}</a></span>
                    </div>
                    <div class="Classification">
                        <span class="Operation">浏览数<i>(${content.hits})</i></span>
                        <span class="Operation">收藏<i>(${content.collections})</i></span>
                        <span class="Operation">点赞<i>(${content.loves})</i></span>
                        <span class="Operation">评论<i>(${content.comments})</i></span>
                    </div>
                </div>
                <div class="cont_details">
                   ${content.content }
                </div>
                <div class="comment_box bg_white clearfix">
                    <div class="fl share_box">
                        <ul class="clearfix">
                            <li><a href="javascript:void(0)" title="分享到QQ"></a></li>
                            <li><a href="javascript:void(0)" title="分享到微信"></a></li>
                            <li><a href="javascript:void(0)" title="分享到空间"></a></li>
                            <li><a href="javascript:void(0)" title="分享到微博"></a></li>
                        </ul>快分享给朋友吧！
                    </div>
                    <div class="fl praise"><a href="javascript:void(0)">赞</a></div>
                    <div class="fr collect_box" style="text-align: center;">
                        <a href="javascript:void(0)">点击收藏</a>
                        21人已经收藏
                    </div>
                </div>
                <div class="pingl_box bg_white">
                    <div class="clearfix login_hint">
                        <p>大牛，别默默的看了，快登录帮我点评一下吧！:)</p>
                        <a href="javascript:void(0)" class="primary_btn">登录</a>
                        <a href="javascript:void(0)" class="nature_btn">立即注册</a>
                    </div>
                    <div class="comment_cont">
                        <div class="single_comment clearfix">
                            <a href="javascript:void(0)" class="single_img fl"><img src="../images/user_img.jpg" width="60" height="60"></a>
                            <div class="fl single_cont">
                                <p class="single_name"><a href="javascript:void(0)">我要去蹦极</a><i>今天17:50</i></p>
                                <p class="yijian">确实是很水，老板从拿到项目给我的时候就说只有两个礼拜时间，而且没有原型，确实很粗糙，我也没想到能上首页，自己也觉得不是太合适，但是也感谢ui中国给了我一个鼓励，希望大神们多多包涵，小弟会更加努力的</p>
                                <p class="huifu">
                                   <a href="javascript:void(0)" class="">回复</a>
                                   <a href="javascript:void(0)" class="">分享</a> 
                                </p>
                            </div>
                        </div>
                        <div class="single_comment clearfix">
                            <a href="javascript:void(0)" class="single_img fl"><img src="../images/user_img.jpg" width="60" height="60"></a>
                            <div class="fl single_cont">
                                <p class="single_name"><a href="javascript:void(0)">我要去蹦极</a><i>今天17:50</i></p>
                                <p class="yijian">确实是很水，老板从拿到项目给我的时候就说只有两个礼拜时间，而且没有原型，确实很粗糙，我也没想到能上首页，自己也觉得不是太合适，但是也感谢ui中国给了我一个鼓励，希望大神们多多包涵，小弟会更加努力的</p>
                                <p class="huifu">
                                   <a href="javascript:void(0)" class="">回复</a>
                                   <a href="javascript:void(0)" class="">分享</a> 
                                </p>
                            </div>
                        </div>
                        <div class="single_comment clearfix">
                            <a href="javascript:void(0)" class="single_img fl"><img src="../images/user_img.jpg" width="60" height="60"></a>
                            <div class="fl single_cont">
                                <p class="single_name"><a href="javascript:void(0)">我要去蹦极</a><i>今天17:50</i></p>
                                <p class="yijian">确实是很水，老板从拿到项目给我的时候就说只有两个礼拜时间，而且没有原型，确实很粗糙，我也没想到能上首页，自己也觉得不是太合适，但是也感谢ui中国给了我一个鼓励，希望大神们多多包涵，小弟会更加努力的</p>
                                <p class="huifu">
                                   <a href="javascript:void(0)" class="">回复</a>
                                   <a href="javascript:void(0)" class="">分享</a> 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
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