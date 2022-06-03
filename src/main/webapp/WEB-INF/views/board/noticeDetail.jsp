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
			td, th {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h2>게시글 상세 화면</h2>
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
			                <td>${board.title}</td>
			                <th>조회수</th>
			                <td>${board.readnum}</td>
			            </tr>
			            <tr>
			                <th>작성자</th>
			                <td>${board.member.id}</td>
			                <th>작성시간</th>
			                <td>
			                	<fmt:parseDate value="${board.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
						      	<fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
			                </td>
			            </tr>
			            <tr>
			                <th>내용</th>
			                <td colspan="3">
			                    ${board.content}
			                </td>
			            </tr>
			        </tbody>
		    </table>
		</div>
	</body>
</html>