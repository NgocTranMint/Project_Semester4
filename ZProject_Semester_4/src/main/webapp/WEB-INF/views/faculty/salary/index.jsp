<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Salary">

	<jsp:attribute name="content">

<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Salary Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Salary Page</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <section class="content">
		<div class="card">
	      
	    </div>
	    <div class="card-body">          
			<div class="">
				<div class="table-responsive">
					<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-6">
								<h2>Manage <b>Salary</b></h2>
							</div>
							
						</div>
					</div>
					<table class="table table-striped table-hover">
							<thead>
								<tr>
									
									<th></th>
									<th> Income</th>
									<th> Date</th>
									<th> Total Click In Month</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="salary" items="${salarys }" varStatus="i">
									<tr>
									
									<td>${i.index + 1 }</td>
									<td> <span class="text-primary">${salary.salary } $</span></td>
									<td><fmt:formatDate var="createDate" value="${salary.createDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${createDate }
								</td>
									<td>${salary.totalClickQuizMonth }</td>
									
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>	
			</div>	
		</div>
		</section>

	</jsp:attribute>
</mt:layout_admin>