<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Pack">

	<jsp:attribute name="content">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		function openDeleteModal(packId) {
			$('#packID').val(packId);
		}
		function openEditModal(packId) {
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/admin/ajax/findpackbyid',
						data : {
							packId : packId
						},
						success : function(pack) {
							$('#packId').val(pack.packId);
							$('#titlee').val(pack.title);
							$('#expiryy').val(pack.expiry);
							$('#feee').val(pack.fee);
							$('#descriptionn').val(pack.description);
							$('#statuss').val(pack.status);

						}
					});
		}
		
			function getSwitch(packId){
				$.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/admin/ajax/checkStatusPack',
						data : {
							packId: packId
						},
						success: function(pack) {
							
						}
				 });
			}
		
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Pack Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Pack Page</li>
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
	          <h3 class="card-title">Manage List Packs</h3>
	
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
					<div class="row">
						<div class="col-sm-6">
							<h2>Manage <b>Packs</b>
											</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addEmployeeModal" class="btn btn-success"
												data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New pack</span></a>
												
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th> <a href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=packId">Pack ID</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=title">Title</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=expiry">Expiry</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=fee">Fee</a></th>
							<th> <a href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=description">Description</a></th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
	
	      
	    			  <c:choose>
	        <c:when test="${packs.size() > 0 }">
					<c:forEach var="pack" items="${packs}" varStatus="i">
						<tr>
							<td width="100px">${pack.packId }</td>
							<td>${pack.title }</td>
							<td>${pack.expiry }</td>
							<td>${pack.fee }</td>
							<td>${pack.description }</td>
							<td>
								<c:if test="${pack.status == true }">
									<div class="row result">
										<div class="custom-control custom-switch col-3">
										  <input type="checkbox" class="custom-control-input switch-toggle" id="customSwitches_${i.index+1 }" checked="checked" name="${pack.packId }" onchange="getSwitch(name);">
										  <label class="custom-control-label switch-toggle" for="customSwitches_${i.index+1 }"></label>
										</div>
										<div class="col-1">
											<div style="background: #31a24c; border-radius: 50%; height: 1em; width: 1em;"></div>
										</div>
										<div class="col-8">
											<span>Active</span>
										</div>
									</div>
								</c:if>
								<c:if test="${pack.status == false }">
									<div class="row result">
										<div class="custom-control custom-switch col-3">
										  <input type="checkbox" class="custom-control-input switch-toggle" id="customSwitches_${i.index+1 }" name="${pack.packId }" onchange="getSwitch(name);">
										  <label class="custom-control-label switch-toggle" for="customSwitches_${i.index+1 }"></label>
										</div>
										<div class="col-1">
											<div style="background: gray; border-radius: 50%; height: 1em; width: 1em;"></div>
										</div>
										<div class="col-8">
											<span>Unactive</span>
										</div>
									</div>
								</c:if>
							</td>
							<td>
								<a href="#editEmployeeModal" id="${pack.packId }"
															onclick="openEditModal(id);" class="edit"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Edit">&#xE254;</i></a>
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
	
	    <c:if test="${packs.size() > 0 }">
	        <div class="panel-footer">
	 
			<select style="color: #566787;" name="pageSize"
												onchange="location = this.value;">
			 <option value="">PageSize</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=1&pageSize=5&sort=${sort}">5</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=1&pageSize=10&sort=${sort}">10</option>
			 <option
													value="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=1&pageSize=25&sort=${sort}">25</option>
			  <option
													value="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=1&pageSize=50&sort=${sort}">50</option>
			</select>
	
		&nbsp;&nbsp;
		<span>Showing <strong>${currentPage > 1 ? currentPage * pageSize - pageSize : 1}</strong> to <strong>${pageSize * currentPage}</strong> out of <b>${totalElements}</b> entries</span>
	         
	            <ul class="pagination">
	            			<li
													class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=1&pageSize=${pageSize}&sort=${sort}"
													class="page-link">First</a>
	                    </li>
	                    
	                     <li
													class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}"
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
															href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
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
															href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
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
															href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${page1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page1}</a>
			                    </li>
			                </c:forEach>
		                   
		                 <li class="page-item active">
		                        <a
														href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=${sort}"
														class="page-link">${currentPage}</a>
		                    </li>
		               	  <c:forEach begin="${currentPage}"
														end="${currentPage <= totalPages - 2 ? currentPage + 1 : currentPage}"
														var="page2">
		                    <li
															class="${currentPage == page2 + 1 ? 'page-item active' : 'page-item' }">
		                        <a
															href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${page2 + 1}&pageSize=${pageSize}&sort=${sort}"
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
															href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
	               		</c:if>
	                 
	                  <!--  // end number of page -->
	              
	                     <li
													class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}"
													class="page-link">Next</a>
	                    </li>
	                      <li
													class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
													href="${pageContext.request.contextPath}/admin/pack/pagination?currentPage=${totalPages }&pageSize=${pageSize}&sort=${sort}"
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
		
			<s:form method="post" modelAttribute="pack"
										action="${pageContext.request.contextPath }/admin/pack/create"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Add Pack</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">					
					<div class="form-group">
					<span style="color: red;">${msg==""?"": msg }</span> <br />
						
					</div>
						<div class="form-group">
						<label>Title</label>
						<s:input path="title" type="text" class="form-control"
													required="required" />					
					</div>
						<div class="form-group">
						<label>Expiry ( Day )</label>
						<s:input path="expiry" type="text" class="form-control"
													required="required" />					
					</div>
						<div class="form-group">
						<label>Fee</label>
						<s:input path="fee" type="text" class="form-control"
													required="required" />					
					</div>
						<div class="form-group">
						<label>Description</label>
						<s:input path="description" type="text" class="form-control"
													required="required" />					
					</div>													
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
		<s:form method="post" modelAttribute="pack"
										action="${pageContext.request.contextPath }/admin/pack/update"
										enctype="multipart/form-data">
				
				<div class="modal-header">	
									
					<h4 class="modal-title">Pack's Details </h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>											
				</div>
				<div class="modal-body">		
				<div class="form-group">
						<label>packID</label>
						<input name="packId" type="text" id="packId" class="form-control"
													readonly="readonly" />				
					</div>	
					<div class="form-group">
						<label>Title</label>
						<input name="title" type="text" id="titlee" class="form-control"
													readonly="readonly" />
				
					</div>		
					<div class="form-group">
						<label>Expiry</label>
						<s:input path="expiry" type="text" id="expiryy"
													class="form-control" />
				
					</div>
				
					<div class="form-group">
						<label>Fee</label>
						<s:input path="fee" type="text" id="feee" class="form-control" />					
					</div>	
						<div class="form-group">
						<label>Description</label>
						<s:input path="description" type="text" id="descriptionn"
													class="form-control" />						</div>								
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
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="get"
										action="${pageContext.request.contextPath }/admin/pack/delete">
				<div class="modal-header">				
					<h4 class="modal-title">Delete Pack</h4>
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
											<input type="hidden" name="packID" id="packID">
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