<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mymain.css" >
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<div class="col-md-9 my-page">
			<c:if test="${not empty sessionScope.id}">
						<table class="table">
							<tr>
								<th colspan="2">My Profile</th>
							</tr>
							<tr>
										<td rowspan="5"><img src="../img/mainlogo.png"
											class="my_profile"></td>
								<td>${myvo.name }</td>
							</tr>
							<tr>
								<td>${myvo.birth }</td>
							</tr>
							<tr>
								<td>${myvo.phone }</td>
							</tr>
							<tr>
								<td>${myvo.addr1 }</td>
							</tr>
						</table>
					</c:if>
		<c:choose>
			<c:when test="${not empty sessionScope.id}">
				<c:choose>
					<c:when test="${not empty vo.pet_name}">
						<table class="table">
							<tr>
								<th colspan="2">MyPet Profile</th>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty filename || filename ==''}">
										<td rowspan="5"><img src="../mypageImg/${filename }" class="my_profile"></td>
									</c:when>
									<c:otherwise>
										<td rowspan="5"><img src="../img/mainlogo.png"
											class="my_profile"></td>
									</c:otherwise>
								</c:choose>
								<td>${vo.pet_name }</td>
							</tr>
							<tr>
								<td>${vo.pet_gender }</td>
							</tr>
							<tr>
								<td>${vo.pet_bday }</td>
							</tr>
							<tr>
								<td>${vo.pet_weight }</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table">
							<tr>
								<th colspan="2">MyPet Profile</th>
							</tr>

							<tr>
								<td rowspan="5"><img src="../img/mainlogo.png"
									class="my_profile"></td>
								<td>이름</td>
							</tr>
							<tr>
								<td>성별</td>
							</tr>
							<tr>
								<td>생년월일</td>
							</tr>
							<tr>
								<td>몸무게</td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
</body>
</html>