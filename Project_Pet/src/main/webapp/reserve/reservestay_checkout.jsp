<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<style type="text/css">
.row {
   margin: 0px auto;
   width: 100%;
}
.rdaysout:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rdaysout').click(function(){
		let year=$(this).attr('data-year');
		let month=$(this).attr('data-month');
		let checkout=$(this).text();
		let rday=year+"년도 "+month+"월 "+checkout+"일";
		$('#room_checkout').text(rday);
		$('#rcheckout').val(rday);
		$('#room_ok').show();
		
	})
	
})
</script>
</head>
<body>
<table class="table">
	  <h3 class="text-center" style="margin-bottom: 10px;">${year }년도 ${month }월</h3>
	  <tr class="danger">
	    <c:forEach var="strWeek" items="${strWeek }">
	      <td class="text-center" style="background-color: #c8c8c8;">${strWeek }</td>
	    </c:forEach>
	    <c:set var="week" value="${week }"/>
	    <c:forEach var="i" begin="1" end="${lastday }">
	      <c:if test="${i==1 }">
	        <tr>
	          <td class="text-center">&nbsp;</td>
	      </c:if>
	        <c:if test="${rdayout[i]==1}">
	          <td class="text-center info rdaysout" style="background-color: #FFFF8C" data-year="${year }" data-month="${month }">${i }</td>
	        </c:if>
	        <c:if test="${rdayout[i]==0}">
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
</body>
</html>