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
	
	
	$(document).on('click', '#p_qnaBtn', function() {
    Shadowbox.open({
        content: '../product/product_qna_sendData.do?pno='+pno,
        player: 'iframe',
        title: '문의하기',
        width: 800,
        height: 800,
    });
});
	
	
	
  window.addEventListener('message', function(event) {//insert_review.jsp에서 등록하기 버튼 클릭시 받는 데이터(메시지)
    let recData=event.data
    
    if(recData==='sendReview'){
			newList(1,1)//새로운 리뷰리스트 출력
	}
	else if(recData==='sendQna'){
		
		qnaList(1);
	}
   
   
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
            let reviewamount=res[0].reviewAmount
            
          								
          
          
        
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
				
				let qwriter=vo.writer
				
				let printQwriter=''
									 if (qwriter.length > 3) {
                                           printQwriter=  qwriter.slice(0, -3) + '***';
                                       } else if (qwriter.length === 3) {
                                           printQwriter = qwriter.slice(0, -2) + '**';
                                       } else if (qwriter.length === 2) {
                                           printQwriter = '**' +qwriter.slice(0, -1) + '*';
                                       } else {
                                           printQwriter = qwriter;
                                       }
                                       
				
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
            	+'<div class="mid_1">'
            	+'<div class="user-info" style="display: flex;align-items: center;margin-top: 10px;">'
            	+'<img '
            	+'src="../img/userIcon.jpg"'
            	+'alt="Reviewer Avatar"'
            	+'class="reviewer-avatar"'
            	+'style="float:left"/>'
            	+'<div class="user-name" style="width:1000px;">'+printQwriter+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10px;opacity:0.5;">'+vo.dbday+'</span></div> '
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
            
            $('.input_rNum').text('('+reviewamount+')')

        }

    });
    
}
	
	
		
	//다음버튼 클릭시 다음ajax리뷰리스트 호출
	$(document).on('click', '.Rnext-btn', function() {
		
		let page=$('.product_review_container').attr('data-page')
	
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
	
	qnaList(1);
	
		
});


let qntype=1;
function qnaList(page){//ajax로 qna리스트 받아올 함수
		
		$.ajax({		
			    type: 'post',
		        url: 'product_qna.do',
		        data: { "pno": pno, "page": page,"qtype":qntype},
		        success: function (json){
				
					let res=JSON.parse(json)
				
					let rowcount=res[0].rowcount
					let totalpage=res[0].totalpage
					let startpage=res[0].startpage
					let endpage=res[0].endpage
					let id=res[0].id
					let admin=res[0].admin
					let qnaAmount=res[0].qnaAmount
					if(typeof qnaAmount ==='undefined'){
						qnaAmount='0'
					}
					console.log(qnaAmount)
					let input_qnaData=$('.input_qnaData')
					
					
					let html=''
					
					if(totalpage===0){
						html+='<tr><td colspan=6><h2>작성된 문의가 없습니다.</h2></td></tr>'
						
					}
			
					else{	
					for(vo of res){
						
						//
						
						  
                
						
						
						//
						
						let printQwriter = "";
							if (vo.qwriter.length > 3) {
							    printQwriter=  vo.qwriter.slice(0, -3) + '***';
							} else if (longString.length === 3) {
							    printQwriter =  vo.qwriter.slice(0, -2) + '**';
							} else if (longString.length === 2) {
							    printQwriter = '**' + vo.qwriter.slice(0, -1) + '*';
							} else {
							    printQwriter = vo.qwriter;
							}
						
						
						if(vo.qwriter!==id && vo.secretcheck==='y'&& admin!=='y'){
							
							html+='<tr class="qna_content secretContent" data-qna="'+vo.qno+'" style="width:200px;">'
						html+='<td width:10%>'+rowcount+'</td>'
						if(vo.answercheck==='n'){
							html+='<td width:10%>답변대기중</td>'
						}		
						else{
							html+='<td width:10% style="color:blue; font-weight:bold;">답변완료</td>'
						}				
						html+='<td width:15%>'+printQwriter+'</td>'
						html+='<td width:15% style="font-weight:bold;">'+vo.qtitle+'</td>'
						
						if(vo.secretcheck==='y'){
							html+='<td width:35%><img src="../img/key.jpg" width=20px;>&nbsp;&nbsp;&nbsp;작성자만 볼수있는 글입니다.</td>'
						}
						else{
								html+='<td width:35%>'+vo.qcontent+'</td>'
						}
					
						html+='<td width:15% style="font-size:14px;">'+vo.dbday+'</td>'
						html+='</tr>'
						
							
							
						}
						
						
						else if(admin==='y'){
							
						html+='<tr class="qna_content normalContent" data-qna="'+vo.qno+'" data-answercheck="'+vo.answercheck+'" style="width:200px;">'
						html+='<td width:10%>'+rowcount+'</td>'
						if(vo.answercheck==='n'){
							html+='<td width:10%>답변대기중</td>'
						}		
						else{
							html+='<td width:10% style="color:blue; font-weight:bold;">답변완료</td>'
						}				
						html+='<td width:15%>'+printQwriter+'</td>'
						html+='<td width:15% style="font-weight:bold;">'+vo.qtitle+'</td>'
						
						if(vo.secretcheck==='y'){
							html+='<td width:35%><img src="../img/key.jpg" width=20px;>&nbsp;&nbsp;&nbsp;'+vo.qcontent+'</td>'
						}
						else{
								html+='<td width:35%>'+vo.qcontent+'</td>'
						}
					
						html+='<td width:15% style="font-size:14px;">'+vo.dbday+'</td>'
						html+='</tr>'
						
					
						
						}
						
						else{
							html+='<tr class="qna_content normalContent" data-qna="'+vo.qno+'" data-answercheck="'+vo.answercheck+'" style="width:200px;">'
						html+='<td width:10%>'+rowcount+'</td>'
						if(vo.answercheck==='n'){
							html+='<td width:10%>답변대기중</td>'
						}		
						else{
							html+='<td width:10% style="color:blue; font-weight:bold;">답변완료</td>'
						}				
						html+='<td width:15%>'+printQwriter+'</td>'
						html+='<td width:15% style="font-weight:bold;">'+vo.qtitle+'</td>'
						
						if(vo.secretcheck==='y'){
							html+='<td width:35%><img src="../img/key.jpg" width=20px;>&nbsp;&nbsp;&nbsp;'+vo.qcontent+'</td>'
						}
						else{
								html+='<td width:35%>'+vo.qcontent+'</td>'
						}
					
						html+='<td width:15% style="font-size:14px;">'+vo.dbday+'</td>'
						html+='</tr>'
							
							
						}
						
							rowcount-=1;
					}
					
					 
					html+='<tr><td class="product__pagination prod_page" colspan="6" style="padding-left:550px;"><ul class="pagination">'
					if(startpage>1){
					html+='<li><a id="qnaPagePrevBtn" data-startpage="'+startpage+'">&lt;</a></li>'
					}
					
					for(let i=startpage; i<=endpage; i++){
						
						if(i===Number(page)){
								html+='<li><a class="qnaPageBtn kyj_selected" data-qnaPage="'+i+'">'+i+'</a></li>'
						}
						else{
								html+='<li><a class="qnaPageBtn" data-qnaPage="'+i+'">'+i+'</a></li>'
						}
					
					}
					
					if(endpage<totalpage){

					html+=' <li><a id="qnaPageNextBtn" data-endpage="'+endpage+'">&gt;</a></li>'
					}
					
					html+='</ul></td></tr>'
					
					$('.selectQnaOption').show()
				}
				input_qnaData.html(html);
				console.log(qnaAmount)
				 $('.input_qNum').text('('+qnaAmount+')')
			}
						
		})
		
}
    
  
$(document).on('click', '.normalContent', function() {
	let qno =$(this).data('qna')
	let answercheck=$(this).data('answercheck')
	 
	 
	 
	 
	  		let p_name=''
	  		let printQwriter = "";
	  		let qtitle=''
	  		let filename=''
	  		let qcontent=''
	  		let antitle='no'
	  		let ancontent='no'
                  $.ajax({
                               type: 'post',
                                url: 'product_qna_sendAnswerData.do',
                                data: { "qno":qno,"answercheck":answercheck},
                                success: function (json){
                                 let res2=JSON.parse(json)
                                 p_name=res2.p_name
                                 
                                 qtitle =res2.qtitle
                                 filename=res2.filename
                                 qcontent=res2.qcontent
                                 if(answercheck==='y'){
                                 antitle=res2.antitle
                                 ancontent=res2.ancontent
                                 }
                                 
                               
                                       if (res2.qwriter.length > 3) {
                                           printQwriter=  res2.qwriter.slice(0, -3) + '***';
                                       } else if (res2.qwriter.length === 3) {
                                           printQwriter =  res2qwriter.slice(0, -2) + '**';
                                       } else if (res2.qwriter.length === 2) {
                                           printQwriter = '**' + res2qwriter.slice(0, -1) + '*';
                                       } else {
                                           printQwriter = res2.qwriter;
                                       }
                                       
                                 
                                 
                                 
                                 		  Shadowbox.open({
										        content: '../product/product_qna_answer.do?p_name='+p_name+'&qwriter='+printQwriter
										        			+'&qtitle='+qtitle+'&filename='+filename+'&qcontent='+qcontent+'&antitle='+antitle
										        			+'&ancontent='+ancontent,
										        player: 'iframe',
										        title: '문의하기',
										        width: 800,
										        height: 800,
										    });
                                 
                                 
                                 
                     
                                 }
                                    
                                 
                              })
                
	
    
});
 

 $(document).on('click', '.secretContent', function() {//시크릿 내용클릭시

	alert('작성자만 볼수있습니다.')
	
		
		
});

    
    $(document).on('click', '.qnaPageBtn', function() {//페이지클릭시
	let curpage = $(this).attr('data-qnaPage')
		
		qnaList(curpage)
		
		
});


  $(document).on('click', '#qnaPagePrevBtn', function() {//이전블록페이지클릭
	let startpage = $(this).attr('data-startpage')
	
		qnaList(startpage-1)
	
		
});

 $(document).on('click', '#qnaPageNextBtn', function() {//다음블록페이지클릭
	let endpage = $(this).attr('data-endpage')
	 let nextPage = Number(endpage) + 1; 
		qnaList(nextPage)
		
});


$(document).on('click', '#latestQ', function() {//최신순클릭
$('.qop').removeClass('btn-primary')
$('.qop').addClass('btn-info')
$('#latestQ').removeClass('btn-info')
$('#latestQ').addClass('btn-primary')
		qntype=1
		qnaList(1)
			
		
});

$(document).on('click', '#oldQ', function() {//오래된순클릭
$('.qop').removeClass('btn-primary')
$('.qop').addClass('btn-info')
$('#oldQ').removeClass('btn-info')
$('#oldQ').addClass('btn-primary')
		qntype=2
		qnaList(1)
		
});


$(document).on('click', '#completeQ', function() {//답변완료버튼클릭
$('.qop').removeClass('btn-primary')
$('.qop').addClass('btn-info')
$('#completeQ').removeClass('btn-info')
$('#completeQ').addClass('btn-primary')
		qntype=3
		qnaList(1)
});

$(document).on('click', '#NotcompleteQ', function() {//미답변클릭
$('.qop').removeClass('btn-primary')
$('.qop').addClass('btn-info')
$('#NotcompleteQ').removeClass('btn-info')
$('#NotcompleteQ').addClass('btn-primary')
		qntype=4
		qnaList(1)
		
});


$(document).on('click', '#addToCartBtn', function() {
	
	//에이젝스로 상품 담기 
	
	let quantity= $('#kyj_total_price').data('qamount')
	let total= $('#kyj_total_price').data('qtotal')
					$.ajax({
								type:'post',
								url: '../shopping/shoppingInsert.do',
                                data: { "pno":pno,"buy_count":quantity,"buy_intprice":total},
                                success: function (json){
									let res=JSON.parse(json)
									let msg=res.msg;
									let id=res.id;
									
									if(id===null || typeof id==='undefined'||id===''){
										alert('로그인후 이용해주세요.')
										return;
									}
									if(msg==='NOSTACK'){
										alert('품절된 상품입니다.')
										return;
									}
									else if(msg==='FULLSTACK'){
										alert('남은재고가 희망수량보다 적습니다.')
										return;
									}
									else if(msg==='NO'){
										alert('이미 장바구니에 담긴 상품입니다')
										return;
									}
									else{
										centerModal()
									}
									
								}
		
							})
	
	
});

// 모달 창의 닫기 버튼을 클릭할 때 팝업을 숨기는 이벤트 핸들러
$(document).on('click', '.close', function() {
    document.getElementById("cartModal").style.display = "none";
});

$(document).on('click', '#keepshop', function() {
    document.getElementById("cartModal").style.display = "none";
});


// 모달 창을 화면 중앙에 배치하는 함수
function centerModal() {
  var modal = document.getElementById('cartModal');
  modal.style.display = 'block'; // 모달을 보이게 설정
  modal.style.top = '50%'; // 화면 상단에서 절반만큼 이동
  modal.style.left = '50%'; // 화면 왼쪽에서 절반만큼 이동
  modal.style.transform = 'translate(-50%, -50%)'; // 모달을 정확히 중앙으로 이동
}


// 화면 크기가 변경될 때 모달 창을 중앙에 유지하기 위해 이벤트를 등록합니다.

    
    
});


