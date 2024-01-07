/**
 * 
 */

 $(document).ready(function() {
     
   
   
      
    
       
    // 댓글 목록을 받아오는 함수
    function getComments(getpage) {
    let wno = $('#selectWno').attr('data-wno');
      let page=getpage;
      if (typeof page === 'undefined' || page === null || page === '') {
        page = "1";
    }

        $.ajax({
            type: 'post',
            url: '../walk/walkReplyAjaxList.do',
            data: { "wno": wno ,"page":page},
            success: function(json) {
                let res = JSON.parse(json);
                let replyAmount = res[0].replyAmount;
                let id = res[0].sessionID;
                let totalpage=res[0].totalpage;
                let commentListHtml = '<img src="../img/walkRe.png" style="width:40px;">&nbsp;<span style="margin-bottom:20px; font-weight:bold; font-size:25px;">댓글(' + replyAmount + ')</span>';
         
               
                if (id !== null) {
                    commentListHtml += '<div class="input-group">' +
                        ' <textarea class="kyj_textarea" rows="4" cols="156" name="rcontent" id="rcontent" placeholder="댓글을 입력해주세요" required></textarea>' +
                        ' <div class="row" style="margin-top:5px; margin-left:1010px; margin-bottom:10px;">' +
                        ' <input class="kyj_text" type="password" size="11" name="password" id="password" placeholder="비밀번호" required>' +
                        ' <input type="button" class="btn btn-sm btn-info" value="등록" style="margin-left:5px;" id="userReplyBtn">' +
                        '</div></div><hr><div class="comment-list">';
                }
                
                if(replyAmount===0){
               commentListHtml+='<h2 class="text-center">댓글이 없습니다.<h2></div>'
            }
            else{
                  
                for(let i=0; i<res.length; i++){
               let vo =res[i];
               
               commentListHtml+=' <div class="comment" id="getRno" data-index='+i+' data-rno='+vo.rno+' data-page='+page+'>'
                           +' <div class="comment-header" style="height:35px;">'
                           
                           
                     if(vo.group_tab>0){
                        let margin=0;
                     for(let k=1;k<=vo.group_tab;k++){
                                 margin+=10;
                     }
                                       
                     commentListHtml+='<div style="height:10px; margin-bottom:15px; opacity:0.5; font-size:10px;"><img src="../img/reply.png" style="width:20px; margin-left:'+margin+'px;">'
                                    +'&nbsp;&nbsp;('+vo.rootId+'님에 대한 댓글)</div>'
                     }   
                     
                  
                           
                        if(vo.group_tab>0){
                                    
                              for(let j=1; j<=vo.group_tab; j++){
                                 
                                 
                                 
                                 
                                    commentListHtml+='&nbsp;&nbsp;&nbsp;&nbsp;'
                                    
                                    
                              }
                              
                              
                              
                                 
                        }   
                        
                     commentListHtml+='<span style=" opacity:0.8; font-weight:bold;"><img src="../img/userIcon.jpg" style="width:20px;">&nbsp;'
                     +vo.userid+'</span><span style="margin-left:10px;"class="dbday">'+vo.dbday+'</span>'
                     +'<div class="comment-actions" style="float:right; height:35px;">'   
                  
                  if(vo.rcontent!=='삭제한 댓글입니다.'){
               if(id===vo.userid){
                  commentListHtml+='<button class="modifyBtn btn btn-sm btn-info">수정</button>'
                              +' <button class="deleteBtn btn btn-sm btn-info">삭제</button>'
                                 
               }   
               
               if(id !==vo.userid && id!==null){
                  commentListHtml+='  <button class="replyBtn btn btn-sm btn-info">답글</button>'
               }
                  }
               commentListHtml+='</div>'+'</div>'+'<div class="mainContent" style="margin-top:18px;">'
               
                        if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+=' &nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }   
               
               commentListHtml+='<span class="mc">'+vo.rcontent+'</span>'
                           +'<hr></div>'   
                           
               
               commentListHtml+='<div style="display: none;" class="addreply">'
               
                           
               
               
                              if(vo.group_tab>0||(vo.group_tab===0&&vo.root===0)){
                        let margin=0;
                     for(let k=0;k<=vo.group_tab;k++){
                                 margin+=15;
                     }
                                       
                     commentListHtml+='<div style="height:10px; margin-bottom:30px; opacity:0.5; font-size:10px; color:magenta;"><img src="../img/reply.png" style="width:20px; margin-left:'+margin+'px;">'
                                 +'&nbsp;&nbsp;(새로운 답변작성)</div>'
                     
                     }   
                           
                           
                           if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }   
               commentListHtml+='<textarea class="kyj_textarea" rows="4" cols="70" name="addcontent" id="addcontent" placeholder="답변을 입력해주세요" required></textarea>'   
                            +'<div class="row" style="margin-top:5px; margin-left:400px; margin-bottom:10px;">'         
                                              
                              if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }   
               commentListHtml+=' <input type="password" size="13" name="addpassword" class="addpassword kyj_text" placeholder="비밀번호" required>'
                           +'<input type="submit" id="addReplyBtn" value="등록"></div><hr></div>'
                           
                        
            //댓글삭제
               commentListHtml+='   <div class="dpassword" style="display:none; margin-bottom:20px;">'
                              
                     if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+=' &nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }   
               commentListHtml+='<input type="password" name="dpassword" placeholder="비밀번호" class="delpassword kyj_text" required>'   
                           +'<input type="submit" id="ReplyDeleteBtn" value="삭제">'   
               
                           +'</div>'   
                           
            //댓글 수정 
            
               commentListHtml+='<div style="display: none;" class="modifyreply">'
               
                           if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+=' &nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }   
                        
               commentListHtml+='<textarea class="kyj_textarea" rows="4" cols="70" name="upcontent" id="upcontent" required>'+vo.rcontent+'</textarea>'   
                            +'<div class="row" id="addUpdate" style="margin-top:5px; margin-left:400px; margin-bottom:10px;">'         
                                              
                              if(vo.group_tab>0){
                           
                              for(let j=1; j<=vo.group_tab; j++){
                                    commentListHtml+=' &nbsp;&nbsp;&nbsp;'   
                              }
                                 
                        }
               commentListHtml+=' <input type="password" size="10" name="uppassword" class="uppassword kyj_text" placeholder="비밀번호" required>'
                           +'<input type="submit" id="replyUpdateBtn" value="수정"></div><hr></div>'               
                           
         
            }
 
         }
         
					if(replyAmount!==0){         
                commentListHtml +='<center><div class="lastDiv" data-totalpage='+totalpage+'>'
                				+'<span><button id="goFirstpage" class="btn btn-xs" style="float:left;">&lt;&nbsp;&nbsp;처음으로</button></span>'	
                				+'<h3><span><button class="btn btn-lg btn-primary" id="prevBtn" style="margin-right:10px;">이전</button></span>'+page+'/'+totalpage
 	               			    +'<span style="margin-left:10px;"><button class="btn btn-lg btn-primary" id="nextBtn">다음</button></span>'
 	               			    +'<span><button id="goEndpage" class="btn btn-xs" style="float:right;">&nbsp;&nbsp;마지막으로&gt</button></span>'	
 	               			    +'</h3></div></center>'
 	               			    }
 	               		commentListHtml+= '</div>';
                   
                $('.comment-section').html(commentListHtml);
                
              
               
            }
        });
        
          
        
        
      
      
    }
    
    
   
    
   	//댓글 관련 버튼에관한 js
    function clickBtn(){
      let wno = $('#selectWno').attr('data-wno');
   
   let passwordErrorState = {};
    let UpdatepasswordErrorState = {};
   
       $('.comment-section').on('click', '.replyBtn', function() {
            let index = $(this).closest('.comment').data('index');
            $('.addreply').eq(index).toggle();
            $('.dpassword').eq(index).hide();
            $('.modifyreply').eq(index).hide();
         
        });

        $('.comment-section').on('click', '.deleteBtn', function() {
            let index = $(this).closest('.comment').data('index');
            $('.dpassword').eq(index).toggle();
            $('.addreply').eq(index).hide();
            $('.modifyreply').eq(index).hide();
        });

        $('.comment-section').on('click', '.modifyBtn', function() {
            let index = $(this).closest('.comment').data('index');
            $('.modifyreply').eq(index).toggle();
            $('.addreply').eq(index).hide();
            $('.dpassword').eq(index).hide();
        });
        
        $('.comment-section').on('click', '#prevBtn', function() {
			
			let changepage=$('.comment').attr('data-page')
           
           if(changepage==="1"){
			   return;
		   }
		   else{
           getComments(changepage-1)
           }
        });
        
        $('.comment-section').on('click', '#nextBtn', function() {
           let changepage=$('.comment').attr('data-page')
           let checkEnd=$('.lastDiv').attr('data-totalpage')
           if(changepage!==checkEnd){
           getComments(Number(changepage)+1)
           }
        });
        
          $('.comment-section').on('click', '#goFirstpage', function() {
           getComments(1);
        });
        
          $('.comment-section').on('click', '#goEndpage', function() {
        
           let checkEnd=$('.lastDiv').attr('data-totalpage')
           
           getComments(checkEnd)
           
        });
        
         $('.comment-section').on('click', '#userReplyBtn', function() {
             let pwd=$('#password').val()
             let rcontent=$('#rcontent').val()
             
             if(rcontent.trim()===""){
               $('#rcontent').focus();
               return;
            }
             
             if(pwd.trim()===""){
            $('#password').focus();
               return;
            }
            
             
             $.ajax({
               type:'post',
               url:'walkReplyAjaxAdd.do',
                 
               data:{"pwd":pwd,"rcontent":rcontent,"wno":wno},
               success:function(){
                  getComments();
               
               }
            })
             
             
             
      });
        
        
        
         $('.comment-section').on('click', '#addReplyBtn', function() {
          
          
                
           let addpassword = $(this).closest('.addreply').find('.addpassword').val();
              let addcontent = $(this).closest('.addreply').find('#addcontent').val();
            let rno = $(this).closest('#getRno').attr('data-rno');
             
             if(addcontent.trim()===""){
                $(this).closest('.addreply').find('#addcontent').focus();
               return;
            }
             
             if(addpassword.trim()===""){
              $(this).closest('.addreply').find('.addpassword').focus();
               return;
            }
            
             
             $.ajax({
               type:'post',
               url:'walkReplyMoreAdd.do',
               data:{"pwd":addpassword,"rcontent":addcontent,"wno":wno,"rno":rno},
               success:function(){
                  getComments();
               
               }
            })
             
             
          
      });
         
         let stopGetComments = false; // getComments() 실행 여부를 제어하는 플래그
         
         $('.comment-section').on('click', '#ReplyDeleteBtn', function() {
         let clickedButton = $(this); // 클릭한 버튼 요소 저장
                
           let dpassword= $(this).closest('.dpassword').find('.delpassword').val();
          
                  let rno = $(this).closest('#getRno').attr('data-rno');
                  let mainContent = $(this).closest('.comment').find('.dpassword');
               mainContentDOM=mainContent[0];
               let newMsg='';
          
             
             if(dpassword.trim()===""){
              $(this).closest('.dpassword').find('.delpassword').focus();
               return;
            }
         
 

            
             
             $.ajax({
               type:'post',
               url:'walkReplyDelete.do',
               data:{"pwd":dpassword,"rno":rno},
               success:function(addJson){
                  let addRes=JSON.parse(addJson)
                  if(addRes.msg==='비밀번호가 틀렸습니다.'){
                  
                       if (!passwordErrorState.hasOwnProperty(rno)) {
                        passwordErrorState[rno] = true; // 한 번만 오류 메시지 생성
                        newMsg = $('<span style="color:red">&nbsp;&nbsp;&nbsp;' + addRes.msg + '</span>');
                        $(mainContentDOM).append(newMsg);
                             }
                             
                                    clickedButton.closest('.dpassword').find('.delpassword').val('');
                               clickedButton.closest('.dpassword').find('.delpassword').focus();
                              stopGetComments = true; 
                  }
                  
                  else{
                      stopGetComments = false; // getComments() 호출을 멈추기 위한 플래그 설정
                      getComments();
                  }
               
               }
            })
         
             
      }); 
      
      
       let updateStopGetComments =false;
         $('.comment-section').on('click', '#replyUpdateBtn', function() {
         let clickedButton = $(this); // 클릭한 버튼 요소 저장
      
           let uppassword = $(this).closest('.modifyreply').find('.uppassword').val();
          
              let upcontent = $(this).closest('.modifyreply').find('#upcontent').val();
                  
            let rno = $(this).closest('#getRno').attr('data-rno');
           
          
                 
           let mainContent = $(this).closest('.comment').find('#addUpdate');
                  
               let newMsg='';
          
             
             if(uppassword.trim()===""){
               
               $(this).closest('.modifyreply').find('.uppassword').focus();
             
               return;
            }
         
 

            
             
             $.ajax({
               type:'post',
               url:'walkReplyUpdate.do',
               data:{"pwd":uppassword,"rno":rno,"upcontent":upcontent},
               success:function(updateJson){
                  let updateRes=JSON.parse(updateJson)
                  if(updateRes.msg==='비밀번호가 틀렸습니다.'){
                  
                       if (!UpdatepasswordErrorState.hasOwnProperty(rno)) {
                        UpdatepasswordErrorState[rno] = true; // 한 번만 오류 메시지 생성
                        newMsg = $('<span style="color:red">&nbsp;&nbsp;&nbsp;' + updateRes.msg + '</span>');
                        $(mainContent).append(newMsg);
                             }
                             
                                    clickedButton.closest('.modifyreply').find('.uppassword').val('');
                               clickedButton.closest('.modifyreply').find('.uppassword').focus();
                              stopGetComments = true; 
                  }
                  
                  else{
                      stopGetComments = false; // getComments() 호출을 멈추기 위한 플래그 설정
                      getComments();
                  }
               
               }
            })
         
             
      }); 
      
      
      
    }
    
    
  
      
      
      
   

    // 댓글 받아오는 함수 호출
 getComments(clickBtn());
 
     
         

    
});




    