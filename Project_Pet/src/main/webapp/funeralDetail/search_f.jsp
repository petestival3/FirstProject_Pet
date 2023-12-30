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
		 },
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
			 },
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
				  "cr_com_name": "test 센트럴파크(주)",
				  "cr_com_phone": "051-728-5411",
				  "cr_com_loc": "부산광역시 기장군 일광면 차양길 175",
				  "cr_com_homepage": "http:\/\/www.startice.co.kr"
				 },
				 {
				  "cr_com_no": "4",
				  "cr_com_sector": "장례, 화장, 봉안",
				  "cr_com_name": "파트라슈",
				  "cr_com_phone": "051-723-2201",
				  "cr_com_loc": "test 부산 기장군 장안읍 좌동리 49-1",
				  "cr_com_homepage": "http:\/\/www.mypatrasche.co.kr"
				 },
				 {
				  "cr_com_no": "5",
				  "cr_com_sector": "장례, 화장, 봉안, test",
				  "cr_com_name": "아이별",
				  "cr_com_phone": "051-727-4499",
				  "cr_com_loc": "부산광역시 기장군 장안읍 기룡길 11-33",
				  "cr_com_homepage": "http:\/\/www.aistar.co.kr"
				 }
		 ]
//출력부
$(function(){
	funerals.map((funeral)=>{
		$('#user-table tbody').append(
		   '<tr class="result">'
		  +'<td class="text-center">'+funeral.cr_com_no+'</td>'
		  +'<td>'+funeral.cr_com_loc+'</td>'
		  +'<td>'+funeral.cr_com_name+'</td>'
		  +'<td class="text-center">'+funeral.cr_com_sector+'</td>'
		  +'<td >'+funeral.cr_com_homepage+'</td>'
		  +'</tr>'  
		)
	})
	/*
	//이벤트 처리 (기존)
	$('#keyword').keyup(function(){
		let k=$('#keyword').val();
		$('#user-table > tbody > tr').hide()
		let temp=$('#user-table > tbody > tr > td:nth-child(5n+2):contains("'+k+'")')
		                                                   //이부분선택하게해서 카테고리검색도 만들수 있을거같음
		$(temp).parent().show()
	})*/
	//이벤트 처리 (수정본)
	$('#keyword').keyup(function () {
	    let k = $('#keyword').val();
	    let selectedOption = $('#search-table select').val();
	    let columnSelector = '';

	    switch (selectedOption) {
	        case '시/도명':
	            columnSelector = ':nth-child(5n+2)';
	            break;
	        case '업체명':
	            columnSelector = ':nth-child(5n+3)';
	            break;
	        case '분야':
	            columnSelector = ':nth-child(5n+4)';
	            break;
	        default:
	            // 다른 옵션을 처리하려면 필요한 경우 추가로 작성
	            break;
	    }

	    $('#user-table > tbody > tr').hide();
	    let temp = $('#user-table > tbody > tr > td'+columnSelector+ ':contains("' + k + '")');
	    $(temp).parent().show();
	});
})
</script>
<style type="text/css">
/*--------------*/
/*장례식장 검색 페이지*/
/*--------------*/
.breadcrumb-section{
    margin: 50px 0;
}

/*검색부 + 결과출력부*/
#search-table td {
    text-align: center;
    border-top: none !important;
}
#search-table td #keyword{
    width: 500px;
    height: 50px;
    line-height: 50px;
    border: 1px solid #d2d2d2;
    border-radius : 30px;
    text-align: center;
}
#user-table{
    margin: 0 auto 50px;
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
	<div class="container">
    <div class="row">
     <table class="table" id="search-table">
      <tr>
       <td>
        <select>
          <option>시/도명</option>
          <option>업체명</option>
          <option>분야</option>
        </select>
        <input type=text size=25 id="keyword" placeholder="검색어 입력">
       </td>
      </tr>
     </table>
     <div style="height: 20px"></div>
     <table class="table" id="user-table">
       <thead>
         <tr>
           <th class="text-center">번호</th>
           <th class="text-center">주소</th>
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
	<!-- 검색하기 내용 종료 -->
	
	<!-- json으로 목록을 출력한거라 페이지 나누는 dao를 다시 구성해야할거같음.. -->
	<!-- 페이지 나누기 번호 시작
	<nav class="pagination">
		<ul>
			<c:if test="${startPage>1 }">
				<li><a href="../FuneralDetail/search_f.do?page=${startPage-1 }">&laquo;
						Previous</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${i==curpage?"class=current":""}><a
					href="../FuneralDetail/search_f.do?page=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li><a href="../FuneralDetail/search_f.do?page=${endPage+1 }">Next
						&raquo;</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 페이지 나누기 번호 종료 -->
</body>
</html>