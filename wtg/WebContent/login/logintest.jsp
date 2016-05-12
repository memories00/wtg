<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
body{text-align:center;}
.top {font-size:11pt; width:940px; border: 1px solid black;}
#top {height:50px; border: 1px solid black;}
#logo {width:500px; height:50px; border: 1px solid black; margin-left:10px;}
#info {text-align:right; width:410px; height:50px; border: 1px solid black; float:right; margin:0 auto;}
.content {font-size:13pt; width:940px; border: 1px solid black; float:center;}
#content {width:940px; height:700px; border: 1px solid black; float:center;}
.bottom {font-size:11pt; text-align:center; width:940px; border: 1px solid black; float:center;}
#bottom {height:50px; border: 1px solid black; float:center}
#wrapper {min-width:940px; border: 1px solid black;}
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
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memId} ¥‘ »Øøµ«’¥œ¥Ÿ!  
			<a id="logout-btn" onclick="window.location='logout.nhn'">
				<img src="/wtg/img/logoutBtn.jpg" width="100"/>
			</a>
		</c:when>
		<c:otherwise>
			<a href="http://localhost:8000/wtg/login.nhn">
				<img src="/wtg/img/loginBtn.jpg" width="100"/>
			</a>
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