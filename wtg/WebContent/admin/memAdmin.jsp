<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memAdmin</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.memId ne '168456368'}">
	<script>
		alert("접근권한이 없습니다.");
		location.replace("/wtg/main.nhn");
	</script>
</c:when>


<c:otherwise>
	<script type="text/javascript">
	function userList() {
    	alert("logout");
		Kakao.API.request({
			url: '/v1/user/ids',
			success: function(res){
				
				alert(accessToken);
				
				alert("logout-success");
				alert("로그아웃됨");
				$("#kakao-profile").text("");
			},
			fail: function(error){
			console.log(error);
			}
		});
	};
	</script>
</c:otherwise>
</c:choose>
</body>
</html>