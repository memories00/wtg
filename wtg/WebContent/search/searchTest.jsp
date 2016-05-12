<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<h2>메인.검색폼</h2>

<form action="searchPage.nhn" method="post" name="search">

	<input type="text" name="keyword">
	<input type="submit" value="검색">

</form>


<form action="insertMap.nhn" method="post" name="insertMap">
	<input type="text" name="mem_num">
	<input type="text" name="start0">
	<input type="text" name="pass1">
	<input type="text" name="pass2">
	<input type="text" name="pass3">
	<input type="text" name="end4">
	<input type="submit" value="insert">
</form>