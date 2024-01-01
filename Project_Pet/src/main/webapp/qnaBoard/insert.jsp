<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
  width:750px;
}
.primary-btn {
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 15px 8px;
    color: #ffffff;
    text-transform: uppercase;
    font-weight: 700;
    background: #5a70e9;
    letter-spacing: 2px;
    margin-right: 5px;
    margin-bottom: 4px;
}
</style>
</head>
<body>
  <div class="wrapper row3">
   <main class="container clear">
    <h2 class="sectiontitle">QnA</h2>
    <div class="row">
     <form method="post" action="#">
      <table class="table">
        <tr>
          <th width=20% class="text-center">제목</th>
          <td width=80%>
           <input type=text name=subject size=50 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-center">내용</th>
          <td width=80%>
           <textarea rows="10" cols="50" name=content></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
           <button class="btn btn-sm btn-success">글쓰기</button>
           <input type=button value="취소" class="btn btn-sm btn-info"
            onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
   </main>
  </div>
</body>
</html>




