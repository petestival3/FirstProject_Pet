<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.trs{
   height: 100px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.trs').click(function(){
		let name=$(this).attr("data-name");
		let loc=$(this).attr("data-loc");
		let fno=$(this).attr("data-fno");
		$("#res_f_name").text(name)
		$("#res_f_loc").text(loc)
		$('#fno').val(fno);
		$.ajax({
			type:'post',
			url:'../reserve/funeral_date.do',
			data:{"CR_COM_NO":CR_COM_NO},
			success:function(result)
			{
				$('#conti_res_date').html(result);
			}
		})
	})
})
</script>
</head>
<body>
 <table>
    <c:forEach var="vo" items="${list }">
      <tr data-loc="${vo.CR_COM_LOC }" data-fno="${vo.CR_COM_NO }" data-name="${vo.CR_COM_NAME }" class="trs">
       <td class="text-center">
        <td>${vo.CR_COM_NAME }</td>
       </td>
       <td>${vo.CR_COM_LOC }</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>