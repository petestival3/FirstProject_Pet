/**
 * 
 */
Shadowbox.init({
    players: ['iframe'],
    
});





 $(document).ready(function() {
	 const pno=$('#title').attr('data-pno')
	 
    let mainImageSrc = $('.product__details__pic__item img').attr('src'); // 초기 메인 이미지 저장
    
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
    
    
    $('#show_pro_detail_inform').click(function(){
		$('#show_pro_detail_inform').hide()
		$('.pro_detail_img').show()
		$('.close_pro_detail_inform').show()
		
	})
    
    
      $('.close_pro_detail_inform').click(function(){
		$('.pro_detail_img').hide()
		$('#show_pro_detail_inform').show()
		$('.close_pro_detail_inform').hide()
		
	})
   



	
	
	
	$("#write_product_review").click(function(){
			Shadowbox.open({
			content:'../product/Product_insert_review.do?pno='+pno,
			player:'iframe',
			title:'리뷰',
			width:800,
			height:800,
		
		})
	})
	
  window.addEventListener('message', function(event) {
    console.log(event.data);
    // 받은 데이터에 따라 필요한 처리를 수행합니다.
    //새로운 리스트 ajax
});



	

		 
	
  
    
});

