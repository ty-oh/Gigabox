<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
			background-color: lightgray;
		}
		.ci {
			position:absolute;
			left: 50%;
			top: 23px;
			width: 150px;
			height: 90px;
			margin: 0 0 0 -75px;
			padding: 0;
		} 
		.ci a {
			text-decoration: none;
		}
		header .util-area {
			position: relative;
			width: 1100px;
			margin: 0 auto;
		}
		header .util-area .right-link {
			position: absolute;
			top: 15px;
			right: 0px;
		}
		header .util-area .right-link a{
			display: block;
			float: left;
			vertical-align: top;
			margin-left: 10px;
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
</head>
<body>
	<header id="header" class="main-header">
		<h1 class="ci">
			<a href="/Gigabox/Controller?cmd=mainPage">
				<jsp:include page="/pages/modules/logo-main.jsp" />	
			</a>
		</h1>
		
		<div class="util-area">
			<div class="right-link">
				<a href="#">로그인</a>
				<a href="#">회원가입</a>
			</div>
		</div>
		<div class="link-area" >
		</div>
		
		<nav>
			<ul>
				<li>
					<a>영화</a>
				</li>
				<li>
					<a>예매</a>
				</li>
				<li>
					<a>리뷰</a>
				</li>
				<li>
					<a>내 영화</a>
				</li>
			</ul>
		</nav>
		
	</header>
</body>
</html>