<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style type="text/css">
	header {
		position: absolute;
		left: 0;
		right: inherit;
		width: 100%;
		z-index: 100;
		display: block;
		min-width: 1100px;
		height: 91px;
		background: #fff;
    	border-bottom: 1px solid #351f67;
	}
	.main-header {
   		background-color: rgba(0,0,0,.3);
   		border-bottom: 1px solid rgba(255,255,255,.2);
	}
	.ci {
		position:absolute;
		left: 50%;
		top: 10px;
		width: 150px;
		height: 90px;
		margin: 0 0 0 -75px;
		padding: 0;
	} 
	.ci a,
	.ci a:visited {
		text-decoration: none;
		outline: none;
	}
	header a {
		text-decoration: none;
		outline: none;
	}
	header a:hover,
	header a:active {
		text-decoration: none;
		color: #999;
	}
	.main-header a,
	.main-header a:active {
		color: #999;
	}
	.main-header a:hover {
		color: #fff;
	}
	header .util-area {
		position: relative;
		width: 1100px;
		margin: 0 auto;
	}
	header .util-area .left-link {
		position: absolute;
		top: 15px;
		left: 0px;
	}
	header .util-area .left-link a{
		display: block;
		float: left;
		vertical-align: top;
		margin-left: 10px;
	}
	header .util-area .right-link {
		position: absolute;
		top: 15px;
		right: 0px;
	}
	header .util-area .right-link a,
	header .util-area .right-link span {
		display: block;
		float: left;
		vertical-align: top;
		margin-left: 10px;
	}
	.main-header .util-area .right-link span {
		color: #999;
	}
	header .link-area {
		position: relative;
		width: 1100px;
		margin: 0 auto;
	}
	nav {
		height: 0;
	}
	nav>ul {
		position: relative;
		width: 1100px;
		margin: 90px auto 0 auto;
	}
	nav>ul>li>a {
		position: absolute;
		top: -38px;
		height: 38px;
		display: block;
		font-size: 20px;
		font-weight: bold;
	}
	.main-header>nav>ul>li>a {
		color: white;
	}
	nav>ul>li:nth-child(1)>a {
		left: 166px;
	}
	nav>ul>li:nth-child(2)>a {
		left: 350px;
	}
	nav>ul>li:nth-child(3)>a {
		right: 350px;
	}
	nav>ul>li:nth-child(4)>a {
		right: 166px;
	}
</style>
<script type="text/javascript">
	var nav_page_move = function(cmd) {
		if (${empty user.m_idx}) {
			alert('로그인이 필요합니다.');
			location.href = '/Gigabox/Controller?cmd=login_page';
			return;
		}
		
		location.href = '/Gigabox/'+cmd;
	}
</script>
<header id="header" class="">
	<h1 class="ci">
		<a href="/Gigabox/Controller?cmd=main_page">
			<jsp:include page="/pages/modules/logo.jsp" />	
		</a>
	</h1>
	<div class="util-area">
		<c:choose>
			<c:when test="${not empty user }">
				<c:if test="${user.m_isadmin eq 'admin'}">
					<div class="left-link">
						<a href="/Gigabox/AdminController?cmd=movie_insert_page">영화+</a>
						<a href="/Gigabox/AdminController?cmd=theater_insert_page">상영관+</a>
						<a href="/Gigabox/AdminController?cmd=schedule_insert_page">상영일정+</a>
					</div>
				</c:if>
				<div class="right-link">
					<span>${user.m_name }님 안녕하세요. </span>
					<a href="/Gigabox/Controller?cmd=logout">로그아웃</a>
					<a href="/Gigabox/Controller?cmd=member_info_page">회원정보</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="right-link">
					<a href="/Gigabox/Controller?cmd=login_page">로그인</a>
					<a href="/Gigabox/Controller?cmd=join_page">회원가입</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="link-area" >
	</div>
	<nav>
		<ul>
			<li>
				<a href="/Gigabox/Controller?cmd=movie_list">영화</a>
			</li>
			<li>
				<a href="#" onclick="nav_page_move('Controller?cmd=booking_select_movie')">예매</a>
			</li>
			<li>
				<a href="#" onclick="nav_page_move('ReviewController?cmd=review_main_page')">리뷰</a>
			</li>
			<li>
				<a href="#" onclick="nav_page_move('Controller?cmd=my_ticket_page')">내 티켓</a>
			</li>
		</ul>
	</nav>
</header>
