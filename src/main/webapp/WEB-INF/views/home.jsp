<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

 <!-- Carousel Start -->
 <div class="container-fluid px-0 mb-5">
    <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="w-100" src="../resources/img/home2.jpg" alt="Image">
                <div class="carousel-caption">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7 text-center">
                                <p class="fs-4 text-white animated zoomIn">애니포와 함께 하는</p>
                                <h1 class="display-1 text-dark mb-4 animated zoomIn">입양문화</h1>
                                <a href="/shelter/list" class="btn btn-light rounded-pill py-3 px-5 animated zoomIn">입양하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="w-100" src="../resources/img/home2.jpg" alt="Image">
                <div class="carousel-caption">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7 text-center">
                                <p class="fs-4 text-white animated zoomIn">Welcome to <strong class="text-dark">TEA House</strong></p>
                                <h1 class="display-1 text-dark mb-4 animated zoomIn">Organic & Quality Tea Production</h1>
                                <a href="" class="btn btn-light rounded-pill py-3 px-5 animated zoomIn">Explore More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!-- Carousel End -->

    <!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5">
            <div class="wow fadeIn" data-wow-delay="0.5s">
                <div class="section-title">
                    <p class="fs-5 fw-medium fst-italic text-primary">함께 만들어가는 행복</p>
                    <h1 class="display-6">유기된 동물의 새 가족을 함께 찾아주세요 🔍</h1>
                </div>
                <div class="row g-3 mb-4">
                    <div class="col-sm-4">
                        <img class="img-fluid bg-white w-100" src="../resources/img/about-5.jpg" alt="">
                    </div>
                    <div class="col-sm-8">
                        <h5>반려동물, 사지 말고❌ 입양하세요⭕️</h5>
                        <p class="mb-0">영문도 모른채 버려지는 아이들...<br /> 애니포는 유기동물 입양캠페인에 함께하고 있습니다!</p>
                    </div>
                </div>
                <div class="border-top mb-4"></div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
	<div>
		 <img src="../resources/img/home1.png" alt="">
	</div>
    <!-- Store Start -->
    
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium fst-italic text-primary">입양 후기</p>
                <h1 class="display-6">~~~입양후기~~~</h1>
            </div>
            <div class="row g-4">
            
		        <c:if test="${list.size() != 0}">
					<c:forEach items="${list}" var="review">
		               	<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
		                    <div class="store-item position-relative text-center">
								<img src="/display?fileName=${review.fullName}"/>
		                        <div class="p-4">
		                            <div class="text-center mb-3">
		                                <small class="fa fa-star text-primary"></small>
		                            </div>
		                            <h4 class="mb-3"><c:out value="${review.title}" /></h4>
		                            <p><c:out value="${review.content}" /></p>
		                        </div>
		                        <div class="store-overlay">
		                        <a href="/review/view?rno=${review.rno}" 
								class="btn btn-primary rounded-pill py-2 px-4 m-2">
		                            보러가기<i class="fa fa-arrow-right ms-2"></i></a>
		                        </div>
		                    </div>
		               </div>
	               </c:forEach>
               </c:if>
               <c:if test="${list.size() == 0}">
					<ul>
				  		<li>
				  			등록된 후기가 없습니다.
				  		</li>
				  	</ul>
			  	</c:if>
                <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                    <a href="/review/list" class="btn btn-primary rounded-pill py-3 px-5">후기 더보기+</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Store End -->


    <!-- Contact Start -->
    <div class="container-xxl contact py-5">
        <div class="container">
            <div class="section-title text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium fst-italic text-primary">Contact Us</p>
                <h1 class="display-6">다양한 소식을 만나보세요!</h1>
            </div>
            <div class="row justify-content-center wow fadeInUp" data-wow-delay="0.1s">
                <div class="col-lg-8">
                    <p class="text-center mb-5"><a href="https://instagram.com/eeein_97?igshid=MzMyNGUyNmU2YQ==">eeein_97</a></p>
                    <div class="row g-5">
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.3s">
                            <img class="img-fluid bg-white w-100" src="../resources/img/about-6.jpg" alt="">
                        </div>
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.4s">
                        	사진삽입
                        </div>
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.5s">
                            사진삽입
                        </div>
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.5s">
                            사진삽입
                        </div>
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.5s">
                            사진삽입
                        </div>
                        <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.5s">
                            사진삽입
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact Start -->

<%@ include file="./includes/footer.jsp" %>    
