<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function noId(){
	alert('로그인 후 이용가능합니다.')
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                           <ul>
                              <li class="aaa"><i class="fa fa-envelope"></i> PETSTIVAL@gmail.com</li>
                              <li>Give the gift of love to your little family</li>
                           </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                          <c:if test="${sessionScope.admin=='y' }">
                           <div class="header__top__right__auth">
                            <a href="../adminPage/ad_page.do"><i class="fa fa-user"></i> Adminpage</a>
                            </div>
                          </c:if>
                          <c:if test="${sessionScope.id!=null }">
                            &nbsp;&nbsp;
                            <div class="header__top__right__auth">
                                <a href="../member/logout.do"><i class="fa fa-user"></i> Logout</a>
                            </div>
                           </c:if>
                           <c:if test="${sessionScope.admin=='n' }">
                            &nbsp;&nbsp;
                            <div class="header__top__right__auth">
                            <a href="../mypage/mypage.do"><i class="fa fa-user"></i> Mypage</a>
                            </div>
                          </c:if>
                          <c:if test="${sessionScope.id==null }">
                            &nbsp;&nbsp;
                            <div class="header__top__right__auth">
                                <a href="../member/login.jsp"><i class="fa fa-user"></i> Login</a>
                            </div>
                            &nbsp;&nbsp;
                            <div class="header__top__right__auth">
                                <a href="../member/join.jsp"><i class="fa fa-user"></i> Join</a>
                            </div>
                           </c:if>
                           
                           
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                       <a href="../main/main.do">
                       <h2>PETSTIVAL<img src="../img/mainlogo.png" width="35px" height="35px">
                       </h2>
                       </a>
                    </div>
                 </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="../product/ProductList.do">SHOP</a>
                               <ul class="header__menu__dropdown">
                                   <li><a href="../product/ProductList.do">전체상품</a></li>
                                    <li><a href="../product/ProductList.do?ct=사료">사료</a></li>
                                    <li><a href="../product/ProductList.do?ct=간식">간식</a></li>
                                    <li><a href="../product/ProductList.do?ct=배변/위생">배변/위생</a></li>
                                    <li><a href="../product/ProductList.do?ct=목욕/미용">목욕/미용</a></li>
                                    <li><a href="../product/ProductList.do?ct=장난감">장난감</a></li>
                                    <li><a href="../product/ProductList.do?ct=건강관리">건강관리</a></li>
                                    <li><a href="../product/ProductList.do?ct=식기">식기</a></li>
                                    <li><a href="../product/ProductList.do?ct=산책/이동장">산책/이동장</a></li>
                                    <li><a href="../product/ProductList.do?ct=하우스/울타리">하우스/울타리</a></li>
                                    <li><a href="../product/ProductList.do?ct=의류/악세서리">의류/악세서리</a></li>
                                </ul>
                            </li>
                            <li><a href="../main/main.do">HEALTH</a>
                               <ul class="header__menu__dropdown">
                                    <li><a href="../health/hsptmain.do">병원 검색하기</a></li>
                                    <li><a href="../health/newsmain.do">펫케어 콘텐츠</a></li>

                                </ul>
                            </li>
                            <li><a href="../stay/list.do">HOTEL</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../stay/list.do">호텔 목록</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="../reserve/reserve_hotel.do">호텔 예약하기</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <li><a href="#">FUNERAL</a>
                               <ul class="header__menu__dropdown">
                                    <li><a href="../FuneralDetail/produce.do">장례 절차 안내</a></li>
                                    <li><a href="../FuneralDetail/list_f.do">장례식장 전체목록</a></li>
                                    <li><a href="../FuneralDetail/search_f.do">장례식장 검색하기</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="../reserve/reserve_funeral.do">장례식장 예약하기</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <li><a href="#">COMMUNITY</a>
                               <ul class="header__menu__dropdown">
                                    <li><a href="../freeboard/list.do">자유게시판</a></li>
                                    <li><a href="../notice/list.do">공지사항</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                        	<c:if test="${sessionScope.id!=null }">
                            <li><a href="../mypage/my_res.do"><i class="fa fa-heart"></i> <span>${likeNum }</span></a></li>
                            </c:if>
                            <c:if test="${sessionScope.id!=null }">
                            <li><a href="../shopping/shoppingCart.do"><i class="fa fa-shopping-bag"></i> <span>${cartNum}</span></a></li>
                            </c:if>
                            
                            <c:if test="${sessionScope.id==null }">
                            <li><a href="#" onclick="noId()"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
                            </c:if>
                        </ul>
                        <div class="header__cart__price"> <span></span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>ETC</span>
                        </div>
                        <ul>
                            <li style="font-weight: 700;"><a href="#"><i class="xi-home"></i>&nbsp;유기견 보호 센터</a></li>
                            <li style="text-indent: 20px"><a href="../losedog/losedog.do">실종 강아지 목록</a></li>
                            <li style="text-indent: 20px"><a href="../losecat/losecat.do">실종 고양이 목록</a></li>
                            <li style="text-indent: 20px"><a href="../animal/animal.do">보호중인 유기 동물</a></li>
                            <li style="font-weight: 700;"><a href="#"><i class="xi-walk"></i>&nbsp;반려동물 산책로</a></li>
                            <li style="text-indent: 20px"><a href="../walk/walkList.do">가까운 산책로 찾기</a></li>
                            <li style="font-weight: 700;"><a href="#"><i class="xi-heart"></i>&nbsp;마이펫 관리</a></li>
                            <li style="text-indent: 20px">
                            <c:if test="${empty sessionScope.id}">
                            <a href="../member/login.jsp">마이펫 등록</a>
                            </c:if>
                            <c:if test="${not empty sessionScope.id}">
                            <a href="../mypage/my_petreg.do">마이펫 등록</a>
                            </c:if>
                            </li>
                            <li style="text-indent: 20px">
                            <c:if test="${empty sessionScope.id}">
                            <a href="../member/login.jsp">마이펫 관리</a>
                            </c:if>
                            <c:if test="${not empty sessionScope.id}">
                            <a href="../mypage/my_petinfo.do">마이펫 관리</a>
                            </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="hero__search__phone__text">
                              <c:if test="${sessionScope.id!=null }">
                                <h5>${sessionScope.name }(${sessionScope.admin=='y'?"관리자":"일반사용자" })님</h5>
                                <span>환영합니다</span>
                              </c:if>
                              <c:if test="${sessionScope.id==null }">
                                <h5>회원가입을 통해</h5>
                                <span>더 많은 기능을!!</span>
                              </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
</body>
</html>