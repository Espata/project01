<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login page</title>
<style>
body {
	background-image: url(img/bg2.jpg);
	background-attachment: fixed;
	background-size: 100% 100%;
	background-repeat: no-repeat;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-redius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.container {
	margin-top: 80px;
	min-height: 50vh;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-redius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/join.js"></script>
</head>
<body class="sb-nav-fixed">
	<c:if test="${joinResult == 0}">
		<script>
			alert("ID already exist");
		</script>
	</c:if>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/login">Refractive index
			measurement system</a>
	</nav>
	<div class="container" style="width: 674px;">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-0">
				<h4 class="mb-3 text-center">Sign up</h4>
				<form action=/join method=post class="validation-form"
					name="jointable" onsubmit="return formCheck()" novalidate>
					<div class="mb-3">
						<label for="name"></label> <input type="text" class="form-control"
							id="name" name="name" placeholder="Name" required>
					</div>

					<div class="mb-3">
						<label for="id"></label> <input type="text" class="form-control"
							id="id" name="id" placeholder="ID" required>
					</div>

					<div class="mb-3">
						<label for="passwd"></label> <input type="password"
							class="form-control" id="pw" name="pw" placeholder="Password"
							required>
					</div>

					<div class="mb-3">
						<label for="passwd"></label> <input type="password"
							class="form-control" id="pw2" name="pw2" onchange="pwChk()"
							placeholder="Confirm" required>
					</div>

					<span id="checkpw"></span>

					<div class="mb-3">
						<label for="email"></label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="you@example.com" required>
					</div>

					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							name="agreement" id="aggrement" required> <label
							class="custom-control-label" for="aggrement">Personal
							Information Collection and Usage Agreement</label>
					</div>

					<div class="d-grid gap-4 col-6 mx-auto mt-3">
						<button class="btn btn-outline-primary btn-lg btn-block "
							type="submit">SUBMIT</button>
						<button class="btn btn-outline-warning btn-lg btn-block "
							type="reset">RESET</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
