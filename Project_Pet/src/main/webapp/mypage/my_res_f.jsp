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
	width: 800px;
	margin: 20px 0 0 30px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="conatiner">
<div class="row my_res">
  <h4 class="text-center">&nbsp;${sessionScope.name }님의 장례식장 예약내역</h4>
 <table class="table">
   <tr>
    <th class="text-center">예약번호</th>
    <th class="text-center">예약일</th>
    <th class="text-center">예약시간</th>
    <th class="text-center">예약인원</th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">${vo.rf_no }</td>
    <td>${vo.rf_day }</td>
    <td class="text-center">${vo.rf_time }</td>
    <td class="text-center">${vo.rf_inwon }</td>
    </tr>
    <tr>
    <td class="text-center">
      <c:if test="${rf_ok==1 }">
        <span class="btn btn-sm">예약완료</span>
      </c:if>
      <c:if test="${rf_ok==0 }">
        <span class="btn btn-sm">예약대기</span>
      </c:if>
      <a href="#" class="btn btn-sm">취소</a>
    </td>
   </tr>
   </c:forEach>
 </table>
 </div>
 </div>
</body>
</html>
