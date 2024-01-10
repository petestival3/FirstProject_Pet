<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<style type="text/css">

.row .my_res{
	width: 800px;
	margin: 20px 0 0 30px;
}
</style>
</head>
<body>
<div class="container">
<div class="row my_res">
  <h4 class="text-center">장례식장 예약내역</h4>
 <table class="table">
   <tr>
    <th class="text-center">예약번호</th>
    <th class="text-center">예약일</th>
    <th class="text-center">예약시간</th>
    <th class="text-center">예약인원</th>
   </tr>
   <c:forEach var="fvo" items="${list }">
   <tr>
    <a href="../">
    <td class="text-center">${fvo.rf_no }</td>
    <td>${fvo.rf_day }</td>
    <td class="text-center">${fvo.rf_time }</td>
    <td class="text-center">${fvo.rf_inwon }</td>
    <td>
    <button class="btn btn-sm btn-info" id="cancel" data-rno=${vo.stay_no }>예약취소</button>
    </td>
    </a>
   </tr>
   </c:forEach>
 </table>
 </div>
</div>
</body>
</html>