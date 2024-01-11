<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>


.middle{

text-align: center;
vertical-align: middle;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top:25px;">
<div style="margin-bottom:10px;">
<a href="../admin/ad_product_stateHandleList.do?type=1" class="btn-sm ${type==1?'btn-primary':'btn-info'} ">결제완료</a>
<a href="../admin/ad_product_stateHandleList.do?type=2" class="btn-sm ${type==2?'btn-primary':'btn-info'} ">결제취소 대기중</a>
<a href="../admin/ad_product_stateHandleList.do?type=3" class="btn-sm ${type==3?'btn-primary':'btn-info'} ">결제취소완료</a>
<a href="../admin/ad_product_stateHandleList.do?type=4" class="btn-sm ${type==4?'btn-primary':'btn-info'} ">배송중</a>
<a href="../admin/ad_product_stateHandleList.do?type=5" class="btn-sm ${type==5?'btn-primary':'btn-info'} ">배송완료</a>
</div>
<table class="table text-center" style="width:870px;">
		<thead class="qna_firstData">
			<tr >
				<th width=15%>결제자</th>
				<th width=20%>상품이미지</th>
				<th width=25%>상품이름</th>
				<th width=20%>결제일</th>
				<th width=20%>상태처리</th>
				
			</tr>
		</thead>
		      
<c:forEach var="vo" items="${list }">

<tr class="qna_content" >
<td width=15% class="middle" style="font-weight:bold;text-align: center; vertical-align: middle;">${vo.userid }</td>

<td width=20%><img src="${vo.pvo.p_image }"></td>


<td width=25% class="middle"  style="text-align: center; vertical-align: middle;">${vo.pvo.p_name }</td>

<td width=20% style="font-size:15px; text-align: center; vertical-align: middle;" class="middle">${vo.dbday }</td>

<td width=20% class="middle"  style="text-align: center; vertical-align: middle;">

<c:if test="${type==1}">
<a href="../admin/ad_product_stateHandleUpdate.do?utype=1&cbno=${vo.cbno }" class="btn-sm btn-info">배송중처리</a>
</c:if>

<c:if test="${type==2}">
<a href="../admin/ad_product_stateHandleUpdate.do?utype=2&cbno=${vo.cbno }" class="btn-sm btn-danger">결제취소 승인</a>
</c:if>

<c:if test="${type==4}">
<a href="../admin/ad_product_stateHandleUpdate.do?utype=3&cbno=${vo.cbno }" class="btn-sm btn-primary">배송완료처리</a>
</c:if>



</td>

</tr>
    
</c:forEach>
</table>

        <div class="product__pagination prod_page">
                    <center>
                    <c:if test="${startpage > 1}">
                        <a href="../admin/ad_product_stateHandleList.do?page=${startpage-1 }&type=${type}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${startpage }" end="${endpage }">
                        
                          <c:choose>
                           <c:when test="${i eq page}">
                            <a href="../admin/ad_product_stateHandleList.do?page=${i }&type=${type}" class="kyj_selected">${i }</a>
                              
                           </c:when>
                           <c:otherwise>
                             <a href="../admin/ad_product_stateHandleList.do?page=${i }&type=${type}">${i }</a>
                           </c:otherwise>
                        </c:choose>
                       </c:forEach>
                        
                        <c:if test="${endpage < totalpage}">
                       <a href="../admin/ad_product_stateHandleList.do?page=${endpage+1 }&type=${type}"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                    </div>

</div>
</body>
</html>