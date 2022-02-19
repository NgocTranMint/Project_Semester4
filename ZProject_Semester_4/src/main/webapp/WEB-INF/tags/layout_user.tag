<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" uri="http://mytags.vn"%>
<%@ attribute name="title" required="true" rtexprvalue="true"
	type="java.lang.String"%>
<%@ attribute name="content" fragment="true"%>


<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>${title }</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/user/images/logosite.png"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/user/images/logosite.png">

<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css">

<!-- Site CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/style.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/custom.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body class="host_version">



	<!-- LOADER -->
	<div id="preloader">
		<div class="loader-container">
			<div class="progress-br float shadow">
				<div class="progress__item"></div>
			</div>
		</div>
	</div>
	<!-- END LOADER -->

	<!-- Start header -->
	<header class="top-navbar">
		<mt:navbarusers />

	</header>
	<!-- End header -->

	<jsp:invoke fragment="content"></jsp:invoke>

	<div class="parallax section dbcolor">
		<div class="container">
			<div class="row logos">
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_01.png"
						alt="" class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_02.png"
						alt="" class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_03.png"
						alt="" class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_04.png"
						alt="" class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_05.png"
						alt="" class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/user/images/logo_06.png"
						alt="" class="img-repsonsive"></a>
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>About US</h3>
						</div>
						<p>Integer rutrum ligula eu dignissim laoreet. Pellentesque
							venenatis nibh sed tellus faucibus bibendum. Sed fermentum est
							vitae rhoncus molestie. Cum sociis natoque penatibus et magnis
							dis montes.</p>
						<div class="footer-right">
							<ul class="footer-links-soi">
								<li><a
									href="#"><i
										class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-github"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
							<!-- end links -->
						</div>
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>Information Link</h3>
						</div>
						<ul class="footer-links">
							<li><a href="#">Home</a></li>
							<li><a href="#">Pricing</a></li>
							<li><a href="#">About</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
						<!-- end links -->
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>Contact Details</h3>
						</div>

						<ul class="footer-links">
							<li><a href="mailto:#">appchateproject@gmail.com</a></li>
							<li><a href="#">www.onlinequiz.com</a></li>
							<li>Login Memory team 2021 Ho Chi Minh City Vietnam</li>
							<li>appchateproject@gmail.com</li>
							<li>+84 123456789</li>
						</ul>
						<!-- end links -->
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->

	<div class="copyrights">
		<div class="container">
			<div class="footer-distributed">
				<div class="footer-center">
					<p class="footer-company-name">
						All Rights Reserved. &copy; 2022 <a href="#">Login Memory Online Quiz</a> 
					</p>
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end copyrights -->

	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	
	<script
		src="${pageContext.request.contextPath}/resources/user/js/all.js"></script>
	<!-- ALL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/timeline.min.js"></script>
	<script>
		timeline(document.querySelectorAll('.timeline'), {
			forceVerticalMode : 700,
			mode : 'horizontal',
			verticalStartPosition : 'left',
			visibleItems : 4
		});
	</script>


</body>
</html>
