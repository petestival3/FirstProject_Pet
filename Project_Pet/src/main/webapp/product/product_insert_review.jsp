<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/product_review.css">
   <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
   <script src="../js/jquery-3.3.1.min.js"></script> 
  <script type="text/javascript">
  $(function(){
     
     
     
     let value='2.5'
    const pno=$('.p_review_insert_container').attr('data-review_pno')
   

           function sendDataToParent(data) {
               window.parent.postMessage(data, '*');
               
           }
          
       
     
   
     
 
     $('.product_rating__input').click(function(){
       value = $(this).val(); // 클릭된 라디오 버튼의 값 가져오기
         $('#review_input_rating_text').text(value+'/5')
         
      })
      
      
      
      $('#review_child_btn').click(function(){
         
      
         
           let content=$('#p_review_content').val()
           
           
           if(content.trim()===null || content.trim()===''){
            
              $('#p_review_content').focus();
              
              return;
           }
           
          
           
         
           else{
              
              event.preventDefault(); // 기본 이벤트 동작 막기

                // FormData 객체 생성
                let formData = new FormData();
                formData.append('image', document.getElementById('review_insert_img_file').files[0]);
                formData.append('pno',pno );
                formData.append('score',value );
                formData.append('content',content );

                // AJAX로 데이터 전송
                fetch('Product_handle_review.do', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    // 응답 처리
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    sendDataToParent('sendReview')
                    parent.Shadowbox.close()
                    
                })
                .catch(error => {
                    // 에러 처리
                  	alert('상품후기는 아이디당 한번 작성가능합니다.')
                });
              
           }
         
         
      })
   
      
  })
  
  
  function previewImage(event) {
    const previewDiv = document.querySelector('.review_insert_img');
    const previewImg = document.getElementById('preview_image');
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
  
  </script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body  style="background-color: #ffffff;">
<div class="p_review_insert_container" style="text-align:center; margin:30px 30px 30px 30px;" data-review_pno="${pno }"> 
   <div><h2>정성스러운 후기는 상품발전에 큰도움이 됩니다♥</h2></div>
   
   <div class="review_insert_img" style="width:120px; height:120px; margin-left:85px; display:none;">
      
   <img src="" id="preview_image" style="width:100%; height:100%;">
      
   </div>
      
   <div class="review_insert_textarea">
   <input type="file" id="review_insert_img_file" name="review_upload" onchange="previewImage(event)" style="margin-right:260px; margin-bottom:20px;">  
   <div class="review_insert_userid" style="margin-right:400px; margin-bottom:10px; opacity:0.7">${sessionScope.id}님의 후기</div>
   <textarea id="p_review_content" rows="20" cols="70"></textarea>
   </div>
   

   <div class="insert_star" style="margin-top:20px;">
               <span>평점을 입력하세요</span>
            
      <div id="product_half-stars-example">
   
          <div class="product_rating-group">
              <input class="product_rating__input product_rating__input--none" checked name="product_rating2" id="product_rating2-0" value="0" type="radio">
              <label aria-label="0 stars" class="product_rating__label" for="product_rating2-0">&nbsp;</label>
              <label aria-label="0.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-05"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-05" value="0.5" type="radio">
              <label aria-label="1 star" class="product_rating__label" for="product_rating2-10"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-10" value="1" type="radio">
              <label aria-label="1.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-15"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-15" value="1.5" type="radio">
              <label aria-label="2 stars" class="product_rating__label" for="product_rating2-20"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-20" value="2" type="radio">
              <label aria-label="2.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-25"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-25" value="2.5" type="radio" checked>
              <label aria-label="3 stars" class="product_rating__label" for="product_rating2-30"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-30" value="3" type="radio">
              <label aria-label="3.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-35"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-35" value="3.5" type="radio">
              <label aria-label="4 stars" class="product_rating__label" for="product_rating2-40"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-40" value="4" type="radio">
              <label aria-label="4.5 stars" class="product_rating__label product_rating__label--half" for="product_rating2-45"><i class="product_rating__icon product_rating__icon--star fa fa-star-half"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-45" value="4.5" type="radio">
              <label aria-label="5 stars" class="product_rating__label" for="product_rating2-50"><i class="product_rating__icon product_rating__icon--star fa fa-star"></i></label>
              <input class="product_rating__input" name="product_rating2" id="product_rating2-50" value="5" type="radio">
          </div>
        
           
      </div>
            
            <span style="text-align:center;"><h1 id="review_input_rating_text">2.5/5</h1></span>
         
   </div>
   <form id="fileUploadForm" enctype="multipart/form-data">
   <input type="button" style="margin-top:20px;"  id="review_child_btn" class="btn btn-primary" value="등록하기">
   </form>
</div>
</body>
</html>