<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Email">

	<jsp:attribute name="content">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		
		function openDeleteModal(emailId) {
			$('#emailID').val(emailId);
		}
		function openEditModal(emailId) {
			$.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/admin/ajax/findemailbyid',
						data : {
							emailId : emailId
						},
						success : function(email) {
							$('#emailId').val(email.emailId);								
							$('#title').val(email.title);
							$('#emailUser').val(email.emailUser);						
							$('#fullname').val(email.fullname);			
							$('#phoneNumber').val(email.phoneNumber);
							$('#content').val(email.content);
							$('#replyContent').val(email.replyContent);
							$('#sendDate').val(email.sendDate);
							$('#replyDate').val(email.replyDate);
							if(email.checked){
								$('#checked').val('Yes');	
							}else{
								$('#checked').val('No');	
							}
							
						}
					});
		}
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Email Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Email Page</li>
            </ol>
          </div>
        </div>
      </div>
			<!-- /.container-fluid -->
    </section>
		  <!-- Main content -->
    <section class="content">

      <!-- Default box -->
		<div class="card">
	        <div class="card-header">
	          <h3 class="card-title">Manage List Emails</h3>
	
	          <div class="card-tools">
	            <button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
	              <i class="fas fa-minus"></i>
	            </button>
	           
	          </div>
	        </div>
	    <div class="card-body">          
		<div class="">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
				<form method="get" action="${pageContext.request.contextPath}/admin/email/search">
					<div class="row">
						<div class="col-sm-2">
							<h2>Manage <b>Emails</b></h2>
						</div>
						
						<div class="col-sm-7">
							<input type="text" class="form-control" placeholder="Email user..." name="keyword">
							
						</div>
						<div class="col-sm-1">
							<input type="submit" value="Search" class="btn btn-primary">
						</div>
						
						
					</div>
				</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th> <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=emailId">Email ID</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=emailUser">Email User</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=title">Title</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=phoneNumber">Phone Number</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=sendDate">Send Date</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=replyDate">Reply Date</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=checked">Checked</a></th>
							
						</tr>
					</thead>
					<tbody>
	
	      
	    			  <c:choose>
	        		<c:when test="${emails.size() > 0 }">
					<c:forEach var="email" items="${emails}">
					<c:if test="${email.checked == false}">
							<tr style="background: #c5d9ed;" onclick="window.location='${pageContext.request.contextPath }/admin/email/replyIndex?emailId=${email.emailId }';">
								
								<td width="100px"><strong>${email.emailId }</strong></td>
								<td><strong>${email.emailUser }</strong></td>
								<td><strong>${email.title }</strong></td>
								<td><strong>${email.phoneNumber }</strong></td>
								<td><strong><fmt:formatDate var="sendDate" value="${email.sendDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${sendDate }</strong></td>
								<td><strong><fmt:formatDate var="replyDate" value="${email.replyDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${replyDate }</strong></td>
								<td><strong>${email.checked ? "Yes" : "No" }</strong></td>
							</tr>
					</c:if>
						<c:if test="${email.checked == true}">
							<tr onclick="window.location='${pageContext.request.contextPath }/admin/email/replyIndex?emailId=${email.emailId }';">
								
								<td>${email.emailId }</td>
								<td>${email.emailUser }</td>
								<td>${email.title }</td>
								<td>${email.phoneNumber }</td>
								<td><strong><fmt:formatDate var="sendDate" value="${email.sendDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${sendDate }</strong></td>
								<td><strong><fmt:formatDate var="replyDate" value="${email.replyDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${replyDate }</strong></td>
								<td>${email.checked ? "Yes" : "No" }</td>
								
							</tr>
					</c:if>
						</c:forEach>
						  </c:when>
	        		<c:otherwise>
	            <tr align="center">
	                <td colspan="5">No Users available</td>
	            </tr>
	        </c:otherwise>
	    </c:choose>
					</tbody>
				</table>
				
				
	<div>
	
	    <c:if test="${emails.size() > 0 }">
	        <div class="panel-footer">
	 
			<select style="color: #566787;" name="pageSize"
													onchange="location = this.value;">
			 <option value="">PageSize</option>
			 <option value="${pageContext.request.contextPath}/admin/email/pagination?currentPage=1&pageSize=5&sort=${sort}">5</option>
			 <option value="${pageContext.request.contextPath}/admin/email/pagination?currentPage=1&pageSize=10&sort=${sort}">10</option>
			 <option value="${pageContext.request.contextPath}/admin/email/pagination?currentPage=1&pageSize=25&sort=${sort}">25</option>
			  <option value="${pageContext.request.contextPath}/admin/email/pagination?currentPage=1&pageSize=50&sort=${sort}">50</option>
			</select>
	
		&nbsp;&nbsp;
		<span>Showing <strong>${currentPage > 1 ? currentPage * pageSize - pageSize : 1}</strong> to <strong>${pageSize * currentPage}</strong> out of <b>${totalElements}</b> entries</span>
	         
	            <ul class="pagination">
	            			<li class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=1&pageSize=${pageSize}&sort=${sort}"
														class="page-link">First</a>
	                    </li>
	                    
	                     <li class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}"
														class="page-link">Previous</a>
	                    </li>
	                    
	                    
	                 <!--  // start number of page -->
	                 
	                    <!--   //  totalpage <= 5 -->
	          
	             
	                 <c:if test="${totalPages <= 5 && currentPage <= 5 }">
		                <c:forEach begin="0" end="${totalPages - 1}" var="page">
		                    <li
																class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a
																href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
																class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
		               
	                </c:if>
	              <!--   //  totalpage > 5 -->
	          
	                 <c:if test="${totalPages > 5 && currentPage <= 2 }">
		                <c:forEach begin="0" end="4" var="page">
		                    <li class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
																class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
	                </c:if>
	              
	                   <c:if test="${totalPages > 5 && currentPage >= 3 && currentPage != totalPages}">
	                  	                
			              	<c:forEach begin="${currentPage <= totalPages - 2 ? currentPage - 2 : currentPage - 3}"
															end="${currentPage - 1}" var="page1">
			                    <li class="page-item">
			                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${page1}&pageSize=${pageSize}&sort=${sort}"
																class="page-link">${page1}</a>
			                    </li>
			                </c:forEach>
		                   
		                 <li class="page-item active">
		                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${currentPage}</a>
		                    </li>
		               	  <c:forEach begin="${currentPage}" end="${currentPage <= totalPages - 2 ? currentPage + 1 : currentPage}"
															var="page2">
		                    <li class="${currentPage == page2 + 1 ? 'page-item active' : 'page-item' }">
		                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${page2 + 1}&pageSize=${pageSize}&sort=${sort}"
																class="page-link">${page2 + 1}</a>
		                    </li>
		                </c:forEach> 
	                </c:if>
	                
	                   <!--   //  the last page -->
	          
	             
	            		    <c:if test="${currentPage == totalPages && totalPages > 5}">
			                <c:forEach begin="${totalPages - 5 }" end="${totalPages - 1}" var="page">
			                    <li class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
			                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
																class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
	               		</c:if>
	                 
	                  <!--  // end number of page -->
	              
	                     <li class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}"
														class="page-link">Next</a>
	                    </li>
	                      <li class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/email/pagination?currentPage=${totalPages }&pageSize=${pageSize}&sort=${sort}"
														class="page-link">Last</a>
	                    </li>
	            </ul>
	        </div>
	    </c:if>
	    </div>
		</div>        
	</div>


<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<s:form method="post" modelAttribute="email"
										action="${pageContext.request.contextPath }/admin/email/create"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Add Email</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">					
					
									
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
												value="Cancel">
					<s:input type="submit" class="btn btn-success" value="save" path="" />
				</div>
			</s:form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<s:form method="post" modelAttribute="email"
										action="${pageContext.request.contextPath }/admin/email/update"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Email's Details </h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">		
				<div class="form-group">
						<label>EmailID</label>
						<s:input path="emailId" type="text" id="emailId"
													class="form-control" disabled="true" />
				
					</div>	
					<div class="form-group">
						<label>Title</label>
						<s:input path="title" type="text" id="title"
													class="form-control" disabled="true" />
				
					</div>		
					<div class="form-group">
						<label>EmailUser</label>
						<s:input path="emailUser" type="text" id="emailUser"
													class="form-control" disabled="true" />
				
					</div>
				
					<div class="form-group">
						<label>Fullname</label>
						<s:input path="fullname" type="text" id="fullname"
													class="form-control" disabled="true" />
					
					</div>	
						<div class="form-group">
						<label>PhoneNumber</label>
						<s:input path="phoneNumber" type="text" id="phoneNumber"
													class="form-control" disabled="true" />
					
					</div>		<div class="form-group">
						<label>Content</label>
						<s:textarea cols="5" rows="10" path="content" type="text" id="content"
													class="form-control" disabled="true" />
					
					</div>		<div class="form-group">
						<label>ReplyContent</label>
						<s:textarea cols="5" rows="10" path="replyContent" type="text" id="replyContent"
													class="form-control" required="required" />
					
					</div>	
							<div class="form-group">
						<label>SendDate</label>
						<s:input path="sendDate" type="text" id="sendDate"
													class="form-control" disabled="true" />
					
					</div>		
							<div class="form-group">
						<label>ReplyDate</label>
						<s:input path="replyDate" type="text" id="replyDate"
													class="form-control" disabled="true" />
					
					</div>	
						<div class="form-group">
						<label>Checked</label>
						<s:input path="checked" type="text" id="checked"
													class="form-control" disabled="true" />
					
							
				</div></div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
												value="Cancel">
					<s:input type="submit" class="btn btn-success" value="save" path="" />
				</div>
			</s:form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="get"
										action="${pageContext.request.contextPath }/admin/email/delete">
				<div class="modal-header">				
					<h4 class="modal-title">Delete email</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning">
											<small>This action cannot be undone.</small>
										</p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
												value="Cancel">
											<input type="hidden" name="emailID" id="emailID">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          Footer
        </div>
        <!-- /.card-footer-->
      	</div>

		</div>
	</section>

	</jsp:attribute>
</mt:layout_admin>