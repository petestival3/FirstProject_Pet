<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/shopping.css">
<style type="text/css">

</style>


<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
$('#contact-buypost').click(function(){
		Shadowbox.open({
			content:'../shopping/ShoppingPostfind.do',
			player:'iframe',
			title:'우편번호 검색',
			width:490,
			height:350
		})
	})
	
})

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                    	<div style="text-align:center;"><img src="../img/buy.png" style="width:200px;"></div>
                        <table>
                            <thead>
                            
                                
                            </thead>
                            <tbody>
                         
                            <tr class="getSize" >
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총액</th>
                                    <th></th>
                                </tr>
                               
                            <c:forEach var="vo" items="${list }">
                            
                                <tr class="hideAndShow">
                                    <td class="shoping__cart__item" data-pno="${vo.pno }" data-pstack="${vo.pvo.p_stack }">
                                        <a href="../product/DetailBefore.do?count=5&pno=${vo.pno }"><img src="${vo.pvo.p_image }" alt="" class="shoppingItemImage"></a>
                                        <h5 style="display:inline; font-weight:bold;">${vo.pvo.p_name }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                      	<c:if test="${vo.pvo.p_percent!=null }">
                                     <h7 class="hs_original-price">${vo.pvo.p_price}</h7>
                                     </c:if>
                                     
                                  <h7 class="hs_discount-rate">${vo.pvo.p_percent}</h7>   
                                  <h4 class="hs_final-price getShopPrice" >${vo.pvo.p_lower_price }</h4>
                                  
                                    </td>
                                    <td class="shoping__cart__quantity">
                                      <div class="kyj_shoppingQuantity" >
                                        <div class="kyj__ShopInput-container">
								           
								
								
								            <input type="text" value="${vo.buy_count }" class="kyj_shoppingCal" readonly>
								            
								        </div>
            						 </div>
                                    </td>
                                    <td class="shoping__cart__total" data-buy_price="${vo.buy_intprice }">
                                        ${vo.buy_price }
                                    </td>
                                    
                                </tr>
                                
                               </c:forEach>
                                
                                
                            </tbody>
                            </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                       <a href="#" class="primary-btn cart-btn cart-btn-right">돌아가기</a>
                            
                        
                    </div>
                
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="buyContainer">
                         <form id="buy_info" action="#" name="buy_info" method="post">
                          <fieldset>
						      <input name="name" id="name" placeholder="수령인 입력" type="text" tabindex="4" required>
						    </fieldset>
						    
						    <fieldset>
						      <input name="buypost" id="buypost" class="writepost" placeholder="우편번호" type="text"  style="float:left; margin-left:5px;" readonly>
						      <button class="buypostnum btn btn-info" name="buypostnum" type="button" id="contact-buypost" style="float: left; height:50px;" >우편번호검색</button>
						    </fieldset>
						    
						     <fieldset>
							      <input name="addr1" id="addr1" placeholder="주소" type="text" tabindex="20" readonly style="width:500px;">
							    </fieldset>
							    <fieldset>
							      <input name="addr2" id="addr2" placeholder="상세주소" type="text" tabindex="11">
							    </fieldset>
							    <fieldset>
							      <input name="phone" id="phone" placeholder="전화번호" type="text" tabindex="12" required>
							    </fieldset>
							    <fieldset>
							      <textarea name="require" placeholder="요청사항을 입력하세요" rows=5 cols=60></textarea>
							    </fieldset>
                          </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                <div style="text-align:center;"><img src="../img/mainlogo.png" style="width:240px;"></div>
                
                    <div class="shoping__checkout">
                        
                        
                            
            <span class="allTotalPrice" data-allTotalPrice="" style="text-align:center;" ><h2>결제예상금액&nbsp;&nbsp;&nbsp;</h2><h1><span style="color:red;">${buy_price }</span></h1></span></span>
                        
                        <form action="../shopping/shoppingMoveBuy.do" method="post" id="sendBuy"> 
                        <button class="primary-btn"  id="moveToBuy" style="width:500px;">결제하기</button>
                        <input type="hidden" name="getTotal" id="inputTotal" value="">
                          <input type="hidden" name="getStringTotal" id="inputStringTotal" value="">
                        </form>
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

</body>
</html>