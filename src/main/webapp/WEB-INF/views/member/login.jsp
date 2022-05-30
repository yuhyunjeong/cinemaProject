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
<body>
<div class="col-sm-6, container">
	<h1>로그인 페이지 입니다.</h1>

	<form>
		<fieldset>
			
			<div class="form-group">
				<label for="exampleInputEmail1" class="form-label mt-4">Email
					address</label> <input type="email" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="Enter email"> <small id="emailHelp"
					class="form-text text-muted">We'll never share your email
					with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
				<input type="password" class="form-control"
					id="exampleInputPassword1" placeholder="Password">
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>