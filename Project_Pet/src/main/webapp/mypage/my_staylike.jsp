<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3f828a1af5.js" crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<style type="text/css">
.row .my_res{
	width: 850px;
	margin: 0px auto;
	margin: 35px 0 0 20px;
}
.myres_table {
width: 890px;
margin-top: 10px;
}

.myres_table td{
height: 130px;
}
.myres_table tr {
    border-bottom: 1px solid #f2f2f2;
}
</style>
<script type="text/javascript">
$(function(){
	$(.'detailBtn').click(function(){
		let sno=$(this).attr('data-sno');
		location.href="../stay/detail_before.do?stayno="+sno;
	})
})
</script>
</head>
<body>
<div class="conatiner">
<div class="row my_res">
 <table class="myres_table">
  <h4 class="text-center">좋아요 내역</h4>
   <tr>
    <th class="text-center"></th>
    <th class="text-center">호텔명</th>
    <th class="text-center">평점</th>
    <th class="text-center">상세보기</th>
   </tr>
   <c:forEach var="vo" items="${list }">
   <tr>
    <td class="text-center">
     <a href="../stay/detail_before.do?stayno=${vo.sno }"><img src="${vo.image }" style="width: 170px; height: 150px"></a>
    </td>
    <td>${vo.name }</td>
    <td class="text-center" width="80px;">★ ${vo.score }</td>
    <td>
    <button class="btn btn-sm btn-info detailBtn" data-sno=${vo.sno } style="width: 80px; height: 40px; margin-left: 10px;">상세보기</button>
    </td>
   </tr>
   </c:forEach>
 </table>
 </div>
 				<div class="text-center" style="margin-top: 20px; margin-bottom: 20px">
                    <div class="like__pagination">
                       <a href="../stay/idlike_mypage.do?page=${curpage>1?curpage-1:curpage }"><i class="fa fa-long-arrow-left" style="margin-right: 20px"></i></a>
                       ${curpage } page / ${totalpage } pages
                       <a href="../stay/idlike_mypage.do?page=${curpage<totalpage?curpage+1:curpage }"><i class="fa fa-long-arrow-right" style="margin-left: 20px"></i></a>
                    </div>
                  </div>
 </div>
</body>
</html>