<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style type="text/css">

.row .my_buy{
	width: 850px;
	margin: 0px auto;
	margin: 35px 0 0 20px;
}
.mybuy_table {
width: 890px;
margin-top: 10px;
}

.mybuy_table td{
height: 130px;
}
.mybuy_table tr {
    border-bottom: 1px solid #f2f2f2;
}
.myship_table{
width: 890px;
}
.myship_table th{
 border-bottom: 1px solid #f2f2f2;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $(function() {
	$('.cancel').click(function(){
		let cbno=$(this).data('cbno');
		 $.ajax({
		        type: 'post', 
		        url: '../mypage/my_buy_delete.do', 
		        data: {'cbno':cbno },
		        success: function(result) {
		          alert('결제가 취소되었습니다.');
		          location.href="../mypage/my_buy.do";
		        },
		        error: function() {
		          alert('취소에 실패하였습니다.');
		        }
		      });
		    });
		  });   
</script>
</head>
<body>
<div class="conatiner">
<div class="row my_buy">
 <table class="mybuy_table">
  <h3 class="text-center">상품 결제내역</h3>
   <tr>
    <th class="text-center" width="20%"></th>
    <th class="text-center" width="25%" style="text-align: center">상품명</th>
    <th class="text-center" width="10%">상품수량</th>
    <th class="text-center" width="10%">결제금액</th>
    <th class="text-center" width="15%">결제일자</th>
    <th class="text-center" width="10%">배송상태</th>
    <th class="text-center" width="10%">결제취소</th>
   </tr>
  <c:forEach var="vo" items="${bList }">
   <tr>
    <td class="text-center">
     <a href="#"><img src="${vo.pvo.p_image }" style="width: 150px; height: 120px"></a>
    </td>
    <td>${vo.pvo.p_name }</td>
    <td class="text-center" width="80px;">${vo.buy_count }개</td>
    <td class="text-center" width="80px;">${vo.buy_price }</td>
    <td class="text-center" width="80px;">${vo.buy_date }</td>
     <td class="text-center" width="80px;">${vo.p_state }</td>
     <td>
    <button class="btn btn-sm btn-info cancel" data-cbno=${vo.cbno } style="width: 80px; height: 40px;">결제취소</button>
   </td>
   </tr>
 </table>
 <table class="myship_table">
 <tr>
 <th>배송정보</th>
 </tr>
 <tr>
  <td class="text-left">${vo.reciepient }&nbsp;</td>
 </tr>
 <tr>
  <td class="text-left">${vo.buy_address }&nbsp;</td>
 </tr>
 <tr>
   <td class="text-left" width="30%;">${vo.phone }&nbsp;</td>
 </tr>
 <tr>
   <td class="text-left" "colspan="4">${vo.request_content eq null?"요청사항없음":vo.request_content }&nbsp;</td>
 </tr>
 </table>
 </c:forEach>
 </div>
 </div>
</body>
</html>
