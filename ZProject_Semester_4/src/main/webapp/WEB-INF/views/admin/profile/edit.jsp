<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_admin title="Account">

	<jsp:attribute name="content">

<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#birthday").datepicker();
			$("#dob").datepicker();
		});
		
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Edit Information</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Account Page</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
		<div class="card">
	        <div class="card-header">
	          <h3 class="card-title">Information</h3>
	          <div class="card-tools">
	            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
	              <i class="fas fa-minus"></i>
	            </button>
	          </div>
	        </div>
		    <div class="card-body">
				<div class="table-responsive">
					<div class="table-wrapper">
						<s:form method="post" action="${pageContext.request.contextPath }/admin/profile/editProfile" modelAttribute="accountUsername" enctype="multipart/form-data">
									<div class="modal-body">
										<input type="hidden" value="${accountUsername.accountId }" name="id">					
										
										<div class="form-group">
											<label>FullName</label>
											<s:input path="fullname" type="text" class="form-control"/>
										</div>	
										<div class="form-group">
											<label>Email</label>
											<s:input path="email" type="email" class="form-control"/>
										</div>
											<div class="form-group">
											<label>Date of Birth</label>
											<s:input path="dob" id="birthday" class="form-control"/>
										</div>
										<div class="form-group">
											<label>Address</label>
											<s:textarea cols="5" rows="10" path="addr" type="text" class="form-control"/>
										</div>
										<div class="form-group">
											<label>Phone Number</label>
											<s:input path="phone" type="text" class="form-control"/>
										</div>	
										<!-- <div class="form-group">
											<label>Avatar</label>
											<input type="file" name="file" class="form-control"/>
										</div> -->
										<div class="modal-footer">
											<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
											<input type="submit" class="btn btn-success" value="save">
										</div>				
									</div>
								</s:form>
					</div>        
				</div>
	        </div>
       		<div class="card-footer"> Footer </div>
      	</div>
	</section>

	</jsp:attribute>
</mt:layout_admin>