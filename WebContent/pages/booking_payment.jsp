<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		if(confirm("결제 하시겠습니까?")) {
			location.href="/Gigabox/Controller?cmd=confirm_booking";
			
		} else {
			history.back();
		}
	</script>
</head>
<body>

</body>
</html>