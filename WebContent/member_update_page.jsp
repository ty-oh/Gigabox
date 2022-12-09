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
			line-height: 40px;
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
			padding: 10px 0 10px 30px;
		}
		.login-box .detail .inner-wrapper div {
			margin: 10px 0;
		}
		.login-box .detail .inner-wrapper div input {
			display: inline-block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 20px;
		}
		.login-box .detail .inner-wrapper div input[name="id"].not-valid:focus {
			border: 2px solid red;
			background-color: pink;
		}
	</style>
	<script src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		var isPwValid = false;
		
		var update_member = function(f) {
			if (!isPwValid) {
				alert('비밀번호가 틀립니다.');
				return;
			}
			if (f.name.value == '') {
				alert('이름을 입력해주세요.');
				return;
			}
			
			f.action='/Gigabox/Controller';
			f.submit();
		}
		var checkPw = function(pw) {
			$.ajax({
				type:'get',
				url: '/Gigabox/AjaxController',
				data: {
					id_value:id.value,
					cmd:'pw_check',
				},
				success: function(data) {
					changeInputCss(pw, data);
				},
				error: function(data) {
					console.log('error');
				}
			});
		}
		
		var changeInputCss = function(pw, data) {
			var msg = pw.nextSibling.nextSibling;
			
			if(pw.value.length < 4) {
				msg.innerText = '*필수, 4글자 이상 입력하세요.';
				msg.setAttribute('style', 'color:red');
				pw.setAttribute('style', 'border: 2px solid red; background-color:pink');
				pw.setAttribute('class', 'not-valid');
				isPwValid = false;
			} else  {
				msg.innerText = '유효한 비밀번호 입니다.';
				msg.setAttribute('style', 'color:blue');
				pw.setAttribute('style', 'border: 2px solid skyblue; background-color:skyblue');
				pw.setAttribute('class', 'not-valid');
				isPwValid = true;
			} 			
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
							<span>회원 정보 수정</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" name="id" placeholder="아이디" readonly="readonly"/>
									</div>
									<div>
										<input type="password" name="pw" placeholder="비밀번호" onkeyup="checkPw(this)"/>
										<span></span>
									</div>
									<div>
										<input type="text" name="name" placeholder="이름"/>
										<span>*필수</span>
									</div>
									<div>
										<input type="tel" name="phone" placeholder="전화번호"/>
										<span>*필수</span>									
									</div>
									<div>
										<input type="email" name="email" placeholder="이메일"/>
										<span></span>
									</div>
									<div>
										<input type="hidden" name="cmd" value="update_member">
										<input type="button" value="정보수정" onclick="update_member(this.form)" />
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