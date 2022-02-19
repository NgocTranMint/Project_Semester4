<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:layout_user title="Payment">

	<jsp:attribute name="content">
	
	<div class="container">
	
	
    <div id="contact" class="section wb">
        <div class="container" style="max-width: 1350px;">
            <div class="section-title text-center">
                <h3>Payment takes your multiple-choice tests</h3>
                <p class="lead">You can review the multiple choice tests that you have done.</p>
            </div>
               
            <table class="table table-striped table-hover">
							<thead>
								<tr>
									
									<th></th>
									<th>Title</th>
									<th>Fee</th>
									<th>DatePaid</th>
									<th>Action</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="payment" items="${payments }" varStatus="i">
									<tr>
									
									<td>${i.index + 1 }</td>
									<td> <span class="text-primary">${payment.title }</span></td>
									<td><span class="text-danger">$ ${payment.fee } </span></td>
									<td>
									<fmt:formatDate var="datePaid" value="${payment.datePaid}"
														pattern="dd/MM/yyyy HH:mm:ss" />
									${datePaid }</td>
									<td>
									
										<div class="course-rating">
												<p>
												<a
													href="${pageContext.request.contextPath }/user/payment/paydetails?payId=${payment.payId }"
													class="btn btn-info" role="button">Details</a>
													
												</p>			
										</div>
									</td>
									
								</tr>
								</c:forEach>
							</tbody>
						</table>
            
        </div>       
    </div>
	</div>
	
	
	</jsp:attribute>
</mt:layout_user>

