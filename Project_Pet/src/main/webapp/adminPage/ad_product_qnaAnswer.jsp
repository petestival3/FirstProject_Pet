<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<style type="text/css">
 .container {
 border: 1px solid #ccc; /* 연한 외곽 테두리 */
  padding: 20px; /* 콘텐츠와 테두리 간격 */
  margin: 30px; /* 여백 */
}

/* qcon 클래스의 스타일 */
.qcon {
  border: 1px solid #ccc; /* 연한 외곽 테두리 */
  padding: 10px; /* 콘텐츠와 테두리 간격 */
  margin-top: 10px; /* 위쪽 여백 */
   word-wrap: break-word; /* 텍스트가 요소를 넘어갈 때 줄바꿈 설정 */
}

</style>

<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	
	
	$('#qsubmitBtn').click(function(){
		
	
		  
		  let qno=$('#getQno').data('qno')
		let admincontent = $('#admincontent').val()
		let admintitle= $('#admintitle').val()
		
		if(admincontent.trim()===''){
			alert('내용을 입력해주세요')
			return;
		}
		
		if(admintitle.trim()===''){
			alert('제목을 입력해주세요')
			return;
		}
		
		 sendDataToParent(qno,admincontent ,admintitle)
		
	   	
	})
	
	function sendDataToParent(data1, data2,data3) {
	    const message = {
	        data1: data1,
	        data2: data2,
	        data3: data3
	    };

	    window.parent.postMessage(message, '*');
	}

   
});

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #ffffff;">
	<div class="container" id="getQno" data-qno="${qno }">
	<center><span><h1>문의답변</h1></span></center>
	<div class="row">
		
	
		
	
		<span style="font-weight:bold; font-size:20px;">${p_name }</span> <div style="flex-grow: 1; text-align: right; opacity: 0.7; font-size: 10px;">작성자: ${vo.qwriter}</div>
    </div>
	
	<div class="qcon" style="text-align:left;">
	<span style="font-weight:bold; font-size:20px;">Q:&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold;">${vo.qtitle }</span><div style="margin-left:40px;">${vo.qcontent}</div>
	
	
	</div>
	<c:if test="${vo.filename!='no'}">
	<div class="qcon">
		<h3>[문의사진]</h3>
		<img src="../qnaImg/${vo.filename }" width=100%>
	</div>
	</c:if>

	&nbsp;<img src="../img/reply.png" width=20px;>
	<div class="qcon" style="text-align:left;">
	
	<span style="font-weight:bold; font-size:20px;">A:&nbsp;&nbsp;&nbsp;</span>
	<span style="font-weight:bold;"><input type="text" id="admintitle" name="admintitle" placeholder="제목입력"></span>
	<div style="height:5px;"></div>
	<div style="margin-left:40px;">
	<textarea name="admincontent" id="admincontent" rows="10" cols="50" placeholder="내용을 입력하세요"></textarea>
	
	<div><button class="btn btn-danger" name="qsubmitBtn" id ="qsubmitBtn" style="margin-left:325px;">등록하기</button></div>
	</div>
	
	
	</div>
	
	
</div>


</body>
</html>