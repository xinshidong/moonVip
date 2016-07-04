<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>inde.jsp</title>
<%@ include file="/WEB-INF/pages/common/common.jsp"%>
<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
<%-- <script src="${basePath}/resources/js/echart/echarts-all.js"></script> --%>
<script src="${basePath}/resources/js/echart/echarts.js"></script>
<script type="text/javascript" src="${basePath}/resources/js/date/WdatePicker.js"></script>
</head>
 <body>
	<div class="wrap">
		<%@ include file="/WEB-INF/pages/common/left.jsp"%>
		<div class="content">
			<%@ include file="/WEB-INF/pages/common/header.jsp"%>
			<div class="channel"> 首页 > 日志管理</div>
			<div class="cnt">
			    <div style="padding:10px;">
					<input type="text"  id="date" onFocus="WdatePicker({onpicking:changeDate})" class="Wdate"/>	
				</div>
				<div class="tabwrap"  id="main" style="height:400px;">
					<!--表格-->
				</div>
			</div>
		</div>
	</div>
 <script type="text/javascript">
      $(function(){
    	  var d=new Date().format('yyyy-MM-dd');
    	  loadData(d);
    	  $("#date").val(d);
       });
      //普通ajax
    /*function loadData(date){
    	  $.ajax({
   	    	  type:'post',
   	    	  url:adminPath+"/adminstat/groupUsers",
   	    	  data:{"date":date},
   	    	  success:function(data){
   	    		  alert(JSON.stringify(data))
   	    		  var  json={ 
   	    				    title:date+"年雅虎社区访问统计报表",
   	    				    datas:parseData(data),
   	    				    timelines:getTimeLine(),
   	    		  }; 
   	    		  initChart('main',json);
   	    	  }
   	       });  
      } */
      //ajax原路返回
      function loadData(date){
    	  tzAjax.request({
    		  path:adminPath,
			  model:"adminstat",
			  method:"groupUsers",
			  params:"username=wxw@qq.com&password=123456",
    		  success:function(data){
    			  alert(JSON.stringify(data));	
    			  var  json={ 
	    				    title:date+"年雅虎社区访问统计报表",
	    				    datas:parseData(data),
	    				    timelines:getTimeLine(),
	    		  }; 
	    		  initChart('main',json);
    		  }
    		  
    	  },{"date":date});
      };  
  	 // 点击日期的回调函数
	 function changeDate(dp){
			var date = dp.cal.getNewDateStr();
			loadData(date);
		}
     function parseData(jsonArr){
    	  var  jsonObj={};
    	  for(var key in jsonArr){
    		  var num=jsonArr[key].num;
    		  var m=jsonArr[key].h;
    		  jsonObj["s"+parseInt(m)]=num;	  
    	  };
    		var arr = [];
			for(var i=0;i<=23;i++){
				arr.push(jsonObj["s"+i]||0);
			}
			return arr;
      }
     	//时间轴准备
	  function getTimeLine(){
			var arr = [];
			for(var i=0;i<=23;i++){
				arr.push((i<10?"0"+i:i)+":00");
			}
			return arr;
		};
       function initChart(targetId,json){
			require.config({
	            paths: {
	                echarts: basePath+'/resources/js/echart'
	            }
	        });
	        require(
	            [	
	                'echarts',
	                'echarts/chart/bar',
					'echarts/chart/pie',
					'echarts/chart/line'
	            ],
	           function (ec) {
	                var myChart = ec.init(document.getElementById(targetId));
	                var option  = {
	                		title : {
	                			x:'center',
	                	        text:json.title,
	                	        subtext: '用户/注册数'
	                	    },
	                 	    tooltip : {
	                   	        trigger: 'axis'
	                   	    },
	                   	   toolbox: {
	                	        show : true,
	                	        feature : {
	                	            mark : {show: true},
	                	            dataView : {show: true, readOnly: false},
	                	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	                	            restore : {show: true},
	                	            saveAsImage : {show: true}
	                	        }
	                	    },
	                	    calculable : true,
	                	    xAxis : [
	                	        {   
	                	        	name:'时间段',
	                	            type : 'category',
	                	            data :json.timelines
	                	        }
	                	    ],
	                	    yAxis : [
	                	        {
	                	        	name:'注册数',
	                	            type : 'value'
	                	        }
	                	    ],
	                	    series : [
	                	        {
	                	        	name:'成交',
	                   	            type:'line',
	                   	            smooth:true,
	                   	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
	                   	         	markPoint : {
	    				                data : [
	    				                    {type : 'max', name: '最大值'},
	    				                    {type : 'min', name: '最小值'}
	    				                ]	
	    				            },
	    				            markLine : {
	    				                data : [
	    				                    {type : 'average', name: '平均值'}
	    				                ]
	    				            },
	                   	            data:json.datas
	                	        },
	                	    ]
						};
				    	myChart.setOption(option);
					    var ecConfig = require('echarts/config');
					    myChart.on(ecConfig.EVENT.CLICK, eConsole);
	            }
	        );
	  };
	  function eConsole(){
		  
	  }
 </script>
</body>
</html>