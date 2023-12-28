<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$("#contact-check").click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			title:'아이디 중복체크',
			width:350,
			height:200
		})
	})
	
	$('#contact-post').click(function(){
		Shadowbox.open({
			content:'../member/postfind.do',
			player:'iframe',
			title:'우편번호 검색',
			width:490,
			height:350
		})
	})
})
</script>
</head>
<body>
<div class="join_container">  
  <form id="contact" action="../member/join_ok.do" name="joinFrm" method="post">
    <h3>회원가입</h3>
    <h4>아래 양식을 작성해주세요</h4>
    <fieldset>
      <input name="id" id="id" class="writeid" placeholder="ID 입력" type="text" tabindex="1" style="float:left;" autofocus readonly>
      <button class="idch" name="idcheck" type="button" id="contact-check" style="float: left">중복체크</button>
    </fieldset>
    <fieldset>
      <input name="pwd" id="pwd" placeholder="비밀번호 입력" type="password" tabindex="2">
    </fieldset>
    <fieldset>
      <input name="pwd1" id="pwd1" placeholder="비밀번호 재입력" type="password" tabindex="3">
    </fieldset>
    <fieldset>
      <input name="name" id="name" placeholder="이름 입력" type="text" tabindex="4">
    </fieldset>
    <fieldset>
      <input type="radio" tabindex="5" name="sex" value="남자">남자
      <input type="radio" tabindex="6" name="sex" value="여자">여자
    </fieldset>
    <fieldset>
      <input name="birthday" placeholder="생년월일 입력" type="date" tabindex="7">
      
    </fieldset>
    <fieldset>
      <input name="email" id="email" placeholder="이메일" type="text" tabindex="8">
    </fieldset>
    <fieldset>
      <input name="post" id="post" class="writepost" placeholder="우편번호" type="text" tabindex="9" style="float:left;" readonly>
      <button class="postnum" name="postnum" type="button" id="contact-post" style="float: left">우편번호검색</button>
    </fieldset>
    <fieldset>
      <input name="addr1" id="addr1" placeholder="주소" type="text" tabindex="10" readonly>
    </fieldset>
    <fieldset>
      <input name="addr2" id="addr2" placeholder="상세주소" type="text" tabindex="11">
    </fieldset>
    <fieldset>
      <input name="phone" id="phone" placeholder="전화번호" type="text" tabindex="12">
    </fieldset>
    <fieldset>
      <textarea name="content" placeholder="당신의 반려동물을 소개해주세요." tabindex="13"></textarea>
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" style="float: left">회원가입</button>
      <button class="can" name="cancel" type="button" id="contact-cancel" style="float: left;" onclick="javascript:history.back()">취소</button>
    </fieldset>
  </form>
</div>
</body>
</html>