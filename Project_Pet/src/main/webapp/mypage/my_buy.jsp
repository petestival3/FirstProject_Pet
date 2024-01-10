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

.row .my_res{
	width: 850px;
	margin: 0px auto;
	margin: 30px 0 0 20px;
}
.myres_table {
margin-top: 10px;
}
.myres_table td{
height: 150px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.cancel').click(function(){
	<!--	let cbno=$(this).data('cbno');-->
		
		let cbno=$(this).attr('data-cbno');
		
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
<div class="row my_res">
  <h4 class="text-center">상품 결제내역</h4>
 <table class="myres_table">
   <tr>
    <th class="text-center"></th>
    <th class="text-center">상품명</th>
    <th class="text-center">결제금액</th>
    <th class="text-center">결제일시</th>
    <th class="text-center">배송상태</th>
    <th class="text-center">결제취소</th>
   </tr>
   <c:forEach var="vo" items="${bList }">
   <tr>
    <td class="text-center">
     <a href="#"><img src="${vo.pvo.p_image }" style="width: 90px; height: 70px"></a>
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
 </div>
 </div>
</body>
</html>
