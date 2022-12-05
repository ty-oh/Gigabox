<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
				alert('영문 제목을 입력해주세요.');
				return;
			}
			if (f.main_image == '') {
				alert('메인이미지를 첨부해주세요.');
				return;
			}
			
			f.action = '/Gigabox/MovieController';
			f.submit();
		}
	</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
		<h1>영화 등록하기</h1>
		제목 : <input type="text" name="title"><br/>
		영문 제목 : <input type="text" name="title_eng"><br/>
		줄거리 요약 : <textarea name="summary" rows="10" cols="80" style="resize:none;"></textarea> <br/>
		메인 이미지 : <input type="file" name="image_main"><br/>
		추가 이미지1 : <input type="file" name="image_1"><br/>
		추가 이미지2 : <input type="file" name="image_2"><br/>
		<input type="button" value="영화 등록" onclick="insert_movie(this.form)">
		<input type="reset" value="다시 작성" />
		<input type="hidden" name="cmd" value="insert">
	</form>
</body>
</html>