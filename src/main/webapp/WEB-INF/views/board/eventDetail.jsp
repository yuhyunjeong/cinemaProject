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
    			margin:0 auto;
    			border: solid 1px white;
			}
			.board_content{
				height: 500px;
			}
		</style>
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			
			$(function() {
				$("input[value=삭제하기]").click(function() {
					$("#changeForm").attr("action", "${pageContext.request.contextPath}/board/noticeDelete");
					$("#changeForm").submit();
				})
				$("input[value=수정하기]").click(function() {
					$("#changeForm").attr("action", "${pageContext.request.contextPath}/board/noticeUpdateForm");
					$("#changeForm").submit();
				})
			})
		
		</script>
	</head>
	<body>
		<div class="container">
			<h2>이벤트 상세 화면</h2>
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
			                <td colspan="2">${board.title}</td>
			            </tr>
			            <tr>
			                <th>작성시간</th>
			                <td colspan="2">
			                	<fmt:parseDate value="${board.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
						      	<fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
			                </td>
			            </tr>
			        </tbody>
		    </table>
		    <div style="text-align: center;">
		    	<img src="${board.eventPath}">
		    </div>
		    <form id="changeForm" action="#" style="width: 1000px; margin: 0 auto; text-align: right; ">
               	<input type="hidden" name="bno" value="${board.bno}">
               	<input type="button" value="수정하기">
               	<input type="button" value="삭제하기">
            </form>
		    
		</div>
	</body>
</html>