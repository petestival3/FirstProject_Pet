<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 검색어 입력창 스타일 */
#walkSearchBar {
  height: 40px;
  width: 300px;
  padding: 0 10px;
  border: 1px solid #ddd;
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  outline: none;
}
.walkSearch{
margin-top:50px;
}
.walkSearchList{
display:none;
}

</style>


</head>
<body>

<div class="walkSearch">
<select id="walkSearchOption" name="walkSearchOption">
<option value="전체">전체</option>
<option value="서울">서울</option>
<option value="경기">경기</option>
<option value="인천">인천</option>
<option value="전체">충남</option>
<option value="충북">충북</option>
<option value="강원">강원</option>
<option value="전남">전남</option>
<option value="울산">울산</option>
<option value="경북">경북</option>
<option value="경남">경남</option>
<option value="부산">부산</option>
<option value="대구">대구</option>
<option value="전북">전북</option>
<option value="광주">광주</option>
<option value="세종">세종</option>
<option value="대전">대전</option>
<option value="제주">제주</option>
</select>

<input type="text" id="walkSearchBar" placeholder="검색어를 입력하세요" name="walkSearchBar">

</div>
                
                
         
 <jsp:include page="walkHeader.jsp"></jsp:include>
 
  <div class="row ky">
    									
    									          
	                <div class="col-lg-8 col-md-7 walkNormalList">
                    <div class="row ">
                    	
                    	<!-- 일반 리스트 -->
                    	<c:forEach var="vo" items="${list }">
                        <div class="col-lg-4 col-md-4 col-sm-4 ">
                        <a href="../walk/walkDetail.do?wno=${vo.wno }">
                            <div class="blog__item walk_wrapper">
                                
                                <div class="blog__item__text walk_list_style">
                                   
                                    <h3 class="name_overflow">${vo.wname }</h3>
                                    <p></p>
                                    <p class="name_overflow">${vo.signgu_name }</p>
                                    <p class="name_overflow">${vo.address }</p>
                                   
                                </div>
                            </div>
                            </a>
                        </div>
                        </c:forEach>
                       <!-- 일반 리스트 종료 -->
                   
                        
                        <div class="col-lg-12">
                            
                            <div class="product__pagination blog__pagination prod_page ">
                               <center>
                    <c:if test="${start > 1}">
                        <a href="../walk/walkList.do?page=${start-1 }&loc=${loc}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${start }" end="${end }">
                        	
                          <c:choose>
									<c:when test="${i eq curpage}">
									 <a href="../walk/walkList.do?page=${i }&loc=${loc}" class="kyj_selected">${i }</a>
										
									</c:when>
									<c:otherwise>
									  <a href="../walk/walkList.do?page=${i }&loc=${loc}">${i }</a>
									</c:otherwise>
								</c:choose>
                       </c:forEach>
                        
                        <c:if test="${end < totalpage}">
                       <a href="../walk/walkList.do?page=${end+1 }&loc=${loc}"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                            </div>
                        </div>
                       
                    </div>
                </div>
                
                
                
                
                
                <!-- 에이젝스 서치리스트 -->
                 <div class="col-lg-8 col-md-7 walkSearchList">
                
                    <div class="row" id="walkSearchWrapper">
                    
                    </div>
                </div>
                 <!-- 에이젝스 서치리스트 종료 -->
                
                
                
                
            </div>





</body>
</html>