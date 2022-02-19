<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Account">

	<jsp:attribute name="content">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#birthday").datepicker();
			$("#dob").datepicker();
		});
		
		function openEditModal(accountId) {
			$.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/admin/ajax/findaccountbyid',
						data : {
							accountId : accountId
						},
						success : function(account) {
							$('#accId').val(account.accountId);
							$('#accUsername').val(account.username);
							$('#accFulllname').val(account.fullname);
							$('#accEmail').val(account.email);
							$("#dob").val($.datepicker.formatDate('mm/dd/yy', new Date()));
							$('#accAddress').val(account.addr);
							var $radios = $('input:radio[name=gender]');
							if (account.gender) {
								$radios.filter('[value=true]').prop('checked',
										true);
							} else {
								$radios.filter('[value=false]').prop('checked',
										true);
							}
							$('#accPhone').val(account.phone);
							$('#createDatee').val(account.createDate);
							$('#accAvatar').attr("src", "/assets/uploads/" + account.avatar);
						}
					});
		}
		
		function getSwitch(id,accountId){
			var id = id;
			var resultId = 'result_' + id.replace('customSwitches_', '');
			 $.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath }/admin/ajax/checkStatusAccount',
					data : {
						accountId: accountId
					},
					success: function(account) {
						
						var result = '';
						if(account.status){
							result += '<div class="custom-control custom-switch col-3">';
							result += '<input type="checkbox" class="custom-control-input switch-toggle" id="' + id + '" checked="checked" name="${account.accountId }" onchange="getSwitch(name);">';
							result += '<label class="custom-control-label switch-toggle" for="' + id + '"></label></div>';
							result +=		'<div class="col-1">'
							result +=			'<div style="background: #31a24c; border-radius: 50%; height: 1em; width: 1em;"></div></div>'
							result +=		'<div class="col-8"><span>Active now</span></div>';
							$('#'+resultId).html(result);
						} else {
							result += '<div class="custom-control custom-switch col-3">';
							result += '<input type="checkbox" class="custom-control-input switch-toggle" id="' + id + '" name="${account.accountId }" onchange="getSwitch(name);">';
							result += '<label class="custom-control-label switch-toggle" for="' + id + '"></label></div>';
							result +=		'<div class="col-1">'
							result +=			'<div style="background: gray; border-radius: 50%; height: 1em; width: 1em;"></div></div>'
							result +=		'<div class="col-8"><span>Unactive</span></div>';
							$('#'+resultId).html(result);
						}
						location.reload();
					}
			 });
		}
		
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Account Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Account Page</li>
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
	          <h3 class="card-title">Manage List Accounts</h3>
	
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
				<form method="get" action="${pageContext.request.contextPath}/admin/account/search">
					<div class="row">
						<div class="col-sm-2">
							<h2>Manage <b>Accounts</b>
											</h2>
						</div>
						
						<div class="col-sm-7">
							<input type="text" class="form-control" placeholder="Fullname..." name="keyword">
							
						</div>
						<div class="col-sm-1">
							<input type="submit" value="Search" class="btn btn-primary">
						</div>
						
						<div class="col-sm-2">
							<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
							<i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
						</div>
					</div>
				</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th> <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=accountId">Account ID</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=username">Username</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=fullname">Fullname</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=email">Email</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=dob">Date of Birth</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=gender">Gender</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=roles">Role</a></th>
							<th><a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=status">Status</a></th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
	
	      
	    			  <c:choose>
	        <c:when test="${accounts.size() > 0 }">
					<c:forEach var="account" items="${accounts}" varStatus="i">
						<tr>
							<td width="100px">${account.accountId }</td>
							<td>${account.username }</td>
							<td>${account.fullname }</td>
							<td>${account.email }</td>
							<td>
								<fmt:formatDate var="dob" value="${account.dob }" pattern="dd/MM/yyyy" />
								${dob }
							</td>
							<td>${account.gender ? "Male" : "Female" }</td>
							<td>
								<c:forEach var="role" items="${account.roles }">
									${role.roleName } <br/>
								</c:forEach>
							</td>
							<td>
								<c:if test="${account.status == true }">
									<div class="row" id="result_${i.index +1 }">
										<div class="custom-control custom-switch col-3">
										  <input type="checkbox" class="custom-control-input switch-toggle" id="customSwitches_${i.index+1 }" checked="checked" name="${account.accountId }" onchange="getSwitch(id,name);">
										  <label class="custom-control-label switch-toggle" for="customSwitches_${i.index+1 }"></label>
										</div>
										<div class="col-1">
											<div style="background: #31a24c; border-radius: 50%; height: 1em; width: 1em;"></div>
										</div>
										<div class="col-8">
											<span>Active now</span>
										</div>
									</div>
								</c:if>
								<c:if test="${account.status == false }">
									<div class="row" id="result_${i.index +1 }">
										<div class="custom-control custom-switch col-3">
										  <input type="checkbox" class="custom-control-input switch-toggle" id="customSwitches_${i.index+1 }" name="${account.accountId }" onchange="getSwitch(id,name);">
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
								<a href="#editEmployeeModal" id="${account.accountId }" onclick="openEditModal(id);" class="edit" data-toggle="modal">
								<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
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
	
	    <c:if test="${accounts.size() > 0 }">
	        <div class="panel-footer">
	 
			<select style="color: #566787;" name="pageSize"
												onchange="location = this.value;">
			 <option value="">PageSize</option>
			 <option value="${pageContext.request.contextPath}/admin/account/pagination?currentPage=1&pageSize=5&sort=${sort}">5</option>
			 <option value="${pageContext.request.contextPath}/admin/account/pagination?currentPage=1&pageSize=10&sort=${sort}">10</option>
			 <option value="${pageContext.request.contextPath}/admin/account/pagination?currentPage=1&pageSize=25&sort=${sort}">25</option>
			 <option value="${pageContext.request.contextPath}/admin/account/pagination?currentPage=1&pageSize=50&sort=${sort}">50</option>
			</select>
	
		&nbsp;&nbsp;
		<span>Showing <strong>${currentPage > 1 ? currentPage * pageSize - pageSize : 1}</strong> to <strong>${pageSize * currentPage}</strong> out of <b>${totalElements}</b> entries</span>
	         
	            <ul class="pagination">
	            			<li class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=1&pageSize=${pageSize}&sort=${sort}"
													class="page-link">First</a>
	                    </li>
	                    
	                     <li class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}"
													class="page-link">Previous</a>
	                    </li>
	                    
	                    
	                 <!--  // start number of page -->
	                 
	                    <!--   //  totalpage <= 5 -->
	          
	             
	                 <c:if test="${totalPages <= 5 && currentPage <= 5 }">
		                <c:forEach begin="0" end="${totalPages - 1}" var="page">
		                    <li class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
		               
	                </c:if>
	              <!--   //  totalpage > 5 -->
	          
	                 <c:if test="${totalPages > 5 && currentPage <= 2 }">
		                <c:forEach begin="0" end="4" var="page">
		                    <li class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
		                    </li>
		                </c:forEach>
	                </c:if>
	              
	                   <c:if test="${totalPages > 5 && currentPage >= 3 && currentPage != totalPages}">
	                  	                
			              	<c:forEach begin="${currentPage <= totalPages - 2 ? currentPage - 2 : currentPage - 3}"
														end="${currentPage - 1}" var="page1">
			                    <li class="page-item">
			                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${page1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page1}</a>
			                    </li>
			                </c:forEach>
		                   
		                 <li class="page-item active">
		                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=${sort}"
														class="page-link">${currentPage}</a>
		                    </li>
		               	  <c:forEach begin="${currentPage}" end="${currentPage <= totalPages - 2 ? currentPage + 1 : currentPage}"
														var="page2">
		                    <li class="${currentPage == page2 + 1 ? 'page-item active' : 'page-item' }">
		                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${page2 + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page2 + 1}</a>
		                    </li>
		                </c:forEach> 
	                </c:if>
	                
	                   <!--   //  the last page -->
	          
	             
	            		    <c:if test="${currentPage == totalPages && totalPages > 5}">
			                <c:forEach begin="${totalPages - 5 }" end="${totalPages - 1}" var="page">
			                    <li class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
			                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
															class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
	               		</c:if>
	                 
	                  <!--  // end number of page -->
	              
	                     <li class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}"
													class="page-link">Next</a>
	                    </li>
	                      <li class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a href="${pageContext.request.contextPath}/admin/account/pagination?currentPage=${totalPages }&pageSize=${pageSize}&sort=${sort}"
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
		
			<s:form method="post" modelAttribute="account"
										action="${pageContext.request.contextPath }/admin/account/create"
										enctype="multipart/form-data">
				<div class="modal-header">	
									
					<h4 class="modal-title">Add Account</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">					
					<div class="form-group">
					<span style="color: red;">${msg==""?"": msg }</span> <br />
						<label>UserName</label>
						<s:input path="username" type="text" class="form-control"
													required="required" />
				
					</div>
					<div class="form-group">
						<label>Password</label>
						<s:input path="password" type="password" class="form-control"
													required="required" minlength="8" />
					
					</div>
					<div class="form-group">
						<label>FullName</label>
						<s:input path="fullname" type="text" class="form-control"
													required="required" />
					
					</div>	
					<div class="form-group">
						<label>Email</label>
						<s:input path="email" type="email" class="form-control"
													required="required" />
					
					</div>
						<div class="form-group">
						<label>Date of Birth</label>
						<s:input path="dob" id="birthday" class="form-control"
													required="required" />
					
					</div>
					<div class="form-group">
						<label>Address</label>
						<s:textarea cols="5" rows="10" path="addr" type="text"
													class="form-control" required="required" />
					
					</div>
					<div class="form-group">
						<label>Gender</label>
						<br />
						<s:radiobutton path="gender" value="true" /> Male <br>
					<s:radiobutton path="gender" value="false" /> Female
					</div>	
					<div class="form-group">
						<label>Phone Number</label>
						<s:input path="phone" type="text" class="form-control" required="required" pattern="[0-9]{1,15}"/>
					
					</div>	
					
					<div class="form-group">
						<label>Role</label>
						<br>
						<c:forEach var="role" items="${roles }">
						<c:if test="${role.roleName != 'ROLE_ADMIN' }">
						<input type="checkbox" name="role" value="${role.roleId }">${role.roleName }<br>
						</c:if>
					</c:forEach>
					</div>
				
				
					<div class="form-group">
						<label>Avatar</label>
						<input type="file" name="file" class="form-control" required="required" />
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
		<s:form method="post" modelAttribute="account"
										action="${pageContext.request.contextPath }/admin/account/update"
										enctype="multipart/form-data">
				
					<input name="avatar" type="hidden" value="noimg" />
				<div class="modal-header">	
									
					<h4 class="modal-title">Update Account</h4>
					<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											
				</div>
				<div class="modal-body">		
				<div class="form-group">
						<label>AccountId</label>
						<s:input path="accountId" type="text" id="accId"
													class="form-control" disabled="true" />
				
					</div>			
					<div class="form-group">
						<label>UserName</label>
						<input name="username" type="text" id="accUsername"
													class="form-control" readonly="readonly" />
				
					</div>
				
					<div class="form-group">
						<label>FullName</label>
						<s:input path="fullname" type="text" id="accFulllname"
													class="form-control" />
					
					</div>	
					<div class="form-group">
						<label>Email</label>
						<s:input path="email" type="email" id="accEmail"
													class="form-control" />
					
					</div>
						<div class="form-group">
						<label>Date of Birth</label>
						<s:input path="dob" id="dob" class="form-control"
													required="required" />
					
					</div>
					<div class="form-group">
						<label>Address</label>
						<s:textarea cols="5" rows="10" path="addr" type="text"
													id="accAddress" class="form-control" required="required" />
					
					</div>
					<div class="form-group">
						<label>Gender</label>
						<br />
						<s:radiobutton path="gender" id="accGenderMale" value="true" /> Male <br>
					<s:radiobutton path="gender" id="accGenderFemale" value="false" /> Female
					</div>	
					<div class="form-group">
						<label>Phone Number</label>
						<s:input path="phone" type="text" id="accPhone"
													class="form-control" required="required" />
					</div>	
					<div class="form-group">
						<label>CreateDate</label>
						<s:input path="createDate" type="text" id="createDatee"
													class="form-control" required="required" disabled="true"/>
					</div>	
					<div class="form-group">
						<label>Avatar</label>
						<input type="file" name="file" class="form-control" />
						<img src="" id="accAvatar" width="100%" height="100%">
					
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