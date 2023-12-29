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
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* Shadowbox.init({
	players:['iframe']
})
$(function(){
$('#detail-link').click(function(){
		Shadowbox.open({
			content:'../health/detail.do',
			player:'iframe',
			title:'병원 상세보기',
			width:350,
			height:200
		})
	});
}) */
</script>
<style type="text/css">
.blog-details{
	padding: 0px;
}
.product__pagination a.selected {
	background-color: #007bff;
	color: #fff;
	border: 1px solid #007bff;
}

h2{
	align-content: center;
}

</style>

</head>

<body>

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
				<div class="container">
				<div class="row">

			<!-- 검색바 -->
			
			<div class="blog__sidebar__item" style="width: 1030px; height: 800px;">
		<h2 style="text-align: center; margin-top: -18px; margin-bottom: 30px;">병원목록</h2>
		<div class="row">
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
					<td width=35% class="text-center" id="detail-link"><a
						href="#">${vo.hospital_name }</a></td>
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
						<a href="hsptsearch.do?page=${startPage-1}&st=${st }&fd=${fd }"><i
							class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${i eq curpage}">
								<a href="hsptsearch.do?page=${i}&st=${st }&fd=${fd }" class="selected">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="hsptsearch.do?page=${i}&st=${st }&fd=${fd }">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${endPage<totalpage }">
						<a href="hsptsearch.do?page=${endPage+1}&st=${st }&fd=${fd }"><i
							class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		
		</section>
	<!-- Blog Details Section End -->

</body>

</html>