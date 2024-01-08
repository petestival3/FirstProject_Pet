<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ID 찾기</title>
    <!-- jQuery 및 jQuery UI 로드 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
    // Tabs 초기화
    $(function () {
        $("#tabs").tabs();
    });

    function findPwd(tab) {
        if (tab === 'email') {
            let id = $("#findbyid").val();
            let email=$("#findbyemail").val();
            if(id.trim()===""){
            	$('#findbyid').focus();
            	return;
            }
            if(email.trim()===""){
            	$('#findbyemail').focus();
            	return;
            }
            $.ajax({
            	type:'post',
            	url:'../member/pwdfind_ok.do',
            	data:{"id":id,"email":email},
            	success:function(result){
            		let res=result.trim();
            		if(res==="IDNO"){
            			// 찾으려는 id가 db에 없음
            			$("#emailResult").html('<span style="color:red">ID가 존재하지 않습니다!</span>');
            		}
            		else if(res=="EMAILNO"){
            			// email이 db에 없음
            			$('#emailResult').html('<span style="color:red">이메일이 존재하지 않습니다!</span>');
            		}else if(res=="SEND"){
            			// id, email 일치
            			$("#emailResult").html('<span style="color:blue">전송 완료</span>')
            			alert("등록된 이메일로 임시 비밀번호를 전송했습니다!");
            		}
            	}
            })
            
            
        } 
    }
	</script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #5a70e9;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .find-id-form {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #666;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            background-color: #5a70e9;
            color: white;
            cursor: pointer;
            width: 46%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #fff;
        }

        button:hover {
            background-color: #5a70e9;
        }
        
        .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited{
        	background-color: #5a70e9;
        }
        
        .loginLinkk{
        	display: inline-block;
		    padding: 10px 20px;
		    width: 150px; /* 넓이 지정 */
		    font-size: 16px;
		    text-align: center;
		    text-decoration: none;
		    cursor: pointer;
		    border: 1px solid #fff;
		    margin-left: 20px;
		    background-color: #5a70e9;
        }
    </style>
</head>
<body>

<div class="find-id-form">
    <h2>비밀번호 찾기</h2>

        
        <!-- 이메일 탭 -->
        <div id="emailPwdTab">
            <form>
                <label for="id">ID:</label>
                <input type="text" name="id" id="findbyid">
                <label for="email">이메일:</label>
                <input type="email" name="email" id="findbyemail">
                <button type="button" onclick="findPwd('email')">PW 찾기</button>
                <a href="../member/login.jsp" class="loginLinkk" style="color: #fff;">로그인</a>
            </form>
            <p id="emailResult"></p>
        </div>
</div>



</body>
</html>