<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.row.my_unreg
{
	width: 500px;
	margin: 80px 0 100px 300px;
}
</style>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
function unregOk() {
var password = document.getElementById("pwd").value;
$.ajax({
    url : "../mypage/my_unreg_ok.do",
    type : "post",
    data : {"pwd" : password},
    success : function(res) {
    	if (res === "yes")
       {
    	   alert("회원 탈퇴가 완료되었습니다.");
    	   location.href="../main/main.do";
       } 
       else 
       {
          alert("비밀번호가 일치하지 않습니다.");
       }
    },
    error : function() {
       alert("서버 오류가 발생했습니다.");
    }
 });
}
</script>
</head>
<body>
<div class="container">
<div class="row my_unreg">
<div id="unregInfo" style="text-center">
    <p>회원 탈퇴 시 회원님의 모든 정보가 영구 삭제되며, 복구 불가합니다.</p>
    <p>회원 탈퇴를 진행하시겠습니까?</p>
    <p>진행을 원하시면 비밀번호 입력 후, 탈퇴 버튼을 클릭해주세요</p>
    <input type="password" id="pwd" placeholder="비밀번호">
    <button onclick="unregOk()">탈퇴</button>
</div>
</div>
</div>
</body>
</html>