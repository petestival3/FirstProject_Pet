<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.breadcrumb-section{
    margin: 50px 0;
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Funeral Reservations</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>Funeral</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- 예약하기 내용 시작 -->
	<div class="res_wrap container">
		<!-- 테이블 날짜시간 1분할 -->
		<div class="res_t"></div>
		<!-- 테이블 상세내용 2분할 -->
		<div class="res_t"></div>
		<!-- 테이블 결정사항 3분할 -->
		<div class="res_t"></div>
	</div>
	<!-- 예약하기 내용 종료 -->
</body>
</html>