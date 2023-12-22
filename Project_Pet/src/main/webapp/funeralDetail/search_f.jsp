<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Contact Form Begin -->
	
	<div class="contact-form spad">
	  <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2 style="color:#d9d9d9; font-weight: 400;">장례식장 검색 하기</h2>
					</div>
				</div>
			</div>
		</div>
      </section>
	</div>
	<!-- Contact Form End -->

    <!-- 사이드 예약 매뉴 시작 -->
    <div class="res_submenu">
      <a href="reserve.do">
       <i class="xi-calendar-add"></i>
       <p>예약하기</p>
      </a>
    </div>
    <!-- 사이드 예약 매뉴 종료 -->
    
	<!-- 검색하기 내용 시작 -->
	<div class="search_wrap container">
		<!-- 검색결과 실시간변동 1분할 -->
		<div class="search_t_l">
		   <div>
			<input type="text" id="f_search_text"> 
			<div id="f_search_btn_div">
			<input type="button" id="f_search_btn">
			<i class="xi-search"></i>
			</div>
		   </div>
			
			<!-- 검색결과 ajax로 출력할부분 시작 -->
			<div class="container search_t_l_result">
				<div class="row">
					<table class="table">
						<c:forEach var="i" begin="1" end="10">
							<tr>
								<th width="10%" class="text-center">번호</th>
								<td width="20%" class="loc_title"><a href="#">업체명</a></td>
								<td width="55%">주소</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- 검색결과 ajax로 출력할부분 종료 -->
			
		</div>
		
		<!-- 검색결과 출력 2분할 -->
		<div class="search_t_r">
			<div class="container">
				<div class="row">
			
					<table class="table">
						<c:forEach var="i" begin="1" end="10">
							<tr>
								<th width="10%" class="text-center">번호</th>
								<td width="20%" class="loc_title"><a href="#">업체명</a></td>
								<td width="55%">주소</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이지 이동부분
				<div style="height: 20px"></div>
				<div class="row">
					<div class="text-center">
						<a href="../FuneralDetail/search_f.do?page=${curpage>1?curpage-1:curpage }"
							class="btn btn-sm btn-danger">이전</a> ${curpage } page /
						${totalpage } pages <a
							href="../FuneralDetail/search_f.do?page=${curpage<totalpage?curpage+1:curpage }"
							class="btn btn-sm btn-success">다음</a>
					</div>
				</div>
				 -->
			</div>
		</div>
	</div>
	<!-- 검색하기 내용 종료 -->
</body>
</html>