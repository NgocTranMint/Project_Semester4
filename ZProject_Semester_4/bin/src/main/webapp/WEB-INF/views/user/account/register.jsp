<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<h3>Register</h3>

	<s:form method="post" modelAttribute="account"
		action="${pageContext.request.contextPath }/user/account/register">

		<table>
			<tr>
				<td>Username</td>
				<td><s:input path="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><s:input path="password" /></td>
			</tr>
			<tr>
				<td>Fullname</td>
				<td><s:input path="fullName" /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><s:checkbox path="status" /></td>
			</tr>
			<tr>
				<td>Role</td>
				<td><c:forEach var="role" items="${roles }">

						<input type="checkbox" name="role" value="${role.roleId }"> ${role.roleName }
						<br>
					</c:forEach></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>

		<br>

		<a href="${pageContext.request.contextPath }/user/account/login">Login</a>

	</s:form>
</body>
</html>