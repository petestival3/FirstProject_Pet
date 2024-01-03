<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/star.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.stayintro {
    height: 200px;
    width: 486px;
    display: flex;
    --tw-bg-opacity: 1;
    background-color: rgb(233 241 246 / var(--tw-bg-opacity));
    padding: 20px 22px 20px 20px;
    box-sizing: border-box;
    border-radius: 12px;
    cursor: pointer;
    flex-direction: column;
    justify-content: space-between;
}
</style>
<script type="text/javascript">
$(function(){
	let revpage=1
	let typeno=1
	let objno='${vo.stayno}'
	reviewlist(typeno,objno,revpage)
	/* $('.pageBtn').click(function(){
		let fds=$(this).attr('value');
		reviewlist(fds)
	}) */
	
});
function reviewlist(typeno,objno,revpage){
	$.ajax({
		type:'post',
		url:'../review/list.do',
		data:{"typeno":typeno,"objno":objno,"revpage":revpage},
		success:function(json){
			let res=JSON.parse(json);
			let html='';
			for(let revo of res){
				html+='<img src="../img/mainlogo.png" alt="../img/mainlogo.png" class="user-image" />'
					+'<div class="mid_1">'
					+'<div class="user-info">'
					+'<img src="../img/mainlogo.png" alt="../img/mainlogo.png" class="reviewer-avatar" style="float:left">'
					+'<div class="user-name">'+revo.writer+'</div>'
					+'</div>'
					+'<br />'
					+'<div class="mid_2">'
					+'<div class="rating">'
					+'<span class="star">⭐️</span>'
					+'</div>'
					+'<p>'+revo.dbday+'</p>'
					+'</div>'
					+'<div class="mid_3">'
					+'<p class="review-text">'+revo.content+'</p>'
					+'</div>'
					+'</div>'
			}
			console.log(html)
			$('#reivewprint').html(html)
		}
	})
}
/*
 * <img src="../img/mainlogo.png" alt="User Avatar" class="user-image" />
		
     <div class="mid_1">
       <div class="user-info">
         <img
           src="../img/mainlogo.png"
           alt="Reviewer Avatar"
           class="reviewer-avatar"
           style="float: left"
         />
         <div class="user-name">사용자1</div>
       </div>
       <br />
       <div class="mid_2">
         <div class="rating">
           <span class="star">⭐️</span>
           <span class="star">⭐️</span>
           <span class="star">⭐️</span>
           <span class="star">⭐️</span>
           <span class="star">⭐️</span>
         </div>
         <p>작성날짜 적는 곳</p>
       </div>
       <div class="mid_3">
         <p class="review-type">타입 적는 곳</p>
         <p class="review-text">
           여기어때 정말 좋아요! 서비스가 훌륭하고 위치도 좋습니다. 여기어때
           정말 좋아요! 서비스가 훌륭하고 위치도 좋습니다. 여기어때 정말
           좋아요! 서비스가 훌륭하고 위치도 좋습니다.
         </p>
       </div>
     </div>
 */
</script>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Vegetable’s Package</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <a href="./index.html">Vegetables</a>
                            <span>Vegetable’s Package</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${vo.image }" alt="" style="border-radius: 10px;overflow: hidden;">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="${vo.image }"
                                src="${vo.image }" alt="" style="border-radius: 10px;overflow: hidden;">
                            <img data-imgbigurl="${vo.sub1 }"
                                src="${vo.sub1 }" alt="" style="border-radius: 10px;overflow: hidden;">
                            <img data-imgbigurl="${vo.sub2 }"
                                src="${vo.sub2 }" alt="" style="border-radius: 10px;overflow: hidden;">
                            <img data-imgbigurl="${vo.sub3 }"
                                src="${vo.sub3 }" alt="" style="border-radius: 10px;overflow: hidden;">
                            <img data-imgbigurl="${vo.sub4 }"
                                src="${vo.sub4 }" alt="" style="border-radius: 10px;overflow: hidden;">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${vo.name }</h3>
                        <p style="margin-bottom: 15px">${vo.detailaddr }</p>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>${vo.revcount }개 리뷰</span>
                        </div>
                        <div style="height: 15px"></div>
                        <div class="product__details__price">&#8361;${vo.price }~</div>
                        <div style="height: 15px"></div>
                        <a href="#" class="primary-btn">예약하기</a>
                        <a href="#" class="primary-btn">찜하기</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <div style="height: 30px"></div>
                        <div class="stayintro">
                          <h6 style="margin-bottom: 20px;color: #666"><b>숙소 소개</b></h6>
                          <div style="display: flex">
                          	<img src="../img/pngegg.png" style="width: 25px;height: 25px; ">
                            <p style="margin-left: 9px">${vo.msg }</p>
                          </div>
                        </div>
                    </div>
                   <!--  <p style="margin-top:-12px">
					    <em class="link">
					        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
					        </a>
					    </em>
					</p>
					<div id="map" style="width:100%;height:350px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8b770a89aec1599120a66eb6392863b&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('${vo.detailaddr }', function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
					</script> -->
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">숙소 이용 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">객실 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">리뷰 <span>(${vo.revcount })</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6 style="margin-bottom: 15px">주변 정보</h6>
                                    <p>${vo.around }</p><br>
                                    <h6 style="margin-bottom: 15px">기본 정보</h6>
                                    <p>${vo.basic }</p><br>
                                    <h6 style="margin-bottom: 15px">반려동물 입실 관련 사항</h6>
                                    <p>${vo.petinfo }</p><br>
                                    <h6 style="margin-bottom: 15px">확인 사항 및 기타</h6>
                                    <p>${vo.other }</p>
                                </div>
                                <p style="height: 40px"></p>
                                <h6 style="font-weight: 600; color: #333; margin-top: 15px">숙소위치 안내</h6>
                                <p style="height: 20px"></p>
                                <p style="margin-top:-12px">
								    <em class="link">
								        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
								        </a>
								    </em>
								</p>
								<div id="map" style="width:100%;height:350px;border-radius: 10px;overflow: hidden;border: 1px solid #D9D9D9"></div>
								
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8b770a89aec1599120a66eb6392863b&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  
								
								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch('${vo.detailaddr }', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
								
								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
								</script> 
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                        <!-- Shoping Cart Section Begin -->
									    <section class="shoping-cart spad" style="padding-top: 10px">
									        <div class="container">
									            <div class="row">
									                <div class="col-lg-12">
									                    <div class="shoping__cart__table">
									                        <table>
									                            <thead>
									                                <tr>
									                                    <th class="shoping__product">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방이름</th>
									                                    <th>가격</th>
									                                    <th>예약버튼</th>
									                                </tr>
									                            </thead>
									                            <tbody>
									                              <c:forEach var="rvo" items="${rlist }">
									                                <tr>
									                                    <td class="shoping__cart__item">
									                                        <img src="${rvo.image }" alt="" style="width: 150px;height: 150px;border-radius: 10px;overflow: hidden;border: 1px solid #D9D9D9">
									                                        <h5>${rvo.name }</h5>
									                                    </td>
									                                    <td class="shoping__cart__price">
									                                        &#8361;${rvo.price }
									                                    </td>
									                                    <td class="shoping__cart__quantity">
									                                        <div class="quantity">
									                                            <a href="#" class="primary-btn">예약하기</a>
									                                        </div>
									                                    </td>
									                                </tr>
									                              </c:forEach>
									                            </tbody>
									                        </table>
									                    </div>
									                </div>
									            </div>
									            
									        </div>
									    </section>
									    <!-- Shoping Cart Section End -->
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                <div style="height: 30px; float: right">
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="float:right;">리뷰 작성</button> 
                                </div>
                                <div class="review-container" id="reviewprint">
							      
							    </div>
                                </div>
                            </div>
                            <!-- Modal -->
									  <div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									      <!-- Modal content-->
									      <div class="modal-content">
									      	<form class="review-form" method="post" action="../review/insert.do">
									        <div class="modal-header">
									          <p>별점을 선택해주세요!</p>
									          
									          <div id="full-stars-example-two" style=margin-top:30px;margin-left:10px>
											    <div class="rating-group">
											        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
											        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
											        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
											        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
											        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
											        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
											    </div>
											 </div>
											 <button type="button" class="close" data-dismiss="modal" style="float:right;">&times;</button>
									        </div>
									        <div class="modal-body">
									           <p>어떤점이 만족스러우셨나요?<p>
									           
											      <input type="hidden" name="objno" value="${stayno }" >
											      <input type="hidden" name="type" value="2" >
											      <input type="hidden" name="writer" value="${sessionScope.name }">
											      <textarea name="content" rows=10 cols=60 required></textarea>
											      <div class="modal-footer">
											          <button type="submit" class="btn btn-default">저장</button>
											          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									        	  </div>
    										   
									        </div>
									        </form>
									      </div>
									      
									    </div>
									  </div>
									  <!-- Modal End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            
        </div>
    </section>
    <!-- Related Product Section End -->
</body>
</html>