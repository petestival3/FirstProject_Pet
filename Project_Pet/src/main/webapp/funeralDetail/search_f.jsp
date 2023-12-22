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
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>검색 하기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Form End -->

	<!-- 검색하기 내용 시작 -->
	<div class="search_wrap container">
		<!-- 검색결과 실시간변동 1분할 -->
		<div class="search_t_l">
			<input type="text"> <input type="button">
		</div>
		<!-- 검색결과 출력 2분할 -->
		<div class="search_t_r">
			<div class="container">
				<div class="row">
					<h6 class="text-center">장례식장 목록</h6>
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
				<div style="height: 20px"></div>
				<div class="row">
					<div class="text-center">
						<a href="../seoul/site.do?page=${curpage>1?curpage-1:curpage }"
							class="btn btn-sm btn-danger">이전</a> ${curpage } page /
						${totalpage } pages <a
							href="../seoul/site.do?page=${curpage<totalpage?curpage+1:curpage }"
							class="btn btn-sm btn-success">다음</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 검색하기 내용 종료 -->
</body>
</html>