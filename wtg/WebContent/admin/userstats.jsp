<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<form name="user" method="post"  enctype="multipart/form-data">
<table>

	<tr>
		<td>
			<input type="button" name="oneday" value="일일통계" onClick="user_Oneday()">
		</td>
		<td>
			<input type="button" name="oneday" value="월별통계" onClick="user_Month()">
		</td>
		<td>
			<input type="button" name="oneday" value="전체통계" onClick="user_Allday()">
		</td>
	</tr>
	<tr>
	<td>
	일일통계${daycount}
	</td>
	<td>
	전체통계${allcount}
	</td>
	</tr>
	<tr>
	<td>
	월별통계
	</td>
	</tr>
	<tr>
	<td>
	1월=${onecount}<br />2월=${twocount}<br />3월=${thrcount}<br />4월=${fourcount}<br />5월=${fivcount}<br />6월=${sixcount}<br />
	7월=${sevcount}<br />8월=${eigcount}<br />9월=${nincount}<br />10월=${tencount}<br />11월=${elecount}<br />12월=${twecount}
	</td>
	</tr>

</table>
</form>
</body>
</html>