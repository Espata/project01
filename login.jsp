<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login page</title>
<style>
body {
	background-image: url(img/bg3.jpg);
	background-attachment: fixed;
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>
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
	<c:if test="${joinResult == 1 }">
		<script>
			alert("Sign up success!");
		</script>
	</c:if>
	
	<c:if test="${loginResult == -1 }">
		<script>
			alert("ID does not exist!");
		</script>
	</c:if>
	<c:if test="${loginResult == 0 }">
		<script>
			alert("Password incorrect!");
		</script>
	</c:if>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/login">Refractive index
			measurement system</a>
	</nav>
	<div class="col-lg-13">
		<div class="card shadow-lg border-0 rounded-lg mt-5">
			<div class="jumbotron" style="color: black;">
				<div class="card-header">
					<h3 class="text-center font-weight-light my-4">Login<c:out value="${joinResult}"></c:out></h3>
				</div>
				<div class="card-body">
					<form method="post" action="/login">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="ID"
								name="id" maxlength="20"> <br></br>
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="Password" name="pw" maxlength="20">
							<br></br>
						</div>
						<input type="submit" class="btn btn-primary form-control"
							value="Access">
					</form>
					<div class="card-footer text-center py-3">
						<div class="small">
							<a href="/join">Need an account? Sign up!</a>
						</div>
					</div>
				</div>
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
</body>
</html>
