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
<style type="text/css">
</style>
</head>
<body>
	<div class="col-sm-6, container" style="text-align: center;">
		<h1>카드 가운데 정렬 해야함</h1>

		<div class="card border-secondary mb-3" style="max-width: 40rem;"
			display:inline-block;>
			<div class="card-header">로그인</div>
			<div class="card-body">
				<form action="${pageContext.request.contextPath}/member/login" method="post">


					<div class="form-group">
						<label for="exampleInputId1" class="form-label mt-4">아이디</label>
						<input type="id" class="form-control" id="exampleInputId1" name="id"
							aria-describedby="idHelp" placeholder="아이디를 입력해주세요."> <small
							id="idHelp" class="form-text text-muted">We'll never
							share your email with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
						<input type="password" class="form-control" name="password"
							id="exampleInputPassword1" placeholder="비밀번호를 입력해주세요.">

					</div>
					<br>
					<div>
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
					<br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>