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
			<input type="button" name="oneday" value="�������" onClick="user_Oneday()">
		</td>
		<td>
			<input type="button" name="oneday" value="�������" onClick="user_Month()">
		</td>
		<td>
			<input type="button" name="oneday" value="��ü���" onClick="user_Allday()">
		</td>
	</tr>
	<tr>
	<td>
	�������${daycount}
	</td>
	<td>
	��ü���${allcount}
	</td>
	</tr>
	<tr>
	<td>
	�������
	</td>
	</tr>
	<tr>
	<td>
	1��=${onecount}<br />2��=${twocount}<br />3��=${thrcount}<br />4��=${fourcount}<br />5��=${fivcount}<br />6��=${sixcount}<br />
	7��=${sevcount}<br />8��=${eigcount}<br />9��=${nincount}<br />10��=${tencount}<br />11��=${elecount}<br />12��=${twecount}
	</td>
	</tr>

</table>
</form>
</body>
</html>