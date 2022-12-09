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
			padding: 200px 0 0 0;
		}
		.inner-wrapper {
			width: 1100px;
			margin: 0 auto;
		}
		.login-box {
			width: 600px;
			margin: 0 auto;
			border: 1px solid #503396; 
		}
		.login-box .title {
			width: 100%;
			height: 40px;
			background-color: #503396;
			padding-left: 30px;
		}
		.login-box .title span {
			font-size: 20px;
			font-weight: bold;
			color: white;
		}
		.login-box .detail .inner-wrapper {
			width: 100%;
			height: 320px;
			padding: 30px 0 0 30px;
		}
		.login-box .detail .inner-wrapper input[name="id"],
		.login-box .detail .inner-wrapper input[name="pw"],
		.login-box .detail .inner-wrapper input[type="button"] {
			display: block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
		}
		.login-box .detail .inner-wrapper input[name="id"],
		.login-box .detail .inner-wrapper input[name="pw"] {
			border: 1px solid gray;
			margin: 10px 0;
			padding-left: 20px;
		}
		.login-box .detail .inner-wrapper input[type="button"] {
			margin: 10px 0 40px 0;
			border: 1px solid;
			display: block;
			width: 300px;
		}
	</style>
	<script type="text/javascript">
		var login = function(f) {
			if (f.id.value=='') {
				alert('아이디를 입력해주세요.');
				return;
			}
			if (f.id.value=='') {
				alert('비밀번호를 입력해주세요.');
				return;
			}
			
			f.action="/Gigabox/Controller";
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
					<div class="login-box">
						<div class="title">
							<span>로그인</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<input type="text" name="id" placeholder="아이디"/>
									<input type="password" name="pw" placeholder="비밀번호"/>
									<div class="save_id">
										<label for="save_id">아이디 저장</label>
										<input type="checkbox" name="save_id" id="save_id" />
									</div>
									<input type="hidden" name="cmd" value="login">
									<input type="button" value="로그인" onclick="login(this.form)" />
									<div>
										<span>아직 GIGABOX의 회원이 아니신가요? >></span>
										<a href="/Gigabox/Controller?cmd=join_page">회원가입</a>
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