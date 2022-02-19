
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

	<s:authorize access="hasRole('ROLE_ADMIN')">
<!-- Brand Logo -->
<a href="${pageContext.request.contextPath}/admin/dashboard"
	class="brand-link"> <img
	src="${pageContext.request.contextPath}/resources/admin/images/logoquiz2.png"
	alt="AdminLTE Logo" width="100%"> <span class="brand-text font-weight-light"></span>
</a>

<!-- Sidebar -->
<div class="sidebar">
	<!-- Sidebar user panel (optional) -->
	<div class="user-panel mt-3 pb-3 mb-3 d-flex">
		<%-- <div class="image">
			<img src="${pageContext.request.contextPath}/assets/uploads/${accountUsername.avatar }"
				class="img-circle elevation-2" alt="User Image">
		</div>
		<div class="info">
			<a
				href="${pageContext.request.contextPath}/admin/profile/index?accountId=${accountUsername.accountId }"
				class="d-block">${accountUsername.fullname }</a>
		</div> --%>
	</div>
	</s:authorize>
	
<s:authorize access="hasRole('ROLE_USER_FACULTY')">
<!-- Brand Logo -->
<a href="${pageContext.request.contextPath}/faculty/dashboard"
	class="brand-link"> <img
	src="${pageContext.request.contextPath}/resources/admin/images/logoquiz2.png"
	alt="AdminLTE Logo" width="100%"> <span class="brand-text font-weight-light"></span>
</a>

<!-- Sidebar -->
<div class="sidebar">
	<!-- Sidebar user panel (optional) -->
	<div class="user-panel mt-3 pb-3 mb-3 d-flex">
		
	</div>
	</s:authorize>
	
	<!-- SidebarSearch Form -->
	<div class="form-inline">
		<div class="input-group" data-widget="sidebar-search">
			<input class="form-control form-control-sidebar" type="search"
				placeholder="Search" aria-label="Search">
			<div class="input-group-append">
				<button class="btn btn-sidebar">
					<i class="fas fa-search fa-fw"></i>
				</button>
			</div>
		</div>
	</div>

	<!-- Sidebar Menu -->
	<nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column"
			data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
			<s:authorize access="hasRole('ROLE_ADMIN')">

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/account"
					class="nav-link"> <i class="nav-icon fas fa-user"></i>
						<p>
							Accounts <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/role"
					class="nav-link"> <i class="nav-icon fas fa-user-tag"></i>
						<p>
							Roles <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/email"
					class="nav-link"> <i class="nav-icon far fa-envelope"></i>
						<p>
							Emails <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/pay"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Pays <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/salary"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Salarys <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/pack"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Packs <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/category"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Categories <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/quiz"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Quizzes <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/comment"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Comment <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/rating"
					class="nav-link"> <i class="nav-icon fas fa-dollar-sign"></i>
						<p>
							Rating <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
			</s:authorize>

			<s:authorize access="hasRole('ROLE_USER_FACULTY')">

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/faculty/quiz"
					class="nav-link"> <i class="nav-icon fas fa-user"></i>
						<p>
							Quizzes - Faculty <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/faculty/salary"
					class="nav-link"> <i class="nav-icon fas fa-user"></i>
						<p>
							Salary - Faculty <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
			</s:authorize>
		</ul>
	</nav>
	<!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->
