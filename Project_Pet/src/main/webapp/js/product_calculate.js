/**
 * 
 */
// 상품상세보기의 + -버튼 클릭시 총액값 대입하는 js
 $(document).ready(function() {
    let price = parseFloat($('#detail_p_price').attr('data-price'));
    let quantity = parseInt($(".kyj__calculate").val());
    let target = $('#kyj_total_price');

    function calculateTotal() {
        let totalprice = price * quantity;
        $('#kyj_total_price').data('qamount',quantity)
        $('#kyj_total_price').data('qtotal',totalprice)
        target.text(formatCurrency(totalprice));
        
    }

    $(".kyj__increaseBtn").click(function() {
        quantity++;
          $(".kyj__calculate").val(quantity); // + 버튼 클릭 시 수량 증가
        calculateTotal();
    });

    $(".kyj__decreaseBtn").click(function() {
        quantity = quantity > 1 ? quantity - 1 : 1;
          $(".kyj__calculate").val(quantity); // + 버튼 클릭 시 수량 증가
        calculateTotal();
    });

    function formatCurrency(amount) {
        return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
    }

    calculateTotal(); // 페이지 로드시 초기 총액 계산 및 표시
});