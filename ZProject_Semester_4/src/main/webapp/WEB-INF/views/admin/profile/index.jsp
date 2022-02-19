<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:layout_admin title="Profile">
	<jsp:attribute name="content">
		 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		 <link href="${pageContext.request.contextPath}/resources/admin/css/styleProfile.css" rel="stylesheet">
		 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
		 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		 <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		
			<script type="text/javascript">
				$(function() {
					$("#birthday").datepicker();
				});
				
				function openChangeAvt(accountId) {
					
					$.ajax({
								type : 'GET',
								url : '${pageContext.request.contextPath }/admin/ajax/findaccountbyid',
								data : {
									accountId : accountId
								},
								success : function(account) {
									$('#accAvatar').attr("src", "/assets/uploads/" + account.avatar);
								}
							});
				}
			</script>
		
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>Profile</h1>
	          </div>
	          <div class="col-sm-6">
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>
		
            <section class="content">
				<div class="container-fluid">
				        <div class="row">
				          <div class="col-md-3">
				
				            <!-- Profile Image -->
				            <div class="card card-primary card-outline">
				              <div class="card-body box-profile">
					               <div class="text-center" style="position: relative;">
						           		<img class="profile-user-img img-fluid img-circle" src="${pageContext.request.contextPath}/assets/uploads/${account.avatar}" alt="User profile picture">
						                  	<div class="gb_gb gb_cb">
						                  		<a class="gb_hb gb_Jf gb_cb gb_Of" aria-label="Thay đổi ảnh hồ sơ." href="#openfile" data-toggle="modal" id="${account.accountId }" onclick="openChangeAvt(id);">
						                  			<svg class="gb_ib" enable-background="new 0 0 24 24" focusable="false" height="26" viewBox="0 0 24 24" width="18">
						                  				<path d="M20 5h-3.17L15 3H9L7.17 5H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 14H4V7h16v12zM12 9c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4z"></path>
						                  			</svg>
						                  		</a>
						                  	</div>
					               </div>
				                <h3 class="profile-username text-center">${account.fullname}</h3>
				
				                <p class="text-muted text-center">${account.addr}</p>
				
				                <ul class="list-group list-group-unbordered mb-3">
				                  <li class="list-group-item">
				                    <b>Followers</b> <a class="float-right">1,322</a>
				                  </li>
				                  <li class="list-group-item">
				                    <b>Following</b> <a class="float-right">543</a>
				                  </li>
				                  <li class="list-group-item">
				                    <b>Friends</b> <a class="float-right">13,287</a>
				                  </li>
				                </ul>
				
				                <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
				              </div>
				              <!-- /.card-body -->
				            </div>
				            <!-- /.card -->
				
				            <!-- About Me Box -->
				            <div class="card card-primary">
				              <div class="card-header">
				                <h3 class="card-title">About Me</h3>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body">
				                <strong><i class="fas fa-book mr-1"></i> Education</strong>
				
				                <p class="text-muted">
				                  B.S. in Computer Science from the University of Tennessee at Knoxville
				                </p>
				
				                <hr>
				
				                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>
				
				                <p class="text-muted">Malibu, California</p>
				
				                <hr>
				
				                <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>
				
				                <p class="text-muted">
				                  <span class="tag tag-danger">UI Design</span>
				                  <span class="tag tag-success">Coding</span>
				                  <span class="tag tag-info">Javascript</span>
				                  <span class="tag tag-warning">PHP</span>
				                  <span class="tag tag-primary">Node.js</span>
				                </p>
				
				                <hr>
				
				                <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
				
				                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
				              </div>
				              <!-- /.card-body -->
				            </div>
				            <!-- /.card -->
				          </div>
				          <!-- /.col -->
				          <div class="col-md-9">
				            <div class="card">
				              <div class="card-header p-2">
				                <ul class="nav nav-pills">
				                  <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Information</a></li>
				                  <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Change Password</a></li>
				                </ul>
				              </div><!-- /.card-header -->
				              <div class="card-body">
				                <div class="tab-content">
				                  <div class="active tab-pane" id="activity" style="font-size: 1.2rem; padding-left: 10%;">
				                  	<div class="form-horizontal">
				                      <div class="form-group row">
				                        <label for="inputName" class="col-sm-3 col-form-label">Username:</label>
				                        <div class="col-sm-8">
				                          ${account.username}
				                        </div>
				                       
				                      </div>
				                     
				                      
				                      <div class="form-group row">
				                        <label for="inputEmail" class="col-sm-3 col-form-label">Fullname:</label>
				                        <div class="col-sm-8">
				                          ${account.fullname}
				                        </div>
				                        <div class="col-sm-1">
				                        	<a data-toggle="collapse" data-target="#editFullname"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
				                        </div>
				                      </div>
				                      <form method="post" action="${pageContext.request.contextPath}/admin/profile/editProfileFullname" enctype="multipart/form-data">
					                      <div class="form-group row collapse" id="editFullname">
											   <label for="inputName" class="col-sm-3 col-form-label"></label>
						                       <div class="col-sm-8">
						                       	 <p>Your current fullname is <strong>${account.fullname}</strong>. Do you want to change?</p>
						                         <input type="text" class="form-control" placeholder="Fullname" name="fullname"> <br>
						                         <input type="submit" value="Change" class="btn btn-danger">
						                       </div>
					                      </div>
				                      </form>
				                      <div class="form-group row">
				                        <label for="inputName2" class="col-sm-3 col-form-label">Email:</label>
				                        <div class="col-sm-8">
				                          ${account.email}
				                        </div>
				                       
				                      </div>
				                      
				                      
				                      <div class="form-group row">
				                        <label for="inputExperience" class="col-sm-3 col-form-label">Birthday:</label>
				                        <div class="col-sm-8">
				                          ${account.dob}
				                        </div>
				                        <div class="col-sm-1">
				                        	<a data-toggle="collapse" data-target="#editBirthday"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
				                        </div>
				                      </div>
				                      <form method="post" action="${pageContext.request.contextPath}/admin/profile/editProfileBirthday" enctype="multipart/form-data">
					                      <div class="form-group row collapse" id="editBirthday">
											   <label for="inputName" class="col-sm-3 col-form-label"></label>
						                       <div class="col-sm-8">
						                         <input type="text" class="form-control" id="birthday" placeholder="Birthday" name="birthday"> <br>
						                         <input type="submit" value="Change" class="btn btn-danger">
						                       </div>
					                      </div>
				                      </form>
				                      
				                      <div class="form-group row">
				                        <label for="inputSkills" class="col-sm-3 col-form-label">Address:</label>
				                        <div class="col-sm-8">
				                          ${account.addr}
				                        </div>
				                        <div class="col-sm-1">
				                        	<a data-toggle="collapse" data-target="#editAddress"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
				                        </div>
				                      </div>
				                      <form method="post" action="${pageContext.request.contextPath}/admin/profile/editProfileAddress" enctype="multipart/form-data">
					                      <div class="form-group row collapse" id="editAddress">
											   <label for="inputName" class="col-sm-3 col-form-label"></label>
						                       <div class="col-sm-8">
						                         <input type="text" class="form-control" placeholder="Address" name="address"> <br>
						                         <input type="submit" value="Change" class="btn btn-danger">
						                       </div>
					                      </div>
				                      </form>
				                      
				                      <div class="form-group row">
				                        <label for="inputName" class="col-sm-3 col-form-label">Phone:</label>
				                        <div class="col-sm-8">
				                          ${account.phone}
				                        </div>
				                        <div class="col-sm-1">
				                        	<a data-toggle="collapse" data-target="#editPhone"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
				                        </div>
				                      </div>
				                      <form method="post" action="${pageContext.request.contextPath}/admin/profile/editProfilePhone" enctype="multipart/form-data">
					                      <div class="form-group row collapse" id="editPhone">
											   <label for="inputName" class="col-sm-3 col-form-label"></label>
						                       <div class="col-sm-8">
						                       	 <p>Your current phone is <strong>${account.phone}</strong>. Do you want to change?</p>
						                         <input type="text" class="form-control" placeholder="Phone" pattern="[0-9]{1,15}" name="phone"> <br>
						                         <input type="submit" value="Change" class="btn btn-danger">
						                       </div>
					                      </div>
				                      </form>
				                      
				                      <div class="form-group row">
				                        <label for="inputName" class="col-sm-3 col-form-label">Gender:</label>
				                        <div class="col-sm-8">
				                          ${account.gender? "Male" : "Female"}
				                        </div>
				                      </div>
				                      
				                    </div>
				                  </div>
				                  <!-- /.tab-pane -->
				
				                  <div class="tab-pane" id="settings">
				                    <form method="post" action="${pageContext.request.contextPath}/admin/profile/editPassword" class="form-horizontal">
				                      ${msg == "" ? "" : msg}
				                      <div class="form-group row">
				                        <label class="col-sm-2 col-form-label">Current password</label>
				                        <div class="col-sm-10">
				                          <input type="password" class="form-control" placeholder="Current password" name="currentPassword" id="currentPassword">
				                        </div>
				                      </div>
				                      
				                      <div class="form-group row">
				                        <label class="col-sm-2 col-form-label">New password</label>
				                        <div class="col-sm-10">
				                          <input type="password" class="form-control" placeholder="New password" name="newPassword" id="newPassword">
				                        </div>
				                      </div>
				                      
				                      <div class="form-group row">
				                        <label for="inputName" class="col-sm-2 col-form-label">Confirm password</label>
				                        <div class="col-sm-10">
				                          <input type="password" class="form-control" placeholder="Confirm password" name="confirmPassword" id="confirmPassword">
				                        </div>
				                      </div>
				                      
				                      <div class="form-group row">
				                        <div class="offset-sm-2 col-sm-10">
				                          <button type="submit" class="btn btn-danger" id="changePass">Change</button>
				                        </div>
				                      </div>
				                    </form>
				                  </div>
				                  <!-- /.tab-pane -->
				                </div>
				                <!-- /.tab-content -->
				              </div><!-- /.card-body -->
				            </div>
				            <!-- /.card -->
				          </div>
				          <!-- /.col -->
				        </div>
				        <!-- /.row -->
				      </div><!-- /.container-fluid -->
				    </section>   
				    
	<div id="openfile" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
			<input name="avatar" type="hidden" value="noimg" />
				<div class="modal-header">
					<h4 class="modal-title">Change Image</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										
				</div>
				<div class="modal-body">
					<form method="post" action="${pageContext.request.contextPath }/admin/profile/changeImage" enctype="multipart/form-data">
						<div class="form-group">
							<img src="" id="accAvatar" width="100%" height="100%">
							<br>
							<input type="file" name="file" class="form-control" />
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input type="submit" class="btn btn-success" value="Upload" path="" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>             
	</jsp:attribute>
</mt:layout_admin>