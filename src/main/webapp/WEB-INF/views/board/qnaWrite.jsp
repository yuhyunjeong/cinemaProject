<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			th {
				text-align: center;
			}
			.contentForm{
				width: 1000px;
				height: 500px;
			}
			table{
				width: 1000px;
				height: 100%;
				margin-left:auto; 
    			margin-right:auto;
			}
			input, textarea{
				width: 100%;
				height: 100%;
				background: transparent;
				border: solid 1px white;
			}
			.write{
				width: 100px;
				height: 30px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h2>문의글 작성하기</h2>
			<form method="post" action="${pageContext.request.contextPath}/board/qnaInsert">
		    	<table class="board_view">
			        <colgroup>
			            <col width="15%">
			            <col width="35%">
			            <col width="15%">
			            <col width="*">
			        </colgroup>
			        
			        <tbody>
			            <tr>
			                <th>제목</th>
			                <td colspan="2"><input type="text" name="title"> </td>
			            </tr>
			            <tr>
			                <th>작성자</th>
			                <td><input type="hidden" name="id" value="${member.id}">${member.id}</td>
			            </tr>
			            <tr class="contentForm">
			                <th>내용</th>
			                <td colspan="2">
			                    <textarea rows="20" cols="20" name="content"></textarea>
			                </td>
			            </tr>
			        </tbody>
		    	</table>
		    	<div style="width: 1000px; margin: 0 auto; text-align: right; ">
				<input class="write" type="submit" value="문의하기">
				</div>
		    </form>
		</div>

	</body>
</html>