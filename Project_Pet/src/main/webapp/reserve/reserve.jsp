<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.breadcrumb-section{
    margin: 50px 0;
}

/*검색하기 사이드 메뉴*/
.search_submenu{
	background-color: #5a70e9;
	text-align: center;
	border-radius: 50%;
	position: fixed;
	right: 150px;
	top: 600px;
	width: 100px;
	height: 100px;
}
.search_submenu a{
	display: block;
}
.search_submenu i{
	margin-top: 20px;
	font-size: 25px;
	color: #fff !important;
}
.search_submenu p{
	color: #fff;
}
.search_submenu:hover{
	 box-shadow: 0 10px 10px 10px rgba(90,112,233, 0.2);
	 transition: all 0.4s ease-in-out;
	 transform: translateY(-25px);
}
#conti_res_list tr:hover{
   cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	// 테이블만들고 no값 확인하기
	
	$.ajax({
		type:'post',
		url:'../reserve/res_list.do',
		data:{"no":1},
		success:function(result)
		{
			$('#conti_res_list').html(result)
		}
	})
	$('.conti_res_btn').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../reserve/res_list.do',
			data:{"no":no},
			success:function(result)
			{
				$('#conti_res_list').html(result)
			}
		})
	})
})
</script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Reservation</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>Reserve</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- 검색 사이드 매뉴 시작 -->
	<div class="search_submenu">
		<a href="../FuneralDetail/search_f.do"> <i class="xi-search"></i>
			<p>검색하기</p>
		</a>
	</div>
	<!-- 검색 사이드 매뉴 종료 -->

	<!-- 예약하기 내용 시작 -->
	<div class="res_button container">
	   <span class="primary-btn conti_res_btn" data-no="1">호텔</span>
       <span class="primary-btn conti_res_btn" data-no="2">병원</span>
       <span class="primary-btn conti_res_btn" data-no="3">장례식장</span>
    </div>
	<div class="res_wrap container">
		<!-- 테이블 날짜시간 1분할 -->
		<div class="res_t">
		    <div id="conti_res_list" style="height: 100%;overflow-y:scroll; "></div>
		</div>
		<!-- 테이블 상세내용 2분할 -->
		<div class="res_t">
		  <caption><h3>예약일 정보</h3></caption>
		      <div id="conti_res_date"></div>
		  <caption><h3>시간정보</h3></caption>
		      <div id="times"></div>
		</div>
		
		<!-- 테이블 결정사항 3분할 -->
		<div class="res_t">
		<caption><h3>인원정보</h3></caption>
		      <div id="inwons"></div>
		
		 <table>
		 <tr>
		  <td>
          <h3>예약정보</h3>
          </td>
          </tr>
          <tr>
           <td>
            <img src="../reserve/noimage.png" style="width: 100%" id="conti_res_image">
           </td>
          </tr>
          <tr>
            <td>업체명:<span id="conti_res_name"></span></td>
          </tr>
          <tr>
            <td>예약일:<span id="conti_res_day"></span></td>
          </tr>
          <tr>
            <td>예약시간:<span id="conti_res_time"></span></td>
          </tr>
          <tr>
            <td>인원:<span id="conti_res_inwon"></span></td>
          </tr>
          
          <tr style="display: none" id="ok">
		      <td class="text-center">
		       <form method="post" action="../reserve/reserve_ok.do">
		         <input type=hidden name="fno" id="fno">
		         <input type=hidden name="rday" id="rday">
		         <input type=hidden name="rtime" id="rtime">
		         <input type=hidden name="rinwon" id="rinwon">
		         <button class="btn btn-sm btn-danger">예약하기</button>
		       </form>
		      </td>
		    </tr>
         </table>
		
		</div>
	</div>
	<!-- 예약하기 내용 종료 -->
</body>
</html>