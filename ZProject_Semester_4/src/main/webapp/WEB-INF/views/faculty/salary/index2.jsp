<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Quiz">

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
            <h1>Quiz Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Quiz Page</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <section class="content">
		<div class="card">
	        <div class="card-header">
	          <h3 class="card-title">Manage List Quizzes</h3>
	
	          <div class="card-tools">
	            <button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
	              <i class="fas fa-minus"></i>
	            </button>
	           <!--  <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
	              <i class="fas fa-times"></i>
	            </button> -->
	          </div>
	        </div>
	    </div>
	    <div class="card-body">          
			<div class="">
				<div class="table-responsive">
					<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-6">
								<h2>Manage <b>Quizzes</b></h2>
							</div>
							<div class="col-sm-6">
								<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New quiz</span></a>
								<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
							</div>
						</div>
					</div>
					<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>
										<span class="custom-checkbox">
											<input type="checkbox" id="selectAll">
											<label for="selectAll"></label>
										</span>
									</th>
									<th>Quiz ID</th>
									<th>>Username</th>
									<th> Title</th>
									<th> Description</th>
									<th> Fee</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="quiz" items="${quizs }">
									<tr>
									<td>
										<span class="custom-checkbox">
											<input type="checkbox" id="checkbox1" name="options[]" value="1">
											<label for="checkbox1"></label>
										</span>
									</td>
									<td>${quiz.quizId }</td>
									<td>${quiz.account.fullname }</td>
									<td>${quiz.title }</td>
									<td>${quiz.description }</td>
									<td>${quiz.fee }</td>
									
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