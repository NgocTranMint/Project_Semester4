<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:layout_user title="Course">

	<jsp:attribute name="content">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>
	/* var sec = 0;
	function pad(val) {
		return val > 9 ? val : "00" + val;
	} */

	/* 	function animateValue(id){
	 var current = 0;

	 setInterval(function(){
	 $('#timersubmit').val(current++);
	 },1000);
	 } */
	/* setInterval(function() {
		$("#seconds").html(pad(++sec % 60));
		$("#minutes").html(pad(parseInt(sec / 60, 10)));
	}, 1000); */

	function startTimer(duration, display) {
		var timer = duration, minutes, seconds;
		var current = 0;

		setInterval(function() {
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			display.textContent = minutes + ":" + seconds;
			$('#timersubmit').val(current++);
			if (--timer < 0) {
				timer = duration;
				document.getElementById('formquiz').submit();
			}
		}, 1000);
	}

	window.onload = function() {
		var timer = document.getElementById('timer').value;
		var Minutes = 60 * timer, display = document.querySelector('#timee');
		startTimer(Minutes, display);

	};
</script>

	<div
			style="position: fixed; top: 6em; right: 1em; color: white; z-index: 9999999;">
	
<div
				style="background-color: #eea412; padding: 5px; border-radius: 5px;">
				<i class="fa fa-clock-o" aria-hidden="true"></i>  <span id="timee">${quiz.timer }:00</span>
			</div>
	</div>
    <div id="overviews" class="section wb">
        <div class="container">
        	<div class="test_body">
	        	<div class="row"> 
	         		<div class="quiz_title">
	         			<h2>${quiz.title}</h2>
	         		</div>             
	            </div>
	            <input type="hidden" id="timer" value="${quiz.timer }">
	            <form id="formquiz" method="post"
						action="${pageContext.request.contextPath }/user/course/endtest?quizId=${quiz.quizId}">
	            <c:forEach var="question" items="${quiz.questions}"
							varStatus="i">
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
		         			<ol type="A">
		         				  <c:forEach var="answer" items="${question.answers}"
											varStatus="t">   
											<c:choose>
									<c:when test="${question.typeAnswerChoice == 'checkbox' }">
	     
		         				<div>
		         					<input type="checkbox" name="answer${i.index }"
															value="${answer.answerId}" style="float: left; margin-right: 20px;"> <li>${answer.title }</li>
									
		         				</div>
		         				 	 	</c:when>
		         				 	 	<c:when test="${question.typeAnswerChoice == 'radio' }">
	     
		         				<div>
		         					<input type="radio" name="answer${i.index }"
															value="${answer.answerId}" style="float: left; margin-right: 20px;"> <li>${answer.title }</li>
									
		         				</div>
		         				 	 	</c:when>
		        					
		         				 	</c:choose>  
        
		         				 
						</c:forEach>
		         			</ol>
				</div>
		         			<hr> 
		         		</div> 
		         		           
		            </div>
		            </c:forEach>
		           
		            <div class="btn_submit">
		             <input class="hover-btn-new orange" type="submit"
				value="submit">
		            </div>
		           
	            </form>
						<!-- end col -->
			</div>	
        </div>
			<!-- end container -->
    </div>
		<!-- end section -->

   

	</jsp:attribute>
</mt:layout_user>