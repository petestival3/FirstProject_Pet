<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    List<JJimVO> list=JJimDAO.JJimListData();
    request.setAttribute("list", list);
%>

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
			<c:forEach var="vo" items="${list }">
			<table class="table" style="background-color: #fff">
			<tr>
			<td><img src="${vo.p_image }"
					style="width: 30px; height: 30px"></td>
				<td>
				<p>찜하기번호${vo.no }</p>
				<p>품목번호${vo.pno }</p>
				<p>품명${vo.p_name }</p>
				<p>원가${vo.p_price }</p>
				<p>할인가${vo.p_lower_price }</p>
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
