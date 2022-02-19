<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="ss"
	uri="http://www.springframework.org/security/tags"%>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/plugins/summernote/summernote-bs4.min.css">

<style>
</style>

<!-- Main content -->
<section class="content">
	<div style="padding-top: 15%;" class="error-page">
		<h2 class="headline text-warning">404</h2>

		<div class="error-content">
			<h3>
				<i class="fas fa-exclamation-triangle text-warning"></i> Oops! Page
				not found.
			</h3>


			<ss:authorize access="hasRole('ROLE_ADMIN')">
				<p>
					We could not find the page you were looking for. Meanwhile, you may
					<a href="${pageContext.request.contextPath}/admin/dashboard">return
						to dashboard</a> or try using the search form.
				</p>
			</ss:authorize>
			<ss:authorize access="hasRole('ROLE_USER_FACULTY')">
				<p>
					We could not find the page you were looking for. Meanwhile, you may
					<a href="${pageContext.request.contextPath}/faculty/dashboard">return
						to dashboard</a> or try using the search form.
				</p>
			</ss:authorize>
			<ss:authorize access="hasRole('ROLE_USER_CANDIDATE')">
				<p>
					We could not find the page you were looking for. Meanwhile, you may
					<a href="${pageContext.request.contextPath}/user/home">return
						to dashboard</a> or try using the search form.
				</p>
			</ss:authorize>

			<form class="search-form">
				<div class="input-group">
					<input type="text" name="search" class="form-control"
						placeholder="Search">

					<div class="input-group-append">
						<button type="submit" name="submit" class="btn btn-warning">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<!-- /.input-group -->
			</form>
		</div>
		<!-- /.error-content -->
	</div>
	<!-- /.error-page -->
</section>
<!-- /.content -->