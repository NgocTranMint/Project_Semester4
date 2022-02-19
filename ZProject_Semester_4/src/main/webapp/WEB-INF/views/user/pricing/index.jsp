<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ss" uri="http://www.springframework.org/security/tags"%>
<mt:layout_user title="Pricing">

	<jsp:attribute name="content">
	<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
		function getpackid(packID) {

			var packId = packID;
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath }/user/ajax/sessionpackid',
						data : {
							packId : packId
						}
					});

		};
	</script>
	
	<div class="all-title-box">
		<div class="container text-center">
			<h1>Pricing<span class="m_1">Lorem Ipsum dolroin gravida nibh vel velit.</span>
				</h1>
		</div>
	</div>
	
    <div id="pricing-box" class="section wb">
        <div class="container">
			<div class="row">
            </div>
		</div>
    </div>
    
    <div id="plan" class="section lb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Choose Your Plan</h3>
                <p>Lorem ipsum dolor sit aet, consectetur adipisicing lit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
            </div>
				<!-- end title -->
			<c:if test="${result == true }">
				
				<div style="margin: auto; text-align: center;" class="col-md-6">
					 <div class="pricing-table pricing-table-highlighted">
	                      <div class="pricing-table-header grd1">
	                           <h2>${accountPack.pack.fee } $</h2>
	                           <h3>${accountPack.pack.title }</h3>
	                           <h4 style="color: white;">${accountPack.pack.description }</h4>
	                      </div>
	                      <div class="pricing-table-space"></div>
	                      <div class="pricing-table-features">
	                            <p>
										<i class="fa fa-envelope-o"></i> <strong>Unlimited test</strong> </p>
	                            <p>
										<i class="fa fa-rocket"></i> <strong>More Details of Quiz</strong></p>
	                            <p>
										<i class="fa fa-database"></i> <strong>High Income(Faculty)</strong> </p>
	                            <p>
										<i class="fa fa-link"></i> <strong>FeedBack to Admin</strong></p>
	                           
	                      </div>
	                  </div>
	             </div>
				            
			</c:if>
            <c:if test="${result == false }">
            	<div class="row">
	                <div class="col-md-6 offset-md-3">
	                    <div class="message-box">
	                        <ul class="nav nav-pills nav-stacked"
									id="myTabs">
	                            <li><a class="active" href="#tab1"
										data-toggle="pill">Monthly Subscription</a></li>
	                            <li><a href="#tab2" data-toggle="pill">Yearly Subscription</a></li>
	                        </ul>
	                    </div>
	                </div>
						<!-- end col -->
	            </div>
	
	            <hr class="invis">
	
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="tab-content">
	                        <div class="tab-pane active fade show"
									id="tab1">
	                            <div class="row text-center">
	                            <c:forEach var="pack" items="${packs }"
											varStatus="i">
	                                <c:if test="${pack.expiry < 365 }">
	                                	<div class="col-md-4">
	                                    <div
														class="pricing-table pricing-table-highlighted">
	                                        <div
															class="pricing-table-header grd1">
	                                            <h2>${pack.fee } $</h2>
	                                            <h3>${pack.title }</h3>
	                                            <h4 style="color: white;">${pack.description }</h4>
	                                        </div>
	                                        <div
															class="pricing-table-space"></div>
	                                        <div
															class="pricing-table-features">
	                                           <p>
										<i class="fa fa-envelope-o"></i> <strong>Unlimited test</strong> </p>
	                            <p>
										<i class="fa fa-rocket"></i> <strong>More Details of Quiz</strong></p>
	                            <p>
										<i class="fa fa-database"></i> <strong>High Income(Faculty)</strong> </p>
	                            <p>
										<i class="fa fa-link"></i> <strong>FeedBack to Admin</strong></p>
	                           
	                                        </div>
	                                        <div
															class="pricing-table-sign-up">
	                                            <%-- <a href="#" class="hover-btn-new orange"><span>Order Now</span></a> --%>
	                                            <s:form method="get"
																action="${posturl }">
																<!-- ${pageContext.request.contextPath }/user/pricing/success -->
													<input type="hidden" name="item_number_1"
																	value="${pack.packId }">
													<input type="hidden" name="item_name_1"
																	value="${pack.title }">
													<input type="hidden" name="amount_1" value="${pack.fee }">
													<input type="hidden" name="quantity_1" value="1">
													<br>
																<br>
													<ss:authorize access="hasRole('ROLE_USER_CANDIDATE')">
													
													<input type="submit" value="Buy"
																		style="background-color: black;"
																		class="hover-btn-new orange" id="${pack.packId}"
																		onclick="getpackid(id);">
													</ss:authorize>
													<input type="hidden" name="upload" value="1" /> 
													<input type="hidden" name="return" value="${returnurl }" /> 
													<input type="hidden" name="cmd" value="_cart" /> 
													<input type="hidden" name="business" value="${business }" />
						                		</s:form>
	                                        </div>
	                                    </div>
	                                </div>
	                                </c:if>
	                               </c:forEach>
	                            </div>
									<!-- end row -->
	                        </div>
								<!-- end pane -->
	
	                        <div class="tab-pane fade" id="tab2">
	                            <div class="row text-center">
	                                <c:forEach var="pack" items="${packs }"
											varStatus="i">
	                                <c:if test="${pack.expiry >= 365 }">
	                                	<div class="col-md-4">
	                                    <div
														class="pricing-table pricing-table-highlighted">
	                                        <div
															class="pricing-table-header grd1">
	                                            <h2>${pack.fee } $</h2>
	                                            <h3>${pack.title }</h3>
	                                            <h4 style="color: white;">${pack.description }</h4>
	                                        </div>
	                                        <div
															class="pricing-table-space"></div>
	                                        <div
															class="pricing-table-features">
	                                            <p>
										<i class="fa fa-envelope-o"></i> <strong>Unlimited test</strong> </p>
	                            <p>
										<i class="fa fa-rocket"></i> <strong>More Details of Quiz</strong></p>
	                            <p>
										<i class="fa fa-database"></i> <strong>High Income(Faculty)</strong> </p>
	                            <p>
										<i class="fa fa-link"></i> <strong>FeedBack to Admin</strong></p>
	                           
	                                        </div>
	                                        <div
															class="pricing-table-sign-up">
	                                            <%-- <a href="#" class="hover-btn-new orange"><span>Order Now</span></a> --%>
	                                            <s:form method="get"
																action="${posturl }">
													<input type="hidden" name="item_number_1" value="${pack.packId }">
													<input type="hidden" name="item_name_1" value="${pack.title }">
													<input type="hidden" name="amount_1" value="${pack.fee }">
													<input type="hidden" name="quantity_1" value="1">
													<br>
																<br>
													<ss:authorize access="hasRole('ROLE_USER_CANDIDATE')">
													<input type="submit" value="Buy"
																		style="background-color: black;"
																		class="hover-btn-new orange" id="${pack.packId}"
																		onclick="getpackid(id);">
													</ss:authorize>
													<input type="hidden" name="upload" value="1" /> 
													<input type="hidden" name="return" value="${returnurl }" /> 
													<input type="hidden" name="cmd" value="_cart" /> 
													<input type="hidden" name="business" value="${business }" />
						                		</s:form>
	                                        </div>
	                                    </div>
	                                </div>
	                                </c:if>
	                               </c:forEach>
	                            </div>
									<!-- end row -->
	                        </div>
								<!-- end pane -->
	                    </div>
							<!-- end content -->
	                </div>
						<!-- end col -->
	            </div>
					<!-- end row -->
	        
            </c:if>
        </div>
			<!-- end container -->
    </div>
		<!-- end section -->

    <div id="testimonials" class="parallax section db parallax-off"
			style="background-image:url('${pageContext.request.contextPath }/resources/user/images/parallax_04.jpg');">
        <div class="container">
            <div class="section-title text-center">
                <h3>Testimonials</h3>
                <p>Lorem ipsum dolor sit aet, consectetur adipisicing lit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
            </div>
				<!-- end title -->

            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="testi-carousel owl-carousel owl-theme">
                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_01.png"
										alt="" class="img-fluid">
                                <h4>James Fernando </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Wonderful Support!</h3>
                                <p class="lead">They have got my project on time with the competition with a sed highly skilled, and experienced & professional team.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_02.png"
										alt="" class="img-fluid">
                                <h4>Jacques Philips </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Awesome Services!</h3>
                                <p class="lead">Explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you completed.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_03.png"
										alt="" class="img-fluid ">
                                <h4>Venanda Mercy </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Great & Talented Team!</h3>
                                <p class="lead">The master-builder of human happines no one rejects, dislikes avoids pleasure itself, because it is very pursue pleasure. </p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->
                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_01.png"
										alt="" class="img-fluid">
                                <h4>James Fernando </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Wonderful Support!</h3>
                                <p class="lead">They have got my project on time with the competition with a sed highly skilled, and experienced & professional team.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_02.png"
										alt="" class="img-fluid">
                                <h4>Jacques Philips </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Awesome Services!</h3>
                                <p class="lead">Explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you completed.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<div class="testi-meta">
                                <img
										src="${pageContext.request.contextPath }/resources/user/images/testi_03.png"
										alt="" class="img-fluid">
                                <h4>Venanda Mercy </h4>
                            </div>
                            <div class="desc">
                                <h3>
										<i class="fa fa-quote-left"></i> Great & Talented Team!</h3>
                                <p class="lead">The master-builder of human happines no one rejects, dislikes avoids pleasure itself, because it is very pursue pleasure. </p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
							<!-- end testimonial -->
                    </div>
						<!-- end carousel -->
                </div>
					<!-- end col -->
            </div>
				<!-- end row -->
        </div>
			<!-- end container -->
    </div>
		<!-- end section -->

    
	</jsp:attribute>
</mt:layout_user>