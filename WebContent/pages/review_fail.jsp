<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		if (${param.msg eq 'not_empty'}) {
			alert('리뷰는 영화당 한번만 작성할 수 있습니다.');
			location.href = '/Gigabox/Controller?cmd=main_page';
		}
	</script>
</head>
<body>

</body>
</html>