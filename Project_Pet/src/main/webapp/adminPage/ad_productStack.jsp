<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	let statusValue=$('.adSearch').attr('data-msg');
console.log(statusValue)
    // "status" 값이 "YES"이면 Alert 발생
    if (statusValue === 'YES') {
        alert('처리가 완료되었습니다.');
    }
    
    if (statusValue === 'NO') {
        alert('처리하고자 하는수량보다 현재고가 적습니다');
    }
	
	
	   $(".kyj_shoppingIncreseBtn2").click(function() {
	   
	   
	       let count=$(this).siblings('.kyj_shoppingCal2').val()
	       
	       
	       count++;
	       $(this).siblings('.kyj_shoppingCal2').val(count)
	      
	    event.preventDefault();  // 폼 제출을 막음
	});


	$(".kyj_shoppingDecreseBtn2").click(function() {
	   
	   
	     
	     let count=$(this).siblings('.kyj_shoppingCal2').val()
	     if(count>1){
	        count--;
	        $(this).siblings('.kyj_shoppingCal2').val(count)
	        
	     }
	  
	     event.preventDefault();  // 폼 제출을 막음
	     
	});
	   
	   
	
	
	
	
	});
	</script>

<style type="text/css">


.kyj_shoppingQuantity2 {
 display: flex; 
 justify-content: center;
  align-items: center;
}

.kyj__ShopInput-container2 {
  display: flex;
  align-items: center;
}

.kyj_shoppingCal2 {
  width: 60px; /* Adjust width as needed */
  height: 50px; /* Adjust height as needed */
  padding: 10px;
  text-align: center;
  margin: 0 5px; /* Adjust margin for spacing */
  border: 1px solid #ccc;
  font-size: 18px; /* Adjust font size */
  order: 2; /* Change order to place input in the middle */
}

.kyj_shoppingIncreseBtn2,
.kyj_shoppingDecreseBtn2 {
  padding: 13px; /* Adjust padding for button size */
  background-color: #ccc;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
  order: 1; /* Change order to place buttons at the sides */
}

.kyj_shoppingIncreseBtn2 {
  order: 3; /* Change order to place + button at the right */
}

.kyj_shoppingDecreseBtn2:hover,
.kyj_shoppingIncreseBtn2:hover {
  background-color: #aaa;
}
.adSearch{
 margin-right: 10px;
    padding: 8px;
   
    background-color: #fff;
    font-size: 14px;
    outline: none; /* 포커스 효과 제거 */
}

.adSearch input[type="text"] {
    height: 40px;
    width: 160px;
    padding: 8px;
  
    font-size: 14px;
    outline: none; /* 포커스 효과 제거 */
}

/* 검색 버튼에 대한 스타일 */
.adSearch button {
    height: 40px;
    width: 40px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    outline: none; /* 포커스 효과 제거 */
}

/* 버튼 아이콘에 대한 스타일 */
.adSearch button .icon_search {
    display: inline-block;
    vertical-align: middle;
}  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




 <div style="margin-top:25px;">
  <div class="adSearch" data-msg="${msg }"> 
                  <form method="post" action="../adminPage/ad_productPstackHandleList.do">
                   <select id="searchOptions" name="sct">
                   <option value="전체" ${sct eq "전체"?"selected":""}>전체</option>
                   <option value="사료" ${sct eq "사료"?"selected":""}>사료</option>
                     <option value="간식" ${sct eq "간식"?"selected":""}>간식</option>
                    <option value="배변/위생" ${sct eq "배변/위생"?"selected":""}>배변/위생</option>
                     <option value="목욕/미용" ${sct eq "목욕/미용"?"selected":""}>목욕/미용</option>
                   <option value="장난감" ${sct eq "장난감"?"selected":""}>장난감</option>
                     <option value="건강관리" ${sct eq "건강관리"?"selected":""}>건강관리</option>
                  <option value="식기" ${sct eq "식기"?"selected":""}>식기</option>
                  <option value="산책/이동장" ${sct eq "산책/이동장"?"selected":""}>산책/이동장</option>
                  <option value="하우스/울타리" ${sct eq "하우스/울타리"?"selected":""}>하우스/울타리</option>
                  <option value="의류/악세서리" ${sct eq "의류/악세서리"?"selected":""}>의류/악세서리</option>
                  </select>
               <input type="text" placeholder="검색어를 입력하세요" name="ss" value="${ss eq null?"":ss }" style="height:40px; width:200px;">
                 <button type="submit"><span class="icon_search"></span></button>
               </form>
              </div>
<div style="margin-bottom:10px;">

</div>
<table class="table text-center" style="width:870px;">
		<thead class="qna_firstData">
			<tr >
			
				<th width=25%>상품이미지</th>
				<th width=35%>상품이름</th>
				<th width=15%>수량</th>
				<th width=25%>상태처리</th>
				
			</tr>
		</thead>
		      
<c:forEach var="vo" items="${searchList }">

<tr class="qna_content" >


<td width=25%><img src="${vo.p_image }"></td>


<td width=35% class="middle"  style="text-align: center; font-weight:bold;vertical-align: middle;">${vo.p_name }</td>
<form action="../adminPage/adminHandleStack.do" method="post">
<td width=15% style="font-size:15px; text-align: center; vertical-align: middle;" class="middle">
  
   <div class="kyj_shoppingQuantity2">
               <div class="kyj__ShopInput-container2">
                <button class="kyj_shoppingDecreseBtn2" >-</button>
          <input type="text" value="1" class="kyj_shoppingCal2" name="adminQuantity">
                    <button class="kyj_shoppingIncreseBtn2" >+</button>                
             </div>
                   </div>


</td>

<td width=25% class="middle"  style="text-align: center; vertical-align: middle;">

<input type="hidden" value="${vo.pno }" name="gpno">
<input type="hidden" value="${vo.p_stack }" name="pstack">
<button type="submit" class="btn-sm btn-danger" value="1" name="out">출고처리</button>
<button type="submit" class="btn-sm btn-primary" value="2" name="in">입고처리</button>
</td>
</form>
</tr>
    
</c:forEach>
</table>

      
  <div class="product__pagination">   
                    <center>
                    <c:if test="${start > 1}">
                        <a href="../adminPage/ad_productPstackHandleList.do?page=${start-1 }&sct=${sct}&rt=${ss}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${start }" end="${end }">
                        
                        <c:choose>
									<c:when test="${i eq page}">
									<a href="../adminPage/ad_productPstackHandleList.do?page=${i }&sct=${sct}&ss=${ss}" class="kyj_selected">${i }</a>
										
									</c:when>
									<c:otherwise>
									   <a href="../adminPage/ad_productPstackHandleList.do?page=${i }&sct=${sct}&ss=${ss}">${i }</a>
									</c:otherwise>
								</c:choose>
                       </c:forEach>
                        
                        <c:if test="${end < sTotalPage}">
                       <a href="../adminPage/ad_productPstackHandleList.do?page=${end + 1}&sct=${sct}&ss=${ss}""><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                    </div>
</body>
</html>