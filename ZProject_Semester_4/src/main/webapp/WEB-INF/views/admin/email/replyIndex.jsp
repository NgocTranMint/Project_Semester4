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
			    <section class="content-header">
			      <div class="container-fluid">
			        <div class="row mb-2">
			          <div class="col-sm-6">
			            <h1>Compose</h1>
			          </div>
			          <div class="col-sm-6">
			            <ol class="breadcrumb float-sm-right">
			              <li class="breadcrumb-item"><a href="#">Home</a></li>
			              <li class="breadcrumb-item active">Compose</li>
			            </ol>
			          </div>
			        </div>
			      </div><!-- /.container-fluid -->
			    </section>
			
			    <!-- Main content -->
			    <section class="content">
			      <div class="container-fluid">
			        <div class="row">
			          <div class="col-md-3">
			            <a href="${pageContext.request.contextPath}/admin/email/index" class="btn btn-primary btn-block mb-3">Back to Inbox</a>
			
			            <div class="card">
			              <div class="card-header">
			                <h3 class="card-title">Folders</h3>
			
			                <div class="card-tools">
			                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
			                    <i class="fas fa-minus"></i>
			                  </button>
			                </div>
			              </div>
			              <div class="card-body p-0">
			                <ul class="nav nav-pills flex-column">
			                  <li class="nav-item active">
			                    <a href="#" class="nav-link">
			                      <i class="fas fa-inbox"></i> Inbox
			                      <span class="badge bg-primary float-right">12</span>
			                    </a>
			                  </li>
			                  <li class="nav-item">
			                    <a href="#" class="nav-link">
			                      <i class="far fa-envelope"></i> Sent
			                    </a>
			                  </li>
			                  <li class="nav-item">
			                    <a href="#" class="nav-link">
			                      <i class="far fa-file-alt"></i> Drafts
			                    </a>
			                  </li>
			                  <li class="nav-item">
			                    <a href="#" class="nav-link">
			                      <i class="fas fa-filter"></i> Junk
			                      <span class="badge bg-warning float-right">65</span>
			                    </a>
			                  </li>
			                  <li class="nav-item">
			                    <a href="#" class="nav-link">
			                      <i class="far fa-trash-alt"></i> Trash
			                    </a>
			                  </li>
			                </ul>
			              </div>
			              <!-- /.card-body -->
			            </div>
			            <!-- /.card -->
			            <div class="card">
			              <div class="card-header">
			                <h3 class="card-title">Labels</h3>
			
			                <div class="card-tools">
			                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
			                    <i class="fas fa-minus"></i>
			                  </button>
			                </div>
			              </div>	
			              <!-- /.card-header -->
			              <div class="card-body p-0">
			                <ul class="nav nav-pills flex-column">
			                  <li class="nav-item">
			                    <a class="nav-link" href="#"><i class="far fa-circle text-danger"></i> Important</a>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link" href="#"><i class="far fa-circle text-warning"></i> Promotions</a>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link" href="#"><i class="far fa-circle text-primary"></i> Social</a>
			                  </li>
			                </ul>
			              </div>
			              <!-- /.card-body -->
			            </div>
			            <!-- /.card -->
			          </div>
			          <!-- /.col -->
			        <div class="col-md-9">
			          <div class="card card-primary card-outline">
			            <div class="card-header">
			              <h3 class="card-title">Read Mail</h3>
			
			              <div class="card-tools">
			                <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
			                <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
			              </div>
			            </div>
			            <!-- /.card-header -->
			            <div class="card-body p-0">
			              <div class="mailbox-read-info">
			                <h2>TITLE: ${email.title }</h2>
			                <h4>From: ${email.emailUser }
			                  <span class="mailbox-read-time float-right">${email.sendDate }</span></h4>
			              </div>
			              <!-- /.mailbox-read-info -->
			              <div class="mailbox-controls with-border text-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
			                    <i class="far fa-trash-alt"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
			                    <i class="fas fa-reply"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
			                    <i class="fas fa-share"></i>
			                  </button>
			                </div>
			                <!-- /.btn-group -->
			                <button type="button" class="btn btn-default btn-sm" title="Print">
			                  <i class="fas fa-print"></i>
			                </button>
			              </div>
			              <!-- /.mailbox-controls -->
			              <div class="mailbox-read-message with-border">
			                <h5>YOU: ${email.content }</h5>
			                <span class="mailbox-read-time"><fmt:formatDate var="sendDate" value="${email.sendDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${sendDate }</span>
			              </div>
			              <!-- /.mailbox-read-message -->
			              <c:if test="${email.replyContent != null }">
			              	<div class="mailbox-read-message with-border">
			                	<h5>ME: ${email.replyContent }</h5>
			                	<span class="mailbox-read-time"><fmt:formatDate var="replyDate" value="${email.replyDate}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${replyDate }</span>
			              	</div>
			              </c:if>
			            </div>
			            <div class="card-footer">
			              <div class="float-right">
			                <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
			                <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
			              </div>
			              <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button>
			              <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
			            </div>
			            <!-- /.card-footer -->
			          </div>
			          <!-- /.card -->
			        </div>
			        <!-- /.col -->
			      </div>
			      <div class="row">
			      	<div class="col-md-3"></div>
			      	<div class="col-md-9">
			      	<s:form method="post" modelAttribute="email" action="${pageContext.request.contextPath}/admin/email/replyEmail">
			            <div class="card card-primary card-outline">
			              <div class="card-header">
			                <h3 class="card-title">Compose New Message</h3>
			              </div>
			              <!-- /.card-header -->
			              
			              	<div class="card-body">
			                <div class="form-group">
			                  <input class="form-control" placeholder="To:" value="${email.emailUser }">
			                </div>
			                <div class="form-group">
			                  <input class="form-control" placeholder="Subject:" name="subject">
			                </div>
			                <div class="form-group">
			                    <s:textarea path="replyContent" id="compose-textarea" class="form-control" style="height: 300px"/>
			                    
			                </div>
			                <div class="form-group">
			                  <div class="btn btn-default btn-file">
			                    <i class="fas fa-paperclip"></i> Attachment
			                    <input type="file" name="attachment">
			                  </div>
			                  <p class="help-block">Max. 32MB</p>
			                </div>
			              </div>
			              <s:input path="emailId" type="hidden" value="${email.emailId }"/>
			              <!-- /.card-body -->
			              <div class="card-footer">
			                <div class="float-right">
			                  <button type="button" class="btn btn-default"><i class="fas fa-pencil-alt"></i> Draft</button>
			                  <input type="submit" class="btn btn-primary far fa-envelope" value="Send">
			                </div>
			                <button type="reset" class="btn btn-default"><i class="fas fa-times"></i> Discard</button>
			              </div>
			              <!-- /.card-footer -->
			            </div>
			           </s:form>
			            <!-- /.card -->
			          </div>
			      </div>
			      <!-- /.row -->
			      </div>>
			    </section>
			  <!-- /.content-wrapper -->
	</jsp:attribute>
</mt:layout_admin>