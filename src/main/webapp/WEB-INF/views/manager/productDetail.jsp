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
/* 		$("input[value=수정하기]").click(function() {
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/manager/productUpdateForm");
			$("#requestForm").submit();
		}); */
		
		$("input[value=수정하기]").click(function() {
			$("#requestForm1").attr("action", "${pageContext.request.contextPath}/manager/MovieUpdateForm");
			$("#requestForm1").submit();
		});
		
		$("input[value=수정하기]").click(function() {
			$("#requestForm2").attr("action", "${pageContext.request.contextPath}/manager/FoodUpdateForm");
			$("#requestForm2").submit();
		});
		
		$("input[value=수정하기]").click(function() {
			$("#requestForm3").attr("action", "${pageContext.request.contextPath}/manager/GiftUpdateForm");
			$("#requestForm3").submit();
		});
		
		$("input[value=삭제하기]").click(function() {
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/manager/productDelete");
		});

	}); // ready end 
</script>
</head>
<body>
	<!-- <h1>productDetail 페이지 입니다.</h1> -->
	<%-- test = ${item} / ${kind} <br> --%> 
	<c:choose>
	
		<c:when test="${kind=='movie'}">
			<%-- 영화 : ${item} --%>
			<h1>movieDetail 페이지 입니다.</h1>
			<table>
				<tr>
					<th>영화코드</th>
					<td>${item.movieCode}</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>${item.movieName}</td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td>${item.movieSummary}</td>
				</tr>		
				<tr>
					<th>러닝타임</th>
					<td>${item.movieRunningtime}</td>
				</tr>
				<tr>
					<th>상영시작일</th>
					<td>${item.movieStartdate}</td>
				</tr>
				<tr>
					<th>상영종료일</th>
					<td>${item.movieEnddate}</td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td>${item.movieAge}</td>
				</tr>		
				<tr>
					<th>장르</th>
					<td>${item.movieGenre}</td>
				</tr>	
				<tr>
					<th>포스터</th>
					<td>${item.movieImage}</td>
				</tr>					
				<tr>
					<th>출연진</th>
					<td>${item.actorList}</td>
				</tr>					
				
			</table>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<form name="requestForm1" method="post" id="requestForm1">
					<input type="hidden" name="movieCode" value="${item.movieCode}">
					<%-- <button value="${item.movieCode}" onclick="location.href='${contextPath.reqeust.contextPath}/manager/productUpdate'">수정하기</button> --%>
					<input type="button" class="btn btn-secondary" id="movieUpdate" value="수정하기">
					<input type="button" class="btn btn-secondary" id="movieDelete" value="삭제하기">
				</form>
			</div>
		</c:when>
		
		<c:when test="${kind=='food'}">
			<%-- 먹거리 : ${item} --%>
			<h1>foodDetail 페이지 입니다.</h1>
			<table>
				<tr>
					<th>먹거리코드</th>
					<td>${item.foodCode}</td>
				</tr>
				<tr>
					<th>먹거리이름</th>
					<td>${item.foodName}</td>
				</tr>
				<tr>
					<th>먹거리가격</th>
					<td>${item.foodPrice}</td>
				</tr>		
				<tr>
					<th>먹거리사진</th>
					<td>${item.foodImage}</td>
				</tr>
			</table>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<form name="requestForm2" method="post" id="requestForm2">
					<input type="hidden" name="foodCode" value="${item.foodCode}">
					<input type="button" class="btn btn-secondary" id="foodUpdate" value="수정하기">
					<input type="button" class="btn btn-secondary" id="foodDelete" value="삭제하기">
				</form>
			</div>
		</c:when>

		<c:when test="${kind=='gift'}">
	<%-- 		사은품 : ${item} --%>
			<h1>giftDetail 페이지 입니다.</h1>
			<table>
				<tr>
					<th>사은품코드</th>
					<td>${item.giftCode}</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>${item.movie.movieName}</td>
				</tr>
				<tr>
					<th>사은품이름</th>
					<td>${item.giftName}</td>
					
				</tr>
				<tr>
					<th>사은품수량</th>
					<td>${item.giftQty}</td>
				</tr>									
			</table>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<form name="requestForm3" method="post" id="requestForm3">
					<input type="hidden" name="giftCode" value="${item.giftCode}">
					<input type="button" class="btn btn-secondary" id="giftUpdate" value="수정하기">
					<input type="button" class="btn btn-secondary" id="giftDelete" value="삭제하기">
				</form>
			</div>
		</c:when>				
	</c:choose>

	
</body>
</html>