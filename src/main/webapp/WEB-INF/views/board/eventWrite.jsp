<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="member"/>
			<script type="text/javascript">
				if("${member.role}" != "ROLE_ADMIN"){
					alert("관리자 접근가능");
					location.href = "${pageContext.request.contextPath}/board/qna";
				}
			</script>
			<div class="container">
				<h2>이벤트글 작성하기</h2>
				<form method="post" action="${pageContext.request.contextPath}/board/eventInsert" enctype="multipart/form-data">
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
				                <th>첨부파일</th>
				                <td><input type="file" name="file"/></td>
				            </tr>
				        </tbody>
			    	</table>
			    	<div style="width: 1000px; margin: 0 auto; text-align: right; ">
						<input class="write" type="submit" value="작성하기">
					</div>
			    </form>
			</div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<script type="text/javascript">
				$(function() {
					function anonymous() {
						alert("관리자 접근가능");
						location.href = "${pageContext.request.contextPath}/board/event";
					}
					anonymous();
				})
			</script>
		</sec:authorize>

	</body>
</html>