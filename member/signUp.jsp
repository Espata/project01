<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/joinPage.js"></script>

</head>
<body onload="reset()">
	<c:if test="${joinResult == 0 }">
		<script>
			alert("ID already exist");
		</script>
	</c:if><%=request.getParameter("joinResult")%>
	<form action="/join" method="post" name="signup"
		onsubmit="return formCheck()">
		<input type="text" name="id" autocomplete="off" placeholder="ID" /> <input
			type="hidden" name="idDuplication" value="idUncheck" /> <br></br> <input
			type="password" name="pw" id="pw" placeholder="Password"
			onchange="pwChk()" /><br></br> <input type="password" name="pw2"
			id="pw2" placeholder="Password Check" onchange="pwChk()" />&nbsp;<span
			id="checkpw"></span><br></br> <input type="text" name="name"
			autocomplete="off" placeholder="Name" /><br></br> <input
			type="email" name="email" placeholder="E-mail" /><br></br> <input
			type="submit" value="singup" id="singup" /><br></br>
	</form>

</body>
</html>