
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">


<head>
   
</head>

<body>
  
			
  				
              <div class="col-lg-9 col-md-7" style="margin-top:100px;">
                    <div class="row">
              				<c:forEach var="vo" items="${searchList }">
              				<c:url value="DetailBefore.do?count=2" var="url">
              				<c:param name="pno" value="${vo.pno }"/>
              				<c:param name="ct" value="${sct}"/>
              				<c:param name="ss" value="${ss}"/>
              				<c:param name="page" value="${page}"/>
              				</c:url>
             						 <div class="col-lg-4 col-md-6 col-sm-6 image-container">
             						 <a href="<c:out value="${url}" />">
             						  <img src="${vo.p_image }" class="customimage">
                       					 <div class="product__item ">
                    		  	 	  <div class="product__item__text">
                               			  <h5>${vo.p_name }</h5>
                                    <h6>${vo.p_lower_price }</h6>
                                </div>
                                </div>
   									   </a>
                         </div>
                        
                        </c:forEach>
                            </div>
                            
                            
              					 <c:choose>
									<c:when test="${i eq page}">
									<a href="../product/ProductSearchList.do?page=${i }&ct=${ct}&rt=${rt}" class="kyj_selected">${i }</a>
										
									</c:when>
									<c:otherwise>
									   <a href="../product/ProductSearchList.do?page=${i }&ct=${ct}&rt=${rt}">${i }</a>
									</c:otherwise>
								</c:choose>
                           
                    
                    <div class="product__pagination">   
                    <center>
                    <c:if test="${start > 1}">
                        <a href="../product/ProductSearchList.do?page=${start-1 }&sct=${sct}&rt=${ss}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${start }" end="${end }">
                        
                        <c:choose>
									<c:when test="${i eq page}">
									<a href="../product/ProductSearchList.do?page=${i }&sct=${sct}&ss=${ss}" class="kyj_selected">${i }</a>
										
									</c:when>
									<c:otherwise>
									   <a href="../product/ProductSearchList.do?page=${i }&sct=${sct}&ss=${ss}">${i }</a>
									</c:otherwise>
								</c:choose>
                       </c:forEach>
                        
                        <c:if test="${end < sTotalPage}">
                       <a href="../product/ProductSearchList.do?page=${end + 1}&sct=${sct}&ss=${ss}""><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                    </div>
                </div>
                
                
                
                <c:if test="${ size eq 0}">
                  
                <div class="container" style="width:800px; height:800px;">
                <h2 class="text-center">검색결과가 없습니다.</h2>
                  </div>
             
                
                </c:if>
    
   
   

    
    


</body>

</html>