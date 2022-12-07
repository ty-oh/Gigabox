<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		}
		.contents-header {
		    position: relative;
		    z-index: 1;
		    height: 520px;
		    margin: 0 0 40px 0;
		    color: #ccc;
		    background-color: #151515;
		}
		.contents .movie-detail {
			position: relative;
		    z-index: 4;
		    width: 1100px;
		    height: 100%;
		    margin: 0 auto;
		    padding: 77px 0 0 0;
		}
		.contents .movie-detail .title {
		    position: static;
		    left: inherit;
		    top: inherit;
		    width: 800px;
		    padding: 15px 0 0 0;
		    color: #fff;
		    font-size: 40px;
		    font-weight: 400;
		    line-height: 1.2;
		    text-shadow: 2px 2px 10px rgb(0 0 0 / 70%);
		}
		.contents .movie-detail .title-eng {
			width: 800px;
		    padding: 20px 0 0 0;
		    font-size: 25px;
		    font-family: Roboto;
		    color: #fff;
		    line-height: 1.1;
		    overflow: hidden;
		    max-width: 100%;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		}
		.contents .movie-detail .btn-util {
			padding: 20px 0 0 0;
		}
		.contents .movie-detail .btn-util .btn-like {
		    display: inline-block;
		    min-width: 100px;
		    height: 36px;
		    line-height: 34px;
		    margin: 0 6px 0 0;
		    padding: 0 10px;
		    font-size: .9333em;
		    color: #fff;
		    text-decoration: none;
		    text-align: center;
		    border: 1px solid #706f72;
		    border-radius: 4px;
		    background-color: transparent;
		}
		.contents .movie-detail .poster {
			overflow: hidden;
		    display: block;
		    position: absolute;
		    right: 0;
		    top: 45px;
		    z-index: 2;
		    width: 260px;
		    height: 374px;
		}
		.contents .movie-detail .poster .wrap {
			position: relative;
		    width: 100%;
		    height: 100%;
		    font-size: 0;
		    line-height: 0;
		}
		.contents .movie-detail .poster .wrap img {
			display: block;
		    width: 100%;
		    height: 100%;
		    border-radius: 10px;
		}
		.contents .movie-detail .reserve {
		    overflow: hidden;
		    display: block;
		    position: absolute;
		    right: 0;
		    bottom: 45px;
		    width: 260px;
		}
		.contents .movie-detail .reserve a{
			width: 100%;
    		margin: 0;
    		background-color: #329eb1;
    		display: block;
		    float: left;
		    height: 46px;
		    line-height: 44px;
		    font-size: 1.2em;
		    padding: 0;
		    color: #fff;
		    text-align: center;
		    border: 0;
		    border-radius: 5px;
		    text-decoration: none;
		    font-weight: 700;
		}
		.inner-wrapper {
			width: 1100px;
			margin: 0 auto;
		}
		.inner-wrapper .summary-title {
			margin: 0 0 20px 0;
		}
		.inner-wrapper .summary {
			margin: 0 0 20px 0;
		}
		.inner-wrapper .etc-info {
			margin: 0 0 20px 0;
		}
	</style>
</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/pages/modules/header.jsp"></jsp:include>
		<div class="main-container">
			<div class="contents">
				<div class="contents-header">
					<div class="movie-detail">
						<div class="title">${mvvo.title }</div>
						<div class="title-eng">${mvvo.title_eng }</div>
						<div class="btn-util">
							<button class="button btn-like">♡</button>
						</div>
						<div class="info"></div>
						<div class="poster">
							<div class="wrap">
								<img alt="" src="/movie_images/${mvvo.mv_image_main }">
							</div>
						</div>
						<div class="reserve">
							<a>예매</a>
						</div>
					</div>
				</div>
				<div class="inner-wrapper">
					<div class="summary-wrapper">
						<h2 class="summary-title">줄거리 요약</h2>
						<div class="summary">
							${mvvo.summary }
						</div>
						<div class="etc-info">
							<span>등록일 : ${mvvo.reg_date }</span>
						</div>
					</div>
					<div class="">
						
					</div>
				</div>
			</div>
		</div>		
	</div>
</body>
</html>