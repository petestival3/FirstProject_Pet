<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<style type="text/css">
 #qna_insert_wrapper {
        border: 1px solid #ccc; /* 테두리를 주기 위한 스타일 */
        border-collapse: collapse; /* 테이블 셀 테두리 합치기 */
        background-color: #f8f8f8; /* 연한 배경색 */
    }

   

    #qna_insert_wrapper th {
        text-align: left; /* th의 텍스트 정렬 */
    }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="qna_insert_wrapper">
		<tr>
			<th>제목</th>
			<td><input type="text" size=40> <input type="checkbox"
				name="sercret" value="secret" style="margin-left: 20px;">비밀글
			</td>
		</tr>

		<tr>
			<th style="vertical-align: top;">내용</th>
			<td><textarea rows="10" cols="50"></textarea></td>
		</tr>
		<!-- 이미지 js첨부 -->
		<tr>
			<th><img src=""></th>
			<td></td>
		</tr>
		<!-- 이미지 js첨부 -->
		<tr>
			<th></th>
			<td><input type="file" style="float: left;">
				<button style="float: right;">등록하기</button></td>
		</tr>
	</table>

</body>
</html>