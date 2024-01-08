<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.trs').click(function(){
		let poster=$(this).attr("data-poster");
		let name=$(this).attr("data-name");
		let fno=$(this).attr("data-fno");
		$('#food_image').attr("src",poster);
		$("#food_name").text(name)
		$('#fno').val(fno);
		$.ajax({
			type:'post',
			url:'../reserve/food_date.do',
			data:{"fno":fno},
			success:function(result)
			{
				$('#food_date').html(result);
			}
		})
	})
})
</script>
</head>
<body>
 <table>
    <c:forEach var="vo" items="${list }">
      <tr data-poster="${vo.poster }" data-fno="${vo.fno }" data-name="${vo.name }" class="trs">
       <td class="text-center">
        <img src="${vo.poster }" style="width: 30px;height: 30px">
       </td>
       <td>${vo.name }</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>