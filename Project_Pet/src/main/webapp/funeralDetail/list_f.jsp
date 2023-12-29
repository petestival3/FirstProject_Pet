<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*--------------*/
/*장례식장 목록 페이지*/
/*--------------*/
li{
    list-style: none;
}

.breadcrumb-section {
	margin: 50px 0;
}
/*전체 장례식장 목록*/
.f_list li{
   background-color: #f8f8ff;
   border-radius : 30px;
   padding: 10px 0;
   margin: 10px auto;
}
.f_list li a:hover{
   color: #5a70e9 !important;
}
.f_list li:nth-child(1){
   font-weight : 600;
   background-color: #e8e8ee !important;
   color : #333 !important;
   display: flex;
   justify-content: space-between;
}
.f_list li a{
   color : #333 !important;
   display: flex;
   justify-content: space-between;
}
.f_list_num,
.f_list li a span:nth-child(1){
   text-align: center;
   width: 60px;
}
.f_list_name,
.f_list li a span:nth-child(2){
   text-align: center;
   width: 500px;
}
.f_list_addr{
   text-align: center;
   width: 500px;
}
.f_list li a span:nth-child(3){
   width: 500px;
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

/*장례 목록 페이지 나누기 번호*/
.pagination{
     margin: 30px 0 50px;
}
.pagination ul{
     margin: 0 auto;
     display: flex;
     justify-content: space-between;
     width: 100px;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">상세보기 다이얼로그로 처리하기</h2>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="../img/bread.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Funeral home List</h2>
						<div class="breadcrumb__option">
							<a href="../main/main.do">Home</a> <span>Funeral</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- 예약 사이드 매뉴 시작 -->
	<div class="res_submenu">
		<a href="reserve.do"> <i class="xi-calendar-add"></i>
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

	<!-- 장례 전체 목록 시작 -->
	<div class="container">
	<ul class="f_list">
	        <li>
	        <span class="f_list_num">번호</span>
	        <span class="f_list_name">업체명</span>
	        <span class="f_list_addr">주소</span>
	        </li>
		<c:forEach var="vo" items="${list }" varStatus="s">
			<li><a href="../FuneralDetail/detail_f.do?CR_COM_NO=${vo.CR_COM_NO }">
			<span>${vo.CR_COM_NO }</span>
			<span>${vo.CR_COM_NAME }</span>
			<span>${vo.CR_COM_LOC }</span>
			</a></li>
		</c:forEach>
	</ul>
	</div>
	<!-- 장례 전체 목록 종료 -->

	<!-- 장례 전체 목록 페이지 시작 -->
	<nav class="pagination">
		<ul>
			<c:if test="${startPage>1 }">
				<li><a href="../FuneralDetail/detail_f.do?page=${startPage-1 }">&laquo;
						Previous</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${i==curpage?"class=current":""}><a
					href="../FuneralDetail/detail_f.do?page=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li><a href="../FuneralDetail/detail_f.do?page=${endPage+1 }">Next
						&raquo;</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 장례 전체 목록 페이지 종료 -->
</body>
</html>