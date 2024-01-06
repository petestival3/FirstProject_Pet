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

    function findId(tab) {
        if (tab === 'email') {
            let email = $("#findemail").val();
            if(email.trim()===""){
            	$('#findemail').focus();
            	return;
            }
            $.ajax({
            	type:'post',
            	url:'../member/idfindemail_ok.do',
            	data:{"email":email},
            	success:function(result){
            		let res=result.trim();
            		if(res==="NO"){
            			// 찾으려는 email이 db에 없음
            			$("#emailResult").html('<span style="color:red">이메일이 존재하지 않습니다!</span>');
            		}
            		else{
            			// email이 db에 있음
            			$('#emailResult').html('<span>요청한 이메일에 등록된 ID는 '+res+' 입니다</span>')
            		}
            	}
            })
            
            
        } else if (tab === 'phoneNumber') {
            let phoneNumber = $("#findphoneNumber").val();
            if(phoneNumber.trim()===""){
            	$('#findphoneNumber').focus();
            	return;
            }
            $.ajax({
            	type:'post',
            	url:'../member/idfindphone_ok.do',
            	data:{"phoneNumber":phoneNumber},
            	success:function(result){
            		let res=result.trim();
            		if(res==="NO"){
            			// 찾으려는 phone이 db에 없음
            			$("#phoneNumberResult").html('<span style="color:red">전화번호가 존재하지 않습니다!</span>');
            		}
            		else{
            			// phone이 db에 있음
            			$('#phoneNumberResult').html('<span>요청한 전화번호에 등록된 ID는 '+res+' 입니다</span>')
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
        
        .loginLink{
        	display: inline-block;
		    padding: 10px 20px;
		    width: 120px; /* 넓이 지정 */
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
    <h2>ID 찾기</h2>

    <!-- Tabs 생성 -->
    <div id="tabs">
        <ul>
            <li><a href="#emailTab">이메일</a></li>
            <li><a href="#phoneNumberTab">전화번호</a></li>
        </ul>
        
        <!-- 이메일 탭 -->
        <div id="emailTab">
            <form>
                <label for="email">이메일:</label>
                <input type="email" name="email" id="findemail">
                <button type="button" onclick="findId('email')">ID 찾기</button>
                <a href="../member/login.jsp" class="loginLink" style="color: #fff">로그인</a>
            </form>
            <p id="emailResult"></p>
        </div>

        <!-- 전화번호 탭 -->
        <div id="phoneNumberTab">
            <form>
                <label for="phoneNumber">전화번호:</label>
                <input type="tel" name="phoneNumber" id="findphoneNumber">
                <button type="button" onclick="findId('phoneNumber')">ID 찾기</button>
                <a href="../member/login.jsp" class="loginLink" style="color: #fff">로그인</a>
            </form>
            <p id="phoneNumberResult"></p>
        </div>
    </div>
</div>



</body>
</html>