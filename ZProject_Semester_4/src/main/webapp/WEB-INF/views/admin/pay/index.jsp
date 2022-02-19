<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Pay">

	<jsp:attribute name="content">
<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		function openDeleteModal(payId) {
			$('#payID').val(payId);
		}
		function openEditModal(payId) {
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/admin/ajax/findpaybyid',
						data : {
							payId : payId
						},
						success : function(pay) {
							$('#payId').val(pay.payId);
							$('#accountIdd').val(pay.accountId);
							$('#usernamee').val(pay.username);
							$('#paymentt').val(pay.payment);
							$('#titlee').val(pay.title);
							$('#feee').val(pay.fee);
							$('#datePaidd').val(pay.datePaid); 
							
							$('#payStatuss').val(pay.payStatus);
						}
					});
		}
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Pay Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Pay Page</li>
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
	          <h3 class="card-title">Manage List Pays</h3>
	
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
	    <div class="card-body">          
		<div class="">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
				<form method="get" action="${pageContext.request.contextPath}/admin/pay/search">
					<div class="row">
						<div class="col-sm-2">
							<h2>Manage <b>Pays</b>
											</h2>
						</div>
						
						<div class="col-sm-7">
							<input type="text" class="form-control" placeholder="Username..." name="keyword">
							
						</div>
						<div class="col-sm-1">
							<input type="submit" value="Search" class="btn btn-primary">
						</div>
						
						<div class="col-sm-2">
										
						</div>
					</div>
				</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>
								Serial
							</th>
							<th> <a
												href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=payId">Pay ID</a></th>
							<th><a
												href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=account.username">Username</a></th>
							<th> <a
												href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=payment">Payment</a></th>
													<th> <a
												href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=title">Title</a></th>
													<th> <a
												href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=fee">Fee</a></th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
	
	      
	    			  <c:choose>
	    			  
	        <c:when test="${pays.size() > 0 }">
					<c:forEach var="pay" items="${pays}" >
						<tr>
							<td>
								
							</td>
							<td>${pay.payId }</td>
							<td>${pay.account.username }</td>
							<td>${pay.payment }</td>
							<td>${pay.title }</td>
							<td>${pay.fee }</td>
							
							<td>
								<a href="#editEmployeeModal" id="${pay.payId }" onclick="openEditModal(id);" class="edit" data-toggle="modal">
								<i class="material-icons" data-toggle="tooltip" title="Detail">&#xE88E;</i></a>
							</td>
						</tr>
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
	
	    <c:if test="${pays.size() > 0 }">
	        <div class="panel-footer">
	 
			<select style="color: #566787;" name="pageSize"
												onchange="location = this.value;">
			 <option value="">PageSize</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=1&pageSize=5&sort=${sort}">5</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=1&pageSize=10&sort=${sort}">10</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=1&pageSize=25&sort=${sort}">25</option>
			  <option
													value="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=1&pageSize=50&sort=${sort}">50</option>
			</select>
	
		&nbsp;&nbsp;
		<span>Showing <strong>${currentPage > 1 ? currentPage * pageSize - pageSize : 1}</strong> to <strong>${pageSize * currentPage}</strong> out of <b>${totalElements}</b> entries</span>
	         
	            <ul class="pagination">
	            			<li
													class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=1&pageSize=${pageSize}&sort=${sort}"
													class="page-link">First</a>
	                    </li>
	                    
	                     <li
													class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}"
													class="page-link">Previous</a>
	                    </li>
	                    
	                    
	                 <!--  // start number of page -->
	                 
	                    <!--   //  totalpage <= 5 -->
	          
	             
	                 <c:if test="${totalPages <= 5 && currentPage <= 5 }">
		                <c:forEach begin="0" end="${totalPages - 1}"
														var="page">
		                    <li
															class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a
															href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
		               
	                </c:if>
	              <!--   //  totalpage > 5 -->
	          
	                 <c:if test="${totalPages > 5 && currentPage <= 2 }">
		                <c:forEach begin="0" end="4" var="page">
		                    <li
															class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a
															href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
	                </c:if>
	              
	                   <c:if
													test="${totalPages > 5 && currentPage >= 3 && currentPage != totalPages}">
	                  	                
			              	<c:forEach
														begin="${currentPage <= totalPages - 2 ? currentPage - 2 : currentPage - 3}"
														end="${currentPage - 1}" var="page1">
			                    <li class="page-item">
			                        <a
															href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${page1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page1}</a>
			                    </li>
			                </c:forEach>
		                   
		                 <li class="page-item active">
		                        <a
														href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=${sort}"
														class="page-link">${currentPage}</a>
		                    </li>
		               	  <c:forEach begin="${currentPage}"
														end="${currentPage <= totalPages - 2 ? currentPage + 1 : currentPage}"
														var="page2">
		                    <li
															class="${currentPage == page2 + 1 ? 'page-item active' : 'page-item' }">
		                        <a
															href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${page2 + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page2 + 1}</a>
		                    </li>
		                </c:forEach> 
	                </c:if>
	                
	                   <!--   //  the last page -->
	          
	             
	            		    <c:if
													test="${currentPage == totalPages && totalPages > 5}">
			                <c:forEach begin="${totalPages - 5 }"
														end="${totalPages - 1}" var="page">
			                    <li
															class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
			                        <a
															href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
	               		</c:if>
	                 
	                  <!--  // end number of page -->
	              
	                     <li
													class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}"
													class="page-link">Next</a>
	                    </li>
	                      <li
													class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pay/pagination?currentPage=${totalPages }&pageSize=${pageSize}&sort=${sort}"
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
		
			<s:form method="post" modelAttribute="pay"
										action="${pageContext.request.contextPath }/admin/pay/create"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Add pay</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">					
					<%-- <div class="form-group">
					<span style="color: red;">${msg==""?"": msg }</span> <br />
						<label>pay-Name</label>
						<s:input path="payName" type="text" class="form-control"
													required="required" />
				
					</div>
					<div class="form-group">
						<label>Description</label>
						<s:input path="description" type="text" class="form-control"
													required="required" />
					
					</div> --%>
					
									
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
		<s:form method="post" modelAttribute="pay"
										action="${pageContext.request.contextPath }/admin/pay/update"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Pay's Details </h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">		
				<div class="form-group">
						<label>payID</label>
						<s:input path="payId" type="text" id="payId" class="form-control"
													disabled="true" />
				
					</div>	
					<div class="form-group">
						<label>accountID</label>
						<s:input path="account.accountId" type="text" id="accountIdd"
													class="form-control" disabled="true" />
				
					</div>		
					<div class="form-group">
						<label>Username</label>
						<s:input path="account.username" type="text" id="usernamee"
													class="form-control" disabled="true" required="required" />
				
					</div>
				
					<div class="form-group">
						<label>Payment</label>
						<s:input path="payment" type="text" id="paymentt"
													class="form-control" required="required" />
					
					</div>	
						<div class="form-group">
						<label>Title</label>
						<s:input path="title" type="text" id="titlee" class="form-control"
													required="required" />
					
					</div>		<div class="form-group">
						<label>Fee</label>
						<s:input path="fee" type="text" id="feee" class="form-control"
													required="required" />
					
					</div>		<div class="form-group">
						<label>DatePaid</label>
						<s:input path="datePaid" type="text" id="datePaidd"
													class="form-control" required="required" />
					
					</div>	
							<div class="form-group">
						<label>PayStatus</label>
						<s:input path="payStatus" type="text" id="payStatuss"
													class="form-control" required="required" />
					
					</div>		
									
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
												value="Cancel">
					
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
										action="${pageContext.request.contextPath }/admin/pay/delete">
				<div class="modal-header">				
					<h4 class="modal-title">Delete pay</h4>
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
											<input type="hidden" name="payID" id="payID">
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