<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>

<base href="<%=basePath%>" />
<title>${title }</title>
<style type="text/css">
.slider {
	position: absolute;
	width: 100%;
	height: 425px;
}

.slider li, .slider li a {
	list-style: none;
	float: left;
	width: 100%;
	height: 425px;
}

.slider img {
	width: 100%;
	height: 425px;
	display: block;
}

.slider2 {
	width: 2000px;
}

.slider2 li {
	float: left;
}

.num {
	position: absolute;
	right: 400px;
	bottom: 20px;
}

.num li {
	float: left;
	color: #005aa9;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	overflow: hidden;
	margin: 3px 1px;
	border: 1px solid #005aa9;
	background-color: #fff;
}

.num li.on {
	color: #fff;
	line-height: 21px;
	width: 21px;
	height: 21px;
	font-size: 16px;
	margin: 0 1px;
	border: 0;
	background-color: #005aa9;
	font-weight: bold;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			销售网络
		</div>
	</div>
	<div class="blank"></div>

	<div style="clear: both"></div>

	<div id="container" style="height: 800px"></div>
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
		
	</script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="https://api.map.baidu.com/api?v=2.0&ak=B1f82jlfVMT9uUr31SCAX48fs96lmx1n"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
	<script type="text/javascript" src="js/provinces.js"></script>
	<script type="text/javascript">
		function getPro(key) {

			for (var i = 0, l = provinces.length; i < l; i++) {
				var citys = provinces[i].city;
				for (var j = 0, m = citys.length; j < m; j++) {
					var city = citys[j].name;
					if (city == key) {
						return provinces[i].name;
					}
				}
			}

		}

		$(function() {

			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			var session = [];
			var datalist = [];
			var prolist = [];
			var addresslist = [];

			var index = 0;
			<c:forEach items="${peihuoList}" var="peihuo">

			session[index] = "${peihuo.cityname}";
			prolist[index] = getPro(session[index]);
			addresslist[index] = "${peihuo.address}"+"<br/>联系方式：${peihuo.contact}";
			//alert(getPro(session[index]));
			index++;
			</c:forEach>
			//datalist = new Array();
			for (var h = 0; h < index; h++) {

				//	datalist+="{'name':"+prolist[h]+",'value':"+addresslist[h]+"},";
				//datalist[h] = {
				//	'name' : prolist[h],
				//	'value' : addresslist[h]
				//};

				datalist.push({
					name : prolist[h],
					value : addresslist[h]
				});

				//alert(datalist[h]);
			}

			var option;
			option = {
				title : {
					text : '我们的配货站',
					subtext : '雪克咖啡商城',
					left : 'center'
				},
				tooltip : {
					trigger : 'item'
				},
				legend : {
					orient : 'vertical',
					left : 'left',
					data : [ '配货站' ]
				},
				visualMap : {
					min : 0,
					max : 2500,
					left : 'left',
					top : 'bottom',
					text : [ '高', '低' ], // 文本，默认为数值文本
					calculable : true
				},
				toolbox : {
					show : true,
					orient : 'vertical',
					left : 'right',
					top : 'center',
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				series : [ {
					name : '配货站',
					type : 'map',
					mapType : 'china',
					roam : false,
					label : {
						normal : {
							show : false
						},
						emphasis : {
							show : true
						}
					},
					data : [ {
						name : '北京',
						value : Math.round(Math.random() * 1000),
					}, {
						name : '江苏',
						value : Math.round(Math.random() * 1000),
						tooltip : {
							trigger : 'item',
							formatter : function(name, count, deatil) {

								return name + "<br />" + count;
							}

						}
					} ],
				},

				]
			};
			//console.log(datalist);
			option.series[0].data = [];

			for ( var ss in datalist) {
				var kkk = datalist[ss].value;

				var val = {
					name : datalist[ss].name,
					//data:datalist[ss].name,
					value : datalist[ss].name.length,
					sb : 123,
					tooltip : {
						trigger : 'item',
						formatter : function(params) {
							for ( var ss in datalist) {
								if (datalist[ss].name == params.name) {
									var res = params.name + '<br/>' + datalist[ss].value;

									return res;
								}
							}
							

							//	、、ieturn k.name + "<br />"
							//		+ datalist[ss].value+ "<br />"
						}

					}

				}

				option.series[0].data.push(val);

			}
			//alert(datalist[ss].name);
			//datalist.push({name:prolist[h],value:addresslist[h]});
			//option.series[0].data.push({name:datalist[ss].name,value:datalist[ss].value.length,tooltip: {formatter: function(params){return "sadasdsad"}});

			//	myChart = echarts.init(dom);
			//console.log(option.series[0].data);
			if (option && typeof option === "object") {

				console.log(JSON.stringify(option));
				myChart.setOption(option, false);
			}

		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
