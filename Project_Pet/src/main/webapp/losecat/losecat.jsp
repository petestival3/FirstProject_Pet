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
.product__pagination li.active,
.blog__pagination li.active {
	background: #5a70e9;
	border-color: #a6a6a6;
	color: #ffffff;
}
.cListTitle{
	display: block;
	margin: 0px auto;
	width: 280px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 15px;
}
.sidebar__item ul li a {
	font-size: 16px;
	color: #666666;
	line-height: 48px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}
.sidebar__item ul li a:hover {
	color: #5a70e9;
}
.product__discount__item__text h5 a {
	color: #1c1c1c;
}
a {
    color: black;
    text-decoration: none;
    background-color: transparent;
}
a:hover {
	color: #5a70e9;
}
</style>
</head>

<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>고양이를 찾아주세요</h2>
                        <div class="breadcrumb__option">
                           <%--  <a href="./index.html">유기동물 보호센터&nbsp;&nbsp;</a>--%>
                            <span>유기동물 보호센터&nbsp;&nbsp;-&nbsp;&nbsp;Cats</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>유기동물 보호센터</h4>
                            <ul>
                                <li style="font-weight: bold;"><a href="../losedog/losedog.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;강아지를 찾아주세요</a></li>
                                <li style="font-weight: bold;"><a href="../losecat/losecat.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;고양이를 찾아주세요</a></li>
                                <li style="font-weight: bold;"><a href="../animal/animal.do"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;보호중인 유기동물</a></li>
                            </ul>
                        </div>
                        
                        <!-- 쿠키 -->
                        <!-- 
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        -->
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                
                <!-- Sale Off 상단 3개 -->
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Help</h2>
                        </div>
                        <div class="row">
                        
                            <div class="product__discount__slider owl-carousel">
                             <c:forEach var="cList" items="${cTopList }">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${cList.cimage }">
                                            <div class="product__discount__percent">help!</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>${cList.closedate }</span>
                                            <h5><a href="../losecat/losecatdetail.do?lcno=${cList.lcno }" class="cListTitle">${cList.ctitle }</h5>
                                            <div class="product__item__price">${cList.closeinfo }</a></div>
                                        </div>
                                    </div>
                                </div>
                             </c:forEach>
                              
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>12</span> Cats found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                    
                    <!-- 리스트 -->
                    <c:forEach var="lcvo" items="${lcList }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                              <a href="../losecat/losecatdetail.do?lcno=${lcvo.lcno }">
                              <div class="product__item__pic set-bg" data-setbg="${lcvo.cimage }" style="border-radius: 10px;overflow: hidden;"></a>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <a href="../losecat/losecatdetail.do?lcno=${lcvo.lcno }">
                                    <h5>${lcvo.ctitle }</h5></a><br>
                                    <h6><a href="../losecat/losecatdetail.do?lcno=${lcvo.lcno }">${lcvo.closeinfo }</a></h6>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                    </div>
                        
                   <%-- 페이지 --%>
                  <nav class="pagination">
                  <div class="product__pagination" style="margin: 0px auto;">
			        <ul>
			         <%-- startPage : 1 , 11 , 21 , 31... --%>
			         <c:if test="${startPage>1 }">
			          <li><a href="../losecat/losecat.do?page=${startPage-1 }">&laquo;</a></li>
			         </c:if>
			         
			         <c:forEach var="i" begin="${startPage }" end="${endPage }">
			            <li ${curpage==i?"class=active":"" }><a href="../losecat/losecat.do?page=${i }">${i }</a></li>
			         </c:forEach>
			         
			          
			         <c:if test="${endPage<totalpage }">
			          <li><a href="../losecat/losecat.do?page=${endPage+1 }">&raquo;</i></a></li>
			         </c:if>
			        </ul>
			      </div>
			      </nav>
			      
                </div>
            </div>

    </section>
    <!-- Product Section End -->



</body>
</html>