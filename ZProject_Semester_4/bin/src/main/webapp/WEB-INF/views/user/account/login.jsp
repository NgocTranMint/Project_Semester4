<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<span style="color: red;">${msg }</span>
	<h3>Login</h3>

	<form method="post" action="${pageContext.request.contextPath }/user/account/process-login">
	
	Username: <input type="text" name="username">
	<br>
	Password: <input type="password" name="password">
	<br>
	<input type="submit" value="login">
	<br>
	<a href="${pageContext.request.contextPath }/user/account/register">Register</a>
	
	</form>
</body>
</html>