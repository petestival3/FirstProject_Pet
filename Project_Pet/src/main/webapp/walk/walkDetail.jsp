<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
 
  
 
 </style>
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
   

   
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
        	
         
        
         
            <div class="row">
            	
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                
                    <div class="blog__sidebar kyj_walk"><!--산책로 디테일 왼쪽 사이드메뉴 -->
                   		 <span class="back_walk_list"><img src="../img/left.png.svg" alt=""><a href="javascript:history.back()" class="btn btn-sm">목록</a></span>
                       <div id="course_detail_inform" style="width:100%; height:85%;">
                       			<div id="defaultInform">
  								  <div style="height:auto;"><img src="../img/산책1.jpg" ></div>
    							  <div style="height:auto;"><img src="../img/산책2.jpg" ></div>
   								  <div style="height:auto;"><img src="../img/산책3.jpg" ></div>
   								  <div style="height:auto;"><img src="../img/산책4.jpg" ></div>
								</div>
                       
                       		<div style="text-align:center; margin-bottom:20px;" class="hidden_title"><h3 id="level"></h3></span>
                       		<div class="data_place" id="level_image" style="text-align: center;"><img src="../img/levelA.png" height="120" ></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;코스이름</h4></span>
                       		<div class="data_place" id="course_name"></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;경로</h4></span>
                       		<div id="course_way" class="data_place"></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;위치</h4></span>
                       		<div id="detail_address" class="data_place"></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;코스길이</h4></span>
                       		
                       		<div id="course_length_detail" class="data_place"></div>
                       		 </div>
                       		 <hr class="hidden_title">
                       		
                       		
                       			<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;소요시간</h4></span>
                       		<div id="course_time" class="data_place"></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;근처 약수터</h4></span>
                       		<div id="optn_dc" class="data_place"></div><!--약수터 정보 -->
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;근처 화장실</h4></span>
                       		<div id="toilet_dc" class="data_place"></div>
                       		</div>
                       		<hr class="hidden_title">
                       		
                       		<div style="text-align:center;" class="hidden_title"><span class="control_title"><h4>&#128054;근처 편의시설/문화지</h4></span>
                       		<div id="conventional_name" class="data_place"></div>
                       		</div>
                       		
                      
                        
                    </div>
                    
                </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                         <center><h2 id="selectWno" data-wno="${vo.wno }">${vo.wname }</h2><h5>(${vo.signgu_name })</h5></center>
     
<div id="map" style="width:100%;height:600px; margin-top:17px;">
  
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c2368186c0091fdb14d91b7b4aa613ff&libraries=services"></script>
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
geocoder.addressSearch('${vo.address}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.wname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
     
     
                 <div class="find_Load_view">
                    
                       <span><a href="https://map.kakao.com/link/to/${vo.wname },${vo.cLa },${vo.cLo}" target="_blank" class="btn btn-success">길찾기</a></span>
                     	<span> <a href="https://map.kakao.com/link/roadview/${vo.cLa },${vo.cLo}" target="_blank"  class="btn btn-success">로드뷰 보기</a></span> 
                    </div>
                      
                    </div>
                    
              
                    
                    <div class="course-container">
                    <c:if test="${csSize==0}">
                    <h1>코스정보가 없습니다.</h1>
                    </c:if>
                    <c:if test="${csSize!=0}">
                    	<div class="showCourse_inform">* 클릭 시 상세정보를 볼 수있습니다.</div>
                    </c:if>
  			<ul class="walk_course" data-size="${csSize }">
  			<c:forEach var="courseVo" items="${courseList }">
        <li class="get_wcno" data-wcno="${courseVo.wcno }"><button class="show_corsue btn btn-info">${courseVo.w_course_name }(${courseVo.course_length })</button></li>
        
       </c:forEach>
    </ul>
                      </div>
                   
                </div>
            </div>
        </div>
    
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
           <div class="row">
           		<div class="comment-section" style="width:100%">
   
    
				</div>
           </div>
        </div>
     
    </section>
    <!-- Related Blog Section End -->

   


</body>
</html>