<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<a href="../adminPage/ad_productQnaList.do?type=1" class="btn-sm ">결제완료</a>
<a href="../adminPage/ad_productQnaList.do?type=2" class="btn-sm ">결제취소 대기중</a>
<a href="../adminPage/ad_productQnaList.do?type=2" class="btn-sm ">결제취소완료</a>
<a href="../adminPage/ad_productQnaList.do?type=2" class="btn-sm ">배송중</a>
<a href="../adminPage/ad_productQnaList.do?type=2" class="btn-sm ">배송완료</a>
</div>
<table class="table text-center" style="width:870px;">
		<thead class="qna_firstData">
			<tr >
				<th width=10%>결제자</th>
				<th width=20%>상품이미지</th>
				<th width=15%>상품이름</th>
				<th width=15%>결제일</th>
				<th width=50%>상태처리</th>
				
			</tr>
		</thead>
		      
<c:forEach var="vo" items="">

<tr class="qna_content" >
<td width=10% class="middle" style="text-align: center; vertical-align: middle;">아이디</td>

<td width=20%><img src="../img/noImg.png"></td>


<td width=15% class="middle"  style="text-align: center; vertical-align: middle;">상품이릉ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>

<td width=15% style="font-size:10px; text-align: center; vertical-align: middle;" class="middle">2020-1231-123</td>

<td width=40% class="middle"  style="text-align: center; vertical-align: middle;"><a href="../product/DetailBefore.do?count=4&pno=" class="btn-sm btn-danger">결제취소 승인</a>
&nbsp; 
<a href="../product/DetailBefore.do?count=4&pno=" class="btn-sm btn-info">배송중처리</a>
&nbsp; 
<a href="../product/DetailBefore.do?count=4&pno=" class="btn-sm btn-primary">배송완료처리</a>

</td>

</tr>
    
</c:forEach>
</table>

       <div class="product__pagination prod_page">
                  
                    </div>

</div>
</body>
</html>