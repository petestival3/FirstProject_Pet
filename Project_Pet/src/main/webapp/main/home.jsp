<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let ss='가평'
	stayhome(ss)
	$('.homeStayBtn').click(function(){
		let fds=$(this).attr('value');
		stayhome(fds)
	})
	
});
function stayhome(fds){
	$.ajax({
		type:'post',
		url:'../stay/location_list.do',
		data:{"fds":fds},
		success:function(json){
			let res=JSON.parse(json);
			let html='';
			for(let vo of res){
				html+='<div class="col-lg-3 col-md-4 col-sm-6">'
                    +'<div class="featured__item">'
                    +'<img src="'+vo.image+'" style="border-radius: 10px;overflow: hidden;">'
                	+'<div class="featured__item__text">'
                    +'<h6 id="ssss"><a href="../stay/detail_before.do?stayno='+vo.stayno+'">'+vo.name+'</a></h6>'
                    +'<h5>&#8361;'+vo.price+'~</h5>'
                	+'</div>'
            		+'</div>'
        			+'</div>'
			}
			console.log(html)
			$('#print').html(html)
		}
	})
}

</script>
<style type="text/css">
#ssss{
   white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 함 */ 
   overflow: hidden; /* 초과된 텍스트를 감추기위해 오버플로우를 숨김 */
   text-overflow: ellipsis; /* 말줄임표 만드는 속성 */
}
#main_sb{
   right:20px !important;
}
</style>
</head>
<body>
   <!-- 예약 사이드 매뉴 시작 -->
   <div class="res_submenu" id="main_sb" style="z-index: 9999 !important;">
      <a href="../reserve/reserve_funeral.do"> <i class="xi-calendar-add"></i>
         <p>예약하기</p>
      </a>
   </div>
   <!-- 예약 사이드 매뉴 종료 -->
	<!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__text">
                            </div>
                        </div>
                    </div>
                    <!-- 중간슬라이드예시 -->
    <div class="container">
                    <div class="latest-product__text">
                        <div class="latest-product__slider owl-carousel" >
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item hero__item set-bg" data-setbg="../img/latest-product/hotelbanner.webp">
                                    <div class="latest-product__item__text ht_banner">
                                        <h2 class="ht_h2_banner">반려동물과 "함께"하는<br />즐거운 여행</h2>
                                        <span class="ht_span_banner">합리적인 가격에 따뜻한 추억을</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item hero__item set-bg" data-setbg="../img/latest-product/hospital.png">
                                    <div class="latest-product__item__text hp_banner">
                                        <h2 class="hp_h2_banner">과잉 진료 없는 <br />신뢰를 드립니다</h2>
                                        <span class="hp_span_banner">믿을 수 있는 병원들만 소개해 드립니다.</span>
                                    </div>
                                </a>
                            </div>
                             <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item hero__item set-bg" data-setbg="../img/latest-product/funeral_banner.jpg">
                                    <div class="latest-product__item__text f_banner">
                                        <h2 class="f_h2_banner">사랑했던 가족을<br />배웅 해주세요</h2>
                                        <span class="f_span_banner">모자람 없는 정성으로 곁에 있겠습니다.</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
        <div class="section-title">
                <h2>인기 상품</h2>
        </div>
            <div class="row">
            
                <div class="categories__slider owl-carousel">
                <c:forEach var="pvo" items="${ plist}">
                    
                     <a href="../product/DetailBefore.do?pno=${pvo.pno }&count=3">
             						  <img src="${pvo.p_image }" class="customimage">
                       					 <div class="product__item">
                    		  	 	  <div class="product__item__text">
                               			  <h5>${pvo.p_name }</h5>
                                    <h6>${pvo.p_lower_price }</h6>
                                </div>
                                </div>
   								</a>	   
                </c:forEach>
                 
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>지역별 추천 숙소</h2>
                    </div>
                    <div class="featured__controls">
                        <input type="button" value="가평" class="btn btn-sm btn-primary homeStayBtn">
				        <input type="button" value="인천" class="btn btn-sm btn-primary homeStayBtn">
				        <input type="button" value="강원" class="btn btn-sm btn-primary homeStayBtn">
				        <input type="button" value="충남" class="btn btn-sm btn-primary homeStayBtn">
				        <input type="button" value="제주" class="btn btn-sm btn-primary homeStayBtn">
                    </div>
                </div>
            </div>
            <div class="row featured__filter" id="print">

            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../img/banner/cat_hospital.jpg" style="border-radius: 10px;overflow: hidden;">
                        <div class="banner__pic__text b_t_1">
                           <span>아!</span>
                           <h2>건강검진 언제였지?</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../img/banner/dog_missing.jpg" style="border-radius: 10px;overflow: hidden;">
                        <div class="banner__pic__text b_t_2">
                           <h2>따뜻한 온기를</h2>
                           <h2>전해주세요</h2>
                           <i class="xi-angle-right-thin"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../img/banner/seaturtle.jpg" style="border-radius: 10px;overflow: hidden;">
                        <div class="banner__pic__text b_t_3">
                           <h2>"우리"의</h2>
                           <h2>바다를</h2>
                           <h2>지켜주세요</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../img/banner/dog_funeral.jpg" style="border-radius: 10px;overflow: hidden;">
                        <div class="banner__pic__text b_t_4">
                           <h2>언제까지나&nbsp;&nbsp;기억할께</h2>
                           <p>어느 순간에도 항상 소중한 가족이니까</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->
  
    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>보호중인 동물</h2>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="avo" items="${alist }">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
<a href="../animal/animaldetail.do?kano=${avo.kano }"><img src="${avo.keepimage }" alt="" style="border-radius: 10px;overflow: hidden;"></a>
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="../animal/animaldetail.do?kano=${avo.kano }">${avo.keeptitle }</a></h5>
                            <p>${avo.keepcontent }</p>
                        </div>
                    </div>
                </div>
               </c:forEach>
                
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
</body>
</html>