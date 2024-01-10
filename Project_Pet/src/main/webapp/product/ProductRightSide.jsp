<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
       	  <div class="p_rightside" style="margin-left:50px;" >
                  <div class="sale_title">
                    <img src="../img/new.png" width=60>
                    신상품
                    </div>
                 <c:forEach var="nwvo" items="${newProductList }">
                     <div class="product_item" style="border-radius: 15px; border: 1px solid #ccc; margin-bottom:10px;" >
                  <div class="product__item">
                   
                        
                          <a href="DetailBefore.do?count=1&pno=${nwvo.pno }">
                           
                        <img class="customimage" src="${nwvo.p_image }" height="100" style="margin-left:15px;">
                                <div class="product__item__text">
                        
                                  <h6 class="p_text" style="padding-left:5px;">${nwvo.p_name }</h6>
                                  <h7 class="hs_original-price">${nwvo.p_price}</h7>
                                  <h7 class="hs_discount-rate">${nwvo.p_percent}</h7>   
                                  <h5 class="hs_final-price">${nwvo.p_lower_price }</h5>
                              </div>
                 </div>
                    </a>
              </div>
                 </c:forEach>
                 	
                 	
                 	 <div class="sale_title" style="margin-top:20px; margin-left:40px;">
                    <img src="../img/bestprice.png" width=50>
                    
                    </div>
                    <div style="margin-bottom:10px;">
                    <span style="font-weight:bold; color:blue; font-size:25px; margin-left:40px;">핫딜</span>
                    </div>
                 
                   <c:forEach var="hpvo" items="${hotpriceList }">
                     <div class="product_item" style="border-radius: 15px; border: 1px solid #ccc; margin-bottom:10px;" >
                  <div class="product__item">
                   
                        
                          <a href="DetailBefore.do?count=1&pno=${hpvo.pno }">
                           
                        <img class="customimage" src="${hpvo.p_image }" height="100" style="margin-left:15px;">
                                <div class="product__item__text">
                        
                                  <h6 class="p_text" style="padding-left:5px;">${hpvo.p_name }</h6>
                                  <h7 class="hs_original-price">${hpvo.p_price}</h7>
                                  <h7 class="hs_discount-rate">${hpvo.p_percent}</h7>   
                                  <h5 class="hs_final-price">${hpvo.p_lower_price }</h5>
                              </div>
                 </div>
                    </a>
              </div>
                 </c:forEach>
                 
                </div>
                
                
                
             
            
        
</body>
</html>