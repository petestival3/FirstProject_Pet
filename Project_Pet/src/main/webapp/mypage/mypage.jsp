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



</style>
 
</head>
<body>
    <div class="container">
        <div class="row">

			<div class="col-md-3 col-sm-4">
				<div class="my_menu">
					<!--list-group : 수직 목록 생성-->
					<div class="list-group">
						<a href="../mypage/my_res.do"
							class="list-group-item list-group-item-action">예약내역</a> <a
							href="#" class="list-group-item list-group-item-action">결제내역</a>
						<a href="#" class="list-group-item list-group-item-action">좋아요</a>
						<a href="../mypage/my_info.do" class="list-group-item list-group-item-action">개인정보관리</a>
						<a href="../mypage/my_petinfo.do" class="list-group-item list-group-item-action">마이펫관리</a>
					</div>
				</div>
			</div>
			<jsp:include page="${mypage_jsp }"></jsp:include>
		</div>
    </div>
</body>
</html>