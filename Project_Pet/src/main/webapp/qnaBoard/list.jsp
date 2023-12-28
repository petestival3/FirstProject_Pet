<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  -->
<style type="text/css">
.row{
  margin: 0px auto;
  width:850px;
}
.primary-btn {
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 15px 8px;
    color: #ffffff;
    text-transform: uppercase;
    font-weight: 700;
    background: #5a70e9;
    letter-spacing: 2px;
    margin-right: 5px;
    margin-bottom: 4px;
}
</style>
</head>
<body>
  <div class="wrapper row3">
   <main class="container clear">
    <h2 class="sectiontitle" style="text-align: center;">QnA</h2>
    <div class="row">
     <table class="table">
       <tr>
        <!-- <c:if test="${sessionScope.id!=null }"> -->
        <td>
         <a href="#" class="primary-btn">작성하기</a>
        </td>
        <!-- </c:if> -->
       </tr>
     </table>
     <table class="table">
       <tr>
        <th width=10% class="text-center">번호</th>
        <th width=45% class="text-center">제목</th>
        <th width=15% class="text-center">이름</th>
        <th width=20% class="text-center">작성일</th>
        <th width=10% class="text-center">조회수</th>
       </tr>
       
       <%-- <c:forEach var="vo" items="${list }">
         <tr>
	        <td width=10% class="text-center">${vo.qno }</td>
	        <td width=45%>
	         <c:if test="${vo.group_tab==1 }">
	           &nbsp;&nbsp;
	           <i class="fa fa-arrow-circle-right"></i>
	           <!-- <img src="../replyboard/image/re_icon.png"> -->
	         </c:if>
	         <a href="../qnaBoard/detail.do?no=${vo.qno}">${vo.qtitle }</a>
	        </td>
	        <td width=15% class="text-center">${vo.qwriter }</td>
	        <td width=20% class="text-center">${vo.dbday }</td>
	        <td width=10% class="text-center">${vo.qhit }</td>
	       </tr>
       </c:forEach> --%>
       
     </table>
     
    </div>
   </main>
  </div>
</body>
</html>