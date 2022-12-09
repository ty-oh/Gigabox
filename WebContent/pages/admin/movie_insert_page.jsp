<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
			padding: 80px 0 0 0;
		}
		.inner-wrapper {
			width: 1100px;
			margin: 0 auto;
		}
		.form-box {
			width: 500px;
			margin: 0 auto;
			border: 1px solid #503396; 
		}
		.form-box .title {
			width: 100%;
			height: 40px;
			line-height: 40px;
			background-color: #503396;
			padding-left: 30px;
		}
		.form-box .title span {
			font-size: 20px;
			font-weight: bold;
			color: white;
		}
		.form-box .detail .inner-wrapper {
			width: 100%;
			padding: 10px 0 10px 30px;
		}
		.form-box .detail .inner-wrapper div {
			margin: 10px 0;
		}
		.form-box .detail .inner-wrapper div input,
		.form-box .detail .inner-wrapper div select {
			display: inline-block;
			width: 300px;
			height: 46px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid gray;
			padding-left: 20px;
		}
		.form-box .detail .inner-wrapper div textarea {
			color: #000;
			resize:none;
			width:300px;
			height:250px;
			padding: 5px 0 0 5px;
		}
		.form-box .detail .inner-wrapper div input[type="button"]{
			padding-left: 0px;
		}
		.form-box .detail .inner-wrapper div input[type="file"] {
			border:none;
		}
	</style>
	<script type="text/javascript">
		var insert_movie = function(f) {
			if (f.title == '') {
				alert('제목을 입력해주세요.');
				return;
			}
			if (f.title_eng == '') {
				alert('영문 제목을 입력해주세요.');
				return;
			}
			if (f.summary == '') {
				alert('영화 요약을 입력해주세요.');
				return;
			}
			if (f.main_image == '') {
				alert('메인이미지는 반드시 첨부해주세요.');
				return;
			}
			
			f.action = '/Gigabox/AdminController';
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
					<div class="form-box">
						<div class="title">
							<span>영화 등록 하기 &lt;관리자 전용&gt;</span>
						</div>
						<div class="detail">
							<div class="inner-wrapper">
								<form method="post" enctype="multipart/form-data">
									<div>
										<input type="text" name="title" placeholder="영화 제목을 입력해주세요.">
										<span>*필수</span>
									</div>
									<div>
										<input type="text" name="title_eng" placeholder="영어 제목을 입력해주세요.">
										<span>*필수</span>
									</div>
									<div>
										<textarea name="summary" placeholder="영화 요약을 입력해주세요."></textarea>
										<span>*필수</span>
									</div>
									<div>
										메인 이미지 : <input type="file" name="image_main"><br/>
										추가 이미지1 : <input type="file" name="image_1"><br/>
										추가 이미지2 : <input type="file" name="image_2"><br/>
									</div>
									<div>
										<input type="button" value="영화 등록" onclick="insert_movie(this.form)">
										<input type="reset" value="다시 작성" />
										<input type="hidden" name="cmd" value="insert_movie">
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