<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


</style>

</head>
<body>


	<div class="card border-primary mb-3" >
		<div class="card-header">${member.name} 님</div>
		<div class="card-body">
			<p class="card-text">
			
			<div class="row">
				<div class="col">
				<p>
					<c:choose>
					<c:when test="${member.grade==0}">
			   			일반 회원
			   		</c:when>
					<c:when test="${member.grade==1}">
			   			VIP
			   		</c:when>
					<c:when test="${member.grade==2}">
			   			VVIP
			   		</c:when>
				</c:choose>
				</p>
				<p>
				<fmt:parseDate value="${member.regdate}"
					pattern="yyyy-MM-dd'T'HH:mm:ss" var="memDate" />
				<fmt:formatDate value="${memDate}" pattern="yyyy-MM-dd" />
				가입
				</p>
				<p>${member.point} point
				</p>
				</div>
				
				
			</div>
				
		

		</div>
	</div>



</body>
</html>