<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../css/shopping.css">
<style type="text/css">





</style>



<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	document.getElementById('sendBuy').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼의 기본 동작 중단
        console.log('클릭')
    	
    	$.ajax({
    		   type: 'post',
           url: 'shoppingBeforeCheck.do',
           data: {},
           success: function (json){
        	let res=JSON.parse(json)
        	console.log(res.msg)
        	if(res.msg==='NOCART'){
        		alert('장바구니가 비었습니다.')
        	}
        	else if(res.msg==='NOSTACK'){
        		alert('품절된 상품이 포함되어 있습니다')
        	}
        	else{
        		document.getElementById('sendBuy').submit();
        	}
        	
         	  
        	}
    	
    	})
      
    });
	
	allTotalPrice()

	let size=$('.getSize').attr('data-size')	
	let noItemCheck=false;
	
	 
	
	function updateShop(buy_count,buy_intprice,cbno){
		$.ajax({
   		 type: 'post',
   	        url: 'shoppingCartUpdate.do',
   	        data: { "buy_count":buy_count , "buy_intprice":buy_intprice ,"cbno":cbno },
   	        success: function (json){
   	        	allTotalPrice()
   	        }
   		
   		})
	}
	
	$(".kyj_shoppingIncreseBtn").click(function() {
		
			let pstack=$('.shoping__cart__item').attr('data-pstack')
			const cbno=$(this).attr('data-cbno')
			
		  let price = $(this).attr('data-ShopPrice');
        	let count=$(this).siblings('.kyj_shoppingCal').val()
        	
        	if(count===pstack){
        		alert('재고보다 많을 수 없습니다.')
        		return;
        	}
        	count++;
        	$(this).siblings('.kyj_shoppingCal').val(count)
           let total = $(this).closest('tr').find('.shoping__cart__total');
        	 let intTotal = $(this).closest('tr').find('.shoping__cart__total');
        	 
        let buy_intprice=calculateTotal(price,count,total,intTotal,0,1)
        				
       
        	
        		//업데이트
        
   		 updateShop(count,buy_intprice,cbno)
   	
        	
    });
	
	
	$(".kyj_shoppingDecreseBtn").click(function() {
		
		const cbno=$(this).attr('data-cbno')
		  let price = $(this).attr('data-ShopPrice');
      	let count=$(this).siblings('.kyj_shoppingCal').val()
      	if(count>1){
      		count--;
      		$(this).siblings('.kyj_shoppingCal').val(count)
      		 let total = $(this).closest('tr').find('.shoping__cart__total');
      		 let intTotal = $(this).closest('tr').find('.shoping__cart__total');
        	
        	
        	 let buy_intprice=calculateTotal(price,count,total,intTotal,0,1)
        			
        	
        	 //업데이트
        	
        		 updateShop(count,buy_intprice,cbno)
        	 
        		
      	}
      
      	
  });
	
	
$(".icon_close").click(function() {
	const cbno=$(this).attr('data-cbno')
	 let intTotal = $(this).closest('tr').find('.shoping__cart__total');
	
	 let minusPrice = $(this).closest('tr').find('.shoping__cart__total').attr('data-buy_price');
	 intTotal.attr('data-buy_price',0)
	let close=$(this).closest('.hideAndShow')
	
	let open=$('.noShopItems')
	size--;
	close.hide()
	if(size===0){
		 open.show() 
		 noItemCheck=true;
	}
						
	
	
						$.ajax({
			  			   type: 'post',
			  	           url: 'shoppingCartDelete.do',
			  	           data: { "cbno":cbno},
			  	           success: function (json){
			  	        	
			  	        	
			  	        	calculateTotalClose(minusPrice)
			  	        	}
			  		
			  		})
	
	  
	
	
  });
	
	
$(".cart-btn-right").click(function() {
	
	let close=$('.hideAndShow')
	let open=$('.noShopItems')
	
	
	if(noItemCheck!==true){
		close.hide()
		 open.show() 	
		 
	}
	
	
	$.ajax({
		   type: 'post',
          url: 'shoppingCartReset.do',
          data: {},
          success: function (json){
       	
       	
        	  ResetTotal()
       	}
	
	})
	
    
	
  });
	

	

	

	 function calculateTotal(price,quantity,total,intTotal) {
	      
		 let totalprice = price * quantity;
	        
	        
	       	intTotal.attr('data-buy_price',totalprice)       	
	       	let result=	intTotal.attr('data-buy_price')       
	        total.text(formatCurrency(totalprice));
	       	
	       	
	       	return result;
	        
	    }
	 
	 
	 function calculateTotalClose(price){
		 let total=$('.allTotalPrice').attr('data-allTotalPrice')
		 let totalText=$('.allTotalPrice')
		let totalprice=total-price
		 
		totalText.attr('data-allTotalPrice',totalprice)
		totalText.text(formatCurrency(totalprice))
		 
		$('#inputTotal').val(totalprice)
		  
	 }
	 
	 function ResetTotal(){
		 let totalText=$('.allTotalPrice')
		 	totalText.attr('data-allTotalPrice',0)
		totalText.text('0원')
		
	 }
	
	
	 function formatCurrency(amount) {
	        return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	    }
	 
	 function allTotalPrice(){
		 let allTotalPrice=$('.allTotalPrice')
		 let data = $('.shoping__cart__total'); // 모든 .shoping__cart__total 요소 선택
		    let dataprice = 0;

		    for (let i = 0; i < data.length; i++) {
		        // 각 요소의 data-buy_price 값을 가져와서 합산
		        dataprice += parseInt($(data[i]).attr('data-buy_price'));
		    }
		    allTotalPrice.attr('data-allTotalPrice',dataprice)
		    let textAllTotalPrice=$('.allTotalPrice').attr('data-allTotalPrice')
		    
		    $('.allTotalPrice').text( formatCurrency(textAllTotalPrice))
		 $('#inputTotal').val(dataprice)
	 }
	
	
    
});
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
                    <div style="text-align:center;"><img src="../img/shoppingcart.png" style="width:200px;"></div>
                        <table>
                            <thead>
                            
                                
                            </thead>
                            <tbody>
                         
                            <tr class="getSize" data-size="${size}">
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
								            <button class="kyj_shoppingDecreseBtn" data-ShopPrice="${vo.pvo.p_intlowerprice }" data-cbno="${vo.cbno }" >-</button>
								
								
								            <input type="text" value="${vo.buy_count }" class="kyj_shoppingCal" readonly>
								            <button class="kyj_shoppingIncreseBtn" data-ShopPrice="${vo.pvo.p_intlowerprice }" data-cbno="${vo.cbno }" >+</button>
								        </div>
            						 </div>
                                    </td>
                                    <td class="shoping__cart__total" data-buy_price="${vo.buy_intprice }">
                                        ${vo.buy_price }
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close" data-cbno="${vo.cbno }"></span>
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
                        <a href="../product/ProductList.do" class="primary-btn cart-btn">상품보러가기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니비우기</a>
                    </div>
                    <div class="noShopItems" style="display:${size==0?'':'none;'}">
                            <div style="text-align:center;"><h2>장바구니에 담긴 상품이 없습니다.</h2></div>
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
                            
                            <li>총액<span class="allTotalPrice" data-allTotalPrice="" ></span></li>
                        </ul>
                        <form action="../shopping/shoppingMoveBuy.do" method="post" id="sendBuy"> 
                        <button class="primary-btn"  id="moveToBuy" style="width:500px;">결제이동하기</button>
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