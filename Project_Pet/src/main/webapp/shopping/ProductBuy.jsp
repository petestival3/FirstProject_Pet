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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp36070644"); // 예: imp00000000
	function requestPay(recipient,buy_post,phone,request_content,buy_address,pname,allTotalPrice) {
	   console.log('clicked');
	  // IMP.request_pay(param, callback) 결제창 호출
	   IMP.request_pay({
	       pg : 'html5_inicis', // version 1.1.0부터 지원.
	       
	           /*
	               'kakao':카카오페이,
	               'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	               'nice':나이스,
	               'jtnet':jtnet,
	               'uplus':LG유플러스
	           */
	       pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	       merchant_uid : 'merchant_' + new Date().getTime(),
	       name : pname,
	       amount : allTotalPrice ,
	       buyer_email : 'iamport@siot.do',
	       buyer_name : '구매자이름',
	       buyer_tel : '010-1234-5678',
	       buyer_addr : '서울특별시 강남구 삼성동',
	       buyer_postcode : '123-456',
	       app_scheme : 'iamporttest' //in app browser결제에서만 사용 
	   }, function(rsp) {
	       if ( rsp.success ) {
	           var msg = '결제가 완료되었습니다.';
	           msg += '고유ID : ' + rsp.imp_uid;
	           msg += '상점 거래ID : ' + rsp.merchant_uid;
	           msg += '결제 금액 : ' + rsp.paid_amount;
	           msg += '카드 승인번호 : ' + rsp.apply_num;
	       } else {
	    		
	    	   $.ajax({
	    		   type: 'post',
	               url: 'shoppingPayment.do',
	               data: {"buy_address":buy_address,"recipient":recipient,"phone":phone,"request_content":request_content,"buy_post":buy_post},
	               success: function (json){
	            	   
	               }
	    	   })
	          
	           
	       }
	   });
	}
	
	
$('#contact-buypost').click(function(){
		Shadowbox.open({
			content:'../shopping/ShoppingPostfind.do',
			player:'iframe',
			title:'우편번호 검색',
			width:490,
			height:350
		})
		
		
	})
	
	
	$('#moveToBuy').click(function(){
		
	let recipient=$('#name').val()
	let buy_post=$('#buypost').val()
	let buy_address1 = $('#addr1').val()
	let buy_address2 =$('#addr2').val();	
	let phone=$('#phone').val()
	let request_content=$('#requestContent').val()
	let allTotalPrice=$('.allTotalPrice').attr('data-allTotalPrice')
	let pname=$('.real_name').attr('data-pname')+' 외'+$('.shoping__cart__item').attr('data-size')+'건'
	
	
	
if(recipient===''||typeof recipient ==='undefined'){
		alert('수령인을 입력하세요')
		$('#name').focus()
		return;
	}
if(buy_address1===''||typeof buy_address1 ==='undefined'){
	alert('주소를 입력해주세요')
	$('#buy_address1').focus()
	return;
	}
if(buy_address2===''||typeof buy_address2 ==='undefined'){
	alert('상세주소를 입력해주세요')
	$('#buy_address2').focus()
	return;
}
if(recipient===''||typeof recipient ==='undefined'){
	alert('수령인을 입력하세요')
	$('#name').focus()
	return;
}
if(phone===''||typeof phone ==='undefined'){
	alert('전화번호를 입력하세요')
	$('#phone').focus()
	return;
}

if(phone.length!==13){
	alert('전화번호는 13자리입니다(-포함)')
	$('#phone').focus()
	return;
}

if(request_content==='' || typeof request_content==='undefined'){
	request_content=''
}

//uerid
		
		
			let buy_address = buy_address1+buy_address2
			
			
			requestPay(recipient,buy_post,phone,request_content,buy_address,pname,allTotalPrice)
		
		
		
	
		
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
                               
                            <c:forEach var="vo" items="${list }"  varStatus="loop">
                            	<c:if test="${loop.index==0}">
                            	<div class="real_name" style="display:none;" data-pname="${vo.pvo.p_name }"></div>
                            	</c:if>
                                <tr class="hideAndShow">
                                    <td class="shoping__cart__item" data-pno="${vo.pno }" data-pstack="${vo.pvo.p_stack }" data-size="${size}" }>
                                       <img src="${vo.pvo.p_image }" alt="" class="shoppingItemImage">
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
							      <input name="phone" id="phone" placeholder="전화번호(-포함)" type="text" tabindex="12" required>
							    </fieldset>
							    <fieldset>
							      <textarea name="require" placeholder="요청사항을 입력하세요" rows=5 cols=60 id="requestContent"></textarea>
							    </fieldset>
                          </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                <div style="text-align:center;"><img src="../img/mainlogo.png" style="width:240px;"></div>
                
                    <div class="shoping__checkout">
                        
                        
                            
            <span class="allTotalPrice" data-allTotalPrice="${buy_intprice }" style="text-align:center;" ><h2>결제예상금액&nbsp;&nbsp;&nbsp;</h2><h1><span style="color:red;">${buy_price }</span></h1></span></span>
                        
                       
                        <button class="primary-btn"  id="moveToBuy" style="width:500px;">결제하기</button>
                        <input type="hidden" name="getTotal" id="inputTotal" value="">
                         
                        
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

</body>
</html>