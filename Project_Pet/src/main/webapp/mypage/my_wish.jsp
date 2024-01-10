<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/mymain.css">
<style type="text/css">
.wish_info_list{
    display: flex;
    flex-direction: column;
    justify-content: center;
    height:220px;
}
.reservation_container{
    margin-bottom: 50px;
    width: 850px;
}
</style>
</head>
<body>
	<div class="col-md-9">
		<div class="reservation_container">
			<div class="reservation_header">
				<h2 class="sectiontitle">${sessionScope.name}님의 입양 희망 목록</h2>
			</div>
			<!-- 실제 찜하기 데이터를 반복적으로 표시하는 부분 -->
			<c:forEach var="vo" items="${list }">
			<table class="table" style="background-color: #fff">
			   <tr>
			      <td style="text-align: center;"><img src="${vo.KEEPIMAGE }"
					style="height: 200px; width: 200px;"></td>
			      <td class="wish_info_list">
			      <p>희망 순서&nbsp;<span>${vo.cdno }</span></p>
			      <p>입양 지역&nbsp;<span>${vo.KEEPTITLE }</span></p>
			      <p>작성일&nbsp;<span>${vo.KEEPWRITER }</span></p>
			      </td>
			   </tr>
			    <tr>
				<td colspan="2" class="text-right"><a
					href="../mypage/my_wish_cancel.do?cdno=${vo.cdno }"
					class="primary-btn">취소</a></td>
			  </tr>
			</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>
