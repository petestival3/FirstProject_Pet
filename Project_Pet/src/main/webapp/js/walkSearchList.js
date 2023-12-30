$(function(){
	let loc='전체';
	let w_name=''
	$('#walkSearchOption').change(function(){
		loc=$(this).val();
		
		$('#walkSearchBar').val('')
	
	})
	
	$('#walkSearchBar').keyup(function(){
		
		w_name=$(this).val();
		
		
					$.ajax({
						
						  type: 'post',
      				      url: 'walkSearchList.do',
          				  data: { "w_name":w_name,"loc":loc  },
            			  success: function(json) {
               			 		let res=JSON.parse(json)
                				let listSize=res[0].listSize;
                				
                				if(listSize===0){
									console.log(res[0].msg)
								}
								
								else{
									
									
								}
                				
							
						}
						
					})
		
	})
	
	
})