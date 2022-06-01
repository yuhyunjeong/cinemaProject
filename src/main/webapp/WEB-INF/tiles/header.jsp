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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
	integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
	integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
	crossorigin="anonymous"></script>
<style type="text/css">
#menu {
	text-align: center;
}

.aside {
	float: left
}

.navbar navbar-expand-lg {
	background-color: rgba(255, 255, 255, 0.5);
}

.container-fluid {
	height: 70px;
	background-color: rgba(255, 255, 255, 0.5);
}

.pagination {
	justify-content: center;
}
</style>
</head>
<body>
	<div class="container" style="margin: 5px;">
		<div class="row" style="position: relative;">
			<div class="col-md-8">
				<img src="${pageContext.request.contextPath}/img/KLJ로고.png"
					width="130px" height="100px" />
			</div>
			<div class="col-md-4" style="text-align: right;">

				<button name="mypage" type="button"
					class="btn btn-secondary my-2 my-sm-0" title=""
					data-bs-container="body" data-bs-toggle="popover"
					data-bs-placement="right"
					data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
					data-bs-original-title="Popover Title">마이페이지</button>
				&nbsp;&nbsp;&nbsp;
				<button name="login" type="button"
					class="btn btn-secondary my-2 my-sm-0" title=""
					data-bs-container="body" data-bs-toggle="popover"
					data-bs-placement="right"
					data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
					data-bs-original-title="Popover Title">로그인</button>
				&nbsp;&nbsp;&nbsp;
				<button name="center" type="button"
					class="btn btn-secondary my-2 my-sm-0" title=""
					data-bs-container="body" data-bs-toggle="popover"
					data-bs-placement="right"
					data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
					data-bs-original-title="Popover Title">고객센터</button>
				&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg" name="aa">
		<div class="container-fluid">



			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="#">영화
							<span class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					<li class="nav-item">
						<button type="button" class="btn btn-primary">관리</button>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>