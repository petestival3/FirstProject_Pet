<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>  
<link rel="stylesheet" href="../css/login.css">
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
       <a href="../main/main.do"><h2>PETSTIVAL<img src="../img/mainlogo.png" width="35px" height="35px"></h2></a>
  </div>
  <div class="form">
    <form class="login-form">
      <input type="text" placeholder="ID를 입력하세요" name="id"/>
      <input type="password" placeholder="비밀번호를 입력하세요" name="pwd"/>
      <button>로그인</button>
      <p class="message"><a href="#">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">ID찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">비밀번호찾기</a></p>
    </form>
  </div>
</div>
<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="../js/login.js"></script>

</body>
</html>