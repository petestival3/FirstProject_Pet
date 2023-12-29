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
.breadcrumb-section {
	margin: 50px 0;
}
.f_list li{
   list-style: none;
   background-color: lightblue;
   padding: 10px 0;
   margin: 5px auto;
}

/*검색하기 사이드 메뉴*/

</style>
</head>
<body>
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
		<a href="search_f.do"> <i class="xi-calendar-add"></i>
			<p>검색하기</p>
		</a>
	</div>
	<!-- 검색 사이드 매뉴 종료 -->

	<!-- 장례 전체 목록 시작 -->
	<div class="container">
	<ul class="f_list">
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

	<h1>
		<a href="../FuneralDetail/detail_f.do">상세보기</a>
	</h1>
</body>
</html>