<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>  
<link rel="stylesheet" href="../css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#log_id').val();
		if(id.trim()==="")
		{
			$('#log_id').focus();
			return;
		}
		let pwd=$('#log_pwd').val()
		if(pwd.trim()==="")
		{
			$('#log_pwd').focus()
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/login.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				// NOID , NOPWD , OK
				if(result==='NOID')
				{
					alert("아이디 존재하지 않습니다")
					$('#log_id').val("");
					$('#log_pwd').val("");
					$('#log_id').focus()
				}
				else if(result==='NOPWD')
				{
					alert("비밀번호가 틀립니다")
					$('#log_pwd').val("");
					$('#log_pwd').focus()
				}
				else
				{
					location.href="../main/main.do"
				}
			}
		})
	})
	$('#logoutBtn').on('click',function(){
		location.href="../member/logout.do"
	})
});
</script>
<style>
body {
  background: #9EB8F8; /* fallback for old browsers */
  background: #9EB8F8;
  background: linear-gradient(90deg, #5a70e9 0%, #5a70e9 50%);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #5a70e9;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #5a70e9;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #5a70e9;
  text-decoration: none;
}
.header__logo{
   text-align: center;
}
.header__logo a{
  color : #fff;
  text-decoration: none;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="login-page">
  <div class="header__logo">
       <a href="../main/main.do"><h2>PETSTIVAL<img src="../img/mainlogo_w.png" width="35px" height="35px"></h2></a>
  </div>
  <div class="form">
    <form class="login-form">
      <input type="text" placeholder="ID를 입력하세요" name="log_id" id="log_id"/>
      <input type="password" placeholder="비밀번호를 입력하세요" name="log_pwd" id="log_pwd"/>
      <button type="button" id="logBtn">로그인</button>
      <p class="message"><a href="../member/join.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/idfind.do">ID찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/pwdfind.do">비밀번호찾기</a></p>
    </form>
  </div>
</div>
<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="../js/login.js"></script>

</body>
</html>