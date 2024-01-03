<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	margin: 0px auto;
}
nav.pagination ul{
	list-style: none;
}
nav.pagination li{
	display: inline-block;
}
.product__pagination li.active,
.blog__pagination li.active {
	background: #5a70e9;
	border-color: #a6a6a6;
	color: #ffffff;
}
</style>
</head>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg" style="margin-top: 20px">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Free Board</h2>
                        <div class="breadcrumb__option">
                            <%-- <a href="./index.html">유기동물 보호센터&nbsp;&nbsp;</a>--%>
                            <span>Community&nbsp;&nbsp;-&nbsp;&nbsp;Free Board</span>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<section class="blog-details spad">
 <div class="container">
  <div class="row" style="margin-top: 10px;">
   
   
   <table class="table">
    <tr>
     <th class="text-center" width=10%>번호</th>
     <th class="text-center" width=50%>제목</th>
     <th class="text-center" width=10%>작성자</th>
     <th class="text-center" width=20%>작성일</th>
     <th class="text-center" width=10%>조회수</th>
    </tr>
    <!--<c:set var="count" value="${count }"/>-->
    <c:forEach var="vo" items="${list }">
      <tr>
       <td class="text-center" width=10%>${vo.no }</td>
       <td width=55%><a href="../freeboard/detail.do?no=${vo.no }">${vo.subject }</a>
        &nbsp; <c:if test="${today==vo.dbday }">
          <sup><img src="../freeboard/new.gif"></sup>
        </c:if></td>
       <td class="text-center" width=10%>${vo.name }</td>
       <td class="text-center" width=15%>${vo.dbday }</td>
       <td class="text-center" width=10%>${vo.hit }</td>
      </tr>
      <!--<c:set var="count" value="${count-1 }"/>-->
    </c:forEach>
    
    <%-- 페이지 --%>
             <nav class="pagination">
             <div class="product__pagination" style="margin: 0px auto;">
			   <ul>
			    <%-- startPage : 1 , 11 , 21 , 31... --%>
			    <c:if test="${startPage>1 }">
			     <li><a href="../freeboard/list.do?page=${startPage-1 }">&laquo;</a></li>
			    </c:if>
			         
			    <c:forEach var="i" begin="${startPage }" end="${endPage }">
			       <li ${curpage==i?"class=active":"" }><a href="../freeboard/list.do?page=${i }">${i }</a></li>
			    </c:forEach>
			         
			          
			    <c:if test="${endPage<totalpage }">
			     <li><a href="../freeboard/list.do?page=${endPage+1 }">&raquo;</i></a></li>
			    </c:if>
			   </ul>
			 </div>
			 </nav>
    
    <!-- 글작성 -->
    <div class="freeboard_insert">
    <table class="table">
     <tr>
      <td>
       <a href="../freeboard/insert.do" 
       class="primary-btn" style="font-weight: bold;">작성하기</a>
      </td>
     </tr>
    </table>
    </div>

   </table>
  </div>
</div>
</section>
</body>
</html>