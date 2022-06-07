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
				width: 1000px;
				height: 100%;
				border: solid 1px white;
			}
			textarea{
				width: 1000px;
				height: 100px;
				background: transparent;
				border: solid 1px white;
			}
			table{
				width: 1000px;
				height: 100%;
				margin-left:auto; 
    			margin-right:auto;
    			border: solid 1px white;
			}
			.board_content{
				height: 500px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h2>문의글 상세 화면</h2>
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
			                <td colspan="4">${board.title}</td>
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
			                <th class="board_content">내용</th>
			                <td colspan="3" style="word-break:break-all;">
			                    ${board.content}
			                </td>
			            </tr>
			            <tr>
			            	<td colspan="4">댓글 정보</td>
			            </tr>
			            <tr>
			            	<td>작성자</td><td colspan="2">내용</td>
			            	<td>작성시간</td>
			            </tr>
			            <c:forEach items="${board.replyList}" var="reply">
				            <tr>
				            	<td>${reply.member.id}</td>
				            	<td colspan="2">${reply.content}</td>
				            	<td>
				                	<fmt:parseDate value="${reply.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
							      	<fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
				                </td>
				            </tr>
			            </c:forEach>
			            <tr>
			            	<td colspan="4">댓글 작성</td>
			            </tr>
			        </tbody>
		    </table>
		    <form action="${pageContext.request.contextPath}/board/qnaReplyInsert">
		    	<input type="hidden" name="bno" value="${board.bno}"/>
		    	<textarea rows="20" cols="20" name="content">
		    	</textarea>
		    	<input type="submit" value="작성하기">
		    </form>
		</div>
	</body>
</html>