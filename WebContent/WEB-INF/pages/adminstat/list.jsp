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
 </head>
 <body>
	<div class="wrap">
		<%@ include file="/WEB-INF/pages/common/left.jsp"%>
		<div class="content">
			<%@ include file="/WEB-INF/pages/common/header.jsp"%>
			<div class="channel"> 首页 > 日志管理</div>
			<div class="cnt">
			   <select onchange="loadData(this.value)">
			      <option value="">请选择年份</option>
			      <c:forEach begin="2010" end="2020" var="year">
			          <option value="${year}">${year}</option>
			      </c:forEach>
			   </select>
				<div class="tabwrap"  id="main" style="height:400px;">
					<!--表格-->
				
				</div>
			</div>
		</div>
	</div>
 <script type="text/javascript">
 
      $(function(){
    	  loadData(new Date().getFullYear());
       });
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
   /*     function initChart(targetId,json){
	   var main=document.getElementById(targetId);
	   var mychart=echarts.init(main);
	   option = {
			    title : {
			    	x:'center',
			        text:json.title,
			        subtext: '月份/总数'
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
			            type :'category',
			            data :['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
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
			            data: json.datas,
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
			        },
			    ]
			};
	     mychart.setOption(option);
   }   
        */
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
        function eConsole(param) {
        	
        	alert(JSON.stringify(param))
		  /*   var mes = '【' + param.type + '】';
		    if (typeof param.seriesIndex != 'undefined') {
		        mes += '  seriesIndex : ' + param.seriesIndex;
		        mes += '  dataIndex : ' + param.dataIndex;
		    }
		    alert(JSON.strinify(param)+"===="+mes); */
       
        }
       

 </script>
</body>
</html>