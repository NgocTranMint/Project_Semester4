<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<mt:layout_admin title="Review">

	<jsp:attribute name="content">

<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
.quiz_title {
	text-align: center;
	margin: auto;
}

.quiz_title h2 {
	font-size: 30px;
	font-weight: bold;
	color: #eea412;
}

.quiz_content {
	width: 100%;
}

.quiz_content hr {
	border-top: 3px solid rgba(0, 0, 0, .1);
}

.quiz_content div h3 {
	font-weight: bold;
}

.quiz_content div p {
	padding-left: 10px;
	font-size: 17px;
}

.quiz_content div div {
	padding: 10px 20px;
	font-size: 15px;
	color: black;
}

.quiz_content div div input {
	height: 23px;
	width: 50px;
	vertical-align: middle;
}
</style>	
			
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		
	</script>
		 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Review Question Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Question Page</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
		  <!-- Main content -->
    <section class="content">
	    <div class="card-body">          
			<div class="">
				<div class="table-responsive">
					<div class="table-wrapper">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-6">
									<h2>Review <b>Questions</b>
													</h2>
								</div>
							</div>
						</div>
						        <div class="container">
							        	<div class="row"> 
							         		<div class="quiz_title col-sm-12">
							         			<h2>${quiz.title}</h2>
							         			<hr style="border: 1px solid black;" />      
							         		</div>   
							         		    
							            </div>
							            <input type="hidden" id="timer"
									value="${quiz.timer }">
							            <c:forEach var="question" items="${quiz.questions}"
									varStatus="i">
								            <div class="row">
								         		<div class="quiz_content col-sm-12">
								         			<div>
								         				<h3>Question ${i.index + 1 }:</h3>
								         				<p>${question.title}</p>
								         				<input type="hidden" name="questionId"
													value="${question.questionId }">
								         			</div>
								         			<div>
								         			<ol type="A">
								         				  <c:forEach var="answer"
														items="${question.answers}" varStatus="t">   
														  		<c:choose>
																	<c:when
																test="${question.typeAnswerChoice == 'checkbox' }">
							     										<div>
							     										
								         									<input type="checkbox"
																		name="answer${i.index }" value="${answer.answerId}"
																		style="float: left; margin-right: 20px;"> 
  <li>${answer.title }</li>
  

															
								         								</div>
								         				 	 		</c:when>
								         				 	 		<c:when
																test="${question.typeAnswerChoice == 'radio' }">
							     										<div>
								         									<input type="radio" name="answer${i.index }"
																		value="${answer.answerId}"
																		style="float: left; margin-right: 20px;"> <li>${answer.title }</li>
  
																		</div>
								         				 	 		</c:when>
								         				 		</c:choose>  
							        						</c:forEach>
							        						</ol> 
							        						<hr style="border: 1px dashed black;"> 
														</div>
								         			</div>
								            </div>
								            </c:forEach>
						        </div>
					</div>        
				</div>
		        <div class="card-footer">
		          Footer
		        </div>
      		</div>

		</div>
	
		</section>

	</jsp:attribute>
</mt:layout_admin>