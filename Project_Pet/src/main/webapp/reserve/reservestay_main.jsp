<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width: 100%;
}
.rdays:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rdays').click(function(){
		let year=$(this).attr('data-year');
		let month=$(this).attr('data-month');
		let checkin=$(this).text();
		let rday=year+"년도 "+month+"월 "+checkin+"일";
		let roomname=$('#room_name').attr('data-name');
		let roomimg=$('#room_name').attr('data-img');
		let rno=$('#room_name').attr('data-rno');
		$('#room_checkin').text(rday);
		$('#rcheckin').val(rday);
		$('#resroomname').val(roomname);
		$('#resroomimage').val(roomimg);
		$('#resrno').val(rno);
		
		$.ajax({
			type:'post',
			url:'../reserve/reservestay_checkout.do',
			data:{"checkin":checkin},
			success:function(result){
				$('#stay_checkout').html(result)
			}
		})
		
	})
})
</script>
</head>
<body>
<div class="container">
<h1 class="text-center">숙소 예약</h1>
<div class="row">
<table class="table" height="450">
<tr>
   <td width=25% height="350" class="success">
   <table class="table">
   <h3 class="text-center">CHECK-IN</h3>
   <tr>
     <td>
       <div id="stay_checkin">
       <table class="table">
	  <h3 class="text-center">${year }년도 ${month }월</h3>
	  <tr class="danger">
	    <c:forEach var="strWeek" items="${strWeek }">
	      <td class="text-center">${strWeek }</td>
	    </c:forEach>
	    <c:set var="week" value="${week }"/>
	    <c:forEach var="i" begin="1" end="${lastday }">
	      <c:if test="${i==1 }">
	        <tr>
	          <td class="text-center">&nbsp;</td>
	      </c:if>
	        <c:if test="${rday[i]==1}">
	          <td class="text-center info rdays" data-year="${year }" data-month="${month }">${i }</td>
	        </c:if>
	        <c:if test="${rday[i]==0}">
	          <td class="text-center">${i }</td>
	        </c:if>
	          <c:set var="week" value="${week+1 }"/>
	          <c:if test="${week>6 }">
	            <c:set var="week" value="0"/>
	            </tr>
	            <tr>  
	          </c:if>
	    </c:forEach>
	    
	  </tr>
	</table>
       </div>
     </td>
   </tr>
   </table>
   </td>
   <td width="25%" height="350" class="warning">
   <table class="table">
   <h3 class="text-center">CHECK-OUT</h3>
   <tr>
     <td>
       <div id="stay_checkout"></div>
     </td>
   </tr>
   </table>
   </td>
   <td width=30% rowspan="2" class="info">
   <table class="table">
   <h3 class="text-center">예약정보</h3>
   <tr>
     <td>
       <img src="${vo.image }" style="width: 100%" id="res_room_image"> 
     </td>
   </tr>
   <tr>
   	 <td>방이름: <span id="room_name" data-name="${vo.name }" data-img="${vo.image }" data-rno="${rno }">${vo.name }</span></td>
   </tr>
   <tr>
   	 <td>체크인: <span id="room_checkin"></span></td>
   </tr>
   <tr>
   	 <td>체크아웃: <span id="room_checkout"></span></td>
   </tr>
   <tr style="display: none" id="room_ok">
      <td class="text-center">
        <form method="post" action="../reserve/stayreserve_ok.do">
          <input type=hidden name="resrno" id="resrno">
          <input type=hidden name="rcheckin" id="rcheckin">
          <input type=hidden name="rcheckout" id="rcheckout">
          <input type=hidden name="resroomname" id="resroomname">
          <input type=hidden name="resroomimage" id="resroomimage">
          <button class="btn btn-sm btn-danger">예약하기</button>
        </form>
      </td>
    </tr>
   </table>
   </td>
</tr>
</table>
</div>
</div>
</body>
</html>