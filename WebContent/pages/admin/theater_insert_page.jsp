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
		.form-box .detail .inner-wrapper div input {
			display: inline-block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 20px;
		}
		.form-box .detail .inner-wrapper div input[type="checkbox"] {
			display: inline-block;
			width: 30px;
			height: 30px;
		}
	</style>
	<script type="text/javascript">
		var insert_theater = function(f) {
			if (f.th_name.value == '') {
				alert('상영관 이름은 필수 입력 사항입니다. ');
				return;
			}
			
			f.action='/Gigabox/AdminController'
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
							<span>상영관 등록 &lt;관리자 전용&gt;</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" name="th_name" placeholder="상영관 이름"/>
										<span>*필수</span>
									</div>
									<div>
										<input type="text" name="price" placeholder="좌석 가격"/>
										<span>*필수</span>
									</div>
									<div>
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
													<td colspan="21">상영관 좌석</td>
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
												<c:forEach var="row" items="${rows }">
													<tr>
														<td>${row }</td>
														<c:forEach var="col" begin="1" end="20" step="1">
															<td>
																<%-- <label for="${row }${col }">${row }${col }</label> --%>
																<input type="checkbox" id="${row }${col }" name="seat" value="${row },${col }" checked="checked" />
															</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div>
										<input type="hidden" name="cmd" value="insert_theater" />
										<input type="button" value="상영관 등록" onclick="insert_theater(this.form)" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/pages/modules/footer.jsp" />
	</div>
</body>
</html>