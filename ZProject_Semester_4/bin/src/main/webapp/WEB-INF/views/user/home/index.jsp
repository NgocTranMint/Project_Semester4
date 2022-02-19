<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:layout_user title="Home">
	
	<jsp:attribute name="content">
	<h3>Home</h3>
	<div class="title">
                    <span class="title_icon">
                        <img src="${pageContext.request.contextPath}/resources/user/images/bullet1.gif"
                             alt="" title="" />
                    </span>Featured products
                </div>

                <div class="feat_prod_box">

                    <div class="prod_img">
                        <a href="details.html">
                            <img src="${pageContext.request.contextPath}/resources/user/images/prod1.gif" alt=""
                                 title="" border="0" />
                        </a>
                    </div>

                    <div class="prod_det_box">
                        <div class="box_top"></div>
                        <div class="box_center">
                            <div class="prod_title">Product name</div>
                            <p class="details">
                                Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation.
                            </p>
                            <a href="details.html" class="more">- more details -</a>
                            <div class="clear"></div>
                        </div>

                        <div class="box_bottom"></div>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="feat_prod_box">

                    <div class="prod_img">
                        <a href="details.html">
                            <img src="${pageContext.request.contextPath}/resources/user/images/prod2.gif" alt=""
                                 title="" border="0" />
                        </a>
                    </div>

                    <div class="prod_det_box">
                        <div class="box_top"></div>
                        <div class="box_center">
                            <div class="prod_title">Product name</div>
                            <p class="details">
                                Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation.
                            </p>
                            <a href="details.html" class="more">- more details -</a>
                            <div class="clear"></div>
                        </div>

                        <div class="box_bottom"></div>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="title">
                    <span class="title_icon">
                        <img src="${pageContext.request.contextPath}/resources/user/images/bullet2.gif"
                             alt="" title="" />
                    </span>New products
                </div>
                <div class="new_products">

                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                            <span class="new_icon">
                                <img src="${pageContext.request.contextPath}/resources/user/images/new_icon.gif"
                                     alt="" title="" />
                            </span> <a href="details.html">
                                <img src="${pageContext.request.contextPath}/resources/user/images/thumb1.gif" alt="" title="" class="thumb" border="0" />
                            </a>
                        </div>
                    </div>

                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                            <span class="new_icon">
                                <img src="${pageContext.request.contextPath}/resources/user/images/new_icon.gif"
                                     alt="" title="" />
                            </span> <a href="details.html">
                                <img src="${pageContext.request.contextPath}/resources/user/images/thumb2.gif" alt="" title="" class="thumb" border="0" />
                            </a>
                        </div>
                    </div>

                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                            <span class="new_icon">
                                <img src="${pageContext.request.contextPath}/resources/user/images/new_icon.gif"
                                     alt="" title="" />
                            </span> <a href="details.html">
                                <img src="${pageContext.request.contextPath}/resources/user/images/thumb3.gif" alt="" title="" class="thumb" border="0" />
                            </a>
                        </div>
                    </div>

                </div>

                <div class="clear"></div>
	</jsp:attribute>
</mt:layout_user>