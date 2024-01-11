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
.myres_table {
width: 890px;
margin-top: 10px;
}

.myres_table td{
height: 130px;
}
.myres_table tr {
    border-bottom: 1px solid #f2f2f2;
}
.myres_table h4{
 margin-bottom: 100px;
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
<div class="row my_res">
<h4 class="text-center">&nbsp;호텔 예약내역</h4>
 <table class="myres_table" style="margin-top: 20px;">
   <tr>
    <th class="text-center"></th>
    <th class="text-center">호텔명</th>
    <th class="text-center">체크인</th>
    <th class="text-center">체크아웃</th>
    <th class="text-center">예약상태</th>
    <th class="text-center">예약취소</th>
   </tr>
   <c:if test="${empty list}">
	<td class="text-center" colspan="7">예약내역이 없습니다.</td>
	</c:if>
	<c:if test="${not empty list}">
   <c:forEach var="vo" items="${list }">
   <c:choose>
   <c:when test="${not empty vo.roomimage}">
   <tr>
    <td class="text-center">
     <a href="#"><img src="${vo.roomimage }" style="width: 170px; height: 150px"></a>
    </td>
    <td>${vo.roomname }</td>
    <td class="text-center" width="80px;">${vo.checkin }</td>
    <td class="text-center" width="80px;">${vo.checkout }</td>
    
    <c:if test="${vo.ok==0 }">
     <td>
    <button class="btn btn-sm btn-info" style="width: 80px; height: 40px; margin-left: 10px;">예약대기</button>
    </td>
    </c:if>
     <c:if test="${vo.ok==1 }">
     <td>
    <button class="btn btn-sm btn-info" style="width: 80px; height: 40px; margin-left: 10px;">예약확정</button>
    </td>
    </c:if>
    <td>
    <button class="btn btn-sm btn-info cancel" data-rno=${vo.stay_no } style="width: 80px; height: 40px; margin-left: 10px;">예약취소</button>
    </td>
   </tr>
	</c:when>
	<c:otherwise>
	<tr>
 	<td></td>
 	</tr>
	</c:otherwise>
	</c:choose>
   </c:forEach>
</c:if>
 
 </table>
 </div>
 </div>
</body>
</html>
