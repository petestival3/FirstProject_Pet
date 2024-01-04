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
</style>
</head>
<body>
  
	<div class="col-md-9">
		<div class="reservation_container">
			<div class="reservation_header">
				<h2 class="sectiontitle">${name}님의찜 목록</h2>
			</div>
			<!-- 실제 찜하기 데이터를 반복적으로 표시하는 부분 -->
			<c:forEach begin="1" end="2">
			<table class="table" style="background-color: #fff">
			<tr>
			<td><img src="${vo.poster }"
					style="width: 30px; height: 30px"></td>
				<td>
				<p>${vo.no }품목번호</p>
				<p>품명${vo.name }</p>
				<p>전화번호${vo.tel }</p>
				</td>
		     </tr>
		     <tr>
				<td colspan="2" class="text-right"><a
					href="../mypage/my_JJim_cancle.do?no=${vo.no }"
					class="btn btn-sm btn-success">취소</a></td>
			  </tr>
			</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>
