<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<mt:layout_user title="Contact">
	
	<jsp:attribute name="content">
		
		
	<div class="all-title-box">
		<div class="container text-center">
			<h1>Contact<span class="m_1">Lorem Ipsum dolroin gravida nibh vel velit.</span></h1>
		</div>
	</div>
	
    <div id="contact" class="section wb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Need Help? Sure we are Online!</h3>
                <p class="lead">Let us give you more details about the special offer website you want us. Please fill out the form below. <br>We have million of website owners who happy to work with us!</p>
            </div><!-- end title -->
			<div>
				<h3>${msg }</h3>
			</div>
            <div class="row">
                <div class="col-xl-6 col-md-6 col-sm-6">
                    <div class="contact_form">
                        <div id="message"></div>
                        <p style="color: yellow;">* Please enter your correct email, if it is wrong, you will not receive a feedback letter, thank you !!!</p>
                        <s:form method="post" modelAttribute="email" action="${pageContext.request.contextPath }/user/contact/success">
                            <div class="row row-fluid">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <s:input path="fullname" class="form-control" placeholder="Fullname"/>
                                </div>
                               <div class="col-lg-12 col-md-12 col-sm-12">
                                    <s:input path="emailUser" name="email" class="form-control" placeholder="Your Email"/>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <s:input path="phoneNumber" name="phone" class="form-control" placeholder="Your Phone"/>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <s:input path="title" name="title" class="form-control" placeholder="Title"/>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                	<s:textarea path="content" name="content" class="form-control" rows="6" placeholder="Give us more details.."/>
                                </div>
                                <div class="text-center pd">
                                    <input type="submit" value="SEND" class="btn btn-light btn-radius btn-brd grd1 btn-block">Get a Quote</button>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div><!-- end col -->
                <div class="col-xl-1 col-md-1 col-sm-1"></div>
				<div class="col-xl-5 col-md-5 col-sm-5">
					<div class="map-box">
						<div id="custom-places" class="small-map">
							<div class="mapouter">
								<div class="gmap_canvas">
									<iframe width="600" height="750" id="gmap_canvas" src="https://maps.google.com/maps?q=212-214%20Nguy%E1%BB%85n%20%C4%90%C3%ACnh%20Chi%E1%BB%83u%20ph%C6%B0%E1%BB%9Dng%206%20qu%E1%BA%ADn%203%20%20th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh%20Vi%E1%BB%87t%20Nam&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
									<a href="https://fmovies-online.net"></a><br>
									<style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style>
									<a href="https://www.embedgooglemap.net">add google maps to html</a>
									<style>.gmap_canvas {overflow:hidden;background:none!important;height:750px;width:600px;}</style>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	

	</jsp:attribute>
</mt:layout_user>

