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
			font-size: 25px;
		}
		.inner-wrapper .contents-title .search-box {
			position:absolute;
			top: 20px;
			right: 30px;
			border: 1px solid #888;
			border-radius: 4px;
			height: 37.5px;
		}
		.inner-wrapper .contents-title .search-box input {
			border: none;
			height: 100%;
			width: 150px;
			padding: 0 2px;
			margim: 0;
			font-size: 15px;
		}
		.inner-wrapper .contents-title .search-box button {
			height: 100%;
			width: 40px;
			margin: 0;
			border: none;
			background-color: #999;
		}
		.movie-list>ol {
			margin-left: -60px;
		}
		.movie-list>ol:before {
		
		}
		.movie-list>ol>li {
			overflow: hidden;
		    position: relative;
		    float: left;
		    width: 230px;
		    height: 450px;
		    margin: 0 0 30px 60px;
		    padding: 0;
		    background-color: #fff;
		}
		.movie-list>ol>li .movie-info{
			overflow: hidden;
		    display: block;
		    position: relative;
		    height: 331px;
		    text-decoration: none;
		    background-color: #f5f5f5;
		}
		.movie-list>ol>li .movie-info .rank {
		    position: absolute;
		    left: 0;
		    top: 0;
		    width: 230px;
		    height: 150px;
		    padding: 8px 0 0 10px;
		    line-height: 1.1;
		    font-size: 2em;
		    font-style: italic;
		    font-family: Roboto,Dotum,'돋움',sans-serif;
		    font-weight: 300;
		    color: #fff;
		    text-shadow: 2px 2px 2px rgb(0 0 0 / 80%);
		}
		.movie-list>ol>li .movie-info img {
		    width:100%;
		}
		.movie-list>ol>li .title {
		    position: relative;
		    width: 100%;
		    margin: 15px 0 0 0;
		    padding: 0 0 0 30px;
		    line-height: 25px;
		}
		.movie-list>ol>li .reg_date {
			overflow: hidden;
		}
		.movie-list>ol>li .btn-util {
			overflow: hidden;
			position: absolute;
		    left: 0;
		    bottom: 0;
		    width: 100%;
		    height: 36px;
		}
		.movie-list>ol>li .btn-util .btn-like {
		    float: left;
		    width: 72px;
		    margin: 0;
		    padding: 0 5px;
		    font-size: .8667em;
		    border-color: #ebebeb;
		}
		.movie-list>ol>li .btn-util .booking-btn {
			float: left;
		    width: 153px;
		    margin-left: 5px;
		}
		.movie-list>ol>li .btn-util .booking-btn a {
			color: #fff;
		    line-height: 36px;
		    border: 0;
		    background: #503396;
			display: block;
		    float: left;
		    width: 100%;
		    margin: 0;
		    padding: 0;
		}
	</style>
	<script src="./js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		var booking = function(mv_idx) {
			if (${empty user.m_idx}) {
				alert('로그인이 필요한 서비스입니다.');
				location.href = '/Gigabox/Controller?cmd=login_page';
				return;
			}
			
			location.href = '/Gigabox/Controller?cmd=booking_select_theater&mv_idx='+mv_idx;
		}
		
		var favorite = function(target, m_idx, mv_idx) {
			if(m_idx == '') {
				alert('로그인이 필요합니다.');
				location.href = '/Gigabox/Controller?cmd=login_page';
				return;
			}
			
			$.ajax({
				type:'get',
				url:'/Gigabox/AjaxController',
				data:{
					m_idx:m_idx,
					mv_idx:mv_idx,
					cmd:'click_favorite'
				},
				success: function(data) {
					var fav = JSON.parse(data);
					target.childNodes[1].innerText = fav.isClicked? '♡' : '♥';
					target.childNodes[3].innerText = fav.fCnt;
				},
				error: function(data) {
					console.log('error');
				}
			});
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
						<h1>영화목록</h1>
						<div class="search-box">
							<input type="text" placeholder="영화명 검색" />
							<button>검색</button>
						</div>
					</div>
					<div class="movie-list">
						<ol>
							<c:choose>
								<c:when test="${not empty mvList }">
									<c:forEach var="i" begin="0" end="${mvList.size() - 1 }" step="1">
										<c:set var= "mv" value="${mvList.get(i) }"/>
										<c:set var= "fClicked" value="${fClickedList.get(i) }"/>
										<c:set var= "fCnt" value="${fCntList.get(i) }"/>
										<li>
											<div class="movie-info">
												<p class="rank">1</p>
												<a href="Controller?cmd=movie_page&mv_idx=${mv.mv_idx }" class="movie-info">
													<img alt="" src="/movie_images/${mv.mv_image_main }">
												</a>
											</div>
											<div class="title">
												<p>${mv.title }</p>
											</div>
											<div class="date">
												<span class="reg_date">등록일 ${mv.reg_date }</span>
											</div>
											<div class="btn-util">
												<!-- <button class="button btn-like">♡</button> -->
												<button type="button" class="button btn-like" onclick="favorite(this, ${not empty user? user.m_idx: '0' }, ${mvList.get(i).mv_idx })">
													<span id="favoriteHeart">${fClicked ? '♥': '♡' }</span>
													<span id="favoriteCount" class="favorite-count">${fCnt }</span>
												</button>
												<div class="booking-btn">
													<a href="#" class="button purple" onclick="booking(${mv.mv_idx})">예매</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:when>
							</c:choose>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>