<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top:25px;">
<div style="margin-bottom:10px;">
<a href="../adminPage/maechul.do?type=1" class="btn-sm ${type==1?'btn-primary':'btn-info'} ">오늘</a>
<a href="../adminPage/maechul.do?type=2" class="btn-sm ${type==2?'btn-primary':'btn-info'} ">일주일간</a>
<a href="../adminPage/maechul.do?type=3" class="btn-sm ${type==3?'btn-primary':'btn-info'} ">한달간</a>
<table class="table text-center" style="width:870px;">
		<thead class="qna_firstData">
			<tr >
				<th width=15%>매출액</th>
				
				
			</tr>
		</thead>
		      


<tr class="qna_content" >


<td><h1>
${ machulPrice}
</h1>
</td>

</tr>
    

</table>

      
</div>
</body>
</html>