<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

/*메인페이지 하단 베너 설정*/

.banner__pic{
	position: relative;
	margin-bottom: 50px; 
}
.banner__pic:hover{
    transition: all 0.4s ease-in-out;
	transform: translateY(-10px);
	text-shadow: 0 0 5px gray;
}
.banner__pic__text{
	position: absolute !important;
}
.b_t_1{
    bottom: 10px;
    left: 10px;
}
.b_t_1 span{
    font-size: 70px;
    color: #7ED3F3 !important;
    font-weight: 600;
}
.b_t_1 h2{
   color: #7ED3F3 !important;
    font-size: 50px !important;
    font-weight: 600;
}
.b_t_2{
    top: 45px;
    left: 40px;
}
.b_t_2 h2{
   color: #F6EBD3 !important;
    font-size: 75px !important;
    font-weight: 600;
    opacity: 50%
}
.b_t_3{
    top: 0px;
    left: 30px;
}
.b_t_3 h2{
   color: #fff !important;
    font-size: 75px !important;
    font-weight: 600;
}
.b_t_4{
    text-align : center;
    top: 100px;
    left: 20px;
}
.b_t_4 h2{
   color: #fff !important;
    font-size: 55px !important;
    font-weight: 600;
    opacity: 80%;
}
.b_t_4 p{
    color: #D8D0CD !important;
    font-size: 20px !important;
    font-weight: 600;
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

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
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