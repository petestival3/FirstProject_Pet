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
.delete-btn {
	display: inline-block;
	font-size: 14px;
	padding: 10px 28px 10px;
	color: #ffffff;
	text-transform: uppercase;
	font-weight: 700;
	background: #5a70e9;
	letter-spacing: 2px;
}
.update-btn {
	display: inline-block;
	font-size: 14px;
	padding: 10px 28px 10px;
	color: #ffffff;
	text-transform: uppercase;
	font-weight: 700;
	background: #5a70e9;
	letter-spacing: 2px;
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
       <td width=30%>${vo.no }</td>
       <th class="text-center" width=20%>작성일</th>
       <td width=30%>${vo.dbday }</td>
      </tr>
      <tr>
       <th class="text-center" width=20%>이름</th>
       <td width=30%>${vo.name }</td>
       <th class="text-center" width=20%>조회수</th>
       <td width=30%>${vo.hit }</td>
      </tr>
      <tr>
       <th class="text-center" width=20%>제목</th>
       <td colspan="3">${vo.subject }</td>
      </tr>
      <tr>
       <th width=20%></th>
       <td colspan="3" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap; border: none; background-color: white; font-size: 15px;">${vo.content }</pre></td>
      </tr>
      <tr>
       <td colspan="4" class="text-right">
        <c:if test="${sessionScope.id!=null }">
        <a href="../freeboard/update.do?no=${vo.no }"
         class="update-btn">수정</a>
        <span
         class="delete-btn" id="delete" style="cursor: pointer">삭제</span>
         </c:if>
         <a href="../freeboard/list.do"
         class="primary-btn">목록</a>
         
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
    
    <div style="height: 20px"></div>
   <div class="col-sm-8">
       <table class="table">
	     <%-- 댓글 출력 위치 --%>
	     <tr>
	      <td>
	        <c:forEach var="rvo" items="${list }">
	          <table class="table">
	           <tr>
	             <td class="text-left">
	               <c:if test="${rvo.group_tab>0 }">
	                 <c:forEach var="i" begin="1" end="${rvo.group_tab }">
	                  &nbsp;&nbsp;
	                 </c:forEach>
	                 <img src="image/re_icon.png">
	               </c:if>
	               ◑${rvo.name }&nbsp;(${rvo.dbday })
	             </td>
	             <td class="text-right">
	               <c:if test="${sessionScope.id!=null }">
	                <c:if test="${sessionScope.id==rvo.id }">
	                 <span class="btn btn-xs btn-success ups" data-no="${rvo.no }">수정</span>
	                 <a href="../freeboard/reply_delete.do?no=${rvo.no }&bno=${vo.no}" class="btn btn-xs btn-info">삭제</a>
	                </c:if>
	                <span class="btn btn-xs btn-warning ins" data-no="${rvo.no }">댓글</a>
	               </c:if>
	             </td>
	           </tr>
	           <tr>
	             <td colspan="2"><pre style="white-space: pre-wrap;background-color: white;border: none">${rvo.msg }</pre></td>
	           </tr>
	           <tr style="display:none" class="reins" id="i${rvo.no }">
			      <td colspan="2">
			        <form method="post" action="../freeboard/reply_reply_insert.do" class="inline">
			         <input type=hidden name=bno value="${vo.no}">
			         bno는 다시 detail.do로 이동
			         <input type=hidden name=pno value="${rvo.no }">
			         <textarea rows="5" cols="55" name="msg" style="float: left"></textarea>
		             <input type=submit value="댓글쓰기" 
		              style="width: 100px;height: 104px;background-color: green;color:white;">
			        </form>
			      </td>
			    </tr>
	           <tr style="display: none" class="updates" id="u${rvo.no }">
			      <td colspan="2">
			        <form method="post" action="../freeboard/reply_update.do" class="inline">
			         <input type=hidden name=bno value="${vo.no}">
			         <%-- bno는 다시 detail.do로 이동 --%>
			         <input type=hidden name=no value="${rvo.no }">
			         <textarea rows="5" cols="55" name="msg" style="float: left">${rvo.msg }</textarea>
		             <input type=submit value="댓글수정" 
		              style="width: 100px;height: 104px;background-color: green;color:white;">
			        </form>
			      </td>
			     </tr>
	          </table>
	        </c:forEach>
	      </td>
	     </tr>
	   </table>
	   <c:if test="${sessionScope.id!=null }">
		   <table class="table">
		     <%-- 새댓글 입력 --%>
		     <tr>
		      <td>
		        <form method="post" action="../freeboard/reply_insert.do" class="inline">
		         <input type=hidden name=bno value="${vo.no}">
		         <textarea rows="5" cols="60" name="msg" style="float: left"></textarea>
	             <input type=submit value="댓글쓰기" 
	              style="width: 120px;height: 104px;background-color: green;color:white;">
		        </form>
		      </td>
		     </tr>
		   </table>
	   </c:if>
    
  </div>
  </main>
</div>

</body>
</html>