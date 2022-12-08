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
		    margin: 0 6px 20px 0;
		    padding: 0 10px;
		    font-size: .9333em;
		    color: #fff;
		    text-decoration: none;
		    text-align: center;
		    border: 1px solid #706f72;
		    border-radius: 4px;
		    background-color: transparent;
		}
		.contents .movie-detail .info {
			width: 800px;
		}
		.contents .movie-detail .info .summary {
			margin: 0 0 20px 0;
		}
		.contents .movie-detail .info .r-score {
		
		}
		.contents .movie-detail .info .r-score p,
		.contents .movie-detail .info .r-score span {
			display: inline-block;
			vertical-align: bottom;
		}
		.contents .movie-detail .info .r-score p {
			font-size: 30px;
			font-weight: bold;
			color: #adf;
		}
		.contents .movie-detail .info .r-score span {
			font-size: 20px;
			font-weight: bold;
			color: #adf;
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
		.inner-wrapper .contents-title{
			width: 100%;
			height: 80px;
			position: relative;
		}
		.inner-wrapper .contents-title h1{
			position:absolute;
			top: 20px;
			left: 30px;
			padding-left: 15%;
			font-size: 25px;
		}
		.inner-wrapper .review-list ol>li {
			overflow: hidden;
			position: relative;
			width: 60%;
			height: 75px;
			margin: 5px auto;
			border: 1px solid #777;
			border-radius: 5px;
		}
		.inner-wrapper .review-list ol>li .review-info .user-name {
			position:absolute;
			top: 10px;
			left:10px;
			font-size: 18px;
			font-weight: bold;
		}
		.inner-wrapper .review-list ol>li .review-info .detail {
			position:absolute;
			left: 120px;
		}
		.inner-wrapper .review-list ol>li .review-info .detail p {
			font-size: 18px; 
			margin: 3px;
		}
		.inner-wrapper .review-list ol>li .review-info .btn-util {
			position:absolute;
			right: 10px;
			bottom: 10px;
		}
		.inner-wrapper .review-list ol>li .review-info .btn-util div{
			display: inline-block;
		}
		.inner-wrapper .review-list ol>li .is-empty {
			height: 100%;
			padding-top: 10%;
			text-align: center;
		}
	</style>
	<script type="text/javascript">
		var booking = function(mv_idx) {
			if (${empty user.m_idx}) {
				alert('로그인이 필요한 서비스입니다.');
				location.href = '/Gigabox/Controller?cmd=login_page';
				return;
			}
			
			location.href = '/Gigabox/Controller?cmd=booking_select_theater&mv_idx='+mv_idx;
		}
		var delete_review = function(r_idx) {
			
		}
	</script>
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
						<div class="info">
							<div class="summary">
								${mvvo.summary }
							</div>
							<div class="etc-info">
								<span>등록일 : ${mvvo.reg_date }</span>
							</div>
							<div class="r-score">
								<span>평점</span>
								<p>${rScoreAvg } / 5</p> 
							</div>
						</div>
						<div class="poster">
							<div class="wrap">
								<img alt="" src="/movie_images/${mvvo.mv_image_main }">
							</div>
						</div>
						<div class="reserve">
							<a href="#" onclick="booking(${mvvo.mv_idx})">예매</a>
						</div>
					</div>
				</div>
				<div class="inner-wrapper">
					<div class="contents-title">
						<h1>영화 ${mvvo.title } 실관람 리뷰</h1>
					</div>
					<div class="review-list">
						<ol>
							<c:choose>
								<c:when test="${not empty rList }">
									<c:forEach var="i" begin="0" end="${rList.size() - 1}" step="1">
										<c:set var="m" value="${mList.get(i) }"/>
										<c:set var="r" value="${rList.get(i) }"/>
										<li>
											<div class="review-info">
												<div class="user-name">${m.m_name }</div>
												<div class="detail">
													<p>한줄평 : ${r.r_content }</p>
													<p class="stars">평점 : <c:forEach var="i" begin="1" end="${r.r_score }" step="1">
														★
													</c:forEach></p>
												</div>
												<c:if test="${m.m_idx eq user.m_idx }">
													<div class="btn-util">
														<div class="update-btn">
															<a href="/Gigabox/ReviewController?cmd=review_update_page&r_idx=${r.r_idx }" class="button purple">수정</a>
														</div>
														<div class="delete-btn">
															<a href="#" class="button purple" onclick="delete_review(${r.r_idx})">삭제</a>
														</div>
													</div>											
												</c:if>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li><h1 class="is-empty">작성한 리뷰가 없습니다.</h1></li>
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