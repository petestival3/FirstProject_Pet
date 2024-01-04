<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
									<div class="modal fade" id="myModal" role="dialog">
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
									  </div>
</body>
</html>