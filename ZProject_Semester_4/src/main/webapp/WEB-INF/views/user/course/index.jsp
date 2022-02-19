<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:layout_user title="Course">

	<jsp:attribute name="content">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
	
	
	<div class="all-title-box">
		<div class="container text-center">
			<h1>Course Grid 4<span class="m_1">Lorem Ipsum dolroin gravida nibh vel velit.</span>
				</h1>
		</div>
	</div>
	
    <div id="overviews" class="section wb">
        <div class="container">
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <p class="lead">Lorem Ipsum dolroin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem!</p>
                </div>
            </div>
				<!-- end title -->
			<div class="row">
      			<div class="col-md-6">
      			<form method="get" action="${pageContext.request.contextPath}/user/course/search">
      			<input type="text" class="form-control" placeholder="Quiz..." name="keyword">
      			<!-- <input type="submit" value="Search" class="btn btn-primary"> -->
      			</form>
        			
        			
        			
  				</div>
  
  <div class="col-md-2">
        			<select  class="form-control" style="color: #566787;" name="pageSize"
								onchange="location = this.value;">
			 <option value="">Fee</option>
			 <option value="${pageContext.request.contextPath}/user/course/filter?fee=false">Free</option>
			 <option value="${pageContext.request.contextPath}/user/course/filter?fee=true">Purchase</option>
			
			</select>
        			</div>
  </div>
            <hr class="invis"> 
             <c:choose>
   <c:when test="${quizs.size() > 0 }">
		
           <c:forEach var="quiz" items="${quizs}" varStatus="i">
				    <div class="row"> 
         	
                <div class="col-lg-3 col-md-3 col-3 padding_zero">
                    <div class="course-item">
						<div class="image-blog">
							<img
												src="${pageContext.request.contextPath}/assets/uploads/${quiz.image}"
												alt="" class="img-fluid">
						</div>
						
					</div>
                </div>
                <div class="col-lg-9 col-md-9 col-9 padding_zero">
                	<div class="course-item"> 
                	
                	<div class="course-br">
							<div class="course-title">
								<h2>
											<a
														href="${pageContext.request.contextPath}/user/course/quizdetails?quizId=${quiz.quizId}"
														title="">${quiz.title.length() > 130 ? quiz.title.substring(0, 130) += '...' :  quiz.title}</a>
										</h2>
										
							</div>
							<div class="course-desc">
								<p>${quiz.description.length() > 220 ? quiz.description.substring(0, 220) += '...' :  quiz.description}</p>
							</div>
							<div class="course-rating">
						
										<fmt:formatDate var="dateCreated" value="${quiz.dateCreated}"
													pattern="dd/MM/yyyy" />
			
										<p>
													<i class="fa fa-calendar" aria-hidden="true"></i> &nbsp;&nbsp; ${dateCreated} &nbsp; | &nbsp;
											<i class="fa fa-question-circle" aria-hidden="true"></i> &nbsp; ${quiz.questions.size()} Questions</p>			
							</div>
						</div>
						<div class="course-meta-bot">
							<ul>
								<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp; ${quiz.timer}  Minutes &nbsp; |</li>
								<li><i class="fa fa-users" aria-hidden="true"></i> &nbsp; ${quiz.times} Times &nbsp; |</li>
								<li style="${quiz.fee ? 'color:red;' : 'color:green;'}"><i
													class="fa fa-dollar" aria-hidden="true"></i> &nbsp; ${quiz.fee ? "Purchase" : "Free"} </li>
							</ul>
							<div class="course-rating">
								 <a style="color: black;"
													href="${pageContext.request.contextPath}/user/course/quizdetails?quizId=${quiz.quizId}"
													class="hover-btn-new orange"><span>Take Test</span></a> 						
							</div>
						</div>
                	</div>
                </div>
                 </div>
						<!-- end col -->
</c:forEach>
           	</c:when>
	        <c:otherwise>
	            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <p class="lead text-primary">No quiz!</p>
                </div>
            </div>
	        </c:otherwise>
	    </c:choose>  
           <div class="row">
	
	    <c:if test="${quizs.size() > 0 }">
	      
			
	  <div class="col-lg-4 col-md-4 col-4 padding_zero">
              
		<span>Showing <strong>${currentPage > 1 ? currentPage * pageSize - pageSize : 1}</strong> to <strong>${pageSize * currentPage}</strong> out of <b>${totalElements}</b> entries</span>
	         </div>
	         <div class="col-lg-8 col-md-8 col-8 padding_zero">
      
	            <ul style="float: right;" class="pagination">
	            			<li
									class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
									href="${pageContext.request.contextPath}/user/course/pagination?currentPage=1&pageSize=${pageSize}&sort=${sort}"
									class="page-link">First</a>
	                    </li>
	                    
	                     <li
									class="${currentPage > 1 ? 'page-item' : 'page-item disabled'}">
	                        <a
									href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}"
									class="page-link">Previous</a>
	                    </li>
	                 <c:if test="${totalPages <= 5 && currentPage <= 5 }">
		                <c:forEach begin="0" end="${totalPages - 1}"
										var="page">
		                    <li
											class="${currentPage == page + 1 ? 'page-item active' : 'page-item' }">
		                        <a
											href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
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
											href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
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
											href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${page1}&pageSize=${pageSize}&sort=${sort}"
											class="page-link">${page1}</a>
			                    </li>
			                </c:forEach>
		                   
		                 <li class="page-item active">
		                        <a
										href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${currentPage}&pageSize=${pageSize}&sort=${sort}"
										class="page-link">${currentPage}</a>
		                    </li>
		               	  <c:forEach begin="${currentPage}"
										end="${currentPage <= totalPages - 2 ? currentPage + 1 : currentPage}"
										var="page2">
		                    <li
											class="${currentPage == page2 + 1 ? 'page-item active' : 'page-item' }">
		                        <a
											href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${page2 + 1}&pageSize=${pageSize}&sort=${sort}"
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
											href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${page + 1}&pageSize=${pageSize}&sort=${sort}"
											class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
	               		</c:if>
	                 
	                  <!--  // end number of page -->
	              
	                     <li
									class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
									href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}"
									class="page-link">Next</a>
	                    </li>
	                      <li
									class="${currentPage < totalPages ? 'page-item' : 'page-item disabled'}">
	                        <a
									href="${pageContext.request.contextPath}/user/course/pagination?currentPage=${totalPages }&pageSize=${pageSize}&sort=${sort}"
									class="page-link">Last</a>
	                    </li>
	            </ul>
	              </div>
	       
	    </c:if>
	    </div>
				<!-- end row -->
        </div>
			<!-- end container -->
    </div>
		<!-- end section -->


	
	
	</jsp:attribute>
</mt:layout_user>