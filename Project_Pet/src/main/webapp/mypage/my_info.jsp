<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/myinfo.css">
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
<style type="text/css">
#unreg {
    margin-top: 20px;
}

#unreg span {
    font-size: 15px;
    color: gray; 
    
}
#unreg a {
    font-size: 15px;
}
</style>
</head>
<body>
<div class="join_container">
		<div class="checkout__form" >
			<div class="myinfo_title"
				style="margin-top: 70px;  text-align: center;">
				<h4>개인정보 수정</h4>
			</div>
			<form id="contact" action="../mypage/my_update.do" name="MyFrm"
				method="post" style="margin-top: -30px;">

				<fieldset>
					<input name="id" id="id" class="writeid" placeholder="ID 입력"
						type="text" tabindex="1" style="float: left;" value="${vo.id }"
						readonly>

				</fieldset>
				<fieldset>
					<input name="pwd" id="pwd" placeholder="변경할 비밀번호 입력"
						type="password" tabindex="2" required>
				</fieldset>
				<fieldset>
					<input name="pwd1" id="pwd1" placeholder="변경할 비밀번호 재입력"
						type="password" tabindex="3" required>
				</fieldset>
				<fieldset>
					<input name="name" id="name" placeholder="이름 입력" type="text"
						tabindex="4" value="${vo.name }" required>
				</fieldset>
				<fieldset>
					<input type="radio" tabindex="5" name="sex" value="남자" ${vo.sex eq '남자'?'checked':''} required>남자 
					<input type="radio" tabindex="6" name="sex" value="여자" ${vo.sex eq '여자'?'checked':''} required>여자
				</fieldset>
				<fieldset>
					<input name="birth" placeholder="생년월일 입력" type="date"
						tabindex="7" value="${vo.birth }" readonly>

				</fieldset>
				<fieldset>
					<input name="email" id="email" placeholder="이메일" type="text"
						tabindex="8" value="${vo.email }" required>
				</fieldset>
				<fieldset>
					<input name="post" id="post" class="writepost" placeholder="우편번호"
						type="text" tabindex="9" style="float: left;"
						value="${vo.post }" readonly>
					<button class="postnum" name="postnum" type="button"
						id="contact-post" style="float: left">우편번호검색</button>
				</fieldset>
				<fieldset>
					<input name="addr1" id="addr1" placeholder="주소" type="text"
						tabindex="10" value="${vo.addr1 }" readonly>
				</fieldset>
				<fieldset>
					<input name="addr2" id="addr2" placeholder="상세주소" type="text"
						tabindex="11" value="${vo.addr2 }">
				</fieldset>
				<fieldset>
					<input name="phone" id="phone" placeholder="전화번호" type="text"
						tabindex="12" value="${vo.phone }" required>
				</fieldset>
				<fieldset>
					<textarea name="content" placeholder="당신의 반려동물을 소개해주세요."
						tabindex="13"  required>${vo.content }</textarea>
				</fieldset>
				<fieldset>
					<button name="submit" type="submit" id="contact-submit"
						style="float: left">수정</button>
					<button class="can" name="cancel" type="button" id="contact-cancel"
						style="float: left;" onclick="javascript:history.back()">취소</button>
				</fieldset>
				<fieldset  id="unreg">
					<i class="fa fa-frown-o" aria-hidden="true"></i>&nbsp;
					<span>회원탈퇴를 원하시면 </span><a href="../mypage/my_unreg.do">"탈퇴하기"</a><span>를 눌러주세요 !
					</span>
				</fieldset>
			</form>
			
		</div>
	</div>
</body>
</html>