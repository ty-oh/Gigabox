<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		a {
			text-decoration: none;
		}
		ol, ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		body {
			overflow: auto;
			overflow-y : scroll;
			letter-spacing: 0;
			line-height: 1.5;
			letter-spacing: 0;
		}
		body, html {
			width:100%;
			height:100%;
			margin:0;
			padding:0;
		}
		.button {
		    display: inline-block;
		    height: 36px;
		    margin: 0;
		    padding: 0 15px;
		    text-align: center;
		    line-height: 34px;
		    color: #503396;
		    font-weight: 400;
		    border-radius: 4px;
		    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
		    text-decoration: none;
		    border: 1px solid #503396;
		    vertical-align: middle;
		    background-color: #fff;
		    cursor: pointer;
		}
		.body-wrapper {
			width:100%;
			height:100%;
			padding: 0;
		}
		.main-container {
			width: 100%;
			min-width: 1100px;
			min-height: 100%;
			margin: 0 0 -200px 0;
			padding: 92px 0 300px 0;
		}
		.contents {
			width: 100%;
			margin: 0;
			padding: 80px 0 0 0;
		}
		.inner-wrapper {
			width: 1100px;
			margin: 0 auto;
		}
		.form-box {
			width: 500px;
			margin: 0 auto;
			border: 1px solid #503396; 
		}
		.form-box .title {
			width: 100%;
			height: 40px;
			line-height: 40px;
			background-color: #503396;
			padding-left: 30px;
		}
		.form-box .title span {
			font-size: 20px;
			font-weight: bold;
			color: white;
		}
		.form-box .detail .inner-wrapper {
			width: 100%;
			padding: 10px 0 10px 30px;
		}
		.form-box .detail .inner-wrapper div {
			margin: 10px 0;
		}
		.form-box .detail .inner-wrapper div input,
		.form-box .detail .inner-wrapper div select {
			display: inline-block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 20px;
		}
		.form-box .detail .inner-wrapper div select {
			height: 300px;
		}
		.form-box .detail .inner-wrapper div input[type="button"]{
			padding-left: 0px;
		}
	</style>
	<script type="text/javascript">
		var choose_theater = function(f) {
			if (f.th_idx.value == '') {
				alert('예매하실 상영관를 선택해주세요.');
				return;
			}
			
			f.action='/Gigabox/Controller'
			f.submit();
		}
	</script>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp"/>
		<div class="main-container">
			<div class="contents">
				<div class="inner-wrapper">
					<div class="form-box">
						<div class="title">
							<span>영화 예매하기 - 2. 상영관 선택</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" value="${mv.title }" readonly="readonly"/>
										<select name="th_idx" size="10">
											<option value="0">:: 상영 중인 상영관 ::</option>
											<c:forEach var="th" items="${thList }">
												<option value="${th.th_idx }">${th.th_name }</option>
											</c:forEach>
										</select>
									</div>
									<div>
										<input type="hidden" name="cmd" value="booking_select_date" />
										<input type="button" value="영화 선택" onclick="choose_theater(this.form)" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>