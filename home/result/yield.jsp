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
#container {
	height: 500px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 700px;
	margin: 1em auto;
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
									class="nav-link" href="/home/result/error">Error</a> <a
									class="nav-link" href="/home/result/yield">Yield</a>
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
	<script src="/code/modules/variable-pie.js"></script>
	<script src="/code/modules/exporting.js"></script>
	<script src="/code/modules/export-data.js"></script>
	<script src="/code/modules/accessibility.js"></script>

	<figure class="highcharts-figure"
		style="margin-top: 150px; margin-left: 450px;">
		<div id="container"></div>
		<p class="highcharts-description">Variable radius pie charts can
			be used to visualize a second dimension in a pie chart. In this
			chart, the more densely populated countries are drawn further out,
			while the slice width is determined by the size of the country.</p>
	</figure>




	<script type="text/javascript">
		Highcharts
				.chart(
						'container',
						{
							chart : {
								type : 'variablepie'
							},
							title : {
								text : 'Countries compared by population density and total area.'
							},
							tooltip : {
								headerFormat : '',
								pointFormat : '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>'
										+ 'Area (square km): <b>{point.y}</b><br/>'
										+ 'Population density (people per square km): <b>{point.z}</b><br/>'
							},
							series : [ {
								minPointSize : 10,
								innerSize : '20%',
								zMin : 0,
								name : 'yield',
								data : [ {
									name : 'nondefect',
									y : 505370,
									z : 92.9
								}, {
									name : 'defect',
									y : 551500,
									z : 118.7
								} ]
							} ]
						});
	</script>


</body>
</html>