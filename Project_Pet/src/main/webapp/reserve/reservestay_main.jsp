<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#stay_room tr:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/reserve_room.do',
		data:{"no":1},
		success:function(result){
			$('#stay_room').html(result)
		}
	})
})
</script>
</head>
<body>
<div class="container">
<h1 class="text-center">맛집 예약</h1>
<div class="row">
<table class="table" height="450">
<tr>
   <td width=20% height="350" class="danger">
   <table class="table">
   <caption><h3>맛집정보</h3></caption>
   <tr>
   <td>
   <div id="stay_room" style="height: 350px; overflow-y: scroll"></div>
   </td>
   </tr>
   </table>
   <td width=25% height="350" class="success">
   <table class="table">
   <caption><h3>예약일 정보</h3></caption>
   <tr>
     <td>
       <div id="food_date"></div>
     </td>
   </tr>
   </table>
   </td>
   <td width="25%" height="350" class="warning">
   <table class="table">
   <caption><h3>체크아웃</h3></caption>
   <tr>
     <td>
       <div id="stay_checkout"></div>
     </td>
   </tr>
   </table>
   </td>
   <td width=30% rowspan="2" class="info">
   <table class="table">
   <caption><h3>예약정보</h3></caption>
   <tr>
     <td>
       <img src="../reserve/noimage.png" style="width: 100%" id="food_image"> 
     </td>
   </tr>
   <tr>
   	 <td>업체명:<span id="food_name"></span></td>
   </tr>
   <tr>
   	 <td>예약일:<span id="food_day"></span></td>
   </tr>
   <tr>
   	 <td>예약시간:<span id="food_time"></span></td>
   </tr>
   <tr>
   	 <td>인원:<span id="food_inwon"></span></td>
   </tr>
   <tr style="display: none" id="ok">
      <td class="text-center">
        <form method="post" action="../reserve/reserve_ok.do">
          <input type=hidden name="fno" id="fno">
          <input type=hidden name="rday" id="rday">
          <input type=hidden name="rtime" id="rtime">
          <input type=hidden name="rinwon" id="rinwon">
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