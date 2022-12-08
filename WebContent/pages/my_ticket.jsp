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
			padding: 40px 0 0 0;
		}
		.inner-wrapper {
			width: 1100px;
			margin: 0 auto;
		}
		.inner-wrapper .contents-title{
			width: 100%;
			height: 100px;
			position: relative;
		}
		.inner-wrapper .contents-title h1{
			position:absolute;
			top: 20px;
			left: 30px;
			padding-left: 10%;
			font-size: 25px;
		}
		.inner-wrapper .ticket-list ol>li {
			overflow: hidden;
			position: relative;
			width: 70%;
			height: 300px;
			margin: 20px auto;
			border: 1px solid black;
			border-radius: 5px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info img {
			width: 200px;
			margin: 5px;
			display: inline-block;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail {
			position: absolute;
			top: 30px;
			left: 220px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail p {
			font-size: 20px;
			margin: 10px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail .btn-util {
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail .btn-util div{
			display: inline-block;
		}
		
	</style>
	<script type="text/javascript">
		if (${empty user.m_idx}) {
			alert('티켓을 확인하려면 로그인하세요.');
			location.href = '/Gigabox/Controller?cmd=login_page';
		}
	</script>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp" />
		<div class="main-container">
			<div class="contents">
				<div class="inner-wrapper">
					<div class="contents-title">
						<h1>${user.m_name }님이 예매한 티켓</h1>
					</div>
					<div class="ticket-list">
						<ol>
							<c:choose>
								<c:when test="${not empty scList }">
									<c:forEach var="i" begin="0" end="${scList.size() - 1}" step="1">
										<c:set var="mv" value="${mvList.get(i) }"/>
										<c:set var="th" value="${thList.get(i) }"/>
										<c:set var="sc" value="${scList.get(i) }"/>
										<li>
											<div class="ticket-info">
												<img alt="${mv.title }" src="/movie_images/${mv.mv_image_main }">
												<div class="detail">
													<p>영화 제목 : ${mv.title }</p>
													<p>상영시간 : ${sc.screen_date }</p>
													<p>상영관 : ${th.th_name }</p>
													<p>좌석 : ${sc.th_row }행 ${sc.th_col }열</p>
													<div class="btn-util">
														<div class="review-btn">
															<a href="#" class="button purple">리뷰</a>
														</div>
														<div class="cancle-btn">
															<a href="#" class="button purple">취소</a>
														</div>
													</div>											
												</div>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li><h1>예매한 티켓이 없습니다.</h1></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>