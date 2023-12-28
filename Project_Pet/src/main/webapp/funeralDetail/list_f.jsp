<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*--------------*/
/*장례식장 목록 페이지*/
/*--------------*/
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
                        <h2>Funeral home List</h2>
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

	<!-- 예약 사이드 예약 매뉴 시작 -->
	<div class="res_submenu">
		<a href="reserve.do"> <i class="xi-calendar-add"></i>
			<p>예약하기</p>
		</a>
	</div>
	<!-- 예약 사이드 예약 매뉴 종료 -->
	
	<h1><a href="../FuneralDetail/detail_f.do">상세보기</a></h1>
</body>
</html>