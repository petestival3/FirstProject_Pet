<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
    <div style="margin-top:30px;">
<ul class="nav nav-pills walk_cate" style="margin-bottom: 30px;">
  	 						    <li><a href="../walk/walkList.do?" class="${loc eq '전체' ? 'kyj_cate_selected' : ''}">전체</a></li>
                                <li><a href="../walk/walkList.do?loc=서울" class="${loc eq '서울' ? 'kyj_cate_selected' : ''}">서울</a></li>
                                <li><a href="../walk/walkList.do?loc=경기" class="${loc eq '경기' ? 'kyj_cate_selected' : ''}">경기</a></li>
                                <li><a href="../walk/walkList.do?loc=인천" class="${loc eq '인천' ? 'kyj_cate_selected' : ''}">인천</a></li>
                                <li><a href="../walk/walkList.do?loc=충남" class="${loc eq '충남' ? 'kyj_cate_selected' : ''}">충남</a></li>
                                <li><a href="../walk/walkList.do?loc=충북" class="${loc eq '충북' ? 'kyj_cate_selected' : ''}">충북</a></li>
                                <li><a href="../walk/walkList.do?loc=강원" class="${loc eq '강원' ? 'kyj_cate_selected' : ''}">강원</a></li>
                                <li><a href="../walk/walkList.do?loc=전남" class="${loc eq '전남' ? 'kyj_cate_selected' : ''}">전남</a></li>
                                <li><a href="../walk/walkList.do?loc=울산" class="${loc eq '울산' ? 'kyj_cate_selected' : ''}">울산</a></li>
                                <li><a href="../walk/walkList.do?loc=경북" class="${loc eq '경북' ? 'kyj_cate_selected' : ''}">경북</a></li>
                                <li><a href="../walk/walkList.do?loc=경남" class="${loc eq '경남' ? 'kyj_cate_selected' : ''}">경남</a></li>
                                <li><a href="../walk/walkList.do?loc=부산" class="${loc eq '부산' ? 'kyj_cate_selected' : ''}">부산</a></li>
                                <li><a href="../walk/walkList.do?loc=대구" class="${loc eq '대구' ? 'kyj_cate_selected' : ''}">대구</a></li>
                                <li><a href="../walk/walkList.do?loc=전북" class="${loc eq '전북' ? 'kyj_cate_selected' : ''}">전북</a></li>
                                <li><a href="../walk/walkList.do?loc=광주" class="${loc eq '광주' ? 'kyj_cate_selected' : ''}">광주</a></li>
                                <li><a href="../walk/walkList.do?loc=세종" class="${loc eq '세종' ? 'kyj_cate_selected' : ''}">세종</a></li>
                                <li><a href="../walk/walkList.do?loc=대전" class="${loc eq '대전' ? 'kyj_cate_selected' : ''}">대전</a></li>
                                <li><a href="../walk/walkList.do?loc=제주" class="${loc eq '제주' ? 'kyj_cate_selected' : ''}">제주</a></li>
	    </ul> 

</div>
</body>
</html>