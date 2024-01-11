<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/star.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../js/jquery-3.3.1.min.js"></script> 
<style type="text/css">


        .review-form {
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
            display: inline;
            margin: 10px 0 5px;
            color: #666;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button[type="submit"]{
            width: 45%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button[type="button"]{
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-left: 10px
        }

        input[type="file"] {
            border: none;
            padding: 0;
        }

        button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

</style>
<script type="text/javascript">
$(function(){
	const sno=$('.rating-group').attr('data-review_sno')
	let score='2.5'
	
	function sendDataToParent(data) {
        window.parent.postMessage(data, '*');
        
    }
	
	$('.rating__input').click(function(){
	       score = $(this).val(); // 클릭된 라디오 버튼의 값 가져오기
	       console.log(score)
	      })
	
	 $('#review_submit_Btn').click(function(){
         
         let content=$('#review_input_content').val()
         
         if(content.trim()===null || content.trim()===''){
          
            $('#review_input_content').focus();
            
            return;
         }
         
         else{
        	 event.preventDefault(); // 기본 이벤트 동작 막기

             // FormData 객체 생성
             let formData = new FormData();
             formData.append('image', document.getElementById('reviewImageInput').files[0]);
             formData.append('sno',sno );
             formData.append('score',score );
             formData.append('content',content );

             // AJAX로 데이터 전송
             fetch('insert_ok.do', {
                 method: 'POST',
                 body: formData
             })
             .then(response => {
                 // 응답 처리
                 if (!response.ok) {
                     throw new Error('Network response was not ok');
                 }
                 sendDataToParent('새로운 리스트 출력')
                 parent.Shadowbox.close()
                 
             })
             .catch(error => {
                 // 에러 처리
               	alert('상품후기는 아이디당 한번 작성가능합니다.')
             });
        	 
       	}
    })
	
})
</script>
</head>
<body>
<div class="review-form">
    <h2>상품 리뷰</h2>

   
      
		<label for="review">별점:</label>
		<div id="full-stars-example-two" style="margin-left:100px">
			<div class="rating-group" data-review_sno="${sno }">
				<input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
				<label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
				<input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
				<label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
				<input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
				<label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
				<input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
				<label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
				<input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
				<label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
				<input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
			</div>
		</div>
        <label for="review">리뷰:</label>
        <textarea name="content" rows=6 id="review_input_content"></textarea>

        <label for="photo">사진 첨부:</label>
        <input type="file" name="upload" id="reviewImageInput">
		<input type="hidden" name="objno" value="${sno }" >
		<input type="hidden" name="type" value="2" >
		
	<form action="../review/insert_ok.do" enctype="multipart/form-data" method="post">	
        <button type="button" id="review_submit_Btn" class="btn btn-default">저장</button>
    </form>
</div>


									<%-- <div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									      <!-- Modal content-->
									      <div class="modal-content">
									      	<form class="review-form" method="post" action="../review/insert_ok.do" enctype="multipart/form-data">
									        <div class="modal-header">
									          <p>별점을 선택해주세요!</p>
									          
									          <div id="full-stars-example-two" style=margin-top:30px;margin-left:10px>
											    <div class="rating-group">
											        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
											        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
											        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
											        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
											        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
											        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
											        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
											    </div>
											 </div>
											 <button type="button" class="close" data-dismiss="modal" style="float:right;">&times;</button>
									        </div>
									        <div style="margin: 0px auto">
					                            <div class="review_input_img" style="margin-bottom: 20px; width: 500px;">
					                                <p>
					                                    <img id="selectedReviewImage" src="../img/mainlogo.png" style="max-width: 100%; max-height: 200px; margin-top: 10px;">
					                                </p>
					                                <input type="file" name="upload" size=25 id="reviewImageInput">
					                            </div>
					                        </div>
									        <div class="modal-body">
									           <p>어떤점이 만족스러우셨나요?<p>
									           
											      <input type="hidden" name="objno" value="${sno }" >
											      <input type="hidden" name="type" value="2" >
											      <textarea name="content" rows=10 cols=60 required></textarea>
											      <div class="modal-footer">
											          <button type="submit" class="btn btn-default">저장</button>
											          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									        	  </div>
    										   
									        </div>
									        </form>
									      </div>
									      
									    </div>
									  </div> --%>
</body>
</html>