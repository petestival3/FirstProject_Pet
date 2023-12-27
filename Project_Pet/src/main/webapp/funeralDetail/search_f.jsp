<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
const funerals=[
	 {
		  "cr_com_no": "1",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 세종점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "세종시 부강로 시목부강로 620",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "2",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫포유",
		  "cr_com_phone": "1533-4426",
		  "cr_com_loc": "세종특별자치시 장군면 금암리 87-5",
		  "cr_com_homepage": "http:\/\/www.petforyou.kr"
		 },
		 {
		  "cr_com_no": "3",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "센트럴파크(주)",
		  "cr_com_phone": "051-728-5411",
		  "cr_com_loc": "부산광역시 기장군 일광면 차양길 175",
		  "cr_com_homepage": "http:\/\/www.startice.co.kr"
		 },
		 {
		  "cr_com_no": "4",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "파트라슈",
		  "cr_com_phone": "051-723-2201",
		  "cr_com_loc": "부산 기장군 장안읍 좌동리 49-1",
		  "cr_com_homepage": "http:\/\/www.mypatrasche.co.kr"
		 },
		 {
		  "cr_com_no": "5",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "아이별",
		  "cr_com_phone": "051-727-4499",
		  "cr_com_loc": "부산광역시 기장군 장안읍 기룡길 11-33",
		  "cr_com_homepage": "http:\/\/www.aistar.co.kr"
		 }]
//출력부 (좌측)
$(function(){
	funerals.map((funeral)=>{
		$('#user-table tbody').append(
		   '<tr class="result">'
		  +'<td class="text-center">'+funeral.cr_com_loc+'</td>'
		  +'<td>'+funeral.cr_com_name+'</td>'
		  +'<td>'+funeral.cr_com_sector+'</td>'
		  +'<td>'+funeral.cr_com_homepage+'</td>'
		  +'</tr>'  
		)
	})
	//이벤트 처리 (좌측)
	$('#keyword').keyup(function(){
		let k=$('#keyword').val();
		$('#user-table > tbody > tr').hide()
		let temp=$('#user-table > tbody > tr > td:nth-child(5n+2):contains("'+k+'")')
		                                                   //이부분선택하게해서 카테고리검색도 만들수 있을거같음
		$(temp).parent().show()
	})
	
//출력부 (우측)
$(function(){
	funerals.map((funeral)=>{
		$('#user-table tbody').append(
		   '<tr class="result">'
		  +'<td class="text-center">'+funeral.cr_com_no+'</td>'
		  +'<td class="text-center">'+funeral.cr_com_loc+'</td>'
		  +'<td>'+funeral.cr_com_name+'</td>'
		  +'<td>'+funeral.cr_com_sector+'</td>'
		  +'<td>'+funeral.cr_com_homepage+'</td>'
		  +'</tr>'  
		)
	})
})
</script>
<style type="text/css">
/*--------------*/
/*장례식장 검색 페이지*/
/*--------------*/
.search_wrap{
    display: flex;
    justify-content : space-between;
    width: 1300px;
    height: 500px;
    margin: 0 auto 200px;
}
.search_t_l{
    position: relative;
    display: flex;
    flex-direction:column;
}
.search_t_l .f_search_text{
    width: 100%;
    height: 60px;
    border: 1px solid #d9d9d9;
    border-radius: 30px;
    box-shadow: 0 0 10px #e2e2e2;
    text-align: center;
}
#f_search_btn_div{
    position:absolute;
    top: 5px;
    right: 10px;
}
.xi-search{
    position:absolute;
    top: 15px;
    right: 15px;
    z-index: 99;
    font-size: 20px;
    font-weight: 700;
}
.search_t_l #f_search_btn{
    width: 50px;
    height: 50px;
    background-color:#999;
    border-radius: 50%;
    border: none;
    box-shadow: 0 0 5px #e2e2e2;
}
.search_t_l_result{
    border: 1px solid #d9d9d9;
    border-radius: 20px; 
}

.search_t_r{
    border-radius: 30px;
    text-align: center;
    background-color: #f9f9f9;
}
.search_t_r,
.search_t_l{
    width:600px;
    height: 600px;
}
</style>
</head>
<body>
	<!-- Contact Form Begin -->

	<div class="contact-form spad">
		<section class="breadcrumb-section set-bg"
			data-setbg="../img/bread.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="contact__form__title">
							<h2 style="color: #d9d9d9; font-weight: 400;">장례식장 검색 하기</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Contact Form End -->

	<!-- 사이드 예약 매뉴 시작 -->
	<div class="res_submenu">
		<a href="reserve.do"> <i class="xi-calendar-add"></i>
			<p>예약하기</p>
		</a>
	</div>
	<!-- 사이드 예약 매뉴 종료 -->

	<!-- 검색하기 내용 시작 -->
	<div class="search_wrap">
		<!-- 검색결과 실시간변동 1분할 -->
		<div class="search_t_l">
			<div style="margin-bottom: 40px;">
			     <input type=text id="keyword" placeholder="검색어 입력" class="f_search_text">
				<div id="f_search_btn_div">
					<input type="button" id="f_search_btn"> <i
						class="xi-search"></i>
				</div>
			</div>

			<!-- 검색결과 ajax로 출력할부분 시작 -->
			<div class="container search_t_l_result">
				<div class="row">
					<table class="table" id="user-table-left">
						<thead>
							<tr>
								<th class="text-center">위치</th>
								<th class="text-center">업체명</th>
								<th class="text-center">분야</th>
								<th class="text-center">홈페이지</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
			<!-- 검색결과 ajax로 출력할부분 종료 -->

		</div>

		<!-- 검색결과 출력 2분할 -->
		<div class="search_t_r">
			<div class="container">
			
				<!-- 검색결과 ajax로 출력할부분 시작 -->
			<div class="container search_t_l_result">
				<div class="row">
				   <p style="text-align: center;">장례업체 전체 목록</p>
					<table class="table" id="user-table-right">
						<thead>
							<tr>
								<th class="text-center" width="60">번호</th>
								<th class="text-center">위치</th>
								<th class="text-center">업체명</th>
								<th class="text-center">분야</th>
								<th class="text-center">홈페이지</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
			<!-- 검색결과 ajax로 출력할부분 종료 -->
			
				<!-- 페이지 이동부분
				<div style="height: 20px"></div>
				<div class="row">
					<div class="text-center">
						<a href="../FuneralDetail/search_f.do?page=${curpage>1?curpage-1:curpage }"
							class="btn btn-sm btn-danger">이전</a> ${curpage } page /
						${totalpage } pages <a
							href="../FuneralDetail/search_f.do?page=${curpage<totalpage?curpage+1:curpage }"
							class="btn btn-sm btn-success">다음</a>
					</div>
				</div>
				 -->
			</div>
		</div>
	</div>
	<!-- 검색하기 내용 종료 -->
</body>
</html>