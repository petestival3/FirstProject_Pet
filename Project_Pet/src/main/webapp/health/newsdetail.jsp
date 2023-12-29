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
<style type="text/css">
.contact-form{
padding: 0px;
}
.blog__details__text img{
	border-radius: 10px;
	width: 800px;
	height: 500px;
	
}
</style>
  
</head>

<body>

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 col-md-6 order-md-1 order-1">
                    <div class="blog__details__text">
                    	<h3>
                        ${vo.news_subject }
                        </h3>
                        <p>
                        ${vo.news_date1 }&nbsp;&nbsp;&nbsp;&nbsp; ${vo.news_date2 }
                        </p>
                          <img src=${vo.news_img } style="text-center"><br>
                        <p>
                        ${vo.news_content }
                        </p>
                        
                    </div>
                  
                </div>
                
            </div>
            
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related-blog-title">
						<h2>댓글 남기기</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="contact-form spad">
						<div class="container" >
							
							<form action="#">
								<div class="row">
									<div class="col-lg-12 text-center">
										<textarea placeholder="Your message"></textarea>
										<button type="submit" class="site-btn">SEND MESSAGE</button>
									</div>
								</div>
							</form>
						
					</div>
				</div>
				</div>
			</div>
		</div>
	
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
	
	<!-- Related Blog Section End -->



</body>

</html>