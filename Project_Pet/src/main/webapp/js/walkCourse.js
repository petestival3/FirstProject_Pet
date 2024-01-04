let selectedRes = null;
let isClicked = false;

$(function() {
   
	//코스상세정보를 보기위한 js
    $('.show_corsue').click(function() {
        isClicked = true;
        let wcno = $(this).closest('.get_wcno').attr('data-wcno');
           $('.show_corsue').removeClass('btn-primary'); 
           $('.show_corsue').addClass('btn-info'); 
            $(this).removeClass('btn-info'); 
             $(this).addClass('btn-primary'); 
             $('#defaultInform').hide();
             $('.showCourse_inform').hide();
        
        $.ajax({
            type: 'post',
            url: '../walk/walkCourseAjaxInform.do',
            data: { "wcno": wcno },
            success: function(json) {
                selectedRes = JSON.parse(json);
                showInfo(selectedRes);//showinfo 함수호출을 통해 리스트 jsp에 출력
            }
        });
    });
});
//리스트를 새로 작성하는 함수
function showInfo(info) {
    let div	 = $('#level');
    let div0 = $('#level_image > img');
    let div1 = $('#course_name');
    let div2 = $('#course_way');
    let div3 = $('#detail_address');
    let div4 = $('#course_length_detail');
    let div5 = $('#course_time');
    let div6 = $('#optn_dc');
    let div7 = $('#toilet_dc');
    let div8 = $('#conventional_name');
    div.text('난이도:'+info.course_level);
    div0.attr('src', info.level_image);
    div1.text(info.w_course_name);
    div2.text(info.course_inform);
    div3.text(info.address);
    div4.text(info.course_length_detail);
    div5.text(info.course_time);
    div6.text(info.optn);
    div7.text(info.toilet);
    div8.text(info.conventionName);
    $('.hidden_title').show()
}