<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">

/* 예약내역 관련 스타일 추가 */
.reservation_container {
	width: 100% !important;
	box-sizing: border-box;
	padding: 40px;
	background-color: #f5f5f5;
	margin-top: 20px;
}

.reservation_header {
	font-size: 24px;
	margin-bottom: 20px;
}

.reservation_item {
	border: 1px solid #ddd;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #fff;
}

.reservation_item h3 {
	margin: 0;
	font-size: 18px;
}

.reservation_item p {
	margin: 5px 0;
	color: #777;
}
</style>
</head>
<body>

	<!-- 예약내역 관련 내용 -->
	<div class="col-md-9">
	<div class="reservation_container">
		<div class="reservation_header">
			<h2>호텔 예약내역</h2>
		</div>
		<!-- 실제 예약내역 데이터를 반복적으로 표시하는 부분 -->
		<table class="table" style="margin-top: 20px;">
   <tr>
    <th class="text-center">아이디</th>
    <th class="text-center">예약번호</th>
    <th class="text-center">체크인</th>
    <th class="text-center">체크아웃</th>
    <th class="text-center">숙박위치</th>
    <th class="text-center"></th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">${vo.id }</td>
    <td class="text-center">${vo.no }</td>
    <td class="text-center" width="80px;">${vo.checkin }</td>
    <td class="text-center" width="80px;">${vo.checkout }</td>
    <td>${vo.roomname }</td>
    <td colspan="4" class="text-center">
    <c:if test="${vo.ok==2 }">
        <a href="../adminPage/ad_res_cancel.do?rf_no=${vo.rno }" style="background-color: gray;" class="primary-btn">취소내역삭제</a>
      </c:if>
      <c:if test="${vo.ok==1 }">
        <span class="primary-btn" style="background-color: lightblue;">예약완료</span>
        <a href="../adminPage/ad_res_no.do?rf_no=${vo.rno }" style="background-color: black;" class="primary-btn">비승인</a>
      </c:if>
      <c:if test="${vo.ok==0 }">
        <a href="../adminPage/ad_res_ok.do?rf_no=${vo.rno }" class="primary-btn">승인</a>
        <a href="../adminPage/ad_res_no.do?rf_no=${vo.rno }" style="background-color: black;" class="primary-btn">비승인</a>
      </c:if>
    </td>
    
   </tr>
   </c:forEach>
 </table>
		<!-- 추가 예약내역 아이템들 -->
	</div>
	<!-- 여기까지 -->

	<!-- 기타 마이페이지 콘텐츠 -->

	</div>
</body>
</html>
