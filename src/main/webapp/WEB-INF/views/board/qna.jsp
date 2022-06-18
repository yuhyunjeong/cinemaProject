<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table {
			    margin-left:auto; 
			    margin-right:auto;
			}
			td, th {
				text-align: center;
			}
		</style>
		
	</head>
	<body>
		<h2>&nbsp;&nbsp;문의게시판</h2>
		<div>
		<table class="table table-hover" style="width: 1000px;">
		  <thead>
		    <tr>
		      <th scope="col">글번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>    
		    </tr>
		  </thead>
		  <tbody>
			  <c:choose>
			  	<c:when test="${empty requestScope.list}">
			  		<tr>
			  			<td colspan="5" style="text-align: center;">
			  				<b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b>
			  			</td>
			  		</tr>
			  	</c:when>
			  	<c:otherwise>
			  		<c:forEach items="${requestScope.list}" var="qna">
			  			<tr class="table-active">
					      <th scope="row">${qna.bno}</th>
					      <td style="width: 300;"><a href="${pageContext.request.contextPath}/board/qnaDetail/${qna.bno}">${qna.title}</a><b style="font-size: 3px; color: skyblue;">[${qna.replyList.size()}]</b></td>
					      <td>${qna.member.id}</td>
					      <td>
						      <fmt:parseDate value="${qna.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
						      <fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
					      </td>
			  			</tr>
			  		</c:forEach>
			  	</c:otherwise>
			  </c:choose>
		  </tbody>
		</table>
		
		</div>
		<div style="width: 1000px; margin: 0 auto; text-align: right; ">
			<input type="button" class="btn btn-outline-light" value="문의하기" onclick="location.href='${pageContext.request.contextPath}/board/qnaWrite'">
		</div>
		
	</body>
</html>