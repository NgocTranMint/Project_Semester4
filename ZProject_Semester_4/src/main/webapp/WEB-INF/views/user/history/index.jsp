<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:layout_user title="History">
	
	<jsp:attribute name="content">
	
	<div class="all-title-box-history">
		<div class="container text-center">
			<h1>History<span class="m_1"></span></h1>
		</div>
	</div>
	
    <div id="contact" class="section wb">
        <div class="container" style="max-width: 1350px;">
            <div class="section-title text-center">
                <h3>History takes your multiple-choice tests</h3>
                <p class="lead">You can review the multiple choice tests that you have done.</p>
            </div>
               
            <table class="table table hover">
            	<c:forEach var="history" items="${histories }">
            		<tr class="row">
	            		<td class="col-lg-2 col-md-2 col-2">
	            			<div >
				            	<div class="course-item">
									<div class="image-blog">
										<img src="${pageContext.request.contextPath}/assets/uploads/${history.quiz.image}" alt="" class="img-fluid" style="
    height: 204px;
">
									</div>
								</div>
				            </div>
	            		</td>
			            <td class="col-lg-10 col-md-10 col-10" style="width: 70%">
			            	<div >
				            	<div class="course-item"> 
				                	<div class="course-br">
										<div class="course-title">
											<fmt:formatDate var="dateCreated" value="${history.date}"
														pattern="dd/MM/yyyy" />
											<h1>${dateCreated}</h1>
										</div>
										<div class="course-desc">
											<h3>You had finished test: <span style="color: #eea412; text-transform: uppercase; ">  ${history.quiz.title } </span></h3> 
											<c:if test="${history.timeDone%60 <= 10}">
												<p><i class="fa fa-clock-o" aria-hidden="true"></i> Completion time: <fmt:formatNumber type = "number" pattern = "#" value="${Math.floor(history.timeDone/60)}" maxIntegerDigits="1"/>:0${history.timeDone%60}</p>
											</c:if>
											<c:if test="${history.timeDone%60 > 10}">
												<p><i class="fa fa-clock-o" aria-hidden="true"></i> Completion time: <fmt:formatNumber type = "number" pattern = "#" value="${Math.floor(history.timeDone/60)}" maxIntegerDigits="1"/>:${history.timeDone%60}</p>
											</c:if>
										</div>
										<div class="course-rating">
												<p>
													<i class="fa fa-dollar" aria-hidden="true"></i> &nbsp;&nbsp; <span style="${history.quiz.fee ? 'color:red;' : 'color:green;'}">${history.quiz.fee ? "Purchase" : "Free"}</span> &nbsp; | &nbsp;
													<i class="fa fa-question-circle" aria-hidden="true"></i> &nbsp; ${history.numberRightAnswer }/${history.quiz.questions.size() } &nbsp; | &nbsp;
													<a href="${pageContext.request.contextPath}/user/course/reviewtest?quizId=${history.quiz.quizId}" class="btn btn-info" role="button">Details</a>
												</p>			
										</div>	
									</div>
				                </div>
				            </div>
			            </td>	
	            	</tr>
            	</c:forEach>
            </table>
            
        </div>       
    </div>
	
	
	</jsp:attribute>
</mt:layout_user>

