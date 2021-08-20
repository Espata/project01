<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Refractive index measurement system</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/styles.css">
<link rel="stylesheet" href="/code/css/highchart.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<style type="text/css">
.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#container {
	height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>

</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/home">Refractive index
			measurement system</a>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">
							<i class="far fa-user" style="font-size: 15px;"></i>&ensp;
							<c:out value="${sessionName}"></c:out>
						</div>
						<a class="nav-link" href="/logout">
							<div class="sb-nav-link-icon">
								<i class="fas fa-sign-out-alt" style="font-size: 15px;"></i>
							</div> Logout
						</a>
						<div class="sb-sidenav-menu-heading">Measurement</div>
						<a class="nav-link" href="/home/measure">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Measurement
						</a> <a class="nav-link" href="/home/measure/inputdata">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Input data to DB
						</a>
						<div class="sb-sidenav-menu-heading">Analysis</div>
						<a class="nav-link" href="/home/tables">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a> <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseAuth" aria-expanded="false"
							aria-controls="pagesCollapseAuth">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Results
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseAuth"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/home/result/section">Section</a> <a
									class="nav-link" href="/home/result/error">Error</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Code List</div>
						<a class="nav-link" href="/home/code/error">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Error Code
						</a> <a class="nav-link" href="/home/code/solution">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Solution Code
						</a>
					</div>
				</div>
		</div>
		</nav>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/js/datatables-simple-demo.js"></script>

	<script src="/code/highcharts.js"></script>
	<script src="/code/modules/exporting.js"></script>
	<script src="/code/modules/export-data.js"></script>
	<script src="/code/modules/accessibility.js"></script>
	
	<c:set var="strNumPerSolCode" value="${strNumPerSolCode }" />

	<figure class="highcharts-figure">
		<div id="container"
			style="overflow: hidden; margin-top: 50px; margin-bottom: 20px;"></div>
		<p class="highcharts-description">This chart shows the number of
			occurrences according to the type of error that occurred in each
			session.</p>
	</figure>



	<script type="text/javascript">
	
		var str = "<c:out value='${strNumPerSolCode}' />";
		
		var arr = str.split(",").map(Number);
		
		Highcharts.chart('container', {
			chart : {
				type : 'bar'
			},
			title : {
				text : 'Number of errors by error code'
			},
			xAxis : {
				categories : [ 'Errcode 100', 'Errcode 200', 'Errcode 300',
						'Errcode 400' ]
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Counts'
				}
			},
			legend : {
				reversed : true
			},
			plotOptions : {
				series : {
					stacking : 'normal'
				}
			},
			series : [ {
				name : '405',
				color: '#ff9dff',
				data : [ 0, 0, 0, arr[11] ]
			}, {
				name : '404',
				color: '#e782ff',
				data : [ 0, 0, 0, arr[10] ]
			}, {
				name : '403',
				color: '#c15af4',
				data : [ 0, 0, 0, arr[9] ]
			}, {
				name : '402',
				color: '#a33cd6',
				data : [ 0, 0, 0, arr[8] ]
			}, {
				name : '401',
				color: '#9400d3',
				data : [ 0, 0, 0, arr[7] ]
			}, {
				name : '303',
				color: '#5ad2ff',
				data : [ 0, 0, arr[6], 0 ]
			}, {
				name : '302',
				color: '#46aaff',
				data : [ 0, 0, arr[5], 0 ]
			}, {
				name : '301',
				color: '#0000ff',
				data : [ 0, 0, arr[4], 0 ]
			}, {
				name : '202',
				color: '#7af67a',
				data : [ 0, arr[3], 0, 0 ]
			}, {
				name : '201',
				color: '#52e252',
				data : [ 0, arr[2], 0, 0 ]
			}, {
				name : '102',
				color: '#ff8c8c',
				data : [ arr[1], 0, 0, 0 ]
			}, {
				name : '101',
				color: '#ff0000',
				data : [ arr[0], 0, 0, 0 ]
			} ]
		});
	</script>

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<div class="card mb-4">
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
	                            <tr>
                                <th></th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>                          
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>100</td>
                           		<td>${numPerSolCode["0"] }</td>
                                <td>${numPerSolCode["1"] }</td>                   
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>${numPerSolCode["0"] + numPerSolCode["1"]}</td>
                            </tr>
                            <tr>
                                <th>200</td>
                                <td>${numPerSolCode["2"] }</td>
                                <td>${numPerSolCode["3"] }</td>       
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>${numPerSolCode["2"] + numPerSolCode["3"]}</td>
                            </tr>
                            <tr>
                                <th>300</td>
                                <td>${numPerSolCode["4"] }</td>
                               	<td>${numPerSolCode["5"] }</td>
                                <td>${numPerSolCode["6"] }</td>       
                                <td>0</td>
                          		<td>0</td>
                                 <td>${numPerSolCode["4"] + numPerSolCode["5"] + numPerSolCode["6"]}</td> 
                            </tr>
                            <tr>
                                <th>400</td>
                                <td>${numPerSolCode["7"] }</td>
                                <td>${numPerSolCode["8"] }</td>
                                <td>${numPerSolCode["9"] }</td>          
                                <td>${numPerSolCode["10"] }</td>
                                <td>${numPerSolCode["11"] }</td>     
                                 <td>${numPerSolCode["7"] + numPerSolCode["8"] + numPerSolCode["9"] + numPerSolCode["10"] + numPerSolCode["11"]}</td>                   
                            </tr>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/js/datatables-simple-demo.js"></script>

</body>
</html>