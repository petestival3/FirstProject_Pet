<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*----------------*/
/*장례식장 상세 페이지*/
/*--------------*/
.breadcrumb-section {
	margin: 50px 0;
}

/*검색하기 사이드 메뉴*/
.search_submenu{
	background-color: #5a70e9;
	text-align: center;
	border-radius: 50%;
	position: fixed;
	right: 150px;
	top: 400px;
	width: 100px;
	height: 100px;
}
.search_submenu a{
	display: block;
}
.search_submenu i{
	margin-top: 20px;
	font-size: 25px;
	color: #fff !important;
}
.search_submenu p{
	color: #fff;
}
.search_submenu:hover{
	 box-shadow: 0 10px 10px 10px rgba(90,112,233, 0.2);
	 transition: all 0.4s ease-in-out;
	 transform: translateY(-25px);
}

/*상세내용 테이블*/
.detail_table{
     background-color: #f5f5f5;
     padding: 5px;
     border-radius: 10px;
}
.text-center{
     text-align: center;
}
.detail_table_title{
     font-weight: 600;
     border-bottom: 1px solid #d2d2d2;
}
.detail_table tr:nth-child(2) td,
.detail_table tr:nth-child(3) td,
.detail_table tr:nth-child(4) td,
.detail_table tr:nth-child(5) td,
.detail_table tr:nth-child(6) td{
     border-bottom: 1px solid #d2d2d2;
}
.detail_table td{
     padding: 10px;
     margin: 5px auto;
}
.detail_table .btn{
     background-color: #5a70e9;
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="../img/bread.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Funeral Detail</h2>
						<div class="breadcrumb__option">
							<a href="../main/main.do">Home</a> <span>Funeral</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- 검색 사이드 매뉴 시작 -->
	<div class="search_submenu">
		<a href="search_f.do"> <i class="xi-search"></i>
			<p>검색하기</p>
		</a>
	</div>
	<!-- 검색 사이드 매뉴 종료 -->

	<!-- 장례 상세페이지 시작 -->
	<div class="container">
	<table class="detail_table">
	    <tr>
	        <td class="detail_table_title text-center" colspan="2">
	         상세보기
	        </td>
	    </tr>
		<tr>
			<td width="20%" class="text-center">업체명</td>
			<td width="50%" id="seat">${vo.CR_COM_NAME }</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">분야</td>
			<td width="50%" id="seat">${vo.CR_COM_SECTOR }</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">전화번호</td>
			<td width="50%" id="seat">${vo.CR_COM_PHONE }</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">위치</td>
			<td width="50%" id="seat">${vo.CR_COM_LOC }</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">홈페이지</td>
			<td width="50%" id="seat">${vo.CR_COM_HOMEPAGE }</td>
		</tr>
		<tr>
			<td colspan="3" class="text-right"><a href="#"
				class="btn btn_like">좋아요(0)</a> <a href="#"
				class="btn btn_check">찜하기</a> <a href="#"
				class="btn btn_res">예약하기</a> <a
				class="btn btn_list" href="javascript:history.back()">목록</a>
			</td>
		</tr>
	</table>
	</div>
	<!-- 장례 상세페이지 종료 -->
</body>
</html>