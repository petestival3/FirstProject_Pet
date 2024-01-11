<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>vertical list</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
  
  
  
    <style>
.list-group {
	margin-top: 20px;
}

.list-group a {
	line-height: 2.5;
	font-weight: bold;
}

.my_menu {
	width: 300x;
	height: 600px;
}

.subMenu{
font-size:10px;
opacity:0.7;


}

</style>
 
</head>
<body>
    <div class="container">
        <div class="row">

			<div class="col-md-3 col-sm-4">
				<div class="my_menu">
					<!--list-group : 수직 목록 생성-->
					<div class="list-group">
						<a href="../adminPage/ad_res.do"
							class="list-group-item list-group-item-action">사이트 내부 호텔 예약내역</a>
						<a href="../adminPage/ad_res_f.do"
							class="list-group-item list-group-item-action">사이트 내부 장례식장 예약내역</a> <a
							href="../adminPage/ad_payment.do" class="list-group-item list-group-item-action">사이트 결제내역</a>
						<a href="../adminPage/ad_page.do" class="list-group-item list-group-item-action">회원정보 관리</a>
						
						<a href="" class="list-group-item list-group-item-action" id="productAdmin">상품관리</a>
						<!-- 상품관리 -->
						<a href="../adminPage/ad_productQnaList.do" class="list-group-item list-group-item-action subMenu">&nbsp;&nbsp;- 상품문의관리</a>
						<a href="../adminPage/ad_productPstackHandleList.do" class="list-group-item list-group-item-action subMenu">&nbsp;&nbsp;- 상품 입/출고 관리</a>
						<a href="../adminPage/ad_product_stateHandleList.do" class="list-group-item list-group-item-action subMenu">&nbsp;&nbsp;- 상품주문상태 관리</a>
						<a href="../adminPage/maechul.do" class="list-group-item list-group-item-action subMenu">&nbsp;&nbsp;- 매출관리</a>
						<!-- 상품관리 -->
					</div>
				</div>
			</div>
			<jsp:include page="${ad_page_jsp }"></jsp:include>
		</div>
    </div>
</body>
</html>