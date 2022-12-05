<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- <link rel="stylesheet" href="../css/common.css"> -->
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
		}
		body, html {
			width:100%;
			height:100%;
			margin:0;
			padding:0;
		}
		.body-wrapper {
			width:100%;
			height:100%;
			padding: 0;
		}
		.main-container {
			min-width: 1100px;
			padding-bottom: 200px;
			width: 100%;
			min-height: 100%;
			padding: 0 0 300px 0;
		}
		.contents {
			width: 100%;
			margin: 0;
		}
		.main-page {
			overflow: hidden;
			position: relative;
			z-index: 1;
			margin-top: 0;
			background-color: #fff;
		}
		.main_section01 {
			display: block;
			position: relative;
			min-height: 880px;
			padding: 0 0 80px 0;
		}
		.main_section01 .bg {
			overflow: hidden;
			position: absolute;
			z-index: 2;
			width: 100%;
			min-width: 1100px;
			height: 100%;
			margin: 0 auto;
		}
		.main_section01 .cont-area {
			overflow: hidden;
			display: block;
			position: relative;
			z-index: 3;
			width: 1100px;
			height: auto;
			margin: 0 auto;
			padding: 0 0 50px 0;
		}
		.main_section01 .tab-sorting {
			margin: 170px 0 20px 0;
			text-align: center;
		}
		.main_section01 .tab-sorting button {
			color: #fff;
			border-bottom: 2px solid rgba(255, 255, 255, 0.2);
			position: relative;
			display: inline-block;
			margin: 0 18px;
			padding: 0 0 5px 0;
			vertical-align: top;
			border: 0;
			background-color:transparent;
		}
		.main_section01 .more-movie {
			display: block;
			position: absolute;
			right: 0;
			top: 177px;
			color: #aaa;
			line-height: 16px;
		}
		.movie-list > ol {
			display: block;
		}
		.movie-list > ol li:nth-child(1) {
			margin-left: 0;
		}
		.movie-list > ol li {
			float: left;
			width: 245px;
			height: 352px;
			margin-left: 40px;
			padding: 0;
			background-color: gray;
		}
	</style>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp" />
		<div class="main-container">
			<div class="contents">
				<div class="main-page">
					<div class="section main_section01">
						<div class="bg">
							<div class="bg-pattern"></div>
							<img alt="" src="">
						</div>
						<div class="cont-area">
							<div class="tab-sorting">
								<button type="button">최근 상영작</button>
							</div>
							<a href="#" class="more-movie" title="더 많은 영화보기">더 많은 영화보기 +</a>
							<div class="movie-list">
								<ol class="list">
									<c:choose>
										<c:when test="${not empty mvList }">
											<c:forEach var="i" begin="0" end="3" step="1">
												<c:choose>
													<c:when test="${mvList.size() gt i }">
														<li>
															<p>${mvList.get(i).title }</p>
															<p>${realPath }/${mvList.get(i).mv_image_main }</p>
															<a href="#" class="movie-info">
																<img alt="영화 포스터" src="${realPath += '/' += mvList.get(i).mv_image_main }" />
															</a>
															<div class="btn-util">
																<button type="button" class="button btn-like"></button>
																<a href="#" class="button gblue">예매</a>
															</div>
														</li>
													</c:when>
													<c:otherwise>
														<li>xxx</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											XXX
										</c:otherwise>
									</c:choose>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
