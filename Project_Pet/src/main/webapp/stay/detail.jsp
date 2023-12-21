<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
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
        <div class="container">
            
        </div>
    </section>
    <!-- Related Product Section End -->
</body>
</html>