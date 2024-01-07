<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #ffffff;">
	<div class="container">
	<div class="row">
		<center><span><h1>문의답변</h1></span></center>
	
		
	
		<span style="font-weight:bold; font-size:20px;">${p_name }</span> <div style="flex-grow: 1; text-align: right; opacity: 0.7; font-size: 10px;">작성자: ${qwriter}</div>
    </div>
	
	<div class="qcon" style="text-align:left;">
	<span style="font-weight:bold; font-size:20px;">Q:&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold;">${qtitle }</span><div style="margin-left:40px;">${qcontent}</div>
	
	
	</div>
	<c:if test="${filename!='no' }">
	<div class="qcon">
		<h3>[문의사진]</h3>
		<img src="../qnaImg/${filename }" width=100%>
	</div>
	</c:if>
	<c:if test="${ancontent!='no' }">
	&nbsp;<img src="../img/reply.png" width=20px;>
	<div class="qcon" style="text-align:left;">
	<span style="font-weight:bold; font-size:20px;">A:&nbsp;&nbsp;&nbsp;</span><span style="font-weight:bold;">${antitle }(관리자작성)</span><div style="margin-left:40px;">${ancontent}</div>
	</div>
	</c:if>
	<c:if test="${ancontent=='no' }">
	<div class="qcon" style="text-align:left;">
	<span style="font-weight:bold; font-size:20px;"></span><span style="font-weight:bold;"></span><div style="margin-left:40px;">아직등록된 답변이 없습니다.</div>
	</div>
	</c:if>
	
</div>


</body>
</html>