<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp"></jsp:include>
		<div>
			${mvvo.mv_idx }<br/>
			${mvvo.title }<br/>
			${mvvo.title_eng }<br/>
			${mvvo.summary }<br/>
			${mvvo.mv_image_main }<br/>
			${mvvo.mv_image_1 }<br/>
			${mvvo.mv_image_2 }<br/>
			${mvvo.reg_date }<br/>
		</div>		
	</div>
	<!-- 
		1. 예매 버튼
		2. 관람평
	 -->
</body>
</html>