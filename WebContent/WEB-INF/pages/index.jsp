<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>inde.jsp</title>
<%@ include file="/WEB-INF/pages/common/common.jsp"%>
	<style>

		.numicon{color:#fff;padding:1px 8px;font-weight:700}
		.c1{background:green;}
		.c2{background:red;}
		.c3{background:pink;}
		.c4{background:orange;}
		.c5{background:#111;}
		.c6{background:gray;}	
		/*css代码*/
		.wrap{color:#939da8}
		/*侧边栏*/
		.wrap .slider{width:220px;background:#2E363F;position:fixed;top:0px;left:0;height:100%;}
		.wrap .slider .logo{height:72px;background:#1F262D;line-height:72px;text-align:center;}
		
		.wrap .nav li.items{
			
			border-top: 1px solid #37414b;
			border-bottom: 1px solid #1f262d;
			font-size:12px;
			position:relative;
		}
		.wrap .nav li.items a{padding:8px 110px 8px 21px;display:inline-block;}
		/*silder bar li的样式*/
		.wrap .nav li.items:hover,.wrap .nav li.active{background:#27A9E3}
		.wrap .nav li.items:hover a,.wrap .nav li.active a{color:#fff;}
		.wrap .nav li.items .numicon{float:right;position:absolute;top:8px;right:20px;}
		.wrap .nav li.active:after{
			content:"";
			display:inline-block;
			border-top:8px solid transparent;
			border-right:8px solid #eee;
			border-bottom:8px solid transparent;
			border-left:8px solid transparent;
			float:right;
			position:absolute;
			top:16px;
			right:0px;
		}
		.wrap .nav li .fa{padding-right:10px;font-size:14px;}
		/*silder bar li的样式 里子元素的样式*/
		.wrap .nav li.items ul {background:#111;display:none;}
		.wrap .nav li.items ul li{padding-left:10px;}
		.wrap .content .header{height:36px;background:#1F262D;border-left:1px solid #000}
		/*内容区域*/
		.wrap .content{background:#f8f8f8;margin-left:220px}
		input[placeholder]{color:#e5e5e5;font-size:12px;padding-left:5px;}
		.wrap	.content .header .titems{float:left;border-right:1px solid #999;padding:0px 10px;height:36px;line-height:36px;font-size:12px;}
		.wrap	.content .header .titems a{color:#eaeaea}
		.wrap	.content .header .titems .fa{padding-right:10px;color:#fff}
		.wrap	.content .sbtn{margin-right:20px;}	
		.wrap	.content .sbtn input{height:26px;margin-top:5px;border:0;background:#666}
		.wrap	.content .sbtn a{height:26px;width:46px;display:inline-block;background:#28B779;color:#fff;margin-top:5px;text-align:center;
				font-size:16px;}
		
		.wrap .content .channel{height:36px;line-height:36px;padding-left:10px;}
		.wrap .content .cnt{background:#EEEEEE;}
		.tabwrap{padding:5px;}
		.tztab{width:100%;border-collapse:collapse;border:1px solid #ccc;}
		.tztab th,td{border-bottom:1px solid #fff;text-align:left;padding:4px 6px;font-size:12px;}
		.tztab th{padding:10px;}
		.tztab thead th{background:#2E363F;color:#f9f9f9}
		
		/*单双行渐变*/
		.tztab tbody tr:nth-child(odd){background:#eaeaea}
		.tztab tbody tr:nth-child(even){background:#f8f8f8}
		/*hover改变行的样式*/
		.tztab tbody tr:hover{background:#333;color:#fff}
		.tztab tbody tr:hover a{color:#fff}
		.tztab tbody tr:hover td:hover{background:#28B779}

		.tztab caption{background:#2E363F;color:#fff;padding:5px;font-size:18px;font-weight:700;
			caption-side:top;
			text-align:center;
		}

		.up{
			display:inline-block;
			overflow:hidden;
			border-top:4px solid transparent;
			border-right:4px solid transparent;
			border-bottom:4px solid #fff;
			border-left:4px solid transparent;
		}
		.down{
			display:inline-block;
			overflow:hidden;
			position:relative;
			top:4px;
			border-top:4px solid #fff;
			border-right:4px solid transparent;
			border-bottom:4px solid transparent;
			border-left:4px solid transparent;
		}	
		
  </style>
 </head>
 <body>
	<div class="wrap">
		<div class="slider">
			<div class="logo">
				<a href="#"><img src="${basePath}/resources/images/logo.png"/></a>
			</div>
			<div class="nav">
				<ul>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-home"></i>首页</a></li>
					 <li class="items active"><a href="javascript:void(0);"><i class="fa fa-signal"></i>统计报表</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
					 <li class="items"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
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
		<div class="content">
			<div class="header">
				<ul class="fl">
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-user"></i>欢迎Smile来到cms后台</a></li>
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-envelope"></i>消息5个!</a></li>
					 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-cog"></i>设置</a></li>
					 <li class="titems"><a href="${basePath}/logout"><i class="fa fa-share-alt"></i>退出</a></li>	
				</ul>
				<div class="fr sbtn none">
					<input type="text" class="fl" placeholder="搜索的关键字..."/><a href="#" class="fl"><i class="fa fa-search "></i></a>
				</div>
			</div>
			<div class="channel"> Home > Table</div>
			<div class="cnt">
				<div class="tabwrap">
					
					<!--表格-->
					<table class="tztab">
						<caption>
							2015年度一周统计报表数据
							<div class="fr sbtn">
								<input type="text" class="fl" placeholder="搜索的关键字..."/><a href="#" class="fl"><i class="fa fa-search "></i></a>
							</div>
						</caption>
						<!--头部
						<colgroup id="days">
							<col/>
							<col style="background:green;width:200px;"/>
							<col id="t"/>
						</colgroup>-->
						<thead>
							<tr>
								<th>标题 <span class="up"></span> <span class="down"></span></th>	
								<th>类型</th>	
								<th>作者</th>	
								<th>创建时间</th>	
								<th>是否置顶</th>	
								<th>是否精华</th>	
								<th>是否编码</th>	
								<th>发布状态</th>	
								<th>删除状态</th>
							</tr>
						</thead>
						<!--身体部-->
						<tbody>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascriipt:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascriipt:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascriipt:void(0);">未删除</a></td>
							</tr>
							<tr>
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
								
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
							<tr>
							
								<td>JS/CSS3</td>	
								<td>柯柯</td>	
								<td>2015-09-06 15:15:00</td>	
								<td>是</td>	
								<td>是</td>	
								<td>是</td>	
								<td>39/0</td>	
								<td>发布</td>	
								<td><a href="javascript:void(0);">未删除</a></td>
							</tr>
						</tbody>
					</table>
				</div>
					<span class="numicon c1">1</span>
					<span class="numicon c2">2</span>
					<span class="numicon c3">3</span>
					<span class="numicon c4">4</span>
					<span class="numicon c5">5</span>
					<span class="numicon c6">6</span>
			</div>

		</div>
	
	</div>

 <script type="text/javascript">
    $(function(){
    	//jsä»£ç åå¨è¿é
    	
    })
 
 </script>
</body>
</html>