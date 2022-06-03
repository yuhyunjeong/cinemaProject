<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>공지사항 게시판</h2>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">글번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		      <th scope="col">조회수</th>	      
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
			  		<c:forEach items="${requestScope.list}" var="notice">
			  			<tr class="table-active">
					      <th scope="row">${notice.bno}</th>
					      <td>${notice.title}</td>
					      <td>${notice.member.id}</td>
					      <td>${notice.insertDate}</td>
					      <td>${notice.readnum}</td>
			  			</tr>
			  		</c:forEach>
			  	</c:otherwise>
			  </c:choose>
		  </tbody>
		</table>
	</body>
</html>