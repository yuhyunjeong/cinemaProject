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
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
</script>
<style type="text/css">
.box-image {
	
}

.box-content {
	
}
</style>
</head>


<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 box-image">
				<img src="${path}/img/movie/${movie.movieImage}"
					class="img-fluid img-thumbnail rounded-start"
					style="width: 100%; height: 100%;">

			</div>
			<div class="col-lg-8 box-contents">
				<div class="title">
					<h2><strong>${movie.movieName}</strong></h2>	
					<span class="badge bg-primary">현재상영중</span>	
				</div>
				
				<br>
				<div class="score">
					<strong class="percent"> 예매율&nbsp; </strong> <span> </span>
				</div>
				<hr>
				<div class="spec">
					<dl>
						<dt>배우 :&nbsp;</dt>
						<dd class="mActor">${movie.actorList}</dd>
						<dt>장르 :&nbsp;</dt>
						<dd class="mGenre">${movie.movieGenre}</dd>
						<dd></dd>

						<dd class="mAge">${movie.movieAge}세 이상</dd>
						<dd class="mRunningTime">${movie.movieRunningtime}분</dd>

						<dt>개봉 :&nbsp;</dt>
						<dd class="mStartDate">${movie.movieStartdate}</dd>
					</dl>
				</div>
				<span class="like">
					<button type="button" class="btn btn-secondary" href="">예매</button>
					<button type="button" class="btn btn-secondary" href="">후기 작성</button>
				</span>
				<hr>
				<div class="mSummary">${movie.movieSummary}</div>

			</div>
		</div>
		<br>
		<div class="progress">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="75" aria-valuemin="0"
				aria-valuemax="100" style="width: 100%;"></div>
		</div>
		<br>
		<div class="row">
			<h1>후기 목록</h1>
		</div>
	</div>
</body>
</html>