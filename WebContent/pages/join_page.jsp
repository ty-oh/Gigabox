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
		var isIdValid = false;
		var isPwValid = false;
		var isPwChecked = false;
		var isDuplicate = false;
		
		var join = function(f) {
			if (!isIdValid) {
				alert('아이디가 유효하지 않습니다.');
				return;
			}
			if (!isPwValid) {
				alert('비밀번호가 유효하지 않습니다.');
				return;
			}
			if (!isPwChecked) {
				alert('비밀번호 확인이 같지 않습니다.');
				return;
			}
			if (f.name.value == '') {
				alert('이름을 입력해주세요.');
				return;
			}
			if (f.phone.value == '') {
				alert('전화번호를 입력해주세요.');
				return;
			}
			
			f.action='/Gigabox/Controller';
			f.submit();
		}
		var checkId = function(id) {
			$.ajax({
				type:'get',
				url: '/Gigabox/AjaxController',
				data: {
					id_value:id.value,
					cmd:'id_duplicate_check',
				},
				success: function(data) {
					console.log(data);
					changeInputCss(id, data);
				},
				error: function(data) {
					console.log('error');
				}
			});
		}
		
		var changeInputCss = function(id, data) {
			var msg = id.nextSibling.nextSibling;
			var isDuplicate = data;
			
			if(id.value.length < 3) {
				msg.innerText = '*필수, 3글자 이상 입력하세요.';
				msg.setAttribute('style', 'color:red');
				id.setAttribute('style', 'border: 2px solid red; background-color:pink');
				id.setAttribute('class', 'not-valid');
				isIdValid = false;
			} else if (isDuplicate == 'true') {
				console.log(isDuplicate);
				msg.innerText = '중복된 아이디가 있습니다.';
				msg.setAttribute('style', 'color:red');
				id.setAttribute('style', 'border: 2px solid red; background-color:pink');
				id.setAttribute('class', 'not-valid');
				isIdValid = false;
			} else {
				msg.innerText = '유효한 아이디 입니다.';
				msg.setAttribute('style', 'color:blue');
				id.setAttribute('style', 'border: 2px solid skyblue; background-color:skyblue');
				id.setAttribute('class', 'not-valid');
				isIdValid = true;
			} 
		}
		
		var checkPw = function(pw) {
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
		
		var checkPwSame = function(pwCheck) {
			var pw = pwCheck.parentNode.previousSibling.previousSibling.childNodes[1];
			var msg = pwCheck.nextSibling.nextSibling;
			
			console.log(pw);
			if(pw.value != pwCheck.value) {
				msg.innerText = '비밀번호가 같지 않습니다.';
				msg.setAttribute('style', 'color:red');
				pwCheck.setAttribute('style', 'border: 2px solid red; background-color:pink');
				pwCheck.setAttribute('class', 'not-valid');
				isPwChecked = false;
			} else  {
				msg.innerText = '확인 완료.';
				msg.setAttribute('style', 'color:blue');
				pwCheck.setAttribute('style', 'border: 2px solid skyblue; background-color:skyblue');
				pwCheck.setAttribute('class', 'not-valid');
				isPwChecked = true;
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
							<span>회원가입</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" name="id" placeholder="아이디" onkeyup="checkId(this)"/>
										<span>*필수, 3글자 이상</span>
									</div>
									<div>
										<input type="password" name="pw" placeholder="비밀번호" onkeyup="checkPw(this)"/>
										<span>*필수, 4글자 이상</span>
									</div>
									<div>
										<input type="password" name="pwCheck" placeholder="비밀번호확인" onkeyup="checkPwSame(this)"/>
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
										<input type="hidden" name="cmd" value="join">
										<input type="button" value="회원가입" onclick="join(this.form)" />
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