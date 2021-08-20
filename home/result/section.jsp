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
<style>
.right {
	float: right;
	width: 50%;
}

.left {
	float: left;
	width: 50%;
}
</style>
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
<body class="sb-nav-fixed" style="height: 740px; padding-top: 180px;">
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
						</a> <a class="nav-link" href="/home/error/solution">
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
	<script src="/code/modules/coloraxis.js"></script>

	<c:set var="numOfErr" value="${numOfErr }" />
	<c:set var="strNumPerErrSect" value="${strNumPerErrSect }" />

	<div class="right">
		<figure class="highcharts-figure">
			<div id="container"></div>
			<p class="highcharts-description" style="margin-top: 20px;">This
				chart shows the number of errors in each section as a percentage.</p>
		</figure>

		<script type="text/javascript">
			var str = "<c:out value='${strNumPerErrSect}' />";
			var arr = str.split(",");

			for (var i = 0; i < arr.length; i++)
				arr[i] = Number(arr[i]);

			// Radialize the colors
			Highcharts.setOptions({
				colors : Highcharts.map(Highcharts.getOptions().colors,
						function(color) {
							return {
								radialGradient : {
									cx : 0.5,
									cy : 0.3,
									r : 0.7
								},
								stops : [
										[ 0, color ],
										[
												1,
												Highcharts.color(color)
														.brighten(-0.2).get(
																'rgb') ] // darken
								]
							};
						})
			});

			// Build the chart
			Highcharts
					.chart(
							'container',
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false,
									type : 'pie'
								},
								title : {
									text : 'Proportion of errors per section'
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
								},
								accessibility : {
									point : {
										valueSuffix : '%'
									}
								},
								colorAxis : {},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											format : '<b>{point.name}</b>: {point.percentage:.1f} %',
											connectorColor : 'silver'
										}
									}
								},
								series : [ {
									name : 'Share',
									colorBypoint : true,
									data : [ {
										name : '1',
										y : arr[0]
									}, {
										name : '2',
										y : arr[1]
									}, {
										name : '3',
										y : arr[2]
									}, {
										name : '4',
										y : arr[3]
									}, {
										name : '5',
										y : arr[4]
									}, {
										name : '6',
										y : arr[5]
									}, {
										name : '7',
										y : arr[6]
									}, {
										name : '8',
										y : arr[7]
									}, {
										name : '9',
										y : arr[8]
									}, {
										name : '10',
										y : arr[9]
									}, {
										name : '11',
										y : arr[10]
									}, {
										name : '12',
										y : arr[11]
									}, {
										name : '13',
										y : arr[12]
									}, {
										name : '14',
										y : arr[13]
									}, {
										name : '15',
										y : arr[14]
									}, {
										name : '16',
										y : arr[15]
									}, {
										name : '17',
										y : arr[16]
									}, {
										name : '18',
										y : arr[17]
									}, {
										name : '19',
										y : arr[18]
									}, {
										name : '20',
										y : arr[19]
									}, {
										name : '21',
										y : arr[20]
									}, {
										name : '22',
										y : arr[21]
									}, {
										name : '23',
										y : arr[22]
									}, {
										name : '24',
										y : arr[23]
									}, {
										name : '25',
										y : arr[24]
									}

									]
								} ]
							});
		</script>
	</div>
	<div class="left">
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>Section no.</th>
										<th>Counts</th>
										<th>Percentage</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1
										</td>
										<td>${numPerErrSect["0"]}</td>
										<td>${numPerErrSect["0"]/numOfErr*100 - numPerErrSect["0"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>2
										</td>
										<td>${numPerErrSect["1"]}</td>
										<td>${numPerErrSect["1"]/numOfErr*100 - numPerErrSect["1"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>3
										</td>
										<td>${numPerErrSect["2"]}</td>
										<td>${numPerErrSect["2"]/numOfErr*100 - numPerErrSect["2"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>4
										</td>
										<td>${numPerErrSect["3"]}</td>
										<td>${numPerErrSect["3"]/numOfErr*100 - numPerErrSect["3"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>5
										</td>
										<td>${numPerErrSect["4"]}</td>
										<td>${numPerErrSect["4"]/numOfErr*100 - numPerErrSect["4"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>6
										</td>
										<td>${numPerErrSect["5"]}</td>
										<td>${numPerErrSect["5"]/numOfErr*100 - numPerErrSect["5"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>7
										</td>
										<td>${numPerErrSect["6"]}</td>
										<td>${numPerErrSect["6"]/numOfErr*100 - numPerErrSect["6"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>8
										</td>
										<td>${numPerErrSect["7"]}</td>
										<td>${numPerErrSect["7"]/numOfErr*100 - numPerErrSect["7"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>9
										</td>
										<td>${numPerErrSect["8"]}</td>
										<td>${numPerErrSect["8"]/numOfErr*100 - numPerErrSect["8"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>10
										</td>
										<td>${numPerErrSect["9"]}</td>
										<td>${numPerErrSect["9"]/numOfErr*100 - numPerErrSect["9"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>11
										</td>
										<td>${numPerErrSect["10"]}</td>
										<td>${numPerErrSect["10"]/numOfErr*100 - numPerErrSect["10"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>12
										</td>
										<td>${numPerErrSect["11"]}</td>
										<td>${numPerErrSect["11"]/numOfErr*100 - numPerErrSect["11"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>13
										</td>
										<td>${numPerErrSect["12"]}</td>
										<td>${numPerErrSect["12"]/numOfErr*100 - numPerErrSect["12"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>14
										</td>
										<td>${numPerErrSect["13"]}</td>
										<td>${numPerErrSect["13"]/numOfErr*100 - numPerErrSect["13"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>15
										</td>
										<td>${numPerErrSect["14"]}</td>
										<td>${numPerErrSect["14"]/numOfErr*100 - numPerErrSect["14"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>16
										</td>
										<td>${numPerErrSect["15"]}</td>
										<td>${numPerErrSect["15"]/numOfErr*100 - numPerErrSect["15"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>17
										</td>
										<td>${numPerErrSect["16"]}</td>
										<td>${numPerErrSect["16"]/numOfErr*100 - numPerErrSect["16"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>18
										</td>
										<td>${numPerErrSect["17"]}</td>
										<td>${numPerErrSect["17"]/numOfErr*100 - numPerErrSect["17"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>19
										</td>
										<td>${numPerErrSect["18"]}</td>
										<td>${numPerErrSect["18"]/numOfErr*100 - numPerErrSect["18"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>20
										</td>
										<td>${numPerErrSect["19"]}</td>
										<td>${numPerErrSect["19"]/numOfErr*100 - numPerErrSect["19"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>21
										</td>
										<td>${numPerErrSect["20"]}</td>
										<td>${numPerErrSect["20"]/numOfErr*100 - numPerErrSect["20"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>22
										</td>
										<td>${numPerErrSect["21"]}</td>
										<td>${numPerErrSect["21"]/numOfErr*100 - numPerErrSect["21"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>23
										</td>
										<td>${numPerErrSect["22"]}</td>
										<td>${numPerErrSect["22"]/numOfErr*100 - numPerErrSect["22"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>24
										</td>
										<td>${numPerErrSect["23"]}</td>
										<td>${numPerErrSect["23"]/numOfErr*100 - numPerErrSect["23"]/numOfErr*100 % 0.01}</td>
									</tr>
									<tr>
										<th>25
										</td>
										<td>${numPerErrSect["24"]}</td>
										<td>${numPerErrSect["24"]/numOfErr*100 - numPerErrSect["24"]/numOfErr*100 % 0.01}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		</div>
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