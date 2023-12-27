<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 50px;
	margin-top: 30px;
	border: 1px solid black;
	border-collapse: collapse; /* 테이블 셀 경계를 합침 */
}

th, td {
	padding: 10px;
	text-align: left;
	vertical-align: middle; /* 세로 정렬 중앙으로 지정 */
	border: 1px solid #ddd; /* 셀 경계선 스타일 설정 */
}

th {
	background-color: #f2f2f2; /* 헤더 배경색 지정 */
	padding: 100px;
}

a {
	display: block; /* 링크를 블록 요소로 변환하여 전체 셀에 링크를 확장 */
	padding: 10px;
	text-decoration: none;
	color: inherit; /* 링크 색상을 부모 요소로 상속 */
}

td:first-child {
	width: 20%; /* 첫 번째 td(이미지)의 너비를 30%로 설정 */
}

td:first-child img {
	width: 100%; /* 이미지의 너비를 부모 요소의 100%로 설정하여 고정 */
	height: auto; /* 높이를 자동으로 조정하여 가로세로 비율 유지 */
	object-fit: cover;
}

td:last-child {
	width: 80%; /* 마지막 td(이름, 주소, 전화번호)의 너비를 70%로 설정 */
}
</style>
</head>
<body>
<div class="col-md-9">
			<table class="table">
					<tr>
						<th colspan="2">Admin Page</th>
					</tr>
					<tr>
						<td rowspan="3"><img src="../img/mainlogo.png" class="my_profile"></td>
						<td>이름</td>
					</tr>
					<tr>
						<td>전화번호</td>
					</tr>
					<tr>
						<td>주소</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<th colspan="2">MyPet Profile</th>
					</tr>
					<tr>
						<td rowspan="3"><img src="../img/do.jpg" class="my_profile"></td>
						<td>이름</td>
					</tr>
					<tr>
						<td>성별</td>
					</tr>
					<tr>
						<td>생년월일</td>
					</tr>
				</table>
			</div>
</body>
</html>