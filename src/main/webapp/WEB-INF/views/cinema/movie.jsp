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
	<h1>영화목록 페이지 입니다.</h1>
	<h2>예매율순, 최신순, 관람객순으로 정렬 - ajax</h2>

	<fieldset class="form-group" style="padding-left: 80%">
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios1"
				value="option1" checked=""> 예매율순
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios2"
				value="option2"> 최신순
			</label>
		</div>
		<div class="form-check disabled">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios3"
				value="option3"> 관람객순
			</label>
		</div>
	</fieldset>



	<div class='container mb-4'>
		<div id='rrr' class='row row-cols-1 row-cols-md-4 g-4'>
			<div class="col-lg-3 col-md-6">
				<div class="card mb-3 h-100">
					<div class="card-body">
						<h4 class="card-title">영화</h4>
						<h6 class="card-subtitle mb-2 text-muted">이미지 넣을예정</h6>
						<a href="#" class="card-link">Card link</a>
						<hr>
						<p class="card-text">영화 제목</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>