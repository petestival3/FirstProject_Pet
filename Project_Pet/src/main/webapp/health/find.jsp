<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/health.css">
<style type="text/css">


</style>
<title>Ogani | Template</title>

    
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23e8040d553778eeeb77f0900cb92322&libraries=services"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
<script type="text/javascript">

$(function() {

	
    $('.hsptDetail').click(function() {
        let no = $(this).attr("data-no");
        $.ajax({
            type: "post",
            url: "../health/detail.do",
            data: {"no": no},
           
            success: function(res) {
                let json = JSON.parse(res);
                let address = json.address;
                $('#phone').text(json.phone);
                $('#address').text(json.address);
                $('.name').text(json.name);
                
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				
			        // 주소-좌표 변환 객체를 생성합니다

			   var geocoder = new kakao.maps.services.Geocoder();
			        // 주소로 좌표를 검색합니다
			        geocoder.addressSearch(
			          address,
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker(
												{
													map : map,
													position : coords
												});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div class="name" style="width:150px;text-align:center;padding:6px 0;" ></div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});

                $('#dialog').dialog({
                    autoOpen: false,
                    width: 1150,
                    height: 650,
                    modal: true
                }).dialog("open");

            }
        });
        
    });
});



</script>

</head>

<body>

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: -15px;">


				<div class="blog__sidebar__item">

					
					<table class="hsptfind-table">
						<tr class="success">
							<th width=5% class="text-center">번호</th>
							<th width=35% class="text-center">병원명</th>
							<th width=45% class="text-center">주소</th>
							<th width=15% class="text-center">전화번호</th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td width=5% class="text-center">${vo.no }</td>
								<td width=35% class="text-center hsptDetail" data-no="${vo.no }">${vo.hospital_name }</td>
								<td width=45% class="text-center">${vo.hospital_address }</td>
								<td width=15% class="text-center">${vo.hospital_phone }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="row" style="text-align: center;">
						<div class="order-3"
							style="margin: 0 auto; padding: 0px 0px 20px 0px;">
							<div class="product__pagination" style="margin: 10px;">
								<c:if test="${startPage>1 }">
									<a href="find.do?page=${startPage-1}"><i
										class="fa fa-long-arrow-left"></i></a>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:choose>
										<c:when test="${i eq curpage}">
											<a href="find.do?page=${i}" class="selected">${i}</a>
										</c:when>
										<c:otherwise>
											<a href="find.do?page=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage<totalpage }">
									<a href="find.do?page=${endPage+1}"><i
										class="fa fa-long-arrow-right"></i></a>
								</c:if>
							</div>
						</div>

					</div>

				</div>

			</div>

			<div id="dialog" title="병원정보상세보기" style="display: none">
				<div class="container">
					<div class="row">
						<!-- 왼쪽에 정보 -->
						<div class="col-sm-5">
							<table class="table">
								<tr>
									<td width="35%" height="45%" align="center"><span
										class="fa fa-hospital-o"></span>
										<h4>name</h4>
										<p class="name"></p></td>
								</tr>
								<tr>
									<td width="35%" height="45%" align="center"><span
										class="icon_phone"></span>
										<h4>Phone</h4>
										<p id="phone"></p></td>
								</tr>
								<tr>
									<td width="35%" height="35%" align="center"><span
										class="icon_pin_alt"></span>
										<h4>Address</h4>
										<p id="address"></p></td>
								</tr>
								<tr>
									<td width="35%" align="center"><span
										class="icon_clock_alt"></span>
										<h4>Reservation</h4> <a href="#">예약하기</a></td>
								</tr>
							</table>
							<a href="javascript:history.back()" class="primary-btn">목 록</a>
						</div>
						<!-- 오른쪽에 지도 -->
						<div class="col-sm-7">
							<div id="map" style="width: 100%; height: 450px;"></div>
							
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Blog Details Section End -->

</body>

</html>