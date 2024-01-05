<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-3 col-md-5 p_category" >
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>카테고리</h4>
                            <hr>
                            <ul class="p_cate">
                                <li><a href="ProductList.do?ct=1" class="${ct eq '전체' ? 'kyj_selected' : ''}">전체(${cateNumList[0] })</a></li>
                                
                                <li><a href="ProductList.do?ct=2" class="${ct eq '간식' ? 'kyj_selected' : ''}">간식(${cateNumList[1] })</a></li>
                                <li><a href="ProductList.do?ct=3" class="${ct eq '배변/위생' ? 'kyj_selected' : ''}">배변/위생(${cateNumList[2] })</a></li>
                                <li><a href="ProductList.do?ct=4" class="${ct eq '목욕/미용' ? 'kyj_selected' : ''}">목욕/미용(${cateNumList[3] })</a></li>
                                <li><a href="ProductList.do?ct=5" class="${ct eq '사료' ? 'kyj_selected' : ''}">사료(${cateNumList[4] })</a></li>
                                <li><a href="ProductList.do?ct=6" class="${ct eq '장난감' ? 'kyj_selected' : ''}">장난감(${cateNumList[5] })</a></li>
                                <li><a href="ProductList.do?ct=7" class="${ct eq '건강관리' ? 'kyj_selected' : ''}">건강관리(${cateNumList[6] })</a></li>
                                <li><a href="ProductList.do?ct=8" class="${ct eq '식기' ? 'kyj_selected' : ''}">식기(${cateNumList[7] })</a></li>
                                <li><a href="ProductList.do?ct=9" class="${ct eq '산책/이동장' ? 'kyj_selected' : ''}"}">산책/이동장(${cateNumList[8] })</a></li>
                                <li><a href="ProductList.do?ct=10" class="${ct eq '하우스/울타리' ? 'kyj_selected' : ''}">하우스/울타리(${cateNumList[9] })</a></li>
                                <li><a href="ProductList.do?ct=11" class="${ct eq '의류/악세서리' ? 'kyj_selected' : ''}">의류/악세서리(${cateNumList[10] })</a></li>
                              </ul>
                        </div>
                   
                     
                    </div>
                    <div class="sale_title">
                    <img src="../img/pngwing.com.png" width=60>
                 	초특가할인
                    </div>
                   
                    
                 <div id="highsale_container1" >
  				  <div style="height: 100%; display: flex; flex-direction: column; " class="product_items">
  				
      				  <c:forEach var="hsvo" items="${highSaleList}">
      				
      				  <div class="product_item" style="border-radius: 15px; border: 1px solid #ccc;">
      			   <div class="product__item">
                   
                    		<c:url value="DetailBefore.do?count=1" var="hsurl">
              				<c:param name="pno" value="${hsvo.pno }"/>
              				</c:url>
                 		   <a href="<c:out value="${hsurl}"/>">
                        	
                        <img class="customimage" src="${hsvo.p_image }" height="100" style="margin-left:35px;">
                        		  <div class="product__item__text">
                        
                          		  <h6 class="p_text" style="padding-left:5px;">${hsvo.p_name }</h6>
                          		  <h7 class="hs_original-price">${hsvo.p_price}</h7>
                          		  <h7 class="hs_discount-rate">${hsvo.p_percent}</h7>	
                          		  <h5 class="hs_final-price">${hsvo.p_lower_price }</h5>
                        		</div>
                 </div>
                    </a>
        		</div>
    			     </c:forEach>
   				 </div>
				</div>
		    </div>
                
              
</body>
</html>