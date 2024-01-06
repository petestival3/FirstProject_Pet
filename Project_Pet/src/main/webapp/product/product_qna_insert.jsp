<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <script src="../js/jquery-3.3.1.min.js"></script> 
  <script type="text/javascript">
  $(function(){
		
	  const pno=$('#qna_insert_wrapper').attr('data-pno');
	
	   //이벤트등록
	   $('#insert_qnaBtn').click(function(){//등록하기 버튼시 이벤트
		   
		let qcontent=$('#qna_content').val()
         let checkBox=$('#secretCheck')
          let secretcheck = checkBox.prop('checked') ? 'y' : 'n';
	   		let qtitle=$('#qna_title').val()
         		
           
           
           if(qcontent.trim()===null || qcontent.trim()===''){
        	   
        	   alert('내용을 입력하세요')
        	   $('#qna_content').focus();
        	  
              
              return false;
           }
	   		
	   		if(qtitle.length>15){
	   			alert('제목은 15자리 이하여야합니다')
	   			$('#qna_title').val('')
	   			$('#qna_title').focus()
	   			return false;
	   		}
	   		
          
           
         
           else{
              
              event.preventDefault(); // 기본 이벤트 동작 막기

                // FormData 객체 생성
                let formData = new FormData();
                formData.append('filename', document.getElementById('qnaSelectImg').files[0]);
                formData.append('pno',pno );
                formData.append('secretcheck',secretcheck );
                formData.append('qcontent',qcontent );
                formData.append('qtitle',qtitle);

                // AJAX로 데이터 전송
                fetch('product_qna_handleData.do', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    // 응답 처리
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    sendDataToParent2('sendQna')
                    parent.Shadowbox.close()
                    
                })
                .catch(error => {
                    // 에러 처리
                  	alert('상품문의는 아이디당 한번 작성가능합니다.')
                });
              
           }
		   
		   
		   
		   
	   })
	   
	   
	   $('#qnaSelectImg').change(function(){
		   
		   QnaPreviewImage(event)
		  
	   })
	   
	   
	   
	   //함수들
	   
	   //이미지 자바스크립트 프리뷰
	   function QnaPreviewImage(event) {
    const previewDiv = document.querySelector('.qna_insert_img');
    const previewImg = document.getElementById('qna_previewImg');
    const input = event.target;

    if (input.files && input.files[0]) {
        const reader = new FileReader();

        reader.onload = function(e) {
            previewDiv.style.display = "block"; // 이미지가 있을 때 div 표시
            previewImg.src = e.target.result;
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        previewDiv.style.display = "none"; // 이미지가 없을 때 div 숨김
        previewImg.src = "";
    }
}
	   
	   
	 //부모한테 동작완료 메시지 보내는 함수
	   function sendDataToParent2(data) {
           window.parent.postMessage(data, '*');
           
       } 
	   
	   
	  
  })
  </script>
 <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<style type="text/css">
 #qna_insert_wrapper {
        border: 1px solid #ccc; /* 테두리를 주기 위한 스타일 */
        border-collapse: collapse; /* 테이블 셀 테두리 합치기 */
        background-color: #f8f8f8; /* 연한 배경색 */
    }

 #qna_insert_wrapper {
            margin: 0 auto; /* 가운데 정렬 */
            width: 70%; /* 테이블 너비 지정 */
            border-collapse: collapse; /* 테이블 셀 테두리 합치기 */
        }
       

    #qna_insert_wrapper th {
        text-align: left; /* th의 텍스트 정렬 */
    }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="height:70px; text-align:center;">
	<h1>문의작성</h1>
	</div>
	<table id="qna_insert_wrapper" data-pno="${pno }">
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		
		<tr>
			<th>제목</th>
			<td><input type="text" size=40 id="qna_title"> <input id="secretCheck" type="checkbox"
				name="secret" style="margin-left: 20px;">비밀글
			</td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<th style="vertical-align: top;">내용</th>
			<td><textarea rows="10" cols="50" id="qna_content"></textarea></td>
		</tr>
		
		<tr>
			<th></th>
			<td><input type="file" id="qnaSelectImg" style="float: left;">
			
				<form id="qnaImageUpload" enctype="multipart/form-data">
				<button id="insert_qnaBtn" style="float: right;" class="btn-danger">등록하기</button>
				</form>
				</td>
			</tr>
	</table>
	
	<!-- 이미지 js첨부 -->
		
		<div style="height:20px;"></div>
	<div class="qna_insert_img" style="width:400px; height:200px; margin: 0 auto; display:none;">
	<img src="" id="qna_previewImg" style="width:100%; height:100%;">
	</div>

</body>
</html>