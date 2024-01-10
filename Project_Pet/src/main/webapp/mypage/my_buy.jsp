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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $(function() {
	$('.cancel').click(function(){
		let rno=$(this).data('rno');
		 $.ajax({
		        type: 'post', 
		        url: '../mypage/my_res_cancel.do', 
		        data: {'rno':rno },
		        success: function(result) {
		          alert('예약이 취소되었습니다.');
		          location.href="../mypage/my_res.do";
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
  <h4 class="text-center">상품 결제내역</h4>
   <tr>
    <th class="text-center" width="20%"></th>
    <th class="text-center" width="30%" style="text-align: center">상품명</th>
    <th class="text-center" width="15%">결제금액</th>
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
    <td class="text-center" width="80px;">${vo.buy_price }</td>
    <td class="text-center" width="80px;">${vo.buy_date }</td>
     <td class="text-center" width="80px;">${vo.p_state }</td>
     <td>
    <button class="btn btn-sm btn-info cancel" data-cbno=${vo.cbno } style="width: 80px; height: 40px;">결제취소</button>
   </td>
   </tr>
   </c:forEach>
 </table>
 <table class="myship_table">
 <tr>
 <th class="text-center">배송정보</th>
 </tr>
 <tr>
   <td class="text-center">수령인:${vo. }</td>
  <td class="text-center">주소:</td>
  <td class="text-center">전화번호:</td>
 </tr>
 </table>
 </div>
 </div>
</body>
</html>
