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
					<input type="text"  id="date" onFocus="WdatePicker({onpicking:changeDate,dateFmt:'yyyy'})" class="Wdate"/>	
				</div>
			    <div class="tabwrap" id="main" style="height: 400px;">
				</div>	
			   <div class="tabwrap"  style="height:400px;">
					<!--表格-->
				  <select id="sort">
					<option value="asc">升序</option>
					<option value="desc" selected="selected">降序</option>
				  </select>
				 <table class="tztab">
					<thead>
						<tr>
							<th>主键</th>
							<th>标题 <span class="up"></span> <span class="down"></span></th>	
							<th>创建时间</th>	
							<th>操作</th>
						</tr>
					</thead>
					<!--身体部-->
					<tbody id="tbody">
						<tr>
							<td id="loading" colspan="50"></td>
						</tr>
					</tbody>
			    </table>
			    <div class="cpage"></div>
			 </div>
		   </div>
		</div>
</div>
 <script type="text/javascript">
      $(function(){
    	  loadData(new Date().getFullYear());
       });
	  // 点击日期的回调函数
	   function changeDate(dp){
			var date = dp.cal.getNewDateStr();
			loadData(date);
		}
		
      function loadData(year){
    	   $.ajax({
    	    	  type:'post',
    	    	  url:'http://localhost:8080/moonVip/admin/stat/list',
    	    	  data:{year:year},
    	    	  success:function(data){
    	    		  var  json={ 
    	    				    title:year+"年雅虎社区访问统计报表",
    	    				    datas:parseData(data),
    	    		  }; 
    	    		  initChart('main',json);
    	    	  }
    	      }); 
      }; 
      function parseData(jsonArr){
    	  var  jsonObj={};
    	  for(var key in jsonArr){
    		  var num=jsonArr[key].num;
    		  var m=jsonArr[key].m;
    		  jsonObj["s"+parseInt(m)]=num;	  
    	  }
    	  var arr=[];
    	  for(var i=1;i<=12;i++){
    		  arr.push(jsonObj["s"+i]||0);
    	  }
    	    return arr;  
      }
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
					'echarts/chart/pie'
	            ],
	           function (ec) {
	                var myChart = ec.init(document.getElementById(targetId));
	                var option  = {
						    title : {
						    	x: "center",
						        text: json.title,
						        subtext: "月份/总数"
						    },
						    tooltip : {
						        trigger: 'axis'
						    },
						    toolbox: {
						        show : true,
						        feature : {
						            mark : {show: true},
						            dataView : {show: true, readOnly: false},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    calculable : true,
						    xAxis : [
						        {
						            type : 'category',
						            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    series : [
						        {
						            name:'访问人数',
						            type:'bar',
						            data:json.datas,
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
						            }
						        }
						    ]
						};
					myChart.setOption(option);
					var ecConfig = require('echarts/config');
					myChart.on(ecConfig.EVENT.CLICK, eConsole);
	            }
	        );
	 }
        var mark=true;
        function eConsole(d){
           //获取用户点击的数据
		   var  month=parseInt(d.name);
		   var sort = document.getElementById("sort").value||"desc";
		   var params={
				  month:month,
				  order:"create_time desc",
				  pageNo:0,
				  pageSize:30
		   };
		  loading2($("#tbody"),4);
		  if(mark){
			  mark=!mark;
			  $.ajax({
				   type:"post",
				   url:adminPath+"/adminstat/groupContent",
				   data:params,
				   error:function(){mark=true;},
				   success:function(data){
					   alert(JSON.stringify(data));
					   var len=data.length;
					   var html="";
					   for(var i=0;i<len;i++){
						   html+="<tr>"+
						   "<td>"+data[i].id+"</td>"+
						   "<td>"+data[i].title+"</td>"+
						   "<td>"+data[i].create_time+"</td>"+
						   "<td>操作</td>"
						   "</tr>";
					   }   
					  	$("#tbody").html(html);
				   }
			   });
		    }
        }
 </script>
</body>
</html>