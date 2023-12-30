let selectedRes = null;
let isClicked = false;

$(function() {
    $('.show_corsue').mouseover(function() {
        if (!isClicked) {
            let wcno = $(this).closest('.get_wcno').attr('data-wcno');
            $.ajax({
                type: 'post',
                url: '../walk/walkCourseAjaxInform.do',
                data: { "wcno": wcno },
                success: function(json) {
                    let res = JSON.parse(json);
                    if (!isClicked) {
                        showInfo(res);
                    }
                }
            });
        }
    });

    $('.show_corsue').click(function() {
        isClicked = true;
        let wcno = $(this).closest('.get_wcno').attr('data-wcno');
           $('.show_corsue').removeClass('btn-primary'); 
           $('.show_corsue').addClass('btn-info'); 
            $(this).removeClass('btn-info'); 
             $(this).addClass('btn-primary'); 
        
        $.ajax({
            type: 'post',
            url: '../walk/walkCourseAjaxInform.do',
            data: { "wcno": wcno },
            success: function(json) {
                selectedRes = JSON.parse(json);
                showInfo(selectedRes);
            }
        });
    });
});

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