<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*--------------*/
/*장례식장 목록 페이지*/
/*--------------*/
li {
   list-style: none;
}

.breadcrumb-section {
   margin: 50px 0;
}
/*전체 장례식장 목록*/
.f_list li:nth-child(even) {
   background-color: #f8f8ff;
   border-radius: 30px;
   padding: 10px 0;
   margin: 10px auto;
}

.f_list li a:hover {
   color: #5a70e9 !important;
}

.f_list li:nth-child(1) {
   font-weight: 600;
   background-color: #e8e8ee !important;
   color: #333 !important;
   display: flex;
   justify-content: space-between;
}

.f_list li a {
   color: #333 !important;
   display: flex;
   justify-content: space-between;
}

.f_list_num, .f_list li a span:nth-child(1) {
   text-align: center;
   width: 60px;
}

.f_list_name, .f_list li a span:nth-child(2) {
   text-align: center;
   width: 500px;
}

.f_list_addr {
   text-align: center;
   width: 500px;
}

.f_list li a span:nth-child(3) {
   width: 500px;
}
/*검색하기 사이드 메뉴*/
.search_submenu {
   background-color: #5a70e9;
   text-align: center;
   border-radius: 50%;
   position: fixed;
   right: 150px;
   top: 600px;
   width: 100px;
   height: 100px;
}

.search_submenu a {
   display: block;
}

.search_submenu i {
   margin-top: 20px;
   font-size: 25px;
   color: #fff !important;
}

.search_submenu p {
   color: #fff;
}

.search_submenu:hover {
   box-shadow: 0 10px 10px 10px rgba(90, 112, 233, 0.2);
   transition: all 0.4s ease-in-out;
   transform: translateY(-25px);
}

/*장례 목록 페이지 나누기 번호*/
.pagination {
   margin: 30px 0 50px;
}

.pagination ul {
   margin: 0 auto;
   display: flex;
   justify-content: space-between;
   width: 100px;
}

/*상세내용 테이블*/
.detail_table {
    width:100%;
   background-color: #f5f5f5;
   padding: 5px;
   border-radius: 10px;
}

.text-center {
   text-align: center;
}

.detail_table_title {
   font-weight: 600;
   border-bottom: 1px solid #d2d2d2;
}

.detail_table tr:nth-child(2) td, .detail_table tr:nth-child(3) td,
   .detail_table tr:nth-child(4) td, .detail_table tr:nth-child(5) td,
   .detail_table tr:nth-child(6) td {
   border-bottom: 1px solid #d2d2d2;
}

.detail_table td {
   padding: 10px;
   margin: 5px auto;
}

.detail_table .btn {
   background-color: #5a70e9;
}
#btn_td{
    display: flex;
    justify-content: flex-end;
}
#btn_td a{
    margin-left: 10px;
}
</style>

<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
/*
$(function () {
	   $('.detail_li').hide();
	   
	   $('.detail_open_btn').click(function () {
	      $(this).next('.detail_li').first().show('slow');
	   });

	   $('.detail_hide_btn').click(function () {
	      $(this).prev('.detail_li').first().hide('slow');
	   });
	});
*/


$(function () {
   $('.detail_li').hide()
   
   $('.detail_open_btn').click(function () {
	  $('.detail_li').show('slow')
   });
   $('.detail_hide_btn').click(function () {
      $('.detail_li').hide('slow')
   });
});

/*
$(function () {
    $('.detail_li').hide(); // ID 선택자 대신 클래스 선택자 사용
    $('.detail_open_btn').click(function () {
        var index = $(this).next('li').index(); // 클릭한 버튼의 부모 <li> 엘리먼트의 인덱스 가져오기
        $('.detail_li').eq(index).show('slow'); // 특정 세부 섹션을 지정하기 위해 eq() 사용
    });
    $('.detail_hide_btn').click(function () {
        var index = $(this).next('li').index(); // 클릭한 버튼의 부모 <li> 엘리먼트의 인덱스 가져오기
        $('.detail_li').eq(index).hide('slow'); // 특정 세부 섹션을 지정하기 위해 eq() 사용
    });
});
*/
</script>
</script>

</head>
<body>
   <!-- Breadcrumb Section Begin -->
   <section class="breadcrumb-section set-bg"
      data-setbg="../img/bread.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="breadcrumb__text">
                  <h2>Funeral home List</h2>
                  <div class="breadcrumb__option">
                     <a href="../main/main.do">Home</a> <span>Funeral</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Breadcrumb Section End -->

   <!-- 예약 사이드 매뉴 시작 -->
   <div class="res_submenu">
      <a href="reserve.do"> <i class="xi-calendar-add"></i>
         <p>예약하기</p>
      </a>
   </div>
   <!-- 예약 사이드 매뉴 종료 -->

   <!-- 검색 사이드 매뉴 시작 -->
   <div class="search_submenu">
      <a href="search_f.do"> <i class="xi-search"></i>
         <p>검색하기</p>
      </a>
   </div>
   <!-- 검색 사이드 매뉴 종료 -->

   <!-- 장례 전체 목록 시작 -->
   <div class="container">
      <ul class="f_list">
         <li><span class="f_list_num">번호</span> <span class="f_list_name">업체명</span>
            <span class="f_list_addr">주소</span></li>
         
         <c:forEach var="vo" items="${list }" varStatus="s">
            <li class="f_list_li" data-fno="${vo.CR_COM_NO }">
               <a href="#" class="detail_open_btn"> <span>${vo.CR_COM_NO }</span> <span
                  class="funeral_list_title" data-fno="${vo.CR_COM_NO }">${vo.CR_COM_NAME }</span>
                  <span>${vo.CR_COM_LOC }</span>
            </a>
            </li>
                <!-- 상세보기 테이블 시작 -->
            <li class="detail_li">
               <table class="detail_table">
                  <tr>
                     <td class="detail_table_title text-center" colspan="2">상세보기</td>
                  </tr>
                  <tr>
                     <td width="20%" class="text-center">업체명</td>
                     <td width="50%" id="name">${vo.CR_COM_NAME }</td>
                  </tr>
                  <tr>
                     <td width="20%" class="text-center">분야</td>
                     <td width="50%" id="sector">${vo.CR_COM_SECTOR }</td>
                  </tr>
                  <tr>
                     <td width="20%" class="text-center">전화번호</td>
                     <td width="50%" id="phone">${vo.CR_COM_PHONE }</td>
                  </tr>
                  <tr>
                     <td width="20%" class="text-center">위치</td>
                     <td width="50%" id="loc">${vo.CR_COM_LOC }</td>
                  </tr>
                  <tr>
                     <td width="20%" class="text-center">홈페이지</td>
                     <td width="50%" id="homepage">${vo.CR_COM_HOMEPAGE }</td>
                  </tr>
                  <tr id="btn_tr">
                      <td>&nbsp;</td>
                     <td id="btn_td"><a href="#"
                        class="btn btn_like">좋아요(0)</a> <a href="#"
                        class="btn btn_check">찜하기</a> <a href="reserve.do"
                        class="btn btn_res">예약하기</a> <a class="btn btn_list detail_hide_btn" href="#">창닫기</a></td>
                  </tr>
               </table>
            </li>
            <!-- 상세보기 테이블 종료 -->
         </c:forEach>
      </ul>
   </div>
   <!-- 장례 전체 목록 종료 -->

   <!-- 장례 전체 목록 페이지 시작 -->
   <nav class="pagination">
      <ul>
         <c:if test="${startPage>1 }">
            <li><a href="../FuneralDetail/list_f.do?page=${startPage-1 }">&laquo;
                  Previous</a></li>
         </c:if>
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":""}><a
               href="../FuneralDetail/list_f.do?page=${i }">${i }</a></li>
         </c:forEach>
         <c:if test="${endPage<totalpage }">
            <li><a href="../FuneralDetail/list_f.do?page=${endPage+1 }">Next
                  &raquo;</a></li>
         </c:if>
      </ul>
   </nav>
   <!-- 장례 전체 목록 페이지 종료 -->
</body>
</html>