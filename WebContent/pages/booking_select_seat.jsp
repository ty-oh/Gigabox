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
			width: 800px;
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
	</style>
	<script type="text/javascript">
		var choose_seat = function(f) {
			var isEmpty = true;
			for (var i=0; i<f.seat.length; i++) {
				if (f.seat[i].checked == true) {
					isEmpty = false;
					break;
				}
			}
			
			if (isEmpty) {
				alert('하나 이상의 좌석을 선택해주세요.');
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
							<span>영화 예매하기 - 4. 좌석 선택</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" value="${mv.title }" readonly="readonly"/>
										<input type="text" value="${th.th_name }" readonly="readonly"/>
										<input type="text" value="${screen_date }" readonly="readonly"/>
										<%
											char[] rows = new char[15];
											char a = 'A';
											for(int i=0; i<rows.length; i++) {
												rows[i] = a++;
											}
											pageContext.setAttribute("rows", rows);
										%>
										<table>
											<thead>
												<tr>
													<td colspan="21">S&nbsp;&nbsp;C&nbsp;&nbsp;R&nbsp;&nbsp;E&nbsp;&nbsp;E&nbsp;&nbsp;N</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<c:forEach var="i" begin="0" end="20" step="1">
														<c:if test="${i eq 0 }">
															<td></td>
														</c:if>
														<c:if test="${i ne 0 }">
															<td>${i }</td>
														</c:if>
													</c:forEach>
												</tr>
												<c:forEach var="row" begin="0" end="${fn:length(rows) - 1 }" step="1">
													<tr>
														<td>${rows[row] }</td>
														<c:forEach var="col" begin="0" end="19" step="1">
															<c:set var="seat" value="${seatMap[row][col] }" />
															<td>
																<c:if test="${not empty seat.sc_idx }">
																	<c:if test="${seat.isbooked eq 'isbooked' }">
																		<div class="booked-seat"></div>
																	</c:if>
																	<c:if test="${seat.isbooked ne 'isbooked' }">
																		<input type="checkbox" id="${rows[row] }${col+1 }" name="seat" value="${rows[row] },${col+1 }" />
																	</c:if>
																</c:if>
																<c:if test="${empty seat.sc_idx }">
																	<div class="empty-seat"></div>
																</c:if>
															</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div>
										<input type="hidden" name="cmd" value="booking_payment_page" />
										<input type="button" value="좌석 선택" onclick="choose_seat(this.form)" />
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