<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.breadcrumb-section{
    margin: 50px 0;
}

/*검색하기 사이드 메뉴*/
.search_submenu{
	background-color: #5a70e9;
	text-align: center;
	border-radius: 50%;
	position: fixed;
	right: 150px;
	top: 600px;
	width: 100px;
	height: 100px;
}
.search_submenu a{
	display: block;
}
.search_submenu i{
	margin-top: 20px;
	font-size: 25px;
	color: #fff !important;
}
.search_submenu p{
	color: #fff;
}
.search_submenu:hover{
	 box-shadow: 0 10px 10px 10px rgba(90,112,233, 0.2);
	 transition: all 0.4s ease-in-out;
	 transform: translateY(-25px);
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
                        <h2>Funeral Arrangements</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>Funeral</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- 예약 사이드 매뉴 시작 -->
    <div class="res_submenu">
      <a href="../reserve/reserve_funeral.do">
       <i class="xi-calendar-add"></i>
       <p>예약하기</p>
      </a>
    </div>
    <!-- 예약 사이드 매뉴 종료 -->
    
    <!-- 검색 사이드 매뉴 시작 -->
	<div class="search_submenu">
		<a href="search_f.do"> <i class="xi-search"></i>
			<p>검색하기</p>
		</a>
	</div>
	<!-- 검색 사이드 매뉴 종료 -->
    
    <!-- 장례절차 반복 시작 -->
    <!-- 장례절차 1번만 사진때문에 빼둠 -->
    <div class="text-center funeral_produce_all container">
        <img src="../img/pro1.jpg" style="border-radius: 50px;overflow: hidden;"/>
        <div class="funeral_produce_text">
          <span>1</span>
          <h3>장례예약</h3>
          <p>아이가 무지개 다리를 건너면 대표번호(1688-1240) 또는 온라인 예약을 통해 원하는 일시에 장례를 예약합니다.</p>
        </div>
      </div>
  <c:forEach var="fdvo" items="${list }">
    <div class="text-center funeral_produce_all container">
        <img src="${fdvo.infoimage }" style="border-radius: 50px;overflow: hidden;"/>
        <div class="funeral_produce_text">
          <span>${fdvo.mno }</span>
          <h3>${fdvo.infoh3 }</h3>
          <p>${fdvo.infop }</p>
        </div>
      </div>
   </c:forEach>
   <!-- 장례절차 반복 종료 -->
   
    <!-- Contact Form End -->
   
</body>
</html>