<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
const funerals=[
	 {
		  "cr_com_no": "1",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 세종점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "세종시 부강로 시목부강로 620",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "2",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫포유",
		  "cr_com_phone": "1533-4426",
		  "cr_com_loc": "세종특별자치시 장군면 금암리 87-5",
		  "cr_com_homepage": "http:\/\/www.petforyou.kr"
		 },
		 {
		  "cr_com_no": "3",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "센트럴파크(주)",
		  "cr_com_phone": "051-728-5411",
		  "cr_com_loc": "부산광역시 기장군 일광면 차양길 175",
		  "cr_com_homepage": "http:\/\/www.startice.co.kr"
		 },
		 {
		  "cr_com_no": "4",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "파트라슈",
		  "cr_com_phone": "051-723-2201",
		  "cr_com_loc": "부산 기장군 장안읍 좌동리 49-1",
		  "cr_com_homepage": "http:\/\/www.mypatrasche.co.kr"
		 },
		 {
		  "cr_com_no": "5",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "아이별",
		  "cr_com_phone": "051-727-4499",
		  "cr_com_loc": "부산광역시 기장군 장안읍 기룡길 11-33",
		  "cr_com_homepage": "http:\/\/www.aistar.co.kr"
		 },
		 {
		  "cr_com_no": "6",
		  "cr_com_sector": "장례",
		  "cr_com_name": "대구러브펫",
		  "cr_com_phone": "053-593-4900",
		  "cr_com_loc": "대구 달서구 장동 50",
		  "cr_com_homepage": "http:\/\/dglovepet.kr"
		 },
		 {
		  "cr_com_no": "7",
		  "cr_com_sector": "장례, 봉안",
		  "cr_com_name": "㈜더 포에버",
		  "cr_com_phone": "032-713-5002",
		  "cr_com_loc": "인천광역시 서구 설원로 79(대곡동)",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "8",
		  "cr_com_sector": "봉안",
		  "cr_com_name": "어게인",
		  "cr_com_phone": "032-566-1936",
		  "cr_com_loc": "인천광역시 서구 원당대로246번길 15 (오류동)",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "9",
		  "cr_com_sector": "장례",
		  "cr_com_name": "㈜하늘펫",
		  "cr_com_phone": "062-946-2626",
		  "cr_com_loc": "광주 광산구 지죽동 409-14",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "10",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "이별공간",
		  "cr_com_phone": "***********",
		  "cr_com_loc": "울산광역시 울주군 삼동면 조일리 906-4번지",
		  "cr_com_homepage": "http:\/\/ebyulplace.modoo.at"
		 },
		 {
		  "cr_com_no": "11",
		  "cr_com_sector": "화장",
		  "cr_com_name": "(주)펫콤",
		  "cr_com_phone": "1833-5158",
		  "cr_com_loc": "경기 안산시 단원구 광덕서로 82, 한남법조빌딩 513호(고잔동)",
		  "cr_com_homepage": "https:\/\/petcom.kr"
		 },
		 {
		  "cr_com_no": "12",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "㈜펫바라기",
		  "cr_com_phone": "031-976-3179",
		  "cr_com_loc": "경기 고양시 일산동구 설문동 515-1",
		  "cr_com_homepage": "http:\/\/www.petbaragi.com"
		 },
		 {
		  "cr_com_no": "13",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "몽몽이엠파크",
		  "cr_com_phone": "1811-1336",
		  "cr_com_loc": "경기도 남양주시 화도읍 모꼬지로17번길 136",
		  "cr_com_homepage": "http:\/\/mmempark.com"
		 },
		 {
		  "cr_com_no": "14",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "리멤버",
		  "cr_com_phone": "080-200-5004",
		  "cr_com_loc": "경기도 용인시 처인구 남사면 원앙로 535",
		  "cr_com_homepage": "http:\/\/리멤버.net"
		 },
		 {
		  "cr_com_no": "15",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "씨엘로펫",
		  "cr_com_phone": "1577-7332",
		  "cr_com_loc": "경기도 용인시 처인구 백암면 죽양대로 1206",
		  "cr_com_homepage": "http:\/\/www.cielopet.co.kr"
		 },
		 {
		  "cr_com_no": "16",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "(주)페어웰",
		  "cr_com_phone": "031-941-3350",
		  "cr_com_loc": "경기도 파주시 광탄면 수레길 302",
		  "cr_com_homepage": "http:\/\/farewell.kr"
		 },
		 {
		  "cr_com_no": "17",
		  "cr_com_sector": "장례, 화장",
		  "cr_com_name": "㈜아리아펫",
		  "cr_com_phone": "031-635-2266",
		  "cr_com_loc": "경기 이천시 마장면 장암리 525-1",
		  "cr_com_homepage": "http:\/\/www.aria.pet"
		 },
		 {
		  "cr_com_no": "18",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 경기 김포점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "경기 김포시 월곶면 애기봉로 262",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "19",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "페트나라",
		  "cr_com_phone": "031-997-4445",
		  "cr_com_loc": "경기 김포시 통진읍 귀전리 167",
		  "cr_com_homepage": "http:\/\/petnara.co.kr"
		 },
		 {
		  "cr_com_no": "20",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "엔젤스톤",
		  "cr_com_phone": "031-981-0271",
		  "cr_com_loc": "경기 김포시 하성면 양택리 251-6",
		  "cr_com_homepage": "http:\/\/www.angelstone.co.kr"
		 },
		 {
		  "cr_com_no": "21",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "마스꼬따 휴㈜",
		  "cr_com_phone": "031-989-2444",
		  "cr_com_loc": "경기도 김포시 통진읍 애기봉로 681번길 73-20",
		  "cr_com_homepage": "http:\/\/www.mascotahue.com"
		 },
		 {
		  "cr_com_no": "22",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "아이드림펫",
		  "cr_com_phone": "031-996-7444",
		  "cr_com_loc": "경기 김포시 하성면 하성로 647",
		  "cr_com_homepage": "http:\/\/www.idreampet.co.kr"
		 },
		 {
		  "cr_com_no": "23",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "ROYHILLS",
		  "cr_com_phone": "1855-2004",
		  "cr_com_loc": "경기도 양평군 양동면 양동금곡 4길 10",
		  "cr_com_homepage": "https:\/\/www.royhills.co.kr"
		 },
		 {
		  "cr_com_no": "24",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "스토리펫",
		  "cr_com_phone": "031-353-5579",
		  "cr_com_loc": "경기도 화성시 정남면 서봉로851번길 83(문학리 663)",
		  "cr_com_homepage": "http:\/\/www.스토리펫.com"
		 },
		 {
		  "cr_com_no": "25",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫오케스트라",
		  "cr_com_phone": "1588-1289",
		  "cr_com_loc": "경기도 화성시 비봉면 양노남길 108",
		  "cr_com_homepage": "http:\/\/www.petorchestra.co.kr\/"
		 },
		 {
		  "cr_com_no": "26",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 경기 화성점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "경기도 화성시 팔탄면 독곡길 24-42",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "27",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "(주)우리반려동물문화원",
		  "cr_com_phone": "1899-6415",
		  "cr_com_loc": "경기도 화성시 서신면 안벼슬길 102번길 165",
		  "cr_com_homepage": "http:\/\/www.uripet.co.kr"
		 },
		 {
		  "cr_com_no": "28",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "㈜해피엔딩",
		  "cr_com_phone": "1899-5127",
		  "cr_com_loc": "경기 광주시 초월읍 지월리 134",
		  "cr_com_homepage": "http:\/\/www.wehappyending.com"
		 },
		 {
		  "cr_com_no": "29",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "하늘강아지",
		  "cr_com_phone": "1577-4428",
		  "cr_com_loc": "경기도 광주시 초월읍 선장동길 31-3",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "30",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "백꽃사랑하이빛",
		  "cr_com_phone": "***********",
		  "cr_com_loc": "경기도 광주시 곤지암읍 부항리 236",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "31",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "러브펫",
		  "cr_com_phone": "031-796-4341",
		  "cr_com_loc": "경기 광주시 초월읍 지월리 712-10",
		  "cr_com_homepage": "http:\/\/www.러브펫.net"
		 },
		 {
		  "cr_com_no": "32",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "21그램 반려동물 장례식장",
		  "cr_com_phone": "1688-1240",
		  "cr_com_loc": "경기 광주시 오포읍 매산리 139",
		  "cr_com_homepage": "http:\/\/21gram.co.kr"
		 },
		 {
		  "cr_com_no": "33",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "㈜펫포레스트",
		  "cr_com_phone": "1577-0996",
		  "cr_com_loc": "경기 광주시 오포읍 문형리 749-5",
		  "cr_com_homepage": "http:\/\/petforest.co.kr"
		 },
		 {
		  "cr_com_no": "34",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 경기 광주점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "경기 광주시 초월읍 산수로 409-11",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "35",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 경기 양주점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "경기 양주시 광적면 부흥로 145",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "36",
		  "cr_com_sector": "화장",
		  "cr_com_name": "스타펫",
		  "cr_com_phone": "1588-9344",
		  "cr_com_loc": "경기도 포천시 내촌면 진금로 34",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "37",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "주식회사 패투헤븐",
		  "cr_com_phone": "033-745-4211",
		  "cr_com_loc": "강원 원주시 소초면 현촌길 90-3, 나동",
		  "cr_com_homepage": "https:\/\/www.pettoheaven.co.kr"
		 },
		 {
		  "cr_com_no": "38",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "강릉 펫사랑",
		  "cr_com_phone": "033-645-8888",
		  "cr_com_loc": "강원 강릉시 사천면 구라미길 376",
		  "cr_com_homepage": "https:\/\/gpetlove.modoo.at"
		 },
		 {
		  "cr_com_no": "39",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫 메모리얼",
		  "cr_com_phone": "1566-4379",
		  "cr_com_loc": "강원 횡성군 공근면 경강로초원6길 58",
		  "cr_com_homepage": "http:\/\/www.petmemorial.co.kr"
		 },
		 {
		  "cr_com_no": "40",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "굿바이펫",
		  "cr_com_phone": "043-642-1537",
		  "cr_com_loc": "충북 제천시 봉양읍 장평리 37-1",
		  "cr_com_homepage": "http:\/\/goodbyepet.co.kr"
		 },
		 {
		  "cr_com_no": "41",
		  "cr_com_sector": "화장, 봉안",
		  "cr_com_name": "대전 스카이 펫",
		  "cr_com_phone": "1588-4476",
		  "cr_com_loc": "충청북도 옥천군 이원면 이원로 47",
		  "cr_com_homepage": "https:\/\/mamresky.modoo.at\/"
		 },
		 {
		  "cr_com_no": "42",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "스마일 어게인",
		  "cr_com_phone": "1544-9262",
		  "cr_com_loc": "충청북도 영동군 추풍령면 작동1길 81",
		  "cr_com_homepage": "http:\/\/www.smileagain.net"
		 },
		 {
		  "cr_com_no": "43",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫로스엔젤",
		  "cr_com_phone": "1577-2518",
		  "cr_com_loc": "충청북도 청주시 서원구 남이면 구미1길 37-47",
		  "cr_com_homepage": "http:\/\/www.petlossangel.com"
		 },
		 {
		  "cr_com_no": "44",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "우바스",
		  "cr_com_phone": "1588-6326",
		  "cr_com_loc": "충북 청주시 상당구 신송서원길 120-30",
		  "cr_com_homepage": "http:\/\/www.ubas.co.kr"
		 },
		 {
		  "cr_com_no": "45",
		  "cr_com_sector": "장례, 화장, 건조, 봉안",
		  "cr_com_name": "21그램 반려동물 장례식장 천안아산점",
		  "cr_com_phone": "1688-1240",
		  "cr_com_loc": "충남 천안시 동남구 광풍로 1668(구룡동)",
		  "cr_com_homepage": "http:\/\/21gram.co.kr"
		 },
		 {
		  "cr_com_no": "46",
		  "cr_com_sector": "장례, 화장",
		  "cr_com_name": "㈜좋은친구들",
		  "cr_com_phone": "041-858-4411",
		  "cr_com_loc": "충남 공주시 우성면 보흥2길 36-61",
		  "cr_com_homepage": "http:\/\/goodfriend2012.com"
		 },
		 {
		  "cr_com_no": "47",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "리멤버 파크",
		  "cr_com_phone": "041-735-1700",
		  "cr_com_loc": "충청남도 논산시 연산면 계백로 2172-13",
		  "cr_com_homepage": "http:\/\/www.rememberpark.kr"
		 },
		 {
		  "cr_com_no": "48",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "위드엔젤",
		  "cr_com_phone": "041-332-8787",
		  "cr_com_loc": "충남 예산군 대슬면 화산리 464-1",
		  "cr_com_homepage": "http:\/\/www.withangel.net"
		 },
		 {
		  "cr_com_no": "49",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "전주 반려동물 장례식장 아리움",
		  "cr_com_phone": "063-223-7942",
		  "cr_com_loc": "전라북도 전주시 완산구 콩쥐팥쥐로 1705-44(효자동3가)",
		  "cr_com_homepage": "http:\/\/www.arium.kr"
		 },
		 {
		  "cr_com_no": "50",
		  "cr_com_sector": "장례",
		  "cr_com_name": "서래안 펫타운",
		  "cr_com_phone": "***********",
		  "cr_com_loc": "전라북도 군산시 서래안1길 11, 2층",
		  "cr_com_homepage": "null"
		 },
		 {
		  "cr_com_no": "51",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫바라기",
		  "cr_com_phone": "063-625-3737",
		  "cr_com_loc": "전북 남원시 보절면 신파리 403",
		  "cr_com_homepage": "http:\/\/www.petbaragi.co.kr"
		 },
		 {
		  "cr_com_no": "52",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "전주 하늘",
		  "cr_com_phone": "063-432-0600",
		  "cr_com_loc": "전라북도 완주군 소양면 전진로 1630",
		  "cr_com_homepage": "http:\/\/전주하늘반려동물장례식장.com"
		 },
		 {
		  "cr_com_no": "53",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "해피펫",
		  "cr_com_phone": "063-242-2114",
		  "cr_com_loc": "전라북도 완주군 이서면 팥죽이로 205-7",
		  "cr_com_homepage": "-"
		 },
		 {
		  "cr_com_no": "54",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "오수 펫 추모공원",
		  "cr_com_phone": "063-643-0486",
		  "cr_com_loc": "전라북도 임실군 오수면 춘향로 1554-95, 오수 펫 추모공원",
		  "cr_com_homepage": "http:\/\/www.osupet.com"
		 },
		 {
		  "cr_com_no": "55",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "해늘마루",
		  "cr_com_phone": "061-273-4000",
		  "cr_com_loc": "전남 목포시 고하대로 1140-17(대양동)",
		  "cr_com_homepage": "http:\/\/www.haeneul.kr"
		 },
		 {
		  "cr_com_no": "56",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "전남반려동물장례식장 푸른솔 (주)",
		  "cr_com_phone": "1566-7112",
		  "cr_com_loc": "전라남도 여수시 율촌면 조화길31",
		  "cr_com_homepage": "https:\/\/blog.naver.com\/petgreen_sol"
		 },
		 {
		  "cr_com_no": "57",
		  "cr_com_sector": "장례, 건조, 봉안",
		  "cr_com_name": "타임투반려동물장례문화원",
		  "cr_com_phone": "061-322-0122",
		  "cr_com_loc": "전라남도 함평군 학교면 학교월봉길 217",
		  "cr_com_homepage": "http:\/\/www.timeto.co.kr"
		 },
		 {
		  "cr_com_no": "58",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "경북반려동물장례식장",
		  "cr_com_phone": "1522-0912",
		  "cr_com_loc": "경상북도 김천시 봉산면 영남대로 353",
		  "cr_com_homepage": "http:\/\/gbpet.co.kr"
		 },
		 {
		  "cr_com_no": "59",
		  "cr_com_sector": "장례, 화장, 건조, 봉안",
		  "cr_com_name": "(주)한별소울펫",
		  "cr_com_phone": "1588-9749",
		  "cr_com_loc": "경상북도 구미시 옥성면 이곡3길 69",
		  "cr_com_homepage": "https:\/\/hanbyulsoulpet.modoo.at"
		 },
		 {
		  "cr_com_no": "60",
		  "cr_com_sector": "장례",
		  "cr_com_name": "(주)젠틀펫",
		  "cr_com_phone": "1577-3620",
		  "cr_com_loc": "경상북도 문경시 문경읍 문경대로 2430",
		  "cr_com_homepage": "http:\/\/gentlepetstar.com\/"
		 },
		 {
		  "cr_com_no": "61",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "아이들랜드",
		  "cr_com_phone": "1522-6979",
		  "cr_com_loc": "경상북도 경산시 와촌면 불굴사길 82",
		  "cr_com_homepage": "http:\/\/아이들랜드.com"
		 },
		 {
		  "cr_com_no": "62",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "하얀민들레",
		  "cr_com_phone": "1599-1627",
		  "cr_com_loc": "경북 청도군 화양읍 남성현로852",
		  "cr_com_homepage": "http:\/\/www.youngheal.com"
		 },
		 {
		  "cr_com_no": "63",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "강아지 펫 헤븐",
		  "cr_com_phone": "1899-6144",
		  "cr_com_loc": "경상북도 성주군 선남면 오도리 91",
		  "cr_com_homepage": "http:\/\/petheaven.ad-media.kr"
		 },
		 {
		  "cr_com_no": "64",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "스윗드림 펫",
		  "cr_com_phone": "054-974-2220",
		  "cr_com_loc": "경상북도 칠곡군 가산면 다부거문1길 51-68",
		  "cr_com_homepage": "http:\/\/www.sweetdreampet.com"
		 },
		 {
		  "cr_com_no": "65",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "한별 반려동물 장례식장",
		  "cr_com_phone": "1644-9040",
		  "cr_com_loc": "경남 창원시 진해구 진해대로 2507, 주식회사어울림(용원동)",
		  "cr_com_homepage": "https:\/\/hanbyul16449040.modoo.at"
		 },
		 {
		  "cr_com_no": "66",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "포포즈 반려동물 장례식장 부산점",
		  "cr_com_phone": "1588-2888",
		  "cr_com_loc": "경상남도 김해시 한림면 안하로 102",
		  "cr_com_homepage": "http:\/\/fourpaws.co.kr"
		 },
		 {
		  "cr_com_no": "67",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "아이헤븐",
		  "cr_com_phone": "1577-5474 ",
		  "cr_com_loc": "경상남도 김해시 생림면 봉림리 872-1",
		  "cr_com_homepage": "http:\/\/iheaven.kr"
		 },
		 {
		  "cr_com_no": "68",
		  "cr_com_sector": "화장, 장례, 봉안",
		  "cr_com_name": "펫누리",
		  "cr_com_phone": "1566-9399",
		  "cr_com_loc": "경상남도 김해시 생림면 나전리1065번지 7호",
		  "cr_com_homepage": "http:\/\/www.becomestars.co.kr"
		 },
		 {
		  "cr_com_no": "69",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "펫로스 케어",
		  "cr_com_phone": "1522-2253",
		  "cr_com_loc": "경상남도 김해시 상동면 묵방로 109번길 3",
		  "cr_com_homepage": "http:\/\/www.petlosscare.co.kr\/ "
		 },
		 {
		  "cr_com_no": "70",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "메리온",
		  "cr_com_phone": "055-374-6503",
		  "cr_com_loc": "경남 양산시 상북면 오룡길 152",
		  "cr_com_homepage": "http:\/\/www.merion.co.kr"
		 },
		 {
		  "cr_com_no": "71",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "(주)펫노블레스",
		  "cr_com_phone": "055-374-4400",
		  "cr_com_loc": "경상남도 양산시 상북면 공원로3길 19-91",
		  "cr_com_homepage": "http:\/\/www.petnoblesse.com"
		 },
		 {
		  "cr_com_no": "72",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "한별 리멤버파크",
		  "cr_com_phone": "1899-2610",
		  "cr_com_loc": "경상남도 함안군 법수면 이묵골로 135-3",
		  "cr_com_homepage": "http:\/\/hanbyuldog.modoo.at"
		 },
		 {
		  "cr_com_no": "73",
		  "cr_com_sector": "장례, 화장, 봉안",
		  "cr_com_name": "하늘소풍",
		  "cr_com_phone": "1566-4546",
		  "cr_com_loc": "경남 고성군 회화면 봉오로 145-22",
		  "cr_com_homepage": "http:\/\/www.하늘소풍.kr"
		 }
		]
//출력부
$(function(){
	funerals.map((funeral)=>{
		$('#user-table tbody').append(
		   '<tr class="result">'
		  +'<td class="text-center">'+funeral.cr_com_no+'</td>'
		  +'<td>'+funeral.cr_com_loc+'</td>'
		  +'<td>'+funeral.cr_com_name+'</td>'
		  +'<td class="text-center">'+funeral.cr_com_sector+'</td>'
		  +'<td >'+funeral.cr_com_homepage+'</td>'
		  +'</tr>'  
		)
	})
	/*
	//이벤트 처리 (기존)
	$('#keyword').keyup(function(){
		let k=$('#keyword').val();
		$('#user-table > tbody > tr').hide()
		let temp=$('#user-table > tbody > tr > td:nth-child(5n+2):contains("'+k+'")')
		                                                   //이부분선택하게해서 카테고리검색도 만들수 있을거같음
		$(temp).parent().show()
	})*/
	//이벤트 처리 (수정본)
	$('#keyword').keyup(function () {
	    let k = $('#keyword').val();
	    let selectedOption = $('#search-table select').val();
	    let columnSelector = '';

	    switch (selectedOption) {
	        case '시/도명':
	            columnSelector = ':nth-child(5n+2)';
	            break;
	        case '업체명':
	            columnSelector = ':nth-child(5n+3)';
	            break;
	        case '분야':
	            columnSelector = ':nth-child(5n+4)';
	            break;
	        default:
	            // 다른 옵션을 처리하려면 필요한 경우 추가로 작성
	            break;
	    }

	    $('#user-table > tbody > tr').hide();
	    let temp = $('#user-table > tbody > tr > td'+columnSelector+ ':contains("' + k + '")');
	    $(temp).parent().show();
	});
})
</script>
<style type="text/css">
/*--------------*/
/*장례식장 검색 페이지*/
/*--------------*/
.breadcrumb-section{
    margin: 50px 0;
}

/*검색부 + 결과출력부*/
#search-table td {
    text-align: center;
    border-top: none !important;
}
#search-table td #keyword{
    width: 500px;
    height: 50px;
    line-height: 50px;
    border: 1px solid #d2d2d2;
    border-radius : 30px;
    text-align: center;
}
#user-table{
    margin: 0 auto 50px;
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Search for a funeral home</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>Funeral</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- 사이드 예약 매뉴 시작 -->
	<div class="res_submenu">
		<a href="../reserve/reserve_funeral.do"> <i class="xi-calendar-add"></i>
			<p>예약하기</p>
		</a>
	</div>
	<!-- 사이드 예약 매뉴 종료 -->

	<!-- 검색하기 내용 시작 -->
	<div class="container">
    <div class="row">
     <table class="table" id="search-table">
      <tr>
       <td>
        <select>
          <option>시/도명</option>
          <option>업체명</option>
          <option>분야</option>
        </select>
        <input type=text size=25 id="keyword" placeholder="검색어 입력">
       </td>
      </tr>
     </table>
     <div style="height: 20px"></div>
     <table class="table" id="user-table">
       <thead>
         <tr>
           <th class="text-center">번호</th>
           <th class="text-center">주소</th>
           <th class="text-center">업체명</th>
           <th class="text-center">분야</th>
           <th class="text-center">홈페이지</th>
         </tr>
       </thead>
       <tbody>
         
       </tbody>
     </table>
    </div>
   </div>
	<!-- 검색하기 내용 종료 -->
	
	<!-- json으로 목록을 출력한거라 페이지 나누는 dao를 다시 구성해야할거같음.. -->
	<!-- 페이지 나누기 번호 시작
	<nav class="pagination">
		<ul>
			<c:if test="${startPage>1 }">
				<li><a href="../FuneralDetail/search_f.do?page=${startPage-1 }">&laquo;
						Previous</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${i==curpage?"class=current":""}><a
					href="../FuneralDetail/search_f.do?page=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li><a href="../FuneralDetail/search_f.do?page=${endPage+1 }">Next
						&raquo;</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 페이지 나누기 번호 종료 -->
</body>
</html>