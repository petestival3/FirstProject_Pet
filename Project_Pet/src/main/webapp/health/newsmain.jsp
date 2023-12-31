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
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
	<style type="text/css">
	.product__pagination a.selected {
	background-color: #007bff;
	color: #fff;
	border: 1px solid #007bff;
}
.breadcrumb-section
{
	margin-top: 30px;
}

	</style>
</head>

<body>
    
   
  
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/banner_2.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>PetNews</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">HOME</a>
                            <span>petnews</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
			<div class="row" style="margin-top: -40px;">
				
				<div class="col-lg-12 col-md-8 order-2" >
                <div class="row">
                    <c:forEach var="vo" items="${list3}" varStatus="loopStatus">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <a href="../health/newsdetail.do?no=${vo.no2 }">
                                        <img src="${vo.news_img}" style="max-width: 100%; max-height: 100%; border-radius: 10px; overflow: hidden;" alt="${vo.news_subject}">
                                        <div class="blog__item__text">
                                            <h5>
                                                <a href="../health/newsdetail.do?no=${vo.no2 }">${vo.news_subject}</a>
                                            </h5>
                                        </div>

                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Start a new row after every third item -->
                        <c:if test="${(loopStatus.index + 1) % 3 == 0 && not loopStatus.last}">
                            </div>
                            <div class="row">
                        </c:if>

                        <!-- Close the row if it's the last item -->
                        <c:if test="${loopStatus.last}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="order-3" style="margin:0px auto; text-align: center;">
				<div class="product__pagination">
					<c:if test="${startPage>1 }">
						<a href="newsmain.do?page=${startPage-1}"><i
							class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${i eq curpage}">
								<a href="newsmain.do?page=${i}" class="selected">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="newsmain.do?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${endPage<totalpage }">
						<a href="newsmain.do?page=${endPage+1}"><i
							class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
            </div>
        </div>
    </div>
</section>


    <!-- Blog Section End -->

  
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>