/**
 * 
 */

 $(document).ready(function() {
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
    
   let price = parseFloat($('#detail_p_price').attr('data-price'));
    let quantity = parseInt($(".kyj__calculate").val());
    let target = $('#kyj_total_price');

  
    
});

