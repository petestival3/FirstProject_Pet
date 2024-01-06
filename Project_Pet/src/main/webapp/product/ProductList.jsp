
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">


<head>

    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
    <style type="text/css">
       .p_cate > li > a:hover
       {
     background-color: #333;
    color: #fff;
    border-color: #333;
        }
        .prod_page a:hover
        {
          background-color: #333;
    color: #fff;
    border-color: #333;
        }
   
    </style>
</head>

<body>
  
   
    <!-- Product Section Begin -->
    
        
       
        
        
        
        
           
                <div class="cust">
        <ul class="nav nav-pills p_rank">
       <li ><a href="ProductList.do?ct=${ct }&rt=p_intprice" class="${rt eq 'p_intprice'?'kyj_cate_selected':'' }">가격순</a></li>
      <li><a href="ProductList.do?ct=${ct }&rt=p_hit" class="${rt eq 'p_hit'?'kyj_cate_selected':'' }">조회수</a></li>
       <li><a href="ProductList.do?ct=${ct }&rt=p_review_num" class="${rt eq 'p_review_num'?'kyj_cate_selected':'' }">후기개수</a></li>
     <li><a href="ProductList.do?ct=${ct }&rt=p_stack" class="${rt eq 'p_stack'?'kyj_cate_selected':'' }">품절임박</a></li>
       </ul> 
       
        </div>
               
              <div class="col-lg-9 col-md-7">
                    <div class="row">
                          <c:forEach var="vo" items="${list }">
                          <c:url value="DetailBefore.do" var="url">
                          <c:param name="pno" value="${vo.pno }"/>
                          <c:param name="ct" value="${ct}"/>
                          <c:param name="rt" value="${rt}"/>
                          <c:param name="page" value="${page}"/>
                          </c:url>
                                <div class="col-lg-4 col-md-6 col-sm-6 image-container">
                                <a href="<c:out value="${url}" />">
                                 <img src="${vo.p_image }" class="customimage">
                                       <div class="product__item">
                                     <div class="product__item__text">
                                          <h5>${vo.p_name }</h5>
                                    <h6>${vo.p_lower_price }</h6>
                                </div>
                                </div>
                                 </a>
                         </div>
                        
                        </c:forEach>
                            </div>
                        
                                  
                        
                     
                             
                           
                            
                             <div class="product__pagination prod_page">
                    <center>
                    <c:if test="${start > 1}">
                        <a href="../product/ProductList.do?page=${start-1 }&ct=${ct}&rt=${rt}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${start }" end="${end }">
                        
                          <c:choose>
                           <c:when test="${i eq page}">
                            <a href="../product/ProductList.do?page=${i }&ct=${ct}&rt=${rt}" class="kyj_selected">${i }</a>
                              
                           </c:when>
                           <c:otherwise>
                             <a href="../product/ProductList.do?page=${i }&ct=${ct}&rt=${rt}">${i }</a>
                           </c:otherwise>
                        </c:choose>
                       </c:forEach>
                        
                        <c:if test="${end < totalpage}">
                       <a href="../product/ProductList.do?page=${end + 1}&ct=${ct}&rt=${rt}"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                    </div>
                       
                    
                   
                </div>
    
    <!-- Product Section End -->

</body>

</html>