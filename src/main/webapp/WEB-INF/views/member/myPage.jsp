<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<body>
	<h1>${member.name}님의 마이페이지 입니다.</h1> <p>
	잔여 포인트 : ${member.point} <p>
	아이디 : ${member.id} <p>
	비밀번호 : ${member.password} <p> 
	연락처 : ${member.phone} <p>

	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" href="#">예매내역</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">후기</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">회원정보</a>
			<div class="dropdown-menu" style="">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/member/updateForm">수정</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/member/delete">탈퇴</a>
			</div></li>
	</ul>
	
	<h1>예매내역 목록</h1>
</body>
</html>