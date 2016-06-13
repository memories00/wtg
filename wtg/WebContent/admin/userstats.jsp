<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<link class="include" rel="stylesheet" type="text/css" href="/wtg/lib/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/wtg/js/jquery.jqplot.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/adminCss.css"/>
<script>
$(function(){
	
	var onecount=${onecount};var twocount=${twocount};var thrcount=${thrcount};
	var fourcount=${fourcount};var fivcount=${fivcount};var sixcount=${sixcount};
	var sevcount=${sevcount};var eigcount=${eigcount};var nincount=${nincount};
	var tencount=${tencount};var elecount=${elecount};var twecount=${twecount};
	//1��° �Է°� (�׷��� ������ id��)
	//2��° �Է°� (�׷������� �� ������ ��)
	$.jqplot ('graph',[[onecount,twocount,thrcount,fourcount,fivcount,sixcount,sevcount,eigcount,nincount,
	                    tencount,elecount,twecount]],
			{
				title : '�湮�� ���',
				axes:{
					xaxis:{
						label:"���� : ��"
					},
					yaxis:{
						label:"�湮�ڼ�"
					}
				}
			});
});
</script>

</head>
<body>
<div id="wrapper">


<div id="contents">
	<div id="section">
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
					<b>���� ���</b>
				</td>
			</tr>
			<tr>
				<td>
					1�� : ${onecount}
				</td>
				<td>
					2�� : ${twocount}
				</td>
				<td>
					3�� : ${thrcount}
				</td>
			</tr>
			<tr>
				<td>
					4�� : ${fourcount}
				</td>
				<td>
					5�� : ${fivcount}
				</td>
				<td>
					6�� : ${sixcount}
				</td>
			</tr>
			<tr>
				<td>
					7�� : ${sevcount}
				</td>
				<td>
					8�� : ${eigcount}
				</td>
				<td>
					9�� : ${nincount}
				</td>
			</tr>
			<tr>
				<td>
					10�� : ${tencount}
				</td>
				<td>
					11�� : ${elecount}
				</td>
				<td>
					12�� : ${twecount}
				</td>
			</tr>
		
		</table>
		</form>
	</div>
</div>


</div>
</body>
</html>