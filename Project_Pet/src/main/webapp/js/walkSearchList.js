 $(document).ready(function() {

	
		let isRequestPending=false;
		let loc='전체';
		let w_name=''
	
		
        
        

		
	$('#walkSearchOption').change(function(){
		
		
		loc=$(this).val();
		
		$('#walkSearchBar').val('')
	
	})
	
	
	
	
	$('#walkSearchBar').keyup(function(){
		$('.kyj_selected').removeClass('kyj_selected');
	
		 let cate = $('.walk_cate > li > a');
    cate.each(function() {
        if ($(this).text() === loc) {
            $(this).addClass('kyj_selected');
        }
    });
		
		w_name=$(this).val();
		
		
		   if (w_name.trim() === '') {
            // 입력창이 비어있을 때 처리할 내용
           
            return;
        }
		
	
		if(!isRequestPending){
			isRequestPending=true;
			
			ajax(1);
		}
			
				
			
		
		});         
		
			
					
			function ajax(page){
				
      				 
      					
      			
				$.ajax({
						
						  type: 'post',
      				      url: 'walkSearchList.do',
          				  data: { "w_name":w_name,"loc":loc,"page":page},
            			  success: function(json) {
							  
               			 		let res=JSON.parse(json)
               			 		
               			 		$('.walkNormalList').hide();
               			 		let walkSearchList=$('.walkSearchList')
               			 		let walkSearchWrapper =$('#walkSearchWrapper')
               			 		
               			 		
                				let listSize=res[0].listSize;
                				let totalpage=res[0].totalpage;
                				let start=res[0].start;
                				let end=res[0].end;
                				
                				let contentHtml='';
									let pageHtml='';
												
                					
                				if(listSize===0){
									
									walkSearchWrapper.html('<div><h2>'+res[0].msg+'</h2></div>');
									walkSearchList.show();
									
								}
								
								else{
								
									
									
									for(let vo of res){
										
										contentHtml+='<div class="col-lg-4 col-md-4 col-sm-4 ">'
													+'  <a href="walkDetail.do?wno='+vo.wno+'">'
													+' <div class="blog__item walk_wrapper">'
													+'<div class="blog__item__text walk_list_style">'
													+'<h3 class="name_overflow">'+vo.w_name+'</h3>'
													+'<p></p>'
													+' <p class="name_overflow">'+vo.signgu_name+'</p>'
													+' <p class="name_overflow">'+vo.address+'</p>'
													+'</div>'
													+'</div>'
													+'</a>'
													+'</div>'
													
													
												
									}
									
									
									
									
									pageHtml='<div class="col-lg-12"> <div class="product__pagination blog__pagination prod_page ">'
											+'<center>'
											
										if(start>1){
											pageHtml+='<a href="#" id="prevPageBlock" data-prevPage="'+(start-1)+'"><i class="fa fa-long-arrow-left"></i></a>'
										}
										for(let i=start; i<=end; i++){
											if(i===page){
											pageHtml+=' <a href="#" class="movePage w_selected-page" data-wclickpage="'+i+'">'+i+'</a>'
											}
											else{
												pageHtml+=' <a href="#" class="movePage" data-wclickpage="'+i+'">'+i+'</a>'
											}
										}	
											
										if(end<totalpage){
											pageHtml+='<a href="#" id="nextPageBlock" data-nextPage="'+(NUMBER(end)+1)+'"><i class="fa fa-long-arrow-right"></i></a>'
										}	
											
											
											pageHtml+='</center></div></div>';
									
									
									
									
											contentHtml+=pageHtml+'</div>'
									
							
									walkSearchWrapper.html(contentHtml);
									
									walkSearchList.show();
									
									
											
								}
									
                			
							
						},
						complete: function(){
							isRequestPending=false;
						},
						error :function(xhr,status,error){
							console.log(error)
							isRequestPending=false;
						}
						
						
						
					})
				
			}		
					
					
					
					
				
			
					
		

	
	


 $(document).on('click', '#prevPageBlock', function() {
        let prevpage = parseInt($(this).data('prevPage'));
        
        ajax(prevpage); // 페이지 값을 전달하여 검색을 요청
   
    });
	
    $(document).on('click', '#nextPageBlock', function() {
        let nextpage = parseInt($(this).data('nextPage'));
        
        ajax(nextpage); // 페이지 값을 전달하여 검색을 요청
   
    });
    
     $(document).on('click', '.movePage', function() {
		  console.log('클릭')
        let movePage = parseInt($(this).data('wclickpage'));
       console.log(movePage)
        ajax(movePage); // 페이지 값을 전달하여 검색을 요청
   
    });



 
	
	
})