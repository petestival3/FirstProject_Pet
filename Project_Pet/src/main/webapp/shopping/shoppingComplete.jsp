<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


.comleCon {
  background-color: #f7f7f7; /* 배경색 */
  border: 1px solid #ddd; /* 테두리 스타일 */
  border-radius: 8px; /* 모서리 둥글기 */
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
  padding: 20px; /* 내부 여백 */
  margin: 100px auto; /* 가운데 정렬을 위한 외부 여백 */
  max-width: 600px; /* 최대 너비 */
  text-align: center; /* 텍스트 가운데 정렬 */
  font-family: 'Arial', sans-serif; /* 폰트 설정 */
  color: #333; /* 텍스트 색상 */
  
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="comleCon text-center">


	<div>
		<img src="../img/mainlogo.png" style="width:200px;">
		
	</div>
	<div>
	<span style="font-weight:bold; margin-bottom:15px; font-size:40px;">결제가 완료되었습니다.</h2></span>
	</div>
	
	<div style="margin-bottom:30px;">
	<span style="font-weight:bold; color:blue; font-size:20px; opacity:0.8;">이용해주셔서 감사합니다.</span>
	</div>
	
	<div>
	<span style="margin-right:10px;"><a href="../product/ProductList.do" class="btn btn-info">계속 쇼핑하기</a></span>
	<span><a href="../mypage/my_buy.do" class="btn btn-primary">결제내역 보기</a></span>
	</div>	
</div>
</body>
</html>