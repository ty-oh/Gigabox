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
			padding: 40px 0 0 0;
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
		.login-box .detail .inner-wrapper div input,
		.login-box .detail .inner-wrapper div select {
			display: inline-block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 20px;
		}
	</style>
	<script type="text/javascript">
		onload = function() {
			var score = document.getElementsByName('r_score')[0];
			
			score.value = ${r.r_score};
		}
	
		var update_review = function(f) {
			if (f.r_content.value == '') {
				alert('한줄평을 입력해주세요.');
				return;
			}
			if (f.r_score.value == '') {
				alert('평점을 선택해주세요.');
				return;
			}
			
			f.action='/Gigabox/ReviewController';
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
							<span>리뷰 수정</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post">
									<div>
										<input type="text" value="${mv.title }" readonly="readonly"/>
									</div>
									<div>
										<img alt="${mv.title }" src="/movie_images/${mv.mv_image_main }">
									</div>
									<div>
										<input type="text" name="r_content" value="${r.r_content }" placeholder="한줄평을 입력해주세요."/>
										<span>*필수</span>
									</div>
									<div>
										<select name="r_score">
											<option value="">:: 평점을 선택해주세요 ::</option>
											<option value="1">☆</option>
											<option value="2">☆☆</option>
											<option value="3">☆☆☆</option>
											<option value="4">☆☆☆☆</option>
											<option value="5">☆☆☆☆☆</option>
										</select>
									</div>
									<div>
										<input type="hidden" name="r_idx" value="${r.r_idx }" />
										<input type="hidden" name="cmd" value="update_review" />
										<input type="button" value="리뷰 수정" onclick="update_review(this.form)" />
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