<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

/*주요한 내용*/
.text-center{
   text-align: center;
}
.table{
   margin: auto;
}

/*호텔쿠키 위치변경*/
.hotel_item{
    position: relative;
}
.hotel_text{
    position: absolute;
    width: 100px;
    height: 100px;
    top:0;
    right: 0;
}

/*----------*/
/*예약하기 페이지*/
/*----------*/
.res_wrap{
    display: flex;
    justify-content : space-between;
    width: 1500px;
    height: 500px;
    margin-bottom: 100px;
}
.res_t{
    width:300px;
    height: 500px;
    background-color: #f9f9f9;
}
/*--------------*/
/*장례식장 검색 페이지*/
/*--------------*/
.search_wrap{
    display: flex;
    justify-content : space-between;
    width: 1500px;
    height: 500px;
    margin-bottom: 200px;
}
.search_t_l{
    position: relative;
    display: flex;
    flex-direction:column;
    justify-content: space-between;
}
.search_t_l #f_search_text{
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
    text-align: center;
    background-color: #f9f9f9;
}
.search_t_r,
.search_t_l{
    width:500px;
    height: 600px;
}
/*---------------*/
/*유기동물 리스트 페이지*/
/*---------------*/
.missing_pic{
    width: 100%;
    height: 400px; 
    overflow: hidden;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}
.scroll-to-top {
      position: fixed;
      bottom: 50px;
      right: 50px;
      background-color: #5a70e9;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 15px 15px;
      cursor: pointer;
      text-decoration: none;
		text-align: center;
		border-radius: 50%;
		width: 50px;
		height: 50px;
		font-size: 15px;
    }
.scroll-to-top:hover{
	 box-shadow: 0 5px 5px 5px rgba(90,112,233, 0.2);
	 transition: all 0.4s ease-in-out;
	 transform: translateY(-10px);
}

</style>
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>
    
    <!-- xeicon -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
    <!-- xeicon -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 고정버튼 -->
	<div class="home_submenu">
	  <a href="#" class="scroll-to-top" onclick="scrollToTop()"><i class="xi-angle-up"></i></a>
	</div>
	<script>
	  // 스크롤 최상단으로 이동하는 함수
	  function scrollToTop() {
	    document.body.scrollTop = 0;
	    document.documentElement.scrollTop = 0;
	  }
	
	  // 스크롤 위치에 따라 링크 보이기/숨기기
	  window.onscroll = function() {
	    var scrollLink = document.querySelector('.scroll-to-top');
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	      scrollLink.style.display = 'block';
	    } else {
	      scrollLink.style.display = 'none';
	    }
	  };
	</script>
	
	<!-- home -->
	<jsp:include page="${main_jsp }"></jsp:include>
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>

    <!-- Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/mixitup.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>