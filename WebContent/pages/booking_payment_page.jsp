<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			width: 600px;
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
			margin: 0 0 5px 0;
			display: block;
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
		.form-box .detail .inner-wrapper div input[type="button"] {
			padding-left: 0px;
		}
		.form-box .detail .inner-wrapper div input[type="checkbox"] {
			display: inline-block;
			width: 30px;
			height: 30px;
		}
		.form-box .detail .inner-wrapper div input[readonly="readonly"] {
			background-color: #ddd;
		}
		.form-box .detail .inner-wrapper div .empty-seat {
			margin: 0;
			width: 30px;
			height: 30px;
			display: inline-block;
		}
		.form-box .detail .inner-wrapper div .booked-seat {
			margin: 0;
			width: 30px;
			height: 30px;
			display: inline-block;
			background-color: #555;
		}
		.form-box .detail .inner-wrapper div table {
			margin: 20px 0 0 0;
		}
		.form-box .detail .inner-wrapper div table thead tr td {
			background-color: #aaa;
		}
		.form-box .detail .inner-wrapper div td {
			text-align: center;
		}
		.form-box .detail .inner-wrapper div ul li {
			display:block;
			left-padding: 10px;
			font-size: 20px;
		}
		.form-box .detail .inner-wrapper div .total-price {
			font-size: 25px;
			
		}
		.form-box .detail .inner-wrapper div .total-price span {
			display: inline-block;
			border-bottom: 2px solid #555;
		}
		
	</style>
	<script type="text/javascript">
		var payment = function(f) {
			
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
							<span>영화 예매하기 - 5. 확인 및 결제</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" value="${mv.title }" readonly="readonly"/>
										<input type="text" value="${th.th_name }" readonly="readonly"/>
										<input type="text" value="${screen_date }" readonly="readonly"/>
										<span></span>
										<ul>
											<li>총 ${seatList.size() }개의 좌석을 선택하셨습니다.</li>
											<c:forEach var="seat" items="${seatList }">
												<li>${seat.th_row }열 ${seat.th_col }행 = ${seat.price }원</li>
											</c:forEach>
										</ul>
										<div class="total-price">
											결제금액 <span>${totalPrice }원</span>
										</div>
									</div>
									<div>
										<input type="hidden" name="cmd" value="booking_payment" />
										<input type="button" value="결제하기" onclick="payment(this.form)" />
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