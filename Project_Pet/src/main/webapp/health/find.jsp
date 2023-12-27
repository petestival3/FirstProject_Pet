<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>
<style type="text/css">
.blog-details{
	padding: 0px;
}
.product__pagination a.selected {
	background-color: #007bff;
	color: #fff;
	border: 1px solid #007bff;
}

.blog__sidebar__search button[type="text"] {
	margin-right: 140px;
}
</style>
<script type="text/javascript">
window.onload=function(){

	let post=document.querySelector("#post")
	
	post.addEventListener("click",()=>{
		window.open('detail.jsp','post','width=480px,height=350px,scrollbars=yes,location=no')
	})
}
</script>

</head>

<body>

	<!-- Blog Details Section Begin -->
			<section class="blog-details spad">
				<div class="container">
				<div class="row">

			<!-- 검색바 -->
			
			<div class="blog__sidebar__item" style="width: 1030px; height: 800px;">
		<h2 style="text-align: center; margin-top: -18px; margin-bottom: 30px;" >병원목록</h2>
		<div class="row" style="margin-top: 10px;">
		<table class="table">
			<tr class="success">
				<th width=10% class="text-center">번호</th>
				<th width=35% class="text-center">병원명</th>
				<th width=40% class="text-center">주소</th>
				<th width=15% class="text-center">전화번호</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td width=10% class="text-center">${vo.no }</td>
					<td width=35% class="text-center" id="post"><a
						href="../health/detail.do?no=${vo.no }">${vo.hospital_name }</a></td>
					<td width=40% class="text-center">${vo.hospital_address }</td>
					<td width=15% class="text-center">${vo.hospital_phone }</td>
				</tr>
			</c:forEach>
		</table>
		</div>


			<div class="row">
			<div class="order-3" style="margin: 0 auto; padding: 10px 0px 20px 0px;">
				<div class="product__pagination">
					<c:if test="${startPage>1 }">
						<a href="find.do?page=${startPage-1}"><i
							class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${i eq curpage}">
								<a href="find.do?page=${i}" class="selected">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="find.do?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${endPage<totalpage }">
						<a href="find.do?page=${endPage+1}"><i
							class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
		</div>
	
	</section>
	<!-- Blog Details Section End -->

</body>

</html>