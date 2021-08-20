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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
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
			</nav>
		</div>
		<style>
body {
	padding-top: 40px;
	padding-left: 225px;
}

.t-wrap {
	width: 1500px;
	height: 950px;
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
	height: 470px;
	padding: 10px;
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

.input-loc {
	width: 700px;
	height: 430px;
	border: 1px;
	text-align: left;
	padding-top: 10px;
	margin-left: px;
}

.input-laser {
	width: 700px;
	height: 430px;
	border: 1px;
	text-align: left;
	padding-top: 10px;
	margin-left: px;
}

.input-envir {
	width: 700px;
	height: 430px;
	border: 1px;
	text-align: left;
	padding-top: 10px;
	margin-left: px;
}
</style>


		<form method="post" action="/home/measure/inputdata"
			enctype="multipart/form-data">
			<div class="t-wrap" style="margin-top: 100px; margin-left: 20px;">
				<div class="t-part1">
					<div class="input-table">
						<table border="2" width="375" height="375" align="center">
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<tr>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
							</tr>
							<tr>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
								<td>15</td>
							</tr>
							<tr>
								<td>16</td>
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
							</tr>
							<tr>
								<td>21</td>
								<td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
							</tr>
						</table>
						<div class="input-file">
							<input class="form-control" type="file" id="file" name="file"
								style="height: 38px; width: 500px; margin-left: 700px; margin-top: -37px">
						</div>
					</div>
					<script>
						function buttonFunction() {
							if (document.getElementById("xvalue2").value != document
									.getElementById("xvalue").value) {
								document.getElementById("xvalue2").value = 0;
							}
						}
						function buttonFunction2() {
							if (document.getElementById("yvalue2").value != document
									.getElementById("yvalue").value) {
								document.getElementById("yvalue2").value = 0;
							}
						}
						function buttonFunction3() {
							if (document.getElementById("zvalue2").value != document
									.getElementById("zvalue").value) {
								document.getElementById("zvalue2").value = 0;
							}
						}

						function buttonFunction4() {
							if (document.getElementById("wvalue2").value != document
									.getElementById("wvalue").value) {
								document.getElementById("wvalue2").value = 532;
							}
						}
						function buttonFunction5() {
							if (document.getElementById("pvalue2").value != document
									.getElementById("pvalue").value) {
								document.getElementById("pvalue2").value = 23.0;
							}
						}
						function buttonFunction6() {
							if (document.getElementById("tvalue2").value != document
									.getElementById("tvalue").value) {
								document.getElementById("tvalue2").value = 23.0;
							}
						}
						function buttonFunction7() {
							if (document.getElementById("hvalue2").value != document
									.getElementById("hvalue").value) {
								document.getElementById("hvalue2").value = 0;
							}
						}
					</script>

					<style media="screen">
p {
	display: inline;
	font-size: 20px;
	padding: 10px;
	line-height: 50px;
}

input {
	width: 130px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	margin: 10px;
}

p.h1 {
	margin-left: 100px;
}
</style>

					<div class="input-loc">
						<form style="height: 350px;">
							<p style="margin-left: 55px; margin-right: 85px;">Setup value</p>
							<p style="margin-left: -15px; margin-right: 85px;">Current
								value</p>
							<div id="loc1" style="height: 100px;">

								<p>X</p>
								<input type="text" id="xvalue" name="xvalue" value="0"
									style="margin-right: 70px;" /> <input type="text" id="xvalue2"
									name="xvalue2" value="3" style="margin-right: 70px;" /> <input
									type="button" id="button" onclick="buttonFunction()"
									value="Set" style="margin-right: 70px;" />
							</div>
							<div id="loc2" style="height: 100px;">

								<p>Y</p>
								<input type="text" id="yvalue" name="yvalue" value="0"
									style="margin-right: 70px;" /> <input type="text" id="yvalue2"
									name="yvalue2" value="3" style="margin-right: 70px;" /> <input
									type="button" id="button" onclick="buttonFunction2()"
									value="Set" style="margin-right: 70px;" />
							</div>
							<div id="loc3" style="height: 100px;">

								<p>R</p>
								<input type="text" id="zvalue" name="zvalue" value="0"
									style="margin-right: 70px;" /> <input type="text" id="zvalue2"
									name="zvalue2" value="5.4" style="margin-right: 70px;" /> <input
									type="button" id="button" onclick="buttonFunction3()"
									value="Set" style="margin-right: 70px;" />
							</div>
							<div align="right">
								<input type="submit" id="nextbutton" value="Run"
									style="margin-right: 40px; margin-top: -10px" />
							</div>

						</form>

					</div>
				</div>
				<div class="t-part2">
					<div class="input-laser">
						<form>

							<p style="margin-left: 145px; margin-right: 73px;">Setup
								value</p>
							<p style="margin-left: 5px; margin-right: 73px;">Current
								value</p>
							<div id="loc1">

								<p>Wavelength</p>
								<input type="text" id="wvalue" name="wvalue" value="532" />
								<p style="margin-right: 5px">nm</p>
								<input type="text" id="wvalue2" name="wvalue2" value="355" />
								<p style="margin-right: 5px">nm</p>
								<input type="button" id="button" onclick="buttonFunction4()"
									value="Set" style="width: 110px;" />
							</div>

							<div id="loc2">

								<p style="margin-right: 50px;">Power</p>
								<input type="text" id="pvalue" name="pvalue" value="23.0"
									style="margin-left: 11px; margin-right: 0px;" />
								<p style="margin-left: 10px;">mW</p>
								<input type="text" id="pvalue2" name="pvalue2" value="24.8" />
								<p style="margin-left: 0px; margin-right: 0px;">mW</p>
								<input type="button" id="button" onclick="buttonFunction5()"
									value="Set"
									style="width: 110px; margin-left: 7px; margin-right: 0px;" />
							</div>
						</form>
					</div>

					<div class="input-envir">
						<form>
							<p style="margin-left: 155px; margin-right: 68px;">Setup
								value</p>
							<p style="margin-left: -20px; margin-right: 68px;">Current
								value</p>
							<div id="loc1">

								<p>Temperature</p>
								<input type="text" id="tvalue" name="tvalue" value="23.0" />
								<p style="margin-left: -12px;">&#186;C</p>
								<input type="text" id="tvalue2" name="tvalue2" value="25.2" />
								<p style="margin-left: -12px;">&#186;C</p>
								<input type="button" id="button" onclick="buttonFunction6()"
									value="Set" style="width: 110px;" />
							</div>

							<div id="loc2">

								<p style="margin-right: 33px;">Humidity</p>
								<input type="text" id="hvalue" name="hvalue" value="0"
									style="margin-left: 10px; margin-right: 0px;" />
								<p>%</p>
								<input type="text" id="hvalue2" name="hvalue2" value="11"
									style="margin-left: 13px; margin-right: 0px;" />
								<p>%</p>
								<input type="button" id="button" onclick="buttonFunction7()"
									value="Set"
									style="width: 110px; margin-left: 13px; margin-right: 0px;" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="/js/scripts.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
				crossorigin="anonymous"></script>
			<script src="/js/datatables-simple-demo.js"></script>
		</form>
</body>

</html>