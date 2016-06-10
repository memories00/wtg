<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/mainCss.css"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
<!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link href="sample/assets/css/bootstrap.min.css" rel="stylesheet">
     <!-- Prettyphoto -->
	<link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="sample/css/font-awesome.min.css">
    <!--Line icon font -->
    <link rel="stylesheet" href="sample/css/line-icons.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="sample/css/animate.css">
    <!-- Prettyphoto -->
    <link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="sample/css/style.css">
    <!-- color style -->
    <link rel="stylesheet" href="sample/css/presets/maincolor.css">
    <!-- Responsive styles-->
    <link rel="stylesheet" href="sample/css/responsive.css">
    <!-- circle counter -->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

</head>
<body>

<div id=header>
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<div style="width:100%; height:80px;"></div>
<div id=firstLine style="background-color:silver; width:100%; height:30px; display:table-cell; vertical-align:middle">
	<div style="float:left"><a href="main.nhn">홈</a> </div>
	<div style="float:left">테마별 코스 ></div>
	<div style="float:left">${category}</div>
</div>

<div id="alignbutton" style="background-color:pink; align:left">
	<input type="button" value="최신순" onClick="javascript:location.href='themeList.nhn?cate=${category}'">
    <input id="readBtn" type="button" value="조회순" onClick="javascript:location.href='themeList.nhn?cate=${category}&a=1'">
    <input id="goodBtn" type="button" value="추천순" onClick="javascript:location.href='themeList.nhn?cate=${category}&a=2'"></td>
</div>

<div id="list" style="background-color:skyblue; align:left">
    <c:forEach var="list" items="${list}">
   		<a href="courseView.nhn?num=${list.num}"> 
	      	<div id="image" >
	      		<img src="http://127.0.0.1:8000/wtg/img/${list.m_image}" style="width:80px; heigth:80px"/>
	      	</div>
	       	<div>
		       	<div>
		       		제목 : ${list.subject}
		       	</div>
	        	<div>
	       			조회수 : ${list.readhit}&nbsp;&nbsp;&nbsp;등록일 : <fmt:formatDate value="${list.regdate}" type="date"/>
	       		</div>
	       		<div>
	       			내용 : 
	       			<!-- 표시되는 내용 글자수를 제한한다 -->
		    		<c:choose> 
			   			<c:when test="${fn:length(list.content) > 40}">
				          	<c:out value="${fn:substring(list.content,0,39)}"/>....
			   			</c:when>
			   			<c:otherwise>
			   				<c:out value="${list.content}"/>
			   			</c:otherwise>
					</c:choose>
	       		</div>
	       		<div>
	       			태그 : ${list.hashtag}
	       		</div>
	       	</div>
	    </a> 
   </c:forEach>
</div>
 
<div>${pagingHtml}</div>

<div id=footer>
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
</div>

</body>
</html>
 
