<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=false;
$(function(){
	$('#delete').click(function(){
		if(bCheck===false)
		{
			bCheck=true;
			$('#del').show('slow')
			$('#delete').text("취소")
		}
		else
		{
			bCheck=false;
			$('#del').hide('slow')
			$('#delete').text("삭제")
		}
	});
	$('#delBtn').on('click',function(){
		let no=$('#delBtn').attr("data-no");
		let pwd=$('#pwd').val()
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../freeboard/delete_ok.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				if(result==="yes")
				{
					location.href="../freeboard/list.do"
				}
				else
				{
					alert("비밀번호가 틀립니다!!")
					$('#pwd').val("")
					$('#pwd').focus();
				}
			}
		})
	})
});
</script>
</head>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg" style="margin-top: 20px">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Free Board</h2>
                        <div class="breadcrumb__option">
                            <%-- <a href="./index.html">유기동물 보호센터&nbsp;&nbsp;</a>--%>
                            <span>Community&nbsp;&nbsp;-&nbsp;&nbsp;Free Board</span>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<div class="wrapper row3">
  <main class="container clear"> 
  <div class="row row1" style="height: 500px">
    <table class="table">
      <tr>
       <th class="text-center" width=20%>번호</th>
       <td class="text-center" width=30%>${vo.no }</td>
       <th class="text-center" width=20%>작성일</th>
       <td class="text-center" width=30%>${vo.dbday }</td>
      </tr>
      <tr>
       <th class="text-center" width=20%>이름</th>
       <td class="text-center" width=30%>${vo.name }</td>
       <th class="text-center" width=20%>조회수</th>
       <td class="text-center" width=30%>${vo.hit }</td>
      </tr>
      <tr>
       <th class="text-center" width=20%>제목</th>
       <td colspan="3">${vo.subject }</td>
      </tr>
      <tr>
       <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap; border: none; background-color: white;">${vo.content }</pre></td>
      </tr>
      <tr>
       <td colspan="4" class="text-right">
        <a href="../freeboard/update.do?no=${vo.no }"
         class="btn btn-success btn-xs">수정</a>
        <span
         class="btn btn-info btn-xs" id="delete">삭제</span>
         <a href="../freeboard/list.do"
         class="btn btn-warning btn-xs">목록</a>
       </td>
      </tr>
      <tr id="del" style="display: none">
       <td colspan="4" class="text-right inline">
       비밀번호:<input type="password" id=pwd class="input-sm">
       <input type="button" value="삭제" id="delBtn" data-no="${vo.no }"
        class="btn btn-sm btn-danger">
       </td>
      </tr>
    </table>
  </div>
  </main>
</div>

</body>
</html>