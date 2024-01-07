<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2>회원 결제내역</h2>
		</div>
		<!-- 실제 예약내역 데이터를 반복적으로 표시하는 부분 -->
		<div class="reservation_item">
			<h3>000 사용자 숙소 결제</h3>
			<p>예약자명 : 심청이</p>
			<p>예약일: 2023-01-01</p>
			<p>숙소명: 펫플레이스</p>
		</div>
		<div class="reservation_item">
			<h3>999 사용자 물품 결제</h3>
			<p>구매자명 : 홍길동</p>
			<p>구매일: 2023-02-15</p>
			<p>상품명: 내추럴코어 멍쵸치킨 10g</p>
		</div>
		<!-- 추가 예약내역 아이템들 -->
	</div>
	<!-- 여기까지 -->

	<!-- 기타 마이페이지 콘텐츠 -->

	</div>
</body>
</html>
