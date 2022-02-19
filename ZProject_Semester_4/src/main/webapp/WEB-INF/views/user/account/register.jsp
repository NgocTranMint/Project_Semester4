<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Registration Page</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/dist/css/adminlte.min.css">
	<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script>
	$(function() {
		$("#dob").datepicker();
	});
</script>
</head>

<body class="hold-transition register-page">
<span style="color: red;">${msg }</span>
	<div class="register-box">
		<div class="register-logo">
			<a href="../../index2.html"><b>Admin</b>LTE</a>
		</div>

		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">Register a new membership</p>

				<s:form method="post" modelAttribute="account" enctype="multipart/form-data"
		action="${pageContext.request.contextPath }/user/account/register">
					<div class="input-group mb-3">
						<s:input path="username"
							class="form-control" placeholder="User name"/>
							<s:errors path="username" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:password path="password"
							class="form-control" placeholder="Password"/>
							<s:errors path="password" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input name="repassword" type="password" class="form-control"
							placeholder="Retype password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:input path="fullname" class="form-control" placeholder="Full name"/>
						<s:errors path="fullname" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-signature"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:input path="addr" class="form-control" placeholder="Address"/>
						<s:errors path="addr" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-address-book"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:radiobutton value="true" path="gender" class="form-control" />
						<div class="input-group-append">
							<div class="input-group-radio">
								<span class="fas fa-male">_Male </span>
							</div>
						</div>
						<s:radiobutton value="false" path="gender" class="form-control"/>
						<div class="input-group-append">
							<div class="input-group-radio">
								<span class="fas fa-female">_Female</span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:input path="dob" class="form-control"  placeholder="Date of Birth"/>
						<s:errors path="dob" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-birthday-cake"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:input path="phone" class="form-control" placeholder="Phone"/>
						<s:errors path="phone" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-phone"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<s:input path="email" class="form-control" placeholder="Email"/>
						<s:errors path="email" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input class="form-control" type="file" name="file" placeholder="Avatar">
						<s:errors path="avatar" cssClass="form-control" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user-tie"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms"
									value="true"> <label for="agreeTerms"> I agree
									to the <a href="#">terms</a>
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
					
				<input type="hidden" name="role" value="2">
				
					<input type="hidden" name="status" value="true"/>
				</s:form>

				<div class="social-auth-links text-center">
					<p>- OR -</p>
					<a href="#" class="btn btn-block btn-primary"> <i
						class="fab fa-facebook mr-2"></i> Sign up using Facebook
					</a> <a href="${pageContext.request.contextPath }/user/account/signin-google" class="btn btn-block btn-danger"> <i
						class="fab fa-google-plus mr-2"></i> Sign up using Google+
					</a>
				</div>

				<a href="login.html" class="text-center">I already have a
					membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script> -->
	<!-- Bootstrap 4 -->
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/resources/admin/dist/js/adminlte.min.js"></script>
</body>
</html>
