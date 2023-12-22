<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav.pagination ul{
	list-style: none;
}
nav.pagination li{
	display: inline-block;
}
</style>
</head>

<body>

    <!-- Breadcrumb Section Begin (배너) -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>보호중인 유기 동물</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">유기동물 보호센터</a>
                            <!-- <span>Blog</span> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        
                        <div class="sidebar__item">
                            <h4>유기동물 보호센터</h4>
                            <ul>
                                <li><a href="../losedog/losedog.do">강아지를 찾아주세요</a></li>
                                <li><a href="../losecat/losecat.do">고양이를 찾아주세요</a></li>
                                <li><a href="../animal/animal.do">보호중인 유기동물</a></li>
                            </ul>
                        </div>
                        
                        <%-- <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="#">All</a></li>
                                <li><a href="#">Beauty (20)</a></li>
                                <li><a href="#">Food (5)</a></li>
                            </ul>
                        </div> --%>
                        
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
                        
                        <%--<div class="blog__sidebar__item">
                            <h4>Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Apple</a>
                                <a href="#">Beauty</a>
                                <a href="#">Vegetables</a>
                                <a href="#">Fruit</a>
                                <a href="#">Healthy Food</a>
                                <a href="#">Lifestyle</a>
                            </div>
                        </div> --%>
                        
                    </div>
                </div>
                
                <%-- 리스트 --%>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                      <c:forEach var="vo" items="${anilist }">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic missing_pic" style="background-image: url('${vo.keepimage }'); border-radius: 10px;overflow: hidden;">
									
                              <a href="../animal/animaldetail.do?kano=${vo.kano }">
                              </a>
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i>${vo.keepwriter }</li>
                                        <li><i class="fa fa-comment-o"></i>${vo.keepregdate }</li>
                                    </ul>
                                   
                                    <h5><a href="../animal/animaldetail.do?kano=${vo.kano }">${vo.keeptitle }</a></h5>
                                    <p>${vo.keepcontent } </p>
                                    <%-- <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a> --%>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                  <%-- 페이지 --%>
                  <nav class="pagination">
                  <div class="product__pagination" style="margin: 0px auto;">
			        <ul>
			         <%-- startPage : 1 , 11 , 21 , 31... --%>
			         <c:if test="${startPage>1 }">
			          <li><a href="../animal/animal.do?page=${startPage-1 }">&laquo;</a></li>
			         </c:if>
			         
			         <c:forEach var="i" begin="${startPage }" end="${endPage }">
			            <li ${curpage==i?"class=current":"" }><a href="../animal/animal.do?page=${i }">${i }</a></li>
			         </c:forEach>
			         
			          
			         <c:if test="${endPage<totalpage }">
			          <li><a href="../animal/animal.do?page=${endPage+1 }">&raquo;</i></a></li>
			         </c:if>
			        </ul>
			      </div>
			      </nav>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->



</body>
</html>