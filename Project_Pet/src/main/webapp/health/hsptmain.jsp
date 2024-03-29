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
<link rel="stylesheet" href="../css/health.css">
<title>Ogani | Template</title>


</head>
<body>

	<div class="hspt_main">
	<section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>HospitalSearch</h2>
                       <div class="breadcrumb__option">
                            <a href="../main/main.do">HOME</a>
                            <span>hospital</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>

		<div class="container">
				<div class="blog__sidebar__search">
				<form method="post" action="hsptsearch.do">
				 
					<div class="col-lg-5 col-md-5 order-md-1 order-1" style="margin-left: 40px; margin-top: 30px;">
							<div class="search_1" style="display: flex; align-items: center;">
							<select id="state" name="st">
								<option value="전체" ${st eq "전체"?"selected":""}>전체</option>
								<c:forEach var="vo" items="${statelist}">
									<option value="${vo.state }" ${st eq vo.state ? "selected" : ""}>
									${vo.state}</option>
								</c:forEach>
								
							</select>
							
								<input type="text" placeholder="Search..." name="fd"
									value="${fd eq null?"":fd }">
										
								<button type="submit" style="margin-right: 20px;">
									<span class="icon_search" ></span>
								</button>
								</div>
							</div>
						</div>
					
					</form>
				</div>
				</div>
 	<jsp:include page="${hspt_jsp }"></jsp:include>

</body>
</html>