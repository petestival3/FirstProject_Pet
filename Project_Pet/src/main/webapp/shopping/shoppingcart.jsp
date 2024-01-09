<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.shoppingItemImage{
width:100px;
}


.kyj_shoppingQuantity {
 display: flex; 
 justify-content: center;
  align-items: center;
}

.kyj__ShopInput-container {
  display: flex;
  align-items: center;
}

.kyj_shoppingCal {
  width: 60px; /* Adjust width as needed */
  height: 50px; /* Adjust height as needed */
  padding: 10px;
  text-align: center;
  margin: 0 5px; /* Adjust margin for spacing */
  border: 1px solid #ccc;
  font-size: 18px; /* Adjust font size */
  order: 2; /* Change order to place input in the middle */
}

.kyj_shoppingIncreseBtn,
.kyj_shoppingDecreseBtn {
  padding: 13px; /* Adjust padding for button size */
  background-color: #ccc;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
  order: 1; /* Change order to place buttons at the sides */
}

.kyj_shoppingIncreseBtn {
  order: 3; /* Change order to place + button at the right */
}

.kyj_shoppingDecreseBtn:hover,
.kyj_shoppingIncreseBtn:hover {
  background-color: #aaa;
}




</style>
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
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="vo" items="${list }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${vo.pvo.p_image }" alt="" class="shoppingItemImage">
                                        <h5 style="display:inline; font-weight:bold;">${vo.pvo.p_name }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${vo.pvo.p_price }
                                    </td>
                                    <td class="shoping__cart__quantity">
                                      <div class="kyj_shoppingQuantity" >
                                        <div class="kyj__ShopInput-container">
								            <button class="kyj_shoppingDecreseBtn">-</button>
								
								
								            <input type="text" value="${vo.buy_count }" class="kyj_shoppingCal">
								            <button class="kyj_shoppingIncreseBtn">+</button>
								        </div>
            						 </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${vo.buy_price }
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
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
                        <a href="#" class="primary-btn cart-btn">상품목록으로 이동</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니비우기</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                          
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            
                            <li>총액<span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

  

   
</body>
</html>