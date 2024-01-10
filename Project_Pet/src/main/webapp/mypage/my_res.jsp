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
/* $(function() {
	$('#cancel').click(function(){
		let rno=$(this).data('data-rno');
		 $.ajax({
		        type: 'post', 
		        url: '../mypage/my_res_cancel.do', 
		        data: {'rno':rno },
		        success: function(result) {
		          alert('예약이 취소되었습니다.');
		        },
		        error: function() {
		          alert('취소에 실패하였습니다.');
		        }
		      });
		    });
		  }); */
</script>
</head>
<body>
<div class="conatiner">
<div class="row my_res">
  <h4 class="text-center">호텔 예약내역</h4>
 <table class="table">
   <tr>
    <th class="text-center"></th>
    <th class="text-center">호텔명</th>
    <th class="text-center">체크인</th>
    <th class="text-center">체크아웃</th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">
     <img src="${vo.roomimage }" style="width: 70px; height: 70px">
    </td>
    <td>${vo.roomname }</td>
    <td class="text-center">${vo.checkin }</td>
    <td class="text-center">${vo.checkout }</td>
    <td>
    <button class="btn btn-sm btn-info" id="cancel" data-rno=${vo.stay_no }>예약취소</button>
    </td>
   </tr>
   </c:forEach>
 </table>
 </div>
 </div>
</body>
</html>
