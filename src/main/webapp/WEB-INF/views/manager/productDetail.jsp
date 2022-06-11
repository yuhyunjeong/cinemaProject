<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[value=수정하기]").click(function() {
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/manager/productUpdateForm");
			$("#requestForm").submit();
		});
		
		$("input[value=수정하기]").click(function() {
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/manager/productDelete");
		});

	}); // ready end 
</script>
</head>
<body>
	<h1>productDetail 페이지 입니다.</h1>
	
	<c:set var="movie" value="${requestScope.movie}"/>
	<c:set var="food" value="${requestScope.food}"/>
	<c:set var="gift" value="${requestScope.gift}"/>

	<c:choose>
		<c:when test="${movie eq requestScope.movie}">
		<h1>movieDetail 페이지 입니다.</h1>
			<table>
				<tr>
					<th>영화코드</th>
					<td>${movie.movieCode}</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>${movie.movieName}</td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td>${movie.movieSummary}</td>
				</tr>		
				<tr>
					<th>러닝타임</th>
					<td>${movie.movieRunningtime}</td>
				</tr>
				<tr>
					<th>상영시작일</th>
					<td>${movie.movieStartdate}</td>
				</tr>
				<tr>
					<th>상영종료일</th>
					<td>${movie.movieEnddate}</td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td>${movie.movieAge}</td>
				</tr>		
				<tr>
					<th>장르</th>
					<td>${movie.movieGenre}</td>
				</tr>	
				<tr>
					<th>포스터</th>
					<td>${movie.movieImage}</td>
				</tr>					
				<tr>
					<th>출연진</th>
					<td>${movie.actorList}</td>
				</tr>					
				
			</table>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<form name="requestForm" method="post" id="requestForm">
					<input type="hidden" name="movieCode" value=${movie.movieCode}>
					<input type="button" class="btn btn-secondary" id="movieUpdate" value="수정하기">
					<input type="button" class="btn btn-secondary" id="movieDelete" value="삭제하기">
				</form>
			</div>
		</c:when>
		<c:when test="${food eq requestScope.food}">
			<table>
				<tr>
					<th>먹거리코드</th>
					<td>${food.foodCode}</td>
				</tr>
				<tr>
					<th>먹거리이름</th>
					<td>${food.foodName}</td>
				</tr>
				<tr>
					<th>먹거리가격</th>
					<td>${food.foodPrice}</td>
				</tr>		
				<tr>
					<th>먹거리사진</th>
					<td>${food.foodImage}</td>
				</tr>
			</table>
		</c:when>
		<c:when test="${gift eq requestScope.gift}">
			<table>
				<tr>
					<th>사은품코드</th>
					<td>${gift.giftCode}</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>${gift.movie}</td>
				</tr>
				<tr>
					<th>사은품이름</th>
					<td>${gift.giftName }</td>
					
				</tr>
				<tr>
					<th>사은품수량</th>
					<td>${gift.giftQty}</td>
				</tr>									
			</table>
		</c:when>
	</c:choose> 
	
	<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/manager/product">상품목록으로 돌아가기</a>&gt;</span></div>
	
</body>
</html>