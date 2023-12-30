$(document).ready(function() {
	  let itemHeight = $('.product_item').outerHeight();
	  let currentIndex = 0;
	  let slideCount = 0;

	  function slideItems() {
	    currentIndex = (currentIndex + 3) % 9;
	    slideCount++;

	    if (slideCount === 4) { // 3번의 변경 이후 4번째 변경에서 처음으로 돌아감
	      $('.product_items').animate({ top: 0 }, 1000); // 첫 아이템으로 내려오게 함
	      currentIndex = 0;
	      slideCount = 0;
	    } else {
	      $('.product_items').animate({ top: -currentIndex * itemHeight }, 1000);
	    }
	  }

	  setInterval(slideItems, 5000);
	});
	