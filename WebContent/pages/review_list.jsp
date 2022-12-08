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
			padding-left: 15%;
			font-size: 25px;
		}
		.inner-wrapper .ticket-list ol>li {
			overflow: hidden;
			position: relative;
			width: 60%;
			height: 150px;
			margin: 20px auto;
			border: 1px solid black;
			border-radius: 5px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info img {
			width: 90px;
			margin: 5px;
			display: inline-block;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail {
			position: absolute;
			top: 10px;
			left: 100px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .detail p {
			font-size: 20px;
			margin: 10px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .btn-util {
			position:absolute;
			right: 10px;
			bottom: 10px;
		}
		.inner-wrapper .ticket-list ol>li .ticket-info .btn-util div{
			display: inline-block;
		}
		.inner-wrapper .ticket-list ol>li .is-empty {
			height: 100%;
			padding-top: 10%;
			text-align: center;
		}
	</style>
	<script type="text/javascript">
		var delete_review = function(r_idx) {
			if(!confirm('리뷰를 삭제하시겠습니까?')) {
				return;
			}
			
			location.href = '/Gigabox/ReviewController?cmd=delete_review&r_idx='+r_idx;
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
						<h1>${user.m_name }님이 작성한 리뷰</h1>
					</div>
					<div class="ticket-list">
						<ol>
							<c:choose>
								<c:when test="${not empty rList }">
									<c:forEach var="i" begin="0" end="${rList.size() - 1}" step="1">
										<c:set var="mv" value="${mvList.get(i) }"/>
										<c:set var="r" value="${rList.get(i) }"/>
										<li>
											<div class="ticket-info">
												<img alt="${mv.title }" src="/movie_images/${mv.mv_image_main }">
												<div class="detail">
													<p>영화 제목 : ${mv.title }</p>
													<p>한줄평 : ${r.r_content }</p>
													<p>평점 : <c:forEach var="i" begin="1" end="${r.r_score }" step="1">
														☆
													</c:forEach></p>
												</div>
												<div class="btn-util">
													<div class="update-btn">
														<a href="/Gigabox/ReviewController?cmd=review_update_page&r_idx=${r.r_idx }" class="button purple">수정</a>
													</div>
													<div class="delete-btn">
														<a href="#" class="button purple" onclick="delete_review(${r.r_idx})">삭제</a>
													</div>
												</div>											
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