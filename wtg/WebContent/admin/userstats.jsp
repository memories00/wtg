<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>
<link class="include" rel="stylesheet" type="text/css" href="/wtg/lib/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/wtg/js/jquery.jqplot.min.js"></script>

<html>

<script>
$(function(){
	
	var onecount=${onecount};var twocount=${twocount};var thrcount=${thrcount};
	var fourcount=${fourcount};var fivcount=${fivcount};var sixcount=${sixcount};
	var sevcount=${sevcount};var eigcount=${eigcount};var nincount=${nincount};
	var tencount=${tencount};var elecount=${elecount};var twecount=${twecount};
	//1번째 입력값 (그려진 영역의 id값)
	//2번째 입력값 (그래프내에 들어갈 데이터 값)
	$.jqplot ('graph',[[onecount,twocount,thrcount,fourcount,fivcount,sixcount,sevcount,eigcount,nincount,
	                    tencount,elecount,twecount]],
			{
				title : '방문자 통계',
				axes:{
					xaxis:{
						label:"단위 : 월"
					},
					yaxis:{
						label:"방문자수"
					}
				}
			});
});
</script>
<script>
function user_Oneday()
{
	document.user.action="/wtg/oneday.nhn"
	document.user.submit();
}
function user_Month()
{
	document.user.action="/wtg/month.nhn"
	document.user.submit();
}
function user_Allday()
{
	document.user.action="/wtg/allday.nhn"
	document.user.submit();
}
</script>
<body>
<div id="wrapper">
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="ad_header">
	<!--<jsp:include page="/include/adminHeader.jsp" flush="false"/>-->
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div id="ad_contents">
	<div id="ad_section">
	<br>
	<br>
		<center><div id="graph" style="width:920px; height:400px; z-index:1"></div></center>
		<form name="user" method="post"  enctype="multipart/form-data">
		<table>
		
			<tr>
				<td>
					<b>Day Total : ${daycount}</b>
				</td>
				<td>
					<b>all Total : ${allcount}</b>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>
					<b>월별 통계</b>
				</td>
			</tr>
			<tr>
				<td>
					1월 : ${onecount}
				</td>
				<td>
					2월 : ${twocount}
				</td>
				<td>
					3월 : ${thrcount}
				</td>
			</tr>
			<tr>
				<td>
					4월 : ${fourcount}
				</td>
				<td>
					5월 : ${fivcount}
				</td>
				<td>
					6월 : ${sixcount}
				</td>
			</tr>
			<tr>
				<td>
					7월 : ${sevcount}
				</td>
				<td>
					8월 : ${eigcount}
				</td>
				<td>
					9월 : ${nincount}
				</td>
			</tr>
			<tr>
				<td>
					10월 : ${tencount}
				</td>
				<td>
					11월 : ${elecount}
				</td>
				<td>
					12월 : ${twecount}
				</td>
			</tr>
		
		</table>
		</form>
	</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="ad_footer">
	<jsp:include page="/include/baseFooter.jsp" flush="false"/>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>
</body>
</html>