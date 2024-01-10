<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<style type="text/css">
.contact-form {
	/*  border: 1px solid black; */
	
}

.newsBtn {
	/*  width: 150px;
  margin-left: 1000px;  */
	
}

.contact-form {
	padding: 0px;
}

.blog__details__text img {
	 border-radius: 10px;
	width: 800px;
	height: 500px; 
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=false;
$(function(){
	$('.delete').click(function(){
		
		if(bCheck===false)
		{
			bCheck=true;
			 let del = $(this).closest('tr').next('.del');
			 console.log(del)
		     $(this).closest('.del').show('slow');
			$('.delete').text("취소")
		}
		else
		{
			bCheck=false;
			 let del = $(this).closest('tr').next('.del');
		     $(del).hide('slow');
			$('.delete').text("삭제")
		}
	});
	$('.delBtn').on('click',function(){
		let rno=$('.delBtn').attr("data-rno");
		let no =$('.delBtn').attr("data-no");
		let pwd=$('.pwd').val()
		if(pwd.trim()==="")
		{
			$('.pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../health/newsreply_delete_ok.do',
			data:{"no":no,"rno":rno,"pwd":pwd},
			success:function(result)
			{
				if(result==="yes")
				{
					location.href="../health/newsdetail.do?no="+no
				}
				else
				{
					alert("틀린 비밀번호입니다")
					$('.pwd').val("")
					$('.pwd').focus();
				}
			}
		})
	})
});
$(function(){
	$('.update').click(function(){
		if(bCheck === false)
		{
			bCheck = true;
			$('.upd').show('slow');
			$('.update').text("취소");
		}
		else
		{
			bCheck = false;
			$('.upd').hide('slow');
			$('.update').text("수정");
		}
	});

	$('.updBtn').click(function(){
		
		let content = $(this).closest('tr').find('.upcontent');
	    let realcontent = content.val();
		console.log(realcontent)
		if(realcontent.trim() === "")
		{
			$(this).closest('.upcontent').focus();
			return;
		}
		let pwd = $('.uppwd').val();
		if(pwd.trim() === "")
		{
			$('.uppwd').focus();
			return;
		}
		let rno=$('.updBtn').attr("data-rno");
		let no =$('.updBtn').attr("data-no");
		
	      
		$.ajax({
			type: 'post',
			url: '../health/newsreply_update_ok.do',
			data: {"no":no,"rno":rno,"upcontent":content,"uppwd":pwd},
			success: function(result) 
			{
				if(result==="yes")
				{
					location.href = "../health/newsdetail.do?no="+no
				}
				else
				{
					alert("비밀번호가 틀립니다!!");
					$('.uppwd').val("");
					$('.uppwd').focus();
				}
			},
			error:function(err)
			{
				alert(err)
			}
			
		});
	});
});
</script>
</head>

<body>

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">

				<div class="col-lg-9 col-md-6 order-md-1 order-1">
					<div class="blog__details__text">
						<h3>${vo.news_subject }</h3>
						<p>${vo.news_date1 }&nbsp;&nbsp;&nbsp;&nbsp;${vo.news_date2 }
							&nbsp;&nbsp;&nbsp;&nbsp; 조회수: ${vo.hit }</p>
						<img src=${vo.news_img } style=""><br>
						<p>${vo.news_content }</p>

					</div>

				</div>

			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12" style="height: 50px;">
						<div class="section-title related-blog-title">
							<c:if test="${sessionScope.id==null }">
								<h2>댓글보기</h2>
							</c:if>
							<c:if test="${sessionScope.id!=null }">
								<h2>댓글남기기</h2>
							</c:if>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="contact-form spad">
							<div class="container">
								<div class="row">
									<div class="col-lg-12 text-center" style="margin-top: 20px;">
										<c:forEach var="rvo" items="${list }">
											<table class="table">
												<tr>
													<td class="text-left"><c:if test="${rvo.group_tab>0 }">
															<c:forEach var="i" begin="1" end="${rvo.group_tab }">
	                 														 &nbsp;&nbsp;
	                 														</c:forEach>
															<img src="image/re_icon.png">
														</c:if> <i class="fa fa-user-circle"></i>&nbsp;${rvo.userid }&nbsp;(${rvo.dbday })
													</td>
													<td colspan="4" class="text-right" style="white-space: nowrap;">
													<c:if test="${sessionScope.id!=null }">
															<c:if test="${sessionScope.id==rvo.userid }">
															<span class="update-btn update"  style="cursor: pointer; display: inline-block;" >수정</span>
															&nbsp;&nbsp;
															<span class="delete-btn delete"  style="cursor: pointer; display: inline-block;">삭제</span>
													    </c:if>
														</c:if> 
													</td>
												</tr>
												<tr>
													<td colspan="2"><pre
															style="white-space: pre-wrap; background-color: white; border: none; text-align: left;">${rvo.rcontent }</pre></td>
														
												</tr>
												
												<tr class="del" style="display: none">
													<td colspan="2" class="text-right inline">
													<input type="submit" value="삭제" class="delBtn" data-rno="${rvo.rno }" data-no="${vo.no}" class="btn btn-sm" 
																style="width: 50px; height: 30px; background-color: #5a70e9; color: white; float: right">
															<input type="password" class="pwd" name="pwd"
																placeholder="비밀번호입력" style=" width:150px; float: right">
															
																
													</td>
													</tr>
													<tr class="upd" style="display: none">
													<td colspan="2" class="text-right inline">
													 
															<input type="hidden" name="no" value=${no }>
																<input type="hidden" name="rno" value=${rvo.rno }>
																<div style="display: flex; align-items: center;" class="">
															<textarea class="upcontent" name="upcontent"
																style="float: left; resize: none; width: 750px;">
															</textarea>
															</div>
															<input type="password" class="uppwd" name="uppwd"
																placeholder="비밀번호입력" style=" width:140px; float: left">
														 <input type="button" value="수정" class="updBtn" data-rno="${rvo.rno }" data-no="${vo.no}"
																style="width: 60px; height: 30px; background-color: #5a70e9; color: white; float: left;">
											
													</td>
												</tr>

											</table>

										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="contact-form spad">
							<div class="container">
								<div class="row">
									<div class="col-lg-12 text-center">
										<table class="table">
											<tr>
												<c:if test="${sessionScope.id!=null }">
													<td colspan="2">
														<form method="post"
															action="../health/newsreply_insert_ok.do">
															<input type="hidden" name="no" value=${no }>
																<input type="hidden" name="rno" value=${rvo.rno }>
															<textarea id="content" name="content"
																style="float: left; resize: none; width: 1080px;">
                                                               </textarea>
															 <input type="submit" value="댓글"
																style="width: 60px; height: 50px; background-color: #5a70e9; color: white; float: right">
															
															<input type="password" id="pwd" name="pwd"
																placeholder="비밀번호입력" style=" width:200px; float: right">
														</form>
													</td>
												</c:if>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>