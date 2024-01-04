<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">



</script>





<style type="text/css">



.review-container {
    box-shadow: none; /* 특정 스타일을 없애고자 할 때, 값을 none으로 설정 */
    /* 필요에 따라 다른 속성도 재설정할 수 있습니다. */
  
  
  
  }
 
  
  .mid_3{
 width:400px;
  overflow-wrap: break-word; /* 컨테이너 경계를 넘어가는 경우 단어를 자르고 줄바꿈 */

  }
  
  



</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">

</script>
<script type="text/javascript">
var IMP = window.IMP; // 생략 가능
IMP.init("imp36070644"); // 예: imp00000000
function requestPay() {
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
	    name : $('#title').text(),
	    amount : $('#price').attr('data-price'),
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
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	});
}
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	

 <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>산책</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">산책을 느껴보세요</a>
                            <span>산책</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




						 <!--
                    현재 코드는 상세보기 하단에 최근본 상품을 출력하고 있는데 
                    클릭시 바로 상세보기로 넘어가게 한다 . 다만 일반 목록에서 출력하는것과 차별성을 둔
                     DetailBefore.do?count=1 => count 값을 1을 줬는데 
                     나중에  상세보기에서 DetailListBack.do (목록이동) 클릭시 기존보던 페이지로 이동하지않고
                     디폴트 리스트로 이동하기 위함이다 .
                     나머지ct,rt,page값은 목록으로 돌아가기에는 필요없는 값이지만 detailbefore.do(쿠키저장)메소드에서 detail.do
                     메소드로 넘겨주는과정에서 파라미터값으로 요청하고 있기때문에 통일성을 위해서 준다. 
                     -->
							<c:url value="DetailListBack.do" var="url">
              				<c:param name="lcount" value="${lcount }"/>
              				<c:param name="ct" value="${ct}"/>
              				<c:param name="rt" value="${rt}"/>
              				<c:param name="ss" value="${ss}"/>
              				<c:param name="page" value="${page}"/>
              				</c:url>
              				
              				
  <!-- Product Details Section Begin -->
    <section class="product-details spad">
    
    <div class="container">
   
    
   		 <table class="up_to_image" style="margin-left:20px;">
   		 	
   			 <tr>
   			 
    			<td>
     					 <span id="kyj_top_link"><a href="${url}"><img src="../img/left.png.svg" alt="">목록</a></span>
     			    
                   
                   </td>
               </tr>
           </table>
        <div class="container">
       
            <div class="row">
                <div class="col-lg-6 col-md-6">
                
                    <div class="product__details__pic__item">
    <img class="customimage product__details__pic__item--large" src="${vo.p_image}" alt="">
</div>

<div class="row detail_sub_image">
    <c:forEach var="subVo" items="${subImageList}" varStatus="loop">
        <div class="col-2">
            <img src="${subVo.p_sub_image}" class="sub-image" data-index="${loop.index}">
        </div>
    </c:forEach>
</div>
                  
                </div>
                 
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text" style="padding-left:20px;" >
                    	
                    	<div>
                    	<span class="category-tag" style="margin-bottom:10px;"><a href="ProductList.do?ct=${vo.p_category }">${vo.p_category }</a></span>
                         <span class="hit-wrapper hit-number">조회수${vo.p_hit}</span>
                        <h3 id="title" data-pno="${vo.pno }">${vo.p_name }</h3>
                    </div>


                        
                        <div class="product__details__rating ">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                       
                            <span>(18 reviews)</span>
                             
                        </div>
                       
                        <p>
                        
                     <div id="detail_p_price" class="product__details__price" data-price="${vo.p_intlowerprice }">
                      	   <c:if test="${not empty vo.p_percent}">
  						  		<div class="discounted-price">
     						 		  <span class="p_original_price">${vo.p_price}</span>
       						 		   <span class="product__details__discount">${vo.p_percent}</span>
   								  </div>
				      	   </c:if>
				      	  
							<div class="product__details__price">${vo.p_lower_price}</div>
					 </div>
      							
      
      						 <ul>
      						 <c:if test="${not empty vo.p_shipment}">
                            <li><b>배송</b> <span>${vo.p_shipment }</span></li>
                            </c:if>
                            <c:if test="${not empty vo.p_expire_date}">
                            <li><b>유통기한</b> <span>${vo.p_expire_date}</span></li>
                            </c:if>
                           <li><b>남은재고</b> <span class="product__details__stock">${vo.p_stack}</span></li>
                           
                       
                           	</ul>
                           		
                          	  <ul> 	</ul>
      <div class="kyj_calBox">
    <div class="kyj__details__quantity">
        <div class="kyj__quantity">
            <div class="kyj__input-container">
                <button class="kyj__decreaseBtn">-</button>
                <input type="text" value="1" class="kyj__calculate">
                <button class="kyj__increaseBtn">+</button>
            </div>
        </div>
         <h2><span id="kyj_total_price"></span></h2><!-- 총액 계싼 -->
    </div>
   
</div>
			<div style="height:15px;"></div>

					<div class="bottom_cate" style=" ">
						
                        <a href="#" class="primary-btn text-center" style="width: 190px;">장바구니</a>
                          <a href="#" class="primary-btn text-center" style="width: 190px;" onclick="requestPay()">구매하기</a>
                         	<button>좋아요 예정</button>
                      </div>
      			
      				  
                        <!--  
                                목록으로 돌아가기 위함으로 DetailListBack.do 에 파라미터 값으로 
                             	현재 보는 상세보기가 최근본상품을 통한 상세보기인건지 단순 목록에서 본 상세보기인지 구분
                             	(lcount==null 이면 단순 목록에서 본 상품 , lcount가 1이면 최근본 상품에서 선택한 상세보기)
                             	최근본상품에서 본 상세보기일경우 디폴트값 리스트 목록으로 이동한다 . 단순 목록에서 본 상품상세보기 이면 보던 목록으로 
                             	넘어가게 한다 . = > 이처리는 DetailListBack.do 에서 처리한다
                             	ct=>카테고리정보
                             	rt=>조회수순,후기개수순 등정보
                             	page=> 페이지정보
                             	등을 이용해서 보던 목록으로 넘어가야하기 때문에 el로 값을 받는다.
                                -->
                       
                    </div>
                      
                </div>
                
              
        
                <div class="col-lg-12">
                 
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#p_tabs-1" role="tab"
                                    aria-selected="true">상품상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#p_tabs-2" role="tab"
                                    aria-selected="false">상품후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#p_tabs-3" role="tab"
                                    aria-selected="false">상품문의 <span>(1)</span></a>
                            </li>
                        </ul>
                        
                        
                        <div class="tab-content">
                            <div class="tab-pane active" id="p_tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                
                                <c:if test="${!(vo.p_detail_image==null || vo.p_detail_image=='') }">
                                <div>
                                  <center>
                                  <div>
                                  <button id="show_pro_detail_inform" class="btn btn-lg btn-info">상품상세정보 펼치기&nbsp;&nbsp;&gt;</button>
                                 
                                  </div>
                                  <div> <button class="close_pro_detail_inform btn btn-lg btn-info">상품상세정보 접기&nbsp;&nbsp;&gt;</button></div>
                                  </center>
                                    <p>
                                     <center><div class="pro_detail_img">
                                    <img src="${vo.p_detail_image }">
                                    <div><button class="close_pro_detail_inform btn btn-lg btn-info">상품상세정보 접기&nbsp;&nbsp;&gt;</button></div>
                                    </div>
                                    </center>
                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${(vo.p_detail_image==null || vo.p_detail_image=='') }">
                                    <div><center><img src="../img/noImg.png"></center></div>
                                      </c:if>
                                    
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="p_tabs-2" role="tabpanel">
                            	<div id="input_list">
                                <div class="product__details__tab__desc" id="firstLoadPage">
                                
                                <c:if test="${prListSize!=0 }">
                                <div class="p_total_review_container" >
                                 	
                                 		<div class="p_total_review">
                                 		
                                 		 <div class="rating" style="width:400px; margin-top:10px; margin-bottom:10px;">
                                 		 	<c:if test="${vo.p_grade>=0.5 and vo.p_grade<1 }">
                                 		 	  <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${vo.p_grade>=1 and vo.p_grade<1.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 		<c:if test="${vo.p_grade>=1.5 and vo.p_grade<2 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${vo.p_grade>=2 and vo.p_grade<2.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${vo.p_grade>=2.5 and vo.p_grade<3 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${vo.p_grade>=3 and vo.p_grade<3.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${vo.p_grade>=3.5 and vo.p_grade<4 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	    <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 		<c:if test="${vo.p_grade>=4 and vo.p_grade<4.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 		</c:if>
                                 		 	
                                 		 	
                                 		 		<c:if test="${vo.p_grade>=4.5 and vo.p_grade<5 }">
                                 		 		
                                 		 		
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 	      <span class="half-star">⭐️</span>
                                 		 	     
                                 		 	     
                                 		 		</c:if>
                                 		 	
                                 		 	
                                 		 		<c:if test="${vo.p_grade>=5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 	      <span class="star">⭐️</span>
                                 		 		</c:if>
                                 		 	
									           
									          </div>
									          
									          <div style="margin-top:10px;">
									         
									          <h1>평점 ${vo.p_grade }/5</h1>
									          </div>
                                 		
                                 		</div>
                                 		
                                 		<div class="p_select_review_option" style="margin-top:30px;">
                                 		<ul class="p_rank p_review_rank">
                                 			<li class="r_option"><button id="highscore" class="btn btn-primary">높은 평점순</button></li>
                                 			<li class="r_option"><button id="lowscore" class="btn btn-info">낮은 평점순</button> </li>
                                 			<li class="r_option"><button id="latestdate" class="btn btn-info">최신날짜 순</button></li>
                                 			<li class="r_option"><button id="olddate" class="btn btn-info">오래된날짜 순 </button> </li>
                                 				
                                 		</ul>
                                 			<div style="margin-left:990px;">
                                 			<c:if test="${sessionScope.id==null || sessionScope.id=='' }">
                                 				<span>로그인 후 후기등록이 가능합니다.</span>
                                 			</c:if>
                                 			<c:if test="${sessionScope.id!=null }">
                                 		<button id="write_product_review" class="btn-sm btn-danger">후기 작성하기</button>
                                 		</c:if>
                                 		</div>
                                 		</div>
                                 	</div>
                                 	<hr>
                                 	</c:if>
                                
                                
                                
                                <c:if test="${prListSize==0 }">
                                <div><h2>등록된 후기가없습니다</h2></div>
                                	<div style="margin-left:990px;">
                                 	<c:if test="${sessionScope.id==null || sessionScope.id=='' }">
                                 				<span>로그인 후 후기등록이 가능합니다.</span>
                                 			</c:if>
                                 			<c:if test="${sessionScope.id!=null }">
                                 		<button id="write_product_review" class="btn-sm btn-danger">후기 작성하기</button>
                                 		</c:if>
                                 		</div>
                                </c:if>
                                
                                
                                
                                
                                <c:if test="${prListSize!=0 }">
                                	<c:forEach var="prVo" items="${prList }">
                                	
                                 	
                                 
                                 
                                 <!-- for문 -->
                                  <div class="row product_review_container" data-page="1">
                                  	 <div class="col-md-4" style="width:200px; height:200px ;">
                                  	 <div class="p_review_image" style="width:100%; height:100%;">
                                  	 
                                  	<c:if test="${prVo.imgsize>0 }">
                                  	 <img src="../reviewImg/${prVo.imgname }" style="width:100%; height:100%; object-fit: contain;">
                                  	</c:if>
                                  	
                                  	<c:if test="${prVo.imgsize==0 }">
                                  	 <img src="../img/noImg.png" style="width:100%; height:100%; object-fit: contain;">
                                  	</c:if>
                                  	
                                  	 </div>
                                  	 </div>
                                  	 
                                  
                                  
   										 <div class="col-md-8">
                                   <div class="review-container">
      								<img src="../img/mainlogo.png" alt="User Avatar" class="user-image" />

									      <div class="mid_1">
									        <div class="user-info">
									          <img
									            src="../img/mainlogo.png"
									            alt="Reviewer Avatar"
									            class="reviewer-avatar"
									            style="float: left"
									          />
									          <div class="user-name">${prVo.writer }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10px;opacity:0.5;">${ prVo.dbday}</span></div>
									        </div>
									        <br />
									        <div class="mid_2">
									          <div class="rating" style="width:120px;">
									          
									          
									          
									        	<c:if test="${prVo.score>=0.5 and prVo.score<1 }">
                                 		 	  <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${prVo.score>=1 and prVo.score<1.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 		<c:if test="${prVo.score>=1.5 and prVo.score<2 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${prVo.score>=2 and prVo.score<2.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${prVo.score>=2.5 and prVo.score<3 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${prVo.score>=3 and prVo.score<3.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 	<c:if test="${prVo.score>=3.5 and prVo.score<4 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	    <span class="half-star">⭐️</span>
                                 		 	</c:if>
                                 		 	
                                 		 		<c:if test="${prVo.score>=4 and prVo.score<4.5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 		</c:if>
                                 		 	
                                 		 	
                                 		 		<c:if test="${prVo.score>=4.5 and prVo.score<5 }">
                                 		 		
                                 		 		
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 	      <span class="half-star">⭐️</span>
                                 		 	     
                                 		 	     
                                 		 		</c:if>
                                 		 	
                                 		 	
                                 		 		<c:if test="${prVo.score>=5 }">
                                 		 	  <span class="star">⭐️</span>
                                 		 	  <span class="star">⭐️</span>
                                 		 	   <span class="star">⭐️</span>
                                 		 	     <span class="star">⭐️</span>
                                 		 	      <span class="star">⭐️</span>
                                 		 		</c:if>
									            
									            
									            
									            
									            
									          </div>
									          
									        </div>
									       
									        <div class="mid_3">
									         	<p><h3>${prVo.score }/5</h3></p>
									          <p class="review-text">
									           ${prVo.content }
									          </p>
									          	 
									        </div>
									      </div>
    										</div>
                                  
                              		 	 </div>
                              		 	 </div>
                              		 	 	</c:forEach>
                              		 	 	</c:if>
                              		 	 <!-- for문 -->
                              		 	  <div class="Rpagination">
                              		 	  
                              		 	  
									 	    <c:if test="${prListSize!=0 }">
									    <div class="centered-text"><h2>1/${prTotalpage }</h2></div>
									   </c:if>
									    <c:if test="${reviewTotalPage>1}">
									    <span><button class="btn btn-lg btn-primary Rnext-btn">다음</button></span>
										</c:if>
									</div>
                              		 	 </div>
                              		 	 </div>
                              		 	

                            		</div>
                            <div class="tab-pane" id="p_tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>문의하기</h6>
                                    <p>문의하기</p>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                          <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                    	<hr>
                        <h2>최근본상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           
              <c:forEach var="cvo" items="${clist }" begin="1" end="${count }" >
                <div class="col-lg-3 col-md-4 col-sm-6">
               
                    <div class="product__item">
                   
                    		<c:url value="DetailBefore.do?count=1" var="curl">
              				<c:param name="pno" value="${cvo.pno }"/>
              				<c:param name="ct" value="${ct}"/>
              				<c:param name="rt" value="${rt}"/>
              				<c:param name="page" value="${page}"/>
              				</c:url>
                    
                        <div class="product__item__pic set-bg"><a href="<c:out value="${curl}" />"><img class="customimage" src="${cvo.p_image }">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                        
                            <h6><a href="#">${cvo.p_name }</a></h6>
                            </a>
                            <h5>${cvo.p_lower_price }</h5>
                        </div>
                    </div>
                    
               	 </div>
                </c:forEach>
              
            </div>
        </div>
        
        
        
           <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                    	<hr>
                        <h2>관련상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           
              <c:forEach var="rvo" items="${rlist }" begin="1" end="${rlistSize }" >
                <div class="col-lg-3 col-md-4 col-sm-6">
               
                    <div class="product__item">
                   
                    		<c:url value="DetailBefore.do?count=1" var="rurl">
              				<c:param name="pno" value="${rvo.pno }"/>
              				<c:param name="ct" value="${ct}"/>
              				<c:param name="rt" value="${rt}"/>
              				<c:param name="page" value="${page}"/>
              				</c:url>
                    
                        <div class="product__item__pic set-bg"><a href="<c:out value="${rurl}" />"><img class="customimage" src="${rvo.p_image }">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                        
                            <h6><a href="#">${rvo.p_name }</a></h6>
                            </a>
                            <h5>${rvo.p_lower_price }</h5>
                        </div>
                    </div>
                    
                </div>
                </c:forEach>
              
            </div>
        </div>
        
        
        
        
        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
      
      
       
    </section>
    <!-- Related Product Section End -->



</body>
</html>