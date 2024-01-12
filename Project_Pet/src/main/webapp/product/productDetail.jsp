<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.3.1.min.js"></script>
 <!-- <script src="../js/product_detail.js"></script> -->
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
 
<script type="text/javascript">
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
							} else if (vo.qwriter.length === 3) {
							    printQwriter =  vo.qwriter.slice(0, -2) + '**';
							} else if (vo.qwriter.length === 2) {
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
                                           printQwriter =  res2.qwriter.slice(0, -2) + '**';
                                       } else if (res2.qwriter.length === 2) {
                                           printQwriter = '**' + res2.qwriter.slice(0, -1) + '*';
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
$(document).on('click', '#directBuy', function() {
	
	
	insertShopping(2)
});

$(document).on('click', '#addToCartBtn', function() {
	
	
	insertShopping(1)
});





function insertShopping(type){
	
	
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
									else if(type==1){
										centerModal()
									}
									
									else if(type==2){
										window.location.href="../shopping/shoppingMoveOneBuy.do?getTotal="+total;
									}
									
								}
		
							})
	
}

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





</script>





<style type="text/css">



.review-container {
    box-shadow: none; /* 특정 스타일을 없애고자 할 때, 값을 none으로 설정 */
    /* 필요에 따라 다른 속성도 재설정할 수 있습니다. */
  
  
  
  }
 
  
  .mid_3{
 width:400px;
  overflow-wrap: break-word; /* 컨테이너 경계를 넘어가는 경우 단어를 자르고 줄바꿈 */

  }
  
  
 .pmodal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: none;
}

.pmodal-content {
    background-color: #f2f2f2; /* 부드러운 회색 배경 */
    padding: 20px;
    border-radius: 8px;
    width: 120%;
    max-width: 600px;
    position: relative;
    text-align: center;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.close {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 20px;
    color: #888; /* 닫기 버튼 색상 변경 */
}
   

  



</style>





<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>   

 <section class="breadcrumb-section set-bg"
      data-setbg="../img/bread.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="breadcrumb__text">
                  <h2>SHOP</h2>
                  <div class="breadcrumb__option">
                     <a href="../main/main.do">Home</a> <span>SHOP</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>



                   <!--
                    현재 코드는 상세보기 하단에 최근본 상품을 출력하고 있는데 
                    클릭시 바로 상세보기로 넘어가게 한다 . 다만 일반 목록에서 출력하는것과 차별성을 둔
                     DetailBefore.do?count=1 => count 값을 1을 줬는데 
                     나중에  상세보기에서 DetailListBack.do (목록이동) 클릭시 기존보던 페이지로 이동하지않고
                     디폴트 리스트로 이동하기 위함이다 .
                     나머지ct,rt,page값은 목록으로 돌아가기에는 필요없는 값이지만 detailbefore.do(쿠키저장)메소드에서 detail.do
                     메소드로 넘겨주는과정에서 파라미터값으로 요청하고 있기때문에 통일성을 위해서 준다. 
                     -->
                     <c:url value="DetailListBack.do" var="url">
                          <c:param name="lcount" value="${lcount }"/>
                          <c:param name="ct" value="${ct}"/>
                          <c:param name="rt" value="${rt}"/>
                          <c:param name="ss" value="${ss}"/>
                          <c:param name="page" value="${page}"/>
                          </c:url>
                          
                          
  <!-- Product Details Section Begin -->
    <section class="product-details spad">
    
    <div class="container">
   
    
          <table class="up_to_image" style="margin-left:20px;">
             
            
           </table>
        <div class="container">
       
            <div class="row">
                <div class="col-lg-6 col-md-6">
                
                    <div class="product__details__pic__item">
    <img class="customimage product__details__pic__item--large" src="${vo.p_image}" alt="">
</div>

<div class="row detail_sub_image">
    <c:forEach var="subVo" items="${subImageList}" varStatus="loop">
        <div class="col-2">
            <img src="${subVo.p_sub_image}" class="sub-image" data-index="${loop.index}">
        </div>
    </c:forEach>
</div>
                  
                </div>
                 
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text" style="padding-left:20px;" >
                       
                       <div>
                       <span class="category-tag" style="margin-bottom:10px;"><a href="ProductList.do?ct=${vo.p_category }">${vo.p_category }</a></span>
                         <span class="hit-wrapper hit-number">조회수${vo.p_hit}</span>
                        <h3 id="title" data-pno="${vo.pno }">${vo.p_name }</h3>
                    </div>


                        
                        <div class="product__details__rating ">
                          						
                          				<c:if test="${vo.p_grade==0}">
                                            <i class="fa fa-star-half-o"></i>
                                           </c:if>		
                          						
											
									<c:if test="${vo.p_grade>=0.5 and vo.p_grade<1 }">
                                            <i class="fa fa-star-half-o"></i>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=1 and vo.p_grade<1.5 }">
                                             <i class="fa fa-star"></i>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=1.5 and vo.p_grade<2 }">
                                             <i class="fa fa-star"></i>
                         			   <i class="fa fa-star-half-o"></i>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2 and vo.p_grade<2.5 }">
                                            <i class="fa fa-star"></i>
                           					 <i class="fa fa-star"></i>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2.5 and vo.p_grade<3 }">
                                           <i class="fa fa-star"></i>
                         		   		   <i class="fa fa-star"></i>
                                          <i class="fa fa-star-half-o"></i>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3 and vo.p_grade<3.5 }">
                                           <i class="fa fa-star"></i>
                         		      		 <i class="fa fa-star"></i>
                                           <i class="fa fa-star"></i>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3.5 and vo.p_grade<4 }">
                                         	  <i class="fa fa-star"></i>
                         			 		  <i class="fa fa-star"></i>
                       			   			  <i class="fa fa-star"></i>
                         			 		  <i class="fa fa-star-half-o"></i>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=4 and vo.p_grade<4.5 }">
                                           	 <i class="fa fa-star"></i>
                          			 		 <i class="fa fa-star"></i>
                         			 		  <i class="fa fa-star"></i>
                           		   			 <i class="fa fa-star"></i>
                                                </c:if>
                                           
                                           
                                              <c:if test="${vo.p_grade>=4.5 and vo.p_grade<5 }">
                                              
                                              
                                       		 <i class="fa fa-star"></i>
                           					 <i class="fa fa-star"></i>
                            				<i class="fa fa-star"></i>
                         			        <i class="fa fa-star"></i>
                            				<i class="fa fa-star-half-o"></i>
                                                
                                                
                                              </c:if>


					 					<c:if test="${vo.p_grade>=5 }">
                                       		 	 <i class="fa fa-star"></i>
                           			 			<i class="fa fa-star"></i>
                            					<i class="fa fa-star"></i>
                         			       	 	<i class="fa fa-star"></i>
                            			  		<i class="fa fa-star"></i>
                                              </c:if>
                            <span>(${vo.p_review_num } reviews)</span>
                             
                        </div>
                       
                        <p>
                        
                     <div id="detail_p_price" class="product__details__price" data-price="${vo.p_intlowerprice }">
                            <c:if test="${not empty vo.p_percent}">
                            <div class="discounted-price">
                                <span class="p_original_price">${vo.p_price}</span>
                                   <span class="product__details__discount">${vo.p_percent}</span>
                             </div>
                        </c:if>
                       
                     <div class="product__details__price">${vo.p_lower_price}</div>
                </div>
                           
      
                         <ul>
                         <c:if test="${not empty vo.p_shipment}">
                            <li><b>배송</b> <span>${vo.p_shipment }</span></li>
                            </c:if>
                            <c:if test="${not empty vo.p_expire_date}">
                            <li><b>유통기한</b> <span>${vo.p_expire_date}</span></li>
                            </c:if>
                           <li><b>남은재고</b> <span class="product__details__stock">${vo.p_stack}</span></li>
                           
                       
                              </ul>
                                 
                               <ul>    </ul>
      <div class="kyj_calBox">
    <div class="kyj__details__quantity">
        <div class="kyj__quantity">
            <div class="kyj__input-container">
            <button class="kyj__decreaseBtn btn">-</button>


                <input type="text" value="1" class="kyj__calculate">
                <button class="kyj__increaseBtn btn">+</button>
            </div>
        </div>
         <h2><span id="kyj_total_price" data-pamount="" data-ptotal=""></span></h2><!-- 총액 계싼 -->
    </div>
   
</div>
         <div style="height:15px;"></div>

               <div class="bottom_cate" style=" ">
                  
                        <a href="#" class="primary-btn text-center" id="addToCartBtn" style="width: 190px; background-color:DodgerBlue;">장바구니에담기</a>
                       <!-- 테스트부분 -->
                        <div class="pmodal" id="cartModal">
						    <div class="pmodal-content">
						        <span class="close">&times;</span>
						        <p style="font-weight:bold;">장바구니에 상품이 추가되었습니다!</p>
						        <a href="../shopping/shoppingCart.do" class="btn btn-sm btn-primary">장바구니로 이동</a>
						        <a href="#" class="btn btn-sm btn-info" id="keepshop">계속 쇼핑하기</a>
						    </div>
						</div>

						<!-- 테스트부분 -->
                          <a href="#" class="primary-btn text-center" id="directBuy" style="width: 190px; background-color:DodgerBlue;">바로구매하기</a>
                           <span id="kyj_top_link"><a href="${url}" style="background-color: #FFA500; color:white;">목록으로</a></span>
                      </div>
               
                    
                        <!--  
                                목록으로 돌아가기 위함으로 DetailListBack.do 에 파라미터 값으로 
                                현재 보는 상세보기가 최근본상품을 통한 상세보기인건지 단순 목록에서 본 상세보기인지 구분
                                (lcount==null 이면 단순 목록에서 본 상품 , lcount가 1이면 최근본 상품에서 선택한 상세보기)
                                최근본상품에서 본 상세보기일경우 디폴트값 리스트 목록으로 이동한다 . 단순 목록에서 본 상품상세보기 이면 보던 목록으로 
                                넘어가게 한다 . = > 이처리는 DetailListBack.do 에서 처리한다
                                ct=>카테고리정보
                                rt=>조회수순,후기개수순 등정보
                                page=> 페이지정보
                                등을 이용해서 보던 목록으로 넘어가야하기 때문에 el로 값을 받는다.
                                -->
                       
                    </div>
                      
                </div>
                
              
        
                <div class="col-lg-12">
                 
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#p_tabs-1" role="tab"
                                    aria-selected="true">상품상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#p_tabs-2" role="tab"
                                    aria-selected="false">상품후기<span class="input_rNum">(${vo.p_review_num })</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#p_tabs-3" role="tab" id="p_qna"
                                    aria-selected="false">상품문의 <span class="input_qNum">(${qnaAmount })</span></a>
                            </li>
                        </ul>
                        
                        
                        <div class="tab-content">
                            <div class="tab-pane active" id="p_tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                
                                <c:if test="${!(vo.p_detail_image==null || vo.p_detail_image=='') }">
                                <div>
                                  <center>
                                  <div>
                                  <button id="show_pro_detail_inform" class="btn btn-lg btn-info">상품상세정보 펼치기&nbsp;&nbsp;&gt;</button>
                                 
                                  </div>
                                  <div> <button class="close_pro_detail_inform btn btn-lg btn-info">상품상세정보 접기&nbsp;&nbsp;&gt;</button></div>
                                  </center>
                                    <p>
                                     <center><div class="pro_detail_img">
                                    <img src="${vo.p_detail_image }">
                                    <div><button class="close_pro_detail_inform btn btn-lg btn-info">상품상세정보 접기&nbsp;&nbsp;&gt;</button></div>
                                    </div>
                                    </center>
                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${(vo.p_detail_image==null || vo.p_detail_image=='') }">
                                    <div><center><img src="../img/noImg.png"></center></div>
                                      </c:if>
                                    
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="p_tabs-2" role="tabpanel">
                               <div id="input_list">
                                <div class="product__details__tab__desc" id="firstLoadPage">
                                
                                <c:if test="${prListSize!=0 }">
                                <div class="p_total_review_container" >
                                    
                                       <div class="p_total_review">
                                       
                                        <div class="rating" style="width:400px; margin-top:10px; margin-bottom:10px;">
                                           <c:if test="${vo.p_grade>=0.5 and vo.p_grade<1 }">
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=1 and vo.p_grade<1.5 }">
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=1.5 and vo.p_grade<2 }">
                                             <span class="star">⭐️</span>
                                              <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2 and vo.p_grade<2.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=2.5 and vo.p_grade<3 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3 and vo.p_grade<3.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${vo.p_grade>=3.5 and vo.p_grade<4 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                               <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${vo.p_grade>=4 and vo.p_grade<4.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                              </c:if>
                                           
                                           
                                              <c:if test="${vo.p_grade>=4.5 and vo.p_grade<5 }">
                                              
                                              
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="half-star">⭐️</span>
                                                
                                                
                                              </c:if>
                                           
                                           
                                              <c:if test="${vo.p_grade>=5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="star">⭐️</span>
                                              </c:if>
                                           
                                      
                                     </div>
                                     
                                     <div style="margin-top:10px;">
                                    
                                     <h1>평점 ${vo.p_grade }/5</h1>
                                     </div>
                                       
                                       </div>
                                       
                                       <div class="p_select_review_option" style="margin-top:30px;">
                                       <ul class="p_rank p_review_rank">
                                          <li class="r_option"><button id="highscore" class="btn btn-primary">높은 평점순</button></li>
                                          <li class="r_option"><button id="lowscore" class="btn btn-info">낮은 평점순</button> </li>
                                          <li class="r_option"><button id="latestdate" class="btn btn-info">최신날짜 순</button></li>
                                          <li class="r_option"><button id="olddate" class="btn btn-info">오래된날짜 순 </button> </li>
                                             
                                       </ul>
                                          <div style="margin-left:990px;">
                                          <c:if test="${sessionScope.id==null || sessionScope.id=='' }">
                                             <span>로그인 후 후기등록이 가능합니다.</span>
                                          </c:if>
                                          <c:if test="${sessionScope.id!=null }">
                                       <button id="write_product_review" class="btn-sm btn-danger">후기 작성하기</button>
                                       </c:if>
                                       </div>
                                       </div>
                                    </div>
                                    <hr>
                                    </c:if>
                                
                                
                                
                                <c:if test="${prListSize==0 }">
                                <div><h2>등록된 후기가없습니다</h2></div>
                                   <div style="margin-left:990px;">
                                    <c:if test="${sessionScope.id==null || sessionScope.id=='' }">
                                             <span>로그인 후 후기등록이 가능합니다.</span>
                                          </c:if>
                                          <c:if test="${sessionScope.id!=null }">
                                       <button id="write_product_review" class="btn-sm btn-danger">후기 작성하기</button>
                                       </c:if>
                                       </div>
                                </c:if>
                                
                                
                                
                                
                                <c:if test="${prListSize!=0 }">
                                   <c:forEach var="prVo" items="${prList }">
                                   
                                    
                                 
                                 
                                 <!-- for문 -->
                                  <div class="row product_review_container" data-page="1">
                                      <div class="col-md-4" style="width:200px; height:200px ;">
                                      <div class="p_review_image" style="width:100%; height:100%;">
                                      
                                     <c:if test="${prVo.imgsize>0 }">
                                      <img src="../reviewImg/${prVo.imgname }" style="width:100%; height:100%; object-fit: contain;">
                                     </c:if>
                                     
                                     <c:if test="${prVo.imgsize==0 }">
                                      <img src="../img/noImg.png" style="width:100%; height:100%; object-fit: contain;">
                                     </c:if>
                                     
                                      </div>
                                      </div>
                                      
                                  
                                  
                                  <div class="col-md-8">
                                   <div class="review-container">
                             

                                 <div class="mid_1">
                                   <div class="user-info">
                                     <img
                                       src="../img/userIcon.jpg"
                                       alt="Reviewer Avatar"
                                       class="reviewer-avatar"
                                       style="float: left"
                                     />
                                     <div class="user-name">${prVo.writer }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10px;opacity:0.5;">${ prVo.dbday}</span></div>
                                   </div>
                                   <br />
                                   <div class="mid_2">
                                     <div class="rating" style="width:120px;">
                                     
                                     
                                     
                                      <c:if test="${prVo.score>=0.5 and prVo.score<1 }">
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${prVo.score>=1 and prVo.score<1.5 }">
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${prVo.score>=1.5 and prVo.score<2 }">
                                             <span class="star">⭐️</span>
                                              <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${prVo.score>=2 and prVo.score<2.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${prVo.score>=2.5 and prVo.score<3 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${prVo.score>=3 and prVo.score<3.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${prVo.score>=3.5 and prVo.score<4 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                               <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${prVo.score>=4 and prVo.score<4.5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                              </c:if>
                                           
                                           
                                              <c:if test="${prVo.score>=4.5 and prVo.score<5 }">
                                              
                                              
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="half-star">⭐️</span>
                                                
                                                
                                              </c:if>
                                           
                                           
                                              <c:if test="${prVo.score>=5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="star">⭐️</span>
                                              </c:if>
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                     
                                   </div>
                                  
                                   <div class="mid_3">
                                       <p><h3>${prVo.score }/5</h3></p>
                                     <p class="review-text">
                                      ${prVo.content }
                                     </p>
                                         
                                   </div>
                                 </div>
                                  </div>
                                  
                                         </div>
                                         </div>
                                            </c:forEach>
                                            </c:if>
                                         <!-- for문 -->
                                          <div class="Rpagination">
                                          
                                          
                                   <c:if test="${prListSize!=0 }">
                               <div class="centered-text"><h2>1/${prTotalpage }</h2></div>
                              </c:if>
                               <c:if test="${reviewTotalPage>1}">
                               <span><button class="btn btn-lg btn-primary Rnext-btn">다음</button></span>
                              </c:if>
                           </div>
                                         </div>
                                         </div>
                                        

                                  </div>
                            <div class="tab-pane" id="p_tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc" id="pQna">
                                      <div class="product_qna_container">
                                      	<div class="selectQnaOption" style="margin-bottom:15px; display:none;">
                                      		
                                      		<button class="btn btn-primary qop" id="latestQ">최신순</button>
                                      		<button class="btn btn-info qop" id="oldQ">오래된순</button>
                                      		<button class="btn btn-info qop" id="completeQ">답변완료</button>
                                      		<button class="btn btn-info qop" id="NotcompleteQ">미답변</button>
                                      		
                                      	</div>
                                         <table class="table text-center" id="qna_wrapper">
                                            <thead class="qna_firstData">
                                            <tr>
                                              <th width=10%>번호</th>
                                              <th width=10%>답변유무</th>
                                              <th width=15%>작성자</th>
                                              <th width=15%>제목</th>
                                              <th width=35%>내용</th>
                                              <th width=15%>등록일자</th>
                                            </tr>
                                            </thead>
                                         
                                            <tbody class="input_qnaData">
                                            
                                            </tbody>
                                         </table>
                                            <div class="qna_firstData" style="margin-bottom:40px;">
                                              <c:if test="${sessionScope.id==null || sessionScope.id=='' }">
                                             <span>로그인 후 문의등록이 가능합니다.</span>
                                          </c:if>
                                            <c:if test="${sessionScope.id!=null }">
                                              <div><button id="p_qnaBtn" class="btn btn-danger">상품문의하기</button></div>
                                          </c:if>
                                             
                                            
                                            </div>
                                            
                                               
                                            
                                      </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                          <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                       <hr>
                        <h2>최근본상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           
              <c:forEach var="cvo" items="${clist }" begin="1" end="${count }" >
                <div class="col-lg-3 col-md-4 col-sm-6">
               
                    <div class="product__item">
                   
                          <c:url value="DetailBefore.do?count=1" var="curl">
                          <c:param name="pno" value="${cvo.pno }"/>
                          <c:param name="ct" value="${ct}"/>
                          <c:param name="rt" value="${rt}"/>
                          <c:param name="page" value="${page}"/>
                          </c:url>
                    
                        <a href="<c:out value="${curl}" />" style="color:black"><div class="product__item__pic set-bg"><img class="customimage" src="${cvo.p_image }">
                            
                        </div>
                        <div class="product__item__text">
                        
                          	<span style="position: relative;">
							  <span style="position: absolute; top: -15px; font-size: smaller; font-weight: bold; opacity: 0.7; color: red;">
							  <img src="../img/hit.jpg" style="width:20px;">${cvo.p_hit}</span>
							  <span style="font-weight:bold;">${cvo.p_name}</span>
							</span>
									
							        <center> <div class="rating" style="width:120px; margin-top:5px;">
                                     
                                     	 <c:if test="${cvo.p_grade==0 }">
                                             <span style="margin-left:50px;"class="half-star">⭐️</span>
                                           </c:if>
                                     
                                      <c:if test="${cvo.p_grade>=0.5 and cvo.p_grade<1 }">
                                             <span style="margin-left:50px;" class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${cvo.p_grade>=1 and cvo.p_grade<1.5 }">
                                             <span style="margin-left:50px;" class="star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${cvo.p_grade>=1.5 and cvo.p_grade<2 }">
                                             <span style="margin-left:25px;"class="star">⭐️</span>
                                              <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${cvo.p_grade>=2 and cvo.p_grade<2.5 }">
                                             <span style="margin-left:25px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${cvo.p_grade>=2.5 and cvo.p_grade<3 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${cvo.p_grade>=3 and cvo.p_grade<3.5 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${cvo.p_grade>=3.5 and cvo.p_grade<4 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                               <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${cvo.p_grade>=4 and cvo.p_grade<4.5 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                              </c:if>
                                           
                                           
                                              <c:if test="${cvo.p_grade>=4.5 and cvo.p_grade<5 }">
                                              
                                              
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="half-star">⭐️</span>
                                                
                                                
                                              </c:if>
                                           
                                           
                                              <c:if test="${cvo.p_grade>=5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="star">⭐️</span>
                                              </c:if>
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                      <span style="color: rgb(139, 0, 0); opacity:0.7;">(${cvo.p_review_num } reviews)</span>
                                     </center>
							

                            <div>
                              <c:if test="${cvo.p_percent!=null }">
                                     <h7 class="hs_original-price">${cvo.p_price}</h7>
                                     </c:if>
                                  <h7 class="hs_discount-rate">${cvo.p_percent}</h7>   
                                  <h5 class="hs_final-price">${cvo.p_lower_price }</h5>
                                  </div>
                             
                        </div>
                        </a>
                    </div>
                    
                   </div>
                </c:forEach>
              
            </div>
        </div>
        
        
        
           <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                       <hr>
                        <h2>관련상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           
              <c:forEach var="rvo" items="${rlist }" begin="1" end="${rlistSize }" >
                <div class="col-lg-3 col-md-4 col-sm-6">
               
                    <div class="product__item">
                   
                          <c:url value="DetailBefore.do?count=1" var="rurl">
                          <c:param name="pno" value="${rvo.pno }"/>
                          <c:param name="ct" value="${ct}"/>
                          <c:param name="rt" value="${rt}"/>
                          <c:param name="page" value="${page}"/>
                          </c:url>
                    
                       <a href="<c:out value="${rurl}" />" style="color:black;"> <div class="product__item__pic set-bg"><img class="customimage" src="${rvo.p_image }">
                           
                        </div>
                        <div class="product__item__text">
                        <span style="position: relative;">
							  <span style="position: absolute; top: -15px; font-size: smaller; font-weight: bold; opacity: 0.7; color: red;">
							  <img src="../img/hit.jpg" style="width:20px;">${rvo.p_hit}</span>
							  <span style="font-weight:bold;">${rvo.p_name}</span>
							</span>
                        
                        		 <center> <div class="rating" style="width:120px; margin-top:5px;">
                                     
                                     	 <c:if test="${rvo.p_grade==0 }">
                                             <span style="margin-left:50px;"class="half-star">⭐️</span>
                                           </c:if>
                                     
                                      <c:if test="${rvo.p_grade>=0.5 and rvo.p_grade<1 }">
                                             <span style="margin-left:50px;" class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${rvo.p_grade>=1 and rvo.p_grade<1.5 }">
                                             <span style="margin-left:50px;" class="star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${rvo.p_grade>=1.5 and rvo.p_grade<2 }">
                                             <span style="margin-left:25px;"class="star">⭐️</span>
                                              <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${rvo.p_grade>=2 and rvo.p_grade<2.5 }">
                                             <span style="margin-left:25px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${rvo.p_grade>=2.5 and rvo.p_grade<3 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                             <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${rvo.p_grade>=3 and rvo.p_grade<3.5 }">
                                             <span style="margin-left:12px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                           </c:if>
                                           
                                           <c:if test="${rvo.p_grade>=3.5 and rvo.p_grade<4 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                               <span class="half-star">⭐️</span>
                                           </c:if>
                                           
                                              <c:if test="${rvo.p_grade>=4 and rvo.p_grade<4.5 }">
                                             <span style="margin-left:6px;" class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                              </c:if>
                                           
                                           
                                              <c:if test="${rvo.p_grade>=4.5 and rvo.p_grade<5 }">
                                              
                                              
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="half-star">⭐️</span>
                                                
                                                
                                              </c:if>
                                           
                                           
                                              <c:if test="${rvo.p_grade>=5 }">
                                             <span class="star">⭐️</span>
                                             <span class="star">⭐️</span>
                                              <span class="star">⭐️</span>
                                                <span class="star">⭐️</span>
                                                 <span class="star">⭐️</span>
                                              </c:if>
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                     <span style="color: rgb(139, 0, 0); opacity:0.7;">(${rvo.p_review_num } reviews)</span>
                                     </center>
							
                        			  <c:if test="${rvo.p_percent!=null }">
                                     <h7 class="hs_original-price">${rvo.p_price}</h7>
                                     </c:if>
                                  <h7 class="hs_discount-rate">${rvo.p_percent}</h7>   
                                  <h5 class="hs_final-price">${rvo.p_lower_price }</h5>
                        
                            
                            </a>
                           
                        </div>
                    </div>
                    
                </div>
                </c:forEach>
              
            </div>
        </div>
        
        
        
        
        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
      
      
       
    </section>
    <!-- Related Product Section End -->



</body>
</html>