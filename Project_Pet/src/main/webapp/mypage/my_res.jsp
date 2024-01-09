<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/mymain.css" >
<style type="text/css">

</style>
</head>
<body>
 <h3 class="text-center">상품 구매 목록</h3>
 <table class="table">
   <tr>
    <th class="text-center">번호</th>
    <th class="text-center"></th>
    <th class="text-center">상품명</th>
    <th class="text-center">가격</th>
    <th class="text-center">수량</th>
    <th class="text-center">총구매가격</th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">${vo.cart_no }</td>
    <td class="text-center">
     <img src="${vo.gvo.goods_poster }" style="width: 30px;height: 30px">
    </td>
    <td>${vo.gvo.goods_name }</td>
    <td class="text-center">${vo.gvo.goods_price }</td>
    <td class="text-center">${vo.amount }</td>
    <td class="text-center">${vo.price * vo.amount }</td>
   </tr>
   </c:forEach>
 </table>
</body>
</html>
