<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.top {font-size:11pt; width:940px; border: 1px solid black; float:center;}
#top {height:50px; border: 1px solid black; float:center}
#logo {width:500px; height:50px; border: 1px solid black; float:left; margin-left:10px;}
#info {text-align:right; width:410px; height:50px; border: 1px solid black; float:right; margin-right:10px;}
.content {font-size:13pt; width:940px; border: 1px solid black; float:center;}
#content {width:940px; height:700px; border: 1px solid black; float:center;}
.bottom {font-size:11pt; text-align:center; width:940px; border: 1px solid black; float:center;}
#bottom {height:50px; border: 1px solid black; float:center}
#wrapper {border: 1px solid black; min-width:945px;}
</style>
</head>
<body>
<div id="wrapper">
<!--°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È ≈æ °È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È-->
<div class="top" id="top">

	<div class="top" id="logo">
	∑Œ∞Ì∑Œ∞Ì∑Œ∞Ì∑Œ∞Ì∑Œ∞Ì∑Œ∞Ì∑Œ∑Œ∞Ì∞Ì∞Ì∞Ì∞Ì∞Ì∑Œ∑Œ∑Œ∑Œ§«∑Œ
	</div>
	
	<div class="top" id="info">
		<c:choose>
<c:when test="${sessionScope.memId ne '168456368'}">
	<script>
		alert("¡¢±Ÿ±««—¿Ã æ¯Ω¿¥œ¥Ÿ.");
		location.replace("/wtg/main.nhn");
	</script>
</c:when>


<c:otherwise>
</c:otherwise>
</c:choose>
	</div>
	
</div>
<!--°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë ≈æ °Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë-->

<div class="content" id="content">
ΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂ÌΩÊ∂Ì
</div>

<!--°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È πŸ≈“ °È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È°È-->
<div class="bottom" id="bottom" >
<a href="http://localhost:8000/wtg/login.nhn">»∏ªÁº“∞≥</a> &nbsp;
<a href="http://localhost:8000/wtg/login.nhn">∞Ì∞¥ºæ≈Õ</a> &nbsp;
<a href="http://localhost:8000/wtg/login.nhn">ªÁ¿Ã∆Æ∏ </a>
</div>
<!--°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë πŸ≈“ °Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë°Ë-->
</div>
</body>
</html>