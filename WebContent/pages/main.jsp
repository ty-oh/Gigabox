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
			color
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
		.main_section01 .bg:before {
			content: '';
		    display: block;
		    position: absolute;
		    left: 0;
		    top: 0;
		    z-index: 2;
		    width: 100%;
		    height: 100%;
		    background: linear-gradient(to right, rgba(85,63,5,1) 0%, rgba(23,17,1,0) 50%, rgba(85,63,5,1) 100%);
		}
		.main_section01 .bg .bg-pattern {
		    position: absolute;
   			left: 0;
   			top: 0;
   			z-index: 3;
   			width: 100%;
   			height: 100%;
   			background: url(/movie_images/bg-movie-detail-pattern.png) repeat 0 0;
		}
		.main_section01 .bg img {
			display: block;
			width: 100%;
			filter: blur(15px);
			border:0;
		}
		.main_section01 .bg:after {
			content: '';
		    display: block;
		    position: absolute;
		    left: 0;
		    top: 0;
		    right: 0;
		    bottom: 0;
		    z-index: 2;
    		background-color: rgba(3,1,21,0.7);		
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
			position: relative;
			float: left;
			width: 245px;
			margin-left: 40px;
			padding: 0;
		}
		.movie-list > ol li p{
			position: absolute;
			top : 5px;
			left : 10px;
			font-size: 30px;
			font-weight: bold;
			color: white;
		}
		.movie-list > ol li img {
			width: 100%;
			border-radius: 5px;
		}
		.movie-list > ol li .btn-util {
			overflow: hidden;
			position: relative;
			margin-top: 10px;
			padding: 0 0 0 85px;
			text-align: left;
		}
		.movie-list > ol li .btn-util .btn-like {
			position: absolute;
			left: 0;
			top: 0;
			width: 80px;
			height: 36px;
			line-height: 34px;
			margin: 0;
			padding: 0 5px;
			color: #fff;
			font-size : 20px;
			border-color: #555;
			background-color: rgba(0, 0, 0, 0.4);
		}
		.movie-list > ol li .btn-util div .button {
			display: block;
			float: left;
			width: 100%;
			margin: 0;
			padding: 0;
			border-radius: 4px;
			color: #fff;
			line-height: 36px;
			border: 0;
			background: #037b94;
		}
	</style>
	<script type="text/javascript">
		onload = function() {
			var header = document.getElementsByTagName('header')[0];
			header.setAttribute('class', 'main-header');
		}
	</script>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp" />
		<div class="main-container">
			<div class="contents">
				<div class="main-page">
					<div class="main_section01">
						<div class="bg">
							<div class="bg-pattern"></div>
							<img alt="" src="/movie_images/${mvList.get(0).mv_image_main }">
						</div>
						<div class="cont-area">
							<div class="tab-sorting">
								<button type="button">최근 상영작</button>
							</div>
							<a href="#" class="more-movie" title="더 많은 영화보기">더 많은 영화보기 +</a>
							<div class="movie-list">
								<ol>
									<c:choose>
										<c:when test="${not empty mvList }">
											<c:forEach var="i" begin="0" end="3" step="1">
												<c:choose>
													<c:when test="${mvList.size() gt i }">
														<li>
															<p>${i + 1 }</p>
															<a href="Controller?cmd=movie_page&mv_idx=${mvList.get(i).mv_idx }" class="movie-info">
																<img alt="영화 포스터" src="/movie_images/${mvList.get(i).mv_image_main }" />
															</a>
															<div class="btn-util">
																<button type="button" class="button btn-like">♡</button>
																<div>
																	<a href="#" class="button gblue">예매</a>																
																</div>
															</div>
														</li>
													</c:when>
													<c:otherwise>
														<li>최근 상영작이 없습니다.</li>
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
					<div class="main_section02">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
