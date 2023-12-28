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
.breadcrumb-section{
    margin: 50px 0;
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
                        <h2>Search for a funeral home</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>Funeral</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- 사이드 예약 매뉴 시작 -->
	<div class="res_submenu">
		<a href="reserve.do"> <i class="xi-calendar-add"></i>
			<p>예약하기</p>
		</a>
	</div>
	<!-- 사이드 예약 매뉴 종료 -->

	<!-- 검색하기 내용 시작 -->
	
	<!-- 검색하기 내용 종료 -->
</body>
</html>