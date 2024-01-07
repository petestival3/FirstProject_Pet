<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
 <script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
	
	
	
    $(document).on('click', '#openAnswer', function() {
    	let qno=$(this).data('qno')
        Shadowbox.open({
            content: '../adminPage/ad_product_qna_move.do?qno='+qno,
            player: 'iframe',
            title: '문의답변',
            width: 800,
            height: 800,
        });
    });
    
  
    window.addEventListener('message', function(event) {//insert_review.jsp에서 등록하기 버튼 클릭시 받는 데이터(메시지)
    	 const receivedData = event.data;
    	    const data1 = receivedData.data1;
    	    const data2 = receivedData.data2;
    	    const data3 = receivedData.data3;
			console.log(data1)
			console.log(data2)
			console.log(data3)
			 window.location.href = '../admin/ad_qna_answerInsert.do?qno='+data1+'&ancontent='+data2+'&antitle='+data3; // 
		
       
       
    });
    
    
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="margin-top:25px;">
<div style="margin-bottom:10px;">
<a href="../adminPage/ad_productQnaList.do?type=1" class="btn-sm ${type==1?'btn-primary':'btn-info'} ">미답변</a>
<a href="../adminPage/ad_productQnaList.do?type=2" class="btn-sm ${type==2?'btn-primary':'btn-info'} ">답변완료</a>
</div>
<table class="table text-center" style="width:870px;">
		<thead class="qna_firstData">
			<tr >
				<th width=7%>번호</th>
				<th width=13%>답변유무</th>
				<th width=15%>작성자</th>
				<th width=10%>제목</th>
				<th width=15%>내용</th>
				<th width=15%>등록일자</th>
				<th width=25% style="font-weight:bold; color:red;">관리자</th>
			</tr>
		</thead>
		      <c:set var="count" value="${rowcount }"/>
<c:forEach var="vo" items="${list }">

<tr class="qna_content">
<td width=7%>${count }</td>
<c:if test="${vo.answercheck=='n' }">
<td width=13%>답변대기중</td>
</c:if>
<c:if test="${vo.answercheck=='y' }">
<td width=13% style="color:blue; font-weight:bold;">답변완료</td>
</c:if>
<td width=15%>${vo.qwriter }</td>
<td width=10% style="font-weight:bold;"> ${vo.qtitle }</td>
<td width=15%>${vo.qcontent }</td>
<td width=15% style="font-size:10px;">${vo.dbday }</td>
<td width=25% ><a href="../product/DetailBefore.do?count=4&pno=${vo.pno }" class="btn-sm btn-primary">상품이동</a>
<c:if test="${vo.answercheck=='n' }">
&nbsp; &nbsp; 
<a href="#" class="btn-sm btn-danger" id="openAnswer" data-qno="${vo.qno }">답변</a>
</c:if>
</td></tr>
    <c:set var="count" value="${count-1 }"/>
</c:forEach>
</table>

       <div class="product__pagination prod_page">
                    <center>
                    <c:if test="${startpage > 1}">
                        <a href="../adminPage/ad_productQnaList.do?page=${startpage-1 }&type=${type}"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${startpage }" end="${endpage }">
                        
                          <c:choose>
                           <c:when test="${i eq page}">
                            <a href="../adminPage/ad_productQnaList.do?page=${i }&type=${type}" class="kyj_selected">${i }</a>
                              
                           </c:when>
                           <c:otherwise>
                             <a href="../adminPage/ad_productQnaList.do?page=${i }&type=${type}">${i }</a>
                           </c:otherwise>
                        </c:choose>
                       </c:forEach>
                        
                        <c:if test="${endpage < totalpage}">
                       <a href="../adminPage/ad_productQnaList.do?page=${endpage+1 }&type=${type}"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                        </center>
                    </div>

</div>
</body>
</html>