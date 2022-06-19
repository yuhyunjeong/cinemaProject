<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width:100%}
	#top{
		    vertical-align: top;
		    width: 320px;
		    padding-right: 40px;
		    padding-left: 40px;}
</style>
</head>
<body>
	<table>
		<tr id="a">
			<td colspan="2"><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td id = "top"><tiles:insertAttribute name="top" /></td>
			<td><tiles:insertAttribute name="content" /></td>
		</tr>
		<tr id="b">
			<td colspan="2"><tiles:insertAttribute name="footer" /></td>
		</tr>
		
	</table>
</body>
</html>