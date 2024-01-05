<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product__pagination ul{
	list-style: none;
}
.product__pagination li{
	display: inline-block;
}
.product__pagination li.active{
	background: #5a70e9;
	border-color: #a6a6a6;
	color: #ffffff;
}
a {
    color: black;
    text-decoration: none;
}
a:hover {
	color: #5a70e9;
}
.table_freeboard a:hover {
	color: white;
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
                        <h2>Notice</h2>
                        <div class="breadcrumb__option">
                            <%-- <a href="./index.html">유기동물 보호센터&nbsp;&nbsp;</a>--%>
                            <span>Community&nbsp;&nbsp;-&nbsp;&nbsp;Notice</span>
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
     <th class="text-center" width=10% style="font-size: 13px;">번호</th>
     <th class="text-center" width=50% style="font-size: 13px;">제목</th>
     <th class="text-center" width=10% style="font-size: 13px;">작성자</th>
     <th class="text-center" width=20% style="font-size: 13px;">작성일</th>
     <th class="text-center" width=10% style="font-size: 13px;">조회수</th>
    </tr>
    <!--<c:set var="count" value="${count }"/>-->
    <c:forEach var="vo" items="${list }">
      <tr>
       <td class="text-center" width=10%>${vo.no }</td>
       <td width=55%><a href="../notice/detail.do?no=${vo.no }">${vo.subject }</a>
        &nbsp; <c:if test="${today==vo.dbday }">
          <sup><img src="../freeboard/new.gif"></sup>
        </c:if></td>
       <td class="text-center" width=10%>${vo.name }</td>
       <td class="text-center" width=15%>${vo.dbday }</td>
       <td class="text-center" width=10%>${vo.hit }</td>
      </tr>
      <!--<c:set var="count" value="${count-1 }"/>-->
    </c:forEach>
    
    
			 
    
    <!-- 글작성 -->
    
    <div class="freeboard_insert">
    
    <table class="table">
    <table class="table_freeboard">
    
     <tr>
      <td>
      <c:if test="${sessionScope.id!=null }">
       <a href="../notice/insert.do" 
       class="primary-btn" style="font-weight: bold;">작성하기</a>
      </c:if>
      </td>
     </tr>
     
    </table>
    </table>
    
    
    <%-- 페이지 --%>
             <div class="product__pagination" style="margin: 0px auto;">
			   
			    <!--<c:if test="${startPage>1 }">
			     <li>
		         <a href="../freeboard/list.do?page=${startPage-1 }">&laquo;</a>
		         </li>
		        </c:if>
		        
		         ${curpage } page / ${totalpage } pages
		         
		        <c:if test="${endPage<totalpage }">
		         <li>
		         <a href="../freeboard/list.do?page=${endPage+1 }">&raquo;</a>
		         </li>
		        </c:if> -->
		        
			   <ul>
			    <c:if test="${startPage>1 }">
			     <li><a href="../notice/list.do?page=${startPage-1 }">&laquo;</a></li>
			    </c:if>
			         
			    <c:forEach var="i" begin="${startPage }" end="${endPage }">
			       <li ${curpage==i?"class=active":"" }><a href="../notice/list.do?page=${i }">${i }</a></li>
			    </c:forEach>
			         
			          
			    <c:if test="${endPage<totalpage }">
			     <li><a href="../notice/list.do?page=${endPage+1 }">&raquo;</i></a></li>
			    </c:if>
			   </ul>
			 </div>
    
    </div>

   </table>
  </div>
</div>
</section>
</body>
</html>