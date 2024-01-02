<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
	margin: 0px auto;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
  <h2 class="sectiontitle text-center">자유게시판</h2>
  <div class="row row1" style="height: 200px">
   <table class="table">
    <tr>
     <td>
      <!-- <a href="../freeboard/insert.do"
       class="btn btn-sm btn-danger">글작성</a> -->
       <a href="../freeboard/insert.do" 
       class="primary-btn" style="font-weight: bold;">작성하기</a>
     </td>
    </tr>
   </table>
   <table class="table">
    <tr>
     <th class="text-center" width=10%>번호</th>
     <th class="text-center" width=50%>제목</th>
     <th class="text-center" width=10%>작성자</th>
     <th class="text-center" width=20%>작성일</th>
     <th class="text-center" width=10%>조회수</th>
    </tr>
    <c:set var="count" value="${count }"/>
    <c:forEach var="vo" items="${list }">
      <tr>
       <td class="text-center" width=10%>${count }</td>
       <td width=55%><a href="../freeboard/detail.do?no=${vo.no }">${vo.subject }</a>
        &nbsp; <c:if test="${today==vo.dbday }">
          <sup><img src="../freeboard/new.gif"></sup>
        </c:if></td>
       <td class="text-center" width=10%>${vo.name }</td>
       <td class="text-center" width=15%>${vo.dbday }</td>
       <td class="text-center" width=10%>${vo.hit }</td>
      </tr>
      <c:set var="count" value="${count-1 }"/>
    </c:forEach>
    
    <!-- 페이지 -->
    <tr>
        <td colspan="5" class="text-center">
         <a href="#" class="btn btn-danger btn-sm">이전</a>
         ${curpage } page / ${totalpage } pages
         <a href="#" class="btn btn-danger btn-sm">다음</a>
        </td>
    </tr>
    
    
			      
    
    
    
   </table>
  </div>
  </main>
</div>
</body>
</html>