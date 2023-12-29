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

	<!-- 사이드 예약 매뉴 시작 -->
	<div class="res_submenu">
		<a href="reserve.do"> <i class="xi-calendar-add"></i>
			<p>예약하기</p>
		</a>
	</div>
	<!-- 사이드 예약 매뉴 종료 -->

	<!-- 장례 상세페이지 시작 -->
	<table>
		<tr>
			<td width="20%" class="text-left">이름</td>
			<td width="50%" id="seat">${vo.CR_COM_NAME }</td>
		</tr>
		<tr>
			<td width="20%" class="text-left">분야</td>
			<td width="50%" id="seat">${vo.CR_COM_SECTOR }</td>
		</tr>
		<tr>
			<td width="20%" class="text-left">전화번호</td>
			<td width="50%" id="seat">${vo.CR_COM_PHONE }</td>
		</tr>
		<tr>
			<td width="20%" class="text-left">위치</td>
			<td width="50%" id="seat">${vo.CR_COM_LOC }</td>
		</tr>
		<tr>
			<td width="20%" class="text-left">홈페이지</td>
			<td width="50%" id="seat">${vo.CR_COM_HOMEPAGE }</td>
		</tr>
		<tr>
			<td colspan="3" class="text-right"><a href="#"
				class="btn btn-xs btn-danger">좋아요(0)</a> <a href="#"
				class="btn btn-xs btn-success">찜하기</a> <a href="#"
				class="btn btn-xs btn-info">예약하기</a> <a
				href="javascript:history.back()" class="btn btn-xs btn-warning">목록</a>
			</td>
		</tr>
	</table>
	<!-- 장례 상세페이지 종료 -->
</body>
</html>