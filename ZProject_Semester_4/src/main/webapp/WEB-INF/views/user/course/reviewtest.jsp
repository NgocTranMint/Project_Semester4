<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:layout_user title="Course">

	<jsp:attribute name="content">
	
	<style>
		.explain_question h4 {
			padding: 10px;
			background-color: lightgray;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
		}
		
		.explain_question h3 {
			padding: 10px;
			background-color: cadetblue;
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
		}
</style>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>




	
    <div id="overviews" class="section wb">
        <div class="container">
        	<div class="test_body">
	        	<div class="row"> 
	         		<div class="quiz_title">
	         			<h2>Review ${quiz.title}</h2>
	         		</div>             
	            </div>
	            <input type="hidden" id="timer" value="${quiz.timer }">
	            <form id="formquiz" method="post"
						action="${pageContext.request.contextPath }/user/course/endtest?quizId=${quiz.quizId}">
					
			<c:forEach var="questionId" items="${listQuestionId}" varStatus="i">	 
	            <c:forEach var="question" items="${quiz.questions}">
	            		<c:choose>
		         				<c:when test="${question.questionId == questionId }">
		         				
		         		
		            <div class="row"> 
		           <input type="hidden" id="timersubmit" name="timersubmit">
		         		<div class="quiz_content">
		         			<div>
		         				<h3>Question ${i.index + 1 }:</h3>
		         				<p>${question.title}</p>
		         				<input type="hidden" name="questionId"
														value="${question.questionId }">
								
		         			</div>
		         			<div>
		         		
		         		<!-- 	 get answerId user checked -->
		         	<c:forEach var="answer" items="${question.answers}">
		         				<!-- get answerId type radio -->
								
		         		<c:choose>
		         		<c:when test="${question.typeAnswerChoice == 'radio' }">
		         				<c:forEach var="answerID" items="${listAnswerId}">
		         			
			         				<c:choose>
		     															
							 			<c:when test="${answer.answerId == answerID }">
		     							
		     							<c:set var="answerIdRadio" value="${answer.answerId}" />
		     							
										</c:when>
										
									</c:choose>
									<!-- get answerId type radio -->
									
								</c:forEach>	
							</c:when>
								
								 <c:otherwise>
									<c:forEach var="answerID" items="${listAnswerId}">
			         			
			         				<c:choose>
		     															
							 			<c:when test="${answer.answerId == answerID }">
		     							
		     							<c:set var="answerIdCheckbox" value="${answer.answerId}" />
			     						
										</c:when>
										
									</c:choose>
									<!-- get answerId type radio -->
									
									</c:forEach>	
								</c:otherwise>
								</c:choose>
								<!-- get answerId type checkbox -->
							
					</c:forEach>	
							<!-- 	 get answerId user checked -->
							
							<!-- show answer type radio -->
							<!-- Show all answer in a question -->
								<ol type="A">
							<c:forEach var="answer" items="${question.answers}" varStatus="a">
		         		<!-- get answerId type radio -->
		         		<c:set var="existTrue" value="" />
		     		
						<c:choose>
		         					<c:when test="${question.typeAnswerChoice == 'radio' }">
		         			
	             				<div>
	             				<input type="radio" name="answer${i.index }"
																		value="${answer.answerId}"
																		${answer.answerId == answerIdRadio ? 'checked' : '' }
																		disabled  style="float: left; margin-right: 20px;"> <span
																		class="${answer.answerStatus == true ? 'text-primary' : ''}"> <li>${answer.title } &nbsp; ${answer.answerStatus == true ? '<i class="text-primary fa fa-check" aria-hidden="true"></i>' : ''}</li> </span> </div> 
									</c:when>  
							<c:when test="${question.typeAnswerChoice == 'checkbox' }">
		         				<c:forEach var="answerID" items="${listAnswerId}"
																	varStatus="answerid">
		         				
			         		<c:choose>
		         		
			         		<c:when test="${answer.answerId == answerID }">
		         			
							<div>
	             				<input type="checkbox" name="answer${i.index }"
																					value="${answer.answerId}" checked disabled  style="float: left; margin-right: 20px;"> <span
																					class="${answer.answerStatus == true ? 'text-primary' : ''}"> <li>${answer.title } &nbsp; ${answer.answerStatus == true ? '<i class="text-primary fa fa-check" aria-hidden="true"></i>' : ''}</li> </span> </div>
							
					<c:set var="existTrue" value="${answerID}" />
		     							
					 		</c:when>
							</c:choose>	
							 	</c:forEach>
							<c:choose>
							<c:when test="${existTrue == '' }">
		         			<div>
							
	             				<input type="checkbox" name="answer${i.index }"
																				value="${answer.answerId}" disabled  style="float: left; margin-right: 20px;"> <span
																				class="${answer.answerStatus == true ? 'text-primary' : ''}" > <li>${answer.title }  &nbsp; ${answer.answerStatus == true ? '<i class="text-primary fa fa-check" aria-hidden="true"></i>' : ''}</li></span> 
																</div>
									</c:when>
									</c:choose>									
							
									</c:when>
							</c:choose>
								<!-- show answer type checkbox -->
							
							
							</c:forEach>	
								</ol>
							<!-- Show all answer in a question -->
							
		         			
				</div>
		         			<div class="explain_question">
		         			<br>
		         				<h3>Explain:</h3>
		         				<h4> &nbsp; + ${question.explainDetail}</h4>
		         			</div>
		         			<hr> 
		         		</div>
		         			
		         			
		         			
		         		      
		          
		            </div>
		            </c:when>
		     </c:choose>
		            </c:forEach>
		           </c:forEach>
		         				
		          
		           
	            </form>
						<!-- end col -->
			</div>	
        </div>
			<!-- end container -->
    </div>
		<!-- end section -->

   

	</jsp:attribute>
</mt:layout_user>