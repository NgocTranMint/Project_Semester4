<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact</title>
</head>
<body>
	<h1>Contact Us</h1>
	<s:form method="post" modelAttribute="email" action="${pageContext.request.contextPath }/user/contact/sendContact">
		<table>
			<tr>
				<td>Title: </td>
				<td>
					<s:input path="title"/>
				</td>
			</tr>
			<tr>
				<td>Email: </td>
				<td>
					<s:input path="emailUser"/>
				</td>
			</tr>
			<tr>
				<td>Fullname: </td>
				<td>
					<s:input path="fullname"/>
				</td>
			</tr>
			<tr>
				<td>Phone number: </td>
				<td>
					<s:input path="phoneNumber"/>
				</td>
			</tr>
			<tr>
				<td>Content: </td>
				<td>
					<s:textarea path="content"/>
				</td>
			</tr>
			<tr>
				<td>&nbsp; </td>
				<td>
					<input type="submit" value="Send">
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>