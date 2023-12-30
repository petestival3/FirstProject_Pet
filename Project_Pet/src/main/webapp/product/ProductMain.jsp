<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  
<style type="text/css">


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Page Preloder -->
  

<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">상품을 느껴보세요</a>
                            <span>용품</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="product spad">
		
       <div class="container">
     

      <jsp:include page="ProductCategory.jsp"></jsp:include>
   		
      
      <div class="row">
        
      
      <jsp:include page="${product_jsp }"></jsp:include>
      
     			
       <jsp:include page="ProductRightSide.jsp"></jsp:include>
       
            
       </div>
    
       	
         </div>         
                        
       
    
      

  
    </section>
   
</body>
</html>