<%@page
	import="com.sun.org.apache.bcel.internal.generic.AnnotationElementValueGen"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="/assets/demo/chart-area-demo.js"></script>
<script src="/assets/demo/chart-bar-demo.js"></script>
<script src="/assets/demo/chart-pie-demo.js"></script>

<style>
body {
	padding-top: 40px;
	padding-left: 225px;
}

.t-wrap {
	width: 1500px;
	height: 650px;
}

.t-part1 {
	float: left;
	display: inline-flex;
	height: 470px;
	padding: 10px;
}

.t-part2 {
	float: left;
	display: inline-flex;
	height: 150px;
	width: 1500px;
	padding: 10px;
	text-align: center;
}

.input-table {
	width: 700px;
	height: 430px;
	margin: auto;
	border: 1px;
	padding-top: 10px;
	position: relative;
	text-align: center;
}

.button-box {
	text-align: center;
}
</style>


</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/home">Refractive index
			measurement system</a>
	</nav>
	<iframe id="iframe1" name="iframe1" style="display: none"></iframe>
	<form method="post" target="iframe1">

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
				</nav>
			</div>
			<div class="t-wrap" style="margin-top: 100px; margin-left: 20px;">
				<div class="t-part1">
					<div class="input-table">
						<table id="table" border="2" width="375" height="375"
							align="center" style="text-align: center;">
							<tr>
								<td
									style="${errSector['0'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["0"]}</td>
								<td
									style="${errSector['1'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["1"]}</td>
								<td
									style="${errSector['2'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["2"]}</td>
								<td
									style="${errSector['3'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["3"]}</td>
								<td
									style="${errSector['4'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["4"]}</td>
							</tr>
							<tr>
								<td
									style="${errSector['5'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["5"]}</td>
								<td
									style="${errSector['6'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["6"]}</td>
								<td
									style="${errSector['7'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["7"]}</td>
								<td
									style="${errSector['8'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["8"]}</td>
								<td
									style="${errSector['9'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["9"]}</td>
							</tr>
							<tr>
								<td
									style="${errSector['10'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["10"]}</td>
								<td
									style="${errSector['11'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["11"]}</td>
								<td
									style="${errSector['12'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["12"]}</td>
								<td
									style="${errSector['13'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["13"]}</td>
								<td
									style="${errSector['14'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["14"]}</td>
							</tr>
							<tr>
								<td
									style="${errSector['15'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["15"]}</td>
								<td
									style="${errSector['16'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["16"]}</td>
								<td
									style="${errSector['17'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["17"]}</td>
								<td
									style="${errSector['18'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["18"]}</td>
								<td
									style="${errSector['19'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["19"]}</td>
							</tr>
							<tr>
								<td
									style="${errSector['20'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["20"]}</td>
								<td
									style="${errSector['21'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["21"]}</td>
								<td
									style="${errSector['22'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["22"]}</td>
								<td
									style="${errSector['23'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["23"]}</td>
								<td
									style="${errSector['24'] == 'y' ? 'background-color: red':'background-color: '}">${fullSector["24"]}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-10">


						<script src="/code/highcharts.js"></script>
						<script src="/code/highcharts-more.js"></script>
						<script src="/code/modules/exporting.js"></script>
						<script src="/code/modules/export-data.js"></script>
						<script src="/code/modules/accessibility.js"></script>

						<c:set var="maxData" value="${maxData }" />
						<c:set var="minData" value="${minData }" />
						<c:set var="chartData" value="${chartData }" />
						<c:set var="avgData" value="${avgData }" />
						

						<figure class="highcharts-figure">
							<div id="container"></div>
							<p class="highcharts-description"></p>
						</figure>





						<script type="text/javascript">
							var str = "<c:out value='${chartData }' />";
							var str_min = "<c:out value='${minData }' />";
							var str_max = "<c:out value='${maxData }' />";
							var str_avg = "<c:out value='${avgData }' />";

							var marr = str_min.split(",").map(Number);
							var Marr = str_max.split(",").map(Number);
							var input = str.split(",").map(Number);
							var avg = str_avg.split(",").map(Number);

							Highcharts.chart('container', {

								title : {
									text : 'Compare input data to defalut data'
								},


								yAxis : {
									title : {
										text : 'Refractive index'
									}
								},

								xAxis : {
									accessibility : {
									// rangeDescription: 'Range: 1 to 5'
									},
									title : {
										text : 'Section no.'
									}
									
								},

								legend : {
									layout : 'vertical',
									align : 'right',
									verticalAlign : 'middle'
								},

								plotOptions : {
									series : {
										label : {
											connectorAllowed : false
										},
										pointStart : 1
									}
								},

								series : [ {
									name : 'Input',
									data : input
								}, {
									name : 'Max',
									data : Marr
								}, {
									name : 'Min',
									data : marr
								}, {
									name : 'Avg',
									data : avg
								}
								],

								responsive : {
									rules : [ {
										condition : {
											maxWidth : 500
										},
										chartOptions : {
											legend : {
												layout : 'horizontal',
												align : 'center',
												verticalAlign : 'bottom'
											}
										}
									} ]
								}

							});
						</script>
					</div>
				</div>
				<div class="t-part2" style="margin-left: 110px; margin-top: 30px;">
					<div class="form-group mb-3 ms-5 col-2 m-3">
						<input class="form-control" type="textbox" name="waferNum" id="waferNum" placeholder="Wafer no." />
					</div>
					<div class="form-group mb-3 ms-5 col-2 m-3">
						<select class="form-control" name="waferSect" id="waferSect">		
								<option hidden>Select section</option>
								<option value="1">Section 1</option>
								<option value="2">Section 2</option>
								<option value="3">Section 3</option>
								<option value="4">Section 4</option>
								<option value="5">Section 5</option>
								<option value="6">Section 6</option>
								<option value="7">Section 7</option>
								<option value="8">Section 8</option>
								<option value="9">Section 9</option>
								<option value="10">Section 10</option>
								<option value="11">Section 11</option>
								<option value="12">Section 12</option>
								<option value="13">Section 13</option>
								<option value="14">Section 14</option>
								<option value="15">Section 15</option>
								<option value="16">Section 16</option>
								<option value="17">Section 17</option>
								<option value="18">Section 18</option>
								<option value="19">Section 19</option>
								<option value="20">Section 20</option>
								<option value="21">Section 21</option>
								<option value="22">Section 22</option>
								<option value="23">Section 23</option>
								<option value="24">Section 24</option>
								<option value="25">Section 25</option>		
						</select>
					</div>
					<div class="form-group mb-3 ms-5 col-2 m-3">
						<select class="form-control" name="errCode" id="errCode">
								<option hidden>Select error code</option>
								<option value="100">Code 100</option>
								<option value="200">Code 200</option>
								<option value="300">Code 300</option>
								<option value="400">Code 400</option>
						</select>
					</div>
					<div class="form-group mb-3 ms-5 col-2 m-3">
						<select class="form-control" name="solCode" id="solCode">
								<option hidden>Select solution code</option>
								<option value="101">Code 101</option>
								<option value="102">Code 102</option>
								<option value="201">Code 201</option>
								<option value="202">Code 202</option>
								<option value="301">Code 301</option>
								<option value="302">Code 302</option>
								<option value="303">Code 303</option>
								<option value="401">Code 401</option>
								<option value="402">Code 402</option>
								<option value="403">Code 403</option>
								<option value="404">Code 404</option>
								<option value="405">Code 405</option>
						</select>
					</div>
				</div>
			<div class="button-box" style="margin-top: 34px;">
					<button type="submit" class="btn btn-primary col-2"
						formaction="/home/measure/inputdata/result">Data Save</button>
					<button type="submit" class="btn btn-primary col-2"
						formaction="/home/measure/inputdata/error_report">Submit
						Report</button>
				</div>
			</div>		
		</div>	
	</form>
</body>
</html>
