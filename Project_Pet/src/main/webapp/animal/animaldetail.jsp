<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.blog__details__text a {
	font-size: 16px;
	color: #6f6f6f;
	background: #f5f5f5;
	display: inline-block;
	padding: 7px 26px 5px;
	margin-right: 6px;
	margin-bottom: 10px;
}
</style>
</head>

<body>
    <!-- Page Preloder -->
   <!--   <div id="preloder">
        <div class="loader"></div>
    </div> -->


    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">

                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${avo.keeptitle }</h2>
                        <ul>
                            <li>${avo.keepfoundloc }</li>
                            <li>${avo.keeploc }</li>
                            <li>${avo.keepwriter }</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>유기동물 보호센터</h4>
                            <ul>
                                <li style="font-weight: bold;"><a href="../losedog/losedog.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;강아지를 찾아주세요</a></li>
                                <li style="font-weight: bold;"><a href="../losecat/losecat.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;고양이를 찾아주세요</a></li>
                                <li style="font-weight: bold;"><a href="../animal/animal.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;보호중인 유기동물</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Recent News</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Apple</a>
                                <a href="#">Beauty</a>
                                <a href="#">Vegetables</a>
                                <a href="#">Fruit</a>
                                <a href="#">Healthy Food</a>
                                <a href="#">Lifestyle</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 본 내용 -->
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        
                        
                        <!--  <h3>${avo.keepregdate }</h3> -->
                        <h3>${avo.keeptitle }</h3>
                        <hr>
                        <div class="text-center">
                         <p>${avo.keepregdate } | ${avo.keepfoundloc } | ${avo.keepwriter }</p>
                        </div><br>
                        <img src="${avo.keepimage }" alt="" style="border-radius: 10px;overflow: hidden;">
                        
                        <p>${avo.keepcontent }</p>
                        <br><br>
                        <a href="javascript:history.back()" class="text-right">목록</a>
                        
                         <c:if test="${sessionScope.id!=null }">
                             <c:if test="${wish_count==0 }">
                               <a href="../animal/wish_insert.do?kano=${avo.kano }" class="primary-btn" style="font-weight: bold;"><i class="xi-heart-o"></i> 입양희망</a>
                             </c:if>
                             <c:if test="${wish_count!=0 }">
                               <span class="primary-btn" style="font-weight: bold;"><i class="xi-heart"></i> 입양희망 완료</span>
                               <a href="../mypage/my_wish.do" class="primary-btn" style="font-weight: bold;">마이페이지 취소이동</a>
                             </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>Post You May Like</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Blog Section End -->



</body>
</html>