/**
 * 
 */

//후기 쉐도우박스 초기화
Shadowbox.init({
    players: ['iframe'],
    
});





 $(document).ready(function() {
	 const pno=$('#title').attr('data-pno')
	let type=1;
    let mainImageSrc = $('.product__details__pic__item img').attr('src'); // 초기 메인 이미지 저장
    
    //서브이미지 클릭시 상품이미지 변경되는 js
    $('.sub-image').hover(
        function() {
            const index = $(this).data('index');
            
            if (index !== 0) {
                const newSrc = $(this).attr('src');
                $('.product__details__pic__item img').attr('src', newSrc);
            }
        },
        function() {
            $('.product__details__pic__item img').attr('src', mainImageSrc); // 마우스가 벗어날 때 메인 이미지 원복
        }
    );
    
     //서브이미지 클릭시 상품이미지 변경되는 js
    $('#show_pro_detail_inform').click(function(){
		$('#show_pro_detail_inform').hide()
		$('.pro_detail_img').show()
		$('.close_pro_detail_inform').show()
		
	})
    
     //서브이미지 클릭시 상품이미지 변경되는 js
      $('.close_pro_detail_inform').click(function(){
		$('.pro_detail_img').hide()
		$('#show_pro_detail_inform').show()
		$('.close_pro_detail_inform').hide()
		
	})
   



	
	
	//후기작성 클릭시 쉐도우박스 오픈
	$(document).on('click', '#write_product_review', function() {
    Shadowbox.open({
        content: '../product/Product_insert_review.do?pno=' + pno,
        player: 'iframe',
        title: '리뷰',
        width: 800,
        height: 800,
    });
});
	
  window.addEventListener('message', function(event) {//insert_review.jsp에서 등록하기 버튼 클릭시 받는 데이터(메시지)
    
   	newList(1,1)//새로운 리뷰리스트 출력
   
});


function newList(page) {//새로운 리뷰리스트를 출력하는 ajax를 담은 함수
	
    $.ajax({
        type: 'post',
        url: 'Product_review_newList.do',
        data: { "pno": pno, "page": page, "type": type },
        success: function (json) {
            let res = JSON.parse(json);
            let input_list = $('#input_list');
            let listSize = res[0].listSize;
            let newGrade = res[0].newGrade;
            let totalpage= res[0].totalpage;
            let id=res[0].id;
            
          
        
            let html = '<div class="product__details__tab__desc">';
            html += '<div class="p_total_review_container">';
            html += '<div class="p_total_review">';
            html += '<div class="rating" style="width:400px; margin-top:10px; margin-bottom:10px;">';
            if (newGrade >= 0.5 && newGrade < 1) {
                html += '<span class="half-star">⭐️</span>';
            } else if (newGrade >= 1 && newGrade < 1.5) {
                html += '<span class="star">⭐️</span>';
            } else if (newGrade >= 1.5 && newGrade < 2) {
                html += '<span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (newGrade >= 2 && newGrade < 2.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (newGrade >= 2.5 && newGrade < 3) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (newGrade >= 3 && newGrade < 3.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (newGrade >= 3.5 && newGrade < 4) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (newGrade >= 4 && newGrade < 4.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (newGrade >= 4.5 && newGrade < 5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
             else if (newGrade >= 5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            // ... (rest of your star rating conditions)

            html += '</div>';
            html += '<div style="margin-top:10px;">';
            html += '<h1>평점'+newGrade+'/5</h1>';
            html += '</div>';
            html += '</div>';
            html += '<div class="p_select_review_option" style="margin-top:30px;">';
            html += '<ul class="p_rank p_review_rank">'
            
            if(type===1){
            html+='<li class="r_option"><button id="highscore" class="btn btn-primary">높은 평점순</button></li>'
            	+'<li class="r_option"><button id="lowscore" class="btn btn-info">낮은 평점순</button></li>'
            	+'<li class="r_option"><button id="latestdate" class="btn btn-info">최신날짜 순</button></li>'
            	+'<li class="r_option"><button id="olddate"  class="btn btn-info">오래된날짜 순 </button> </li>'
            	}
            	
            	if(type===2){
            html+='<li class="r_option"><button id="highscore" class="btn btn-info">높은 평점순</button></li>'
            	+'<li class="r_option"><button id="lowscore" class="btn btn-primary">낮은 평점순</button></li>'
            	+'<li class="r_option"><button id="latestdate" class="btn btn-info">최신날짜 순</button></li>'
            	+'<li class="r_option"><button id="olddate"  class="btn btn-info">오래된날짜 순 </button> </li>'
            	}
            	
            	if(type===3){
            html+='<li class="r_option"><button id="highscore" class="btn btn-info">높은 평점순</button></li>'
            	+'<li class="r_option"><button id="lowscore" class="btn btn-info">낮은 평점순</button></li>'
            	+'<li class="r_option"><button id="latestdate" class="btn btn-primary">최신날짜 순</button></li>'
            	+'<li class="r_option"><button id="olddate"  class="btn btn-info">오래된날짜 순 </button> </li>'
            	}
            	
            	if(type===4){
            html+='<li class="r_option"><button id="highscore" class="btn btn-info">높은 평점순</button></li>'
            	+'<li class="r_option"><button id="lowscore" class="btn btn-info">낮은 평점순</button></li>'
            	+'<li class="r_option"><button id="latestdate" class="btn btn-info">최신날짜 순</button></li>'
            	+'<li class="r_option"><button id="olddate"  class="btn btn-primary">오래된날짜 순 </button> </li>'
            	}
            	
            	
           html+='</ul>'
            	+'<div style="margin-left:990px;">'
            	if(id===null || id==='' || typeof id==="undefined"){
            		html+='<span>로그인 후 후기등록이 가능합니다.</span>'
				}
				else{
					html+='	<button id="write_product_review" class="btn-sm btn-danger">후기 작성하기</button>'
				}
				
            html += '</div>';
            html += '</div></div>';
            html += '<hr>';

           

            for (vo of res) {
             html+=' <div class="row product_review_container" data-page="'+page+'"> <div class="col-md-4" style="width:200px; height:200px ;">'
             	+'<div class="p_review_image" style="width:100%; height:100%;">'
             	if(vo.imgsize>0){
					 html+='<img src="../reviewImg/'+vo.imgname+'" style="width:100%; height:100%; object-fit: contain;">'
				 }
             	else{
					 html+='<img src="../img/noImg.png" style="width:100%; height:100%; object-fit: contain;">'
				 }
            	html+='</div></div>'
            	+'<div class="col-md-8">'
            	+'<div class="review-container">'
            	+'<img src="../img/mainlogo.png" alt="User Avatar" class="user-image" />'
            	+'<div class="mid_1">'
            	+'<div class="user-info" style="display: flex;align-items: center;margin-top: 10px;">'
            	+'<img'
            	+'src="../img/mainlogo.png"'
            	+'alt="Reviewer Avatar"'
            	+'class="reviewer-avatar"'
            	+'style="float:left"/>'
            	+'<div class="user-name" style="width:1000px;">'+vo.writer+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10px;opacity:0.5;">'+vo.dbday+'</span></div> '
            	+'</div>'
            	+'<br />'
            	+'<div class="mid_2">'
            	+'<div class="rating" style="width:120px;">'
            	
            	  if (vo.score >= 0.5 && vo.score < 1) {
                html += '<span class="half-star">⭐️</span>';
            } else if (vo.score >= 1 && vo.score < 1.5) {
                html += '<span class="star">⭐️</span>';
            } else if (vo.score >= 1.5 && vo.score < 2) {
                html += '<span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (vo.score >= 2 && vo.score < 2.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (vo.score >= 2.5 && vo.score < 3) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (vo.score >= 3 && vo.score < 3.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (vo.score >= 3.5 && vo.score < 4) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
            else if (vo.score >= 4 && vo.score < 4.5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
            else if (vo.score >= 4.5 && vo.score < 5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="half-star">⭐️</span>';
            }
             else if (vo.score >= 5) {
                html += '<span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span><span class="star">⭐️</span>';
            }
                    
              html+='</div></div>'
              		+'<div class="mid_3">'
              		+'<p><h3>'+vo.score+'/5</h3></p>'  
              		+'<p class="review-text">'+vo.content+'</p>'
              		+'</div></div></div></div></div>' 
                                
            }
				
			
				
            html += '</div><div class="Rpagination">';
            if(page>1){
				html+='<span><button class="btn btn-lg btn-primary Rprev-btn"">이전</button></span>'
				
			}	
			html+='<div class="centered-text"><h2>'+page+'/'+totalpage+'</h2></div>'
			
			if(!(page===totalpage) && totalpage>1){
				html+='<span ><button class="btn btn-lg btn-primary Rnext-btn">다음</button></span>'
			}
			
			html+='</div>'
            
          
            
            
            
             $('#firstLoadPage').hide();
             
            input_list.html(html)
            
            

        }

    });
    
}
	
	
		
	//다음버튼 클릭시 다음ajax리뷰리스트 호출
	$(document).on('click', '.Rnext-btn', function() {
		
		let page=$('.product_review_container').attr('data-page')
		console.log(page)
		newList(Number(page)+1);
	});
	
	//이전버튼 클릭시 이전ajax리뷰리스트 호출
	$(document).on('click', '.Rprev-btn', function() {
	let page=$('.product_review_container').attr('data-page')
    newList(page - 1); // 이전 페이지 로드
});
	
	//목록별 출력 별 타입을 지정하고 리스트 호출
	$(document).on('click', '#lowscore', function() {
	
		type=2
	newList(1)
});
	
	
	$(document).on('click', '#highscore', function() {
	
		type=1
	newList(1)
});

$(document).on('click', '#latestdate', function() {
	
		type=3
	newList(1)
});

$(document).on('click', '#olddate', function() {
	
		type=4
	newList(1)
});


//상품문의 관련 js시작


 $(document).on('click', '#p_qna', function() {//상품문의 버튼클릭시
	
		
});


function qnaList(page){//ajax로 qna리스트 받아올 함수
		
		$.ajax({		
			    type: 'post',
		        url: '',
		        data: { "pno": pno, "page": page},
		        success: function (json){
					
				}
						
		})
}
    
    
});


