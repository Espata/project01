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
		</div>
		</nav>
	</div>
	<section class="page-section picture" id="picture"
		style="padding-left: 80px; padding-top: 200px;">
		<!-- picture Grid Items-->
		<div class="row justify-content-center" style="width: 1100px">
			<!-- picture Item 1-->
			<div class="col-md-auto col-lg-4 mb-5">
				<a
					class="page-section-heading text-center text-uppercase text-secondary m-2 btn btn-default"
					href="/home/measure" role="button" style="left: 200px;">Measurement</a>
				<div class="picture-item mx-auto" data-bs-toggle="modal"
					data-bs-target="">
					<a href="/home/measure"><img class="img-fluid"
						src="/img/measure.png"></a>
				</div>
			</div>
			<!-- picture Item 2-->
			<div class="col-md-6 col-lg-4 mb-5">
				<a
					class="page-section-heading text-center text-uppercase text-secondary m-2 btn btn-default"
					href="/home/tables" role="button" style="left: 240px;">analysis</a>
				<div class="picture-item mx-auto" data-bs-toggle="modal"
					data-bs-target="">
					<a href="/home/tables"><img class="img-fluid" src="/img/analysis.png" alt="..." /></a>
				</div>
			</div>
			<!-- picture Item 3-->
			<div class="col-md-6 col-lg-4 mb-5">
				<a
					class="page-section-heading text-center text-uppercase text-secondary m-2 btn btn-default"
					href="/home/code/error" role="button" style="left: 240px;">code
					list</a>
				<div class="picture-item mx-auto" data-bs-toggle="modal"
					data-bs-target="">
					<a href="/home/code/error"><img class="img-fluid" src="/img/codelist.png" alt="..." /></a>
				</div>
			</div>
		</div>
	</section>
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