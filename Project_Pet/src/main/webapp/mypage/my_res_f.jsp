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
<script type="text/javascript">
function btn(){
    alert('예약이 취소되었습니다.');
}
</script>
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
 <table class="table" style="margin-top: 20px;">
   <tr>
    <th class="text-center">예약번호</th>
    <th class="text-center">예약일</th>
    <th class="text-center">예약시간</th>
    <th class="text-center">예약인원</th>
    <th class="text-center">예약상태</th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">${vo.rf_no }</td>
    <td class="text-center">${vo.rf_day }</td>
    <td class="text-center">${vo.rf_time }</td>
    <td class="text-center">${vo.rf_inwon }</td>
    <td colspan="4" class="text-center">
    <c:if test="${vo.rf_ok==3 }">
        <span style="background-color: gray;" class="primary-btn">취소완료</span>
      </c:if>
      <c:if test="${vo.rf_ok==1 }">
        <span class="primary-btn" style="background-color: lightblue;">예약완료</span>
        <a href="../mypage/my_res_f_cancel.do?rf_no=${vo.rf_no }" style="background-color: black;" class="primary-btn" onclick="javascript:btn()">취소하기</a>
      </c:if>
      <c:if test="${vo.rf_ok==0 }">
        <span class="primary-btn">예약대기</span>
      </c:if>
    </td>
   </tr>
   </c:forEach>
 </table>
 </div>
 </div>
</body>
</html>
