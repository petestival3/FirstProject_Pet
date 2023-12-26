<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ad_hello{
    margin: 50px auto 20px;
    background-color: #f5f5f5;
    border-top: 2px solid #5a70e9;
}
.mainwrap {
	margin: 0px auto 50px;
	height: 500px;
	display: flex;
	justify-content: space-between;
}
.ad_submenu ul li{
    width: 120px;
    height: 50px;
    line-height: 50px;
    list-style: none;
    font-size: 20px;
    font-weight: 600;
}
.ad_content{
    width:100%;
    background-color: #f5f5f5;
}
</style>
</head>
<body>
    <p class="ad_hello container">000 관리자님 입장을 환영합니다.</p>
	<div class="container mainwrap">
		<div class="ad_submenu">
			<ul>
				<li><a href="#">예약내역</a></li>
				<li><a href="#">구매내역</a></li>
				<li><a href="#">위시리스트</a></li>
				<li><a href="#">개인정보관리</a></li>
				<li><a href="#">마이펫관리</a></li>
			</ul>
		</div>
		<div class="ad_content">
		   <p>출력확인용</p>
		</div>
	</div>
</body>
</html>