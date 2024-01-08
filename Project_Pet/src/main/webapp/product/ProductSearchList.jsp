
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
             						 <a href="<c:out value="${url}" />" style="color:black;">
             						  <img src="${vo.p_image }" class="customimage">
                       					 <div class="product__item ">
                    		  	 	  <div class="product__item__text">
                               	  <div class="p_listOver">
                                           <span style="position: relative;">
							  <span style="position: absolute; top: -15px; font-size: smaller; font-weight: bold; opacity: 0.7; color: red;">
							   <img src="../img/hit.jpg" style="width:20px;">${vo.p_hit}</span>
							  <span style="font-weight:bold;">${vo.p_name}</span>
							</span>
							</div>
										 <center> <div class="rating" style="width:120px; margin-top:5px;">
                                     
                                     	 <c:if test="${vo.p_grade==0 }">
                                             <span style="margin-left:50px;"class="half-star">⭐️</span>
                                           </c:if>
                                     
                                      <c:if test="${vo.p_grade>=0.5 and vo.p_grade<1 }">
                                             <span style="margin-left:50px;" class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=1 and vo.p_grade<1.5 }">
                                             <span style="margin-left:50px;" class="star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=1.5 and vo.p_grade<2 }">
                                             <span style="margin-left:25px;"class="star">⭐️</span>
                                              <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2 and vo.p_grade<2.5 }">
                                             <span style="margin-left:25px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2.5 and vo.p_grade<3 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3 and vo.p_grade<3.5 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3.5 and vo.p_grade<4 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                               <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=4 and vo.p_grade<4.5 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                              </c:if>
                                           
                                           
                                              <c:if test="${vo.p_grade>=4.5 and vo.p_grade<5 }">
                                              
                                              
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="half-star">⭐️</span>
                                                
                                                
                                              </c:if>
                                           
                                           
                                              <c:if test="${vo.p_grade>=5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="star">⭐️</span>
                                              </c:if>
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                       <span style="color: rgb(139, 0, 0); opacity:0.7;">(${vo.p_review_num } reviews)</span>
                                     </center>
											
											
											<h7 class="hs_original-price">${vo.p_price}</h7>
                                  <h7 class="hs_discount-rate">${vo.p_percent}</h7>   
                                  <h5 class="hs_final-price">${vo.p_lower_price }</h5>
							
							
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