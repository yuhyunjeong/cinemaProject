<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	
	function reviewList() {
		console.log($('.hiddenCode').val());
	  	$.ajax({
			url: "${pageContext.request.contextPath}/board/reviewList",
			type: "post", 
			dataType: "json", 
			data:{
				"movieCode":$('.hiddenCode').val()
			}, 
			success: function(list) { 
				let str="";
				$.each(list, function(index, item){
					str+=`<tr>`;
					str+=`<th>${"${item.member.id}"}</th>`;
					str+=`<th>${"${item.content}"}</th>`;
					str+=`<th>${"${item.insertDate}"}</th>`;					
					str+=`<th>
							<div class="rating" data-rate="${'${item.starRating}'}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>	
							</div>
						</th>`;	
					str+=`</tr>`;
					
				});
				//$("tbody").empty();
				$(".reviewList").html(str);
				starRating();
			},
				
				
			error: function(err) {
				
			}
		});  
	}
	reviewList();
	
	function starRating() {	
	  	var rating = $('.rating');
	  	rating.each(function() {
			var targetScore = $(this).attr('data-rate');
			
			$(this).find('i:nth-child(-n+'+targetScore+')').css({color:'gold'});
			
		});
	}
	
	
  	

});

	
</script>
<style type="text/css">
.box-image {
	
}

.box-content {
	
}

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 20px;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
textarea{
	background: transparent;
	border: none; 
	width: 100%; 
	-webkit-box-sizing: border-box; 
	-moz-box-sizing: border-box; 
	box-sizing: border-box;
}
			
.reviewInsert{
	border-collapse: collapse;
	border-spacing: 0;
	border: 1px solid white;
	height: 300px;
	
}
.reviewInsert th,td{
	height: 100%;
	border: 1px solid white;
}

</style>
</head>


<body>

<input type="hidden" class="hiddenCode" value="${movie.movieCode}">


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}"  pattern="yyyy-MM-dd" var="today" />



	<div class="container mt-3">
		<div class="row">
			<div class="col-lg-4 box-image">
				<img src="${path}/img/movie/${movie.movieImage}"
					class="img-fluid img-thumbnail rounded-start"
					style="width: 100%; height: 100%;">

			</div>
			<div class="col-lg-8 box-contents">
				<div class="title">					
					<h2><strong>${movie.movieName}</strong></h2>
					
					<c:choose>						
						<c:when test="${movie.movieStartdate>now}">					
							<span class="badge bg-warning">상영예정</span>						
						</c:when>
						
						<c:otherwise>						
							<c:choose>							
								<c:when test="${movie.movieEnddate<now}">
									<span class="badge bg-success">상영종료</span>
								</c:when>							
								<c:otherwise><span class="badge bg-primary">현재상영중</span></c:otherwise>
							</c:choose>							
						</c:otherwise>					
					</c:choose>						
				
				</div>
				<!-- 			
				<br>
				
				<div class="score">
					<strong class="percent"> 예매율&nbsp; </strong> <span> </span>
				</div>
				 -->
				<hr>
				<div class="spec">
					<dl>
						<dt>배우 &nbsp;</dt>
						<dd class="mActor">${movie.actorList}</dd>
						<dt>장르 &nbsp;</dt>
						<dd class="mGenre">${movie.movieGenre}</dd>
						<dd></dd>
						<dt>등급 &nbsp;</dt>
						<dd class="mAge">${movie.movieAge}세 이상</dd>
						<dt>러닝타임 &nbsp;</dt>
						<dd class="mRunningTime">${movie.movieRunningtime}분</dd>

						<dt>개봉 &nbsp;</dt>
						<dd class="mStartDate">
						<fmt:formatDate value="${movie.movieStartdate}" pattern="yyyy-MM-dd"/>
						</dd>
					</dl>
				</div>
				<span class="like">
					<button type="button" class="btn btn-secondary" 
					onclick="location.href='${pageContext.request.contextPath}/cinema/ticketing'">예매하러 가기</button>
					
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
		<div class="row" style="text-align: center;">
			<h1>Review</h1>

			<table class="table table-hover" style="width: 1000px; text-align: center; margin: 0 auto;">
				<thead>
					<tr>
						<th scope="col">작성자</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
						<th scope="col">별점</th>	      
					</tr>
				</thead>
				<tbody class="reviewList">	
				</tbody>
			</table>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/board/reviewInsert" method="post">
		<table class="reviewInsert" cellspacing="0" style="width: 1000px; text-align: center; margin: 0 auto;">
			<thead>
				<tr>
					<th scope="col">작성자</th>
					<th scope="col">sss</th>
					<th scope="col">별점</th>	      
					<th>
						<div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="sratRating" value="5"/>
							<label for="5-stars" class="fas fa-star"></label>
							<input type="radio" id="4-stars" name="sratRating" value="4"/>
							<label for="4-stars" class="fas fa-star"></label>
							<input type="radio" id="3-stars" name="sratRating" value="3"/>
							<label for="3-stars" class="fas fa-star"></label>
							<input type="radio" id="2-stars" name="sratRating" value="2"/>
							<label for="2-stars" class="fas fa-star"></label>
							<input type="radio" id="1-star" name="sratRating" value="1"/>
							<label for="1-star" class="fas fa-star"></label>
						</div>
					</th>
				</tr>
				<tr>
					<td colspan="4" style="height: 100%">
				    	<textarea rows="20" name="content"></textarea>
					</td>
				</tr>
			</thead>
		</table>
    	<br>
    	<input type="hidden" name="movieCode" value="${movie.movieCode}"/>
		<input type="submit" value="작성하기">
    </form>
</body>
</html>