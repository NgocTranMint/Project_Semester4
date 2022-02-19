<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" uri="http://mytags.vn"%>
<%@ attribute name="title" required="true" rtexprvalue="true"
	type="java.lang.String"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib prefix="ss"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title }</title>

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/admin/images/logosite.png"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/admin/images/logosite.png">


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
<!-- 
  add new   -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/style.css">

<!-- 
  add new   -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="${pageContext.request.contextPath}/resources/admin/images/logoquiz2.png"
				alt="AdminLTELogo" height="60" width="200">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ss:authorize access="hasRole('ROLE_USER_FACULTY')">

				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						data-widget="pushmenu" href="#" role="button"><i
							class="fas fa-bars"></i></a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="${pageContext.request.contextPath}/admin/dashboard/index"
						class="nav-link">Home</a></li>
					
				</ul>
			</ss:authorize>
			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item">
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <img
						src="${pageContext.request.contextPath}/assets/uploads/${sessionScope.account.avatar }"
						class="img-circle elevation-2"
						style="with: 30px; height: 30px; border-radius: 50%">
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"
						style="width: 350px; border-radius: 5%">
						<div align="center" style="padding-top: 25px;">
							<img
								src="${pageContext.request.contextPath}/assets/uploads/${sessionScope.account.avatar }"
								class="img-circle elevation-2"
								style="with: 85px; height: 85px; border-radius: 50%">
						</div>
						<br>
						<div align="center">
							<div>${sessionScope.account.fullname }</div>
							<div>${sessionScope.account.email }</div>
						</div>
						<!-- Message End -->
						<ss:authorize access="hasRole('ROLE_USER_FACULTY')">
							<div class="dropdown-divider"></div>
							<a
								href="${pageContext.request.contextPath}/user/profile/index?accountId=${sessionScope.account.accountId }"
								class="dropdown-item"> <!-- Message Start -->
								<div class="media">Profile</div> <!-- Message End -->
							</a>
							<div class="dropdown-divider"></div>
							<a href="${pageContext.request.contextPath}/user/payment/index"
								class="dropdown-item"> <!-- Message Start -->
								<div class="media">Payment</div> <!-- Message End -->
							</a>
						</ss:authorize>
						<ss:authorize access="hasRole('ROLE_ADMIN')">
							<div class="dropdown-divider"></div>
							<a
								href="${pageContext.request.contextPath}/admin/profile/index?accountId=${sessionScope.account.accountId }"
								class="dropdown-item"> <!-- Message Start -->
								<div class="media">Profile</div> <!-- Message End -->
							</a>
						</ss:authorize>
						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath}/user/account/logout"
							class="dropdown-item"> <!-- Message Start -->
							<div class="media">Logout</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<p class="dropdown-item dropdown-footer">Login Memory Team</p>
					</div></li>


			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<mt:sidebaradmins />

		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<jsp:invoke fragment="content"></jsp:invoke>


		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2022 <a
				href="https://adminlte.io">Login Memory</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 1.0
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/dist/js/pages/dashboard.js"></script>

	<!-- 
  add new   -->
	<!-- add custom js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/lib.js"></script>
	<!-- 
  add new   -->
</body>
</html>