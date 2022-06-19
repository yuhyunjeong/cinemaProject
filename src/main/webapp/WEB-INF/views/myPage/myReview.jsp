<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
.mb-3{
 	margin: auto;
}

.nav-item{
	margin: auto;
}
</style>
<script type="text/javascript">
	$(function() {
		function starRating() {	
		  	var rating = $('.rating');
		  	rating.each(function() {
				var targetScore = $(this).attr('data-rate');
				
				$(this).find('i:nth-child(-n+'+targetScore+')').css({color:'gold'});
				
			});
		}
		starRating();
	});
</script>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="sessionMember" property="principal" />
		<script type="text/javascript">
		

		</script>
			<div class="col-sm-6, container" style="text-align: center;">
				<h1>My Review</h1>
				<br>
				
				<ul class="nav nav-pills" style="width: 400px; margin: auto;">
					<li class="nav-item"><a name="btn" value="order"
						class="nav-link" href="${pageContext.request.contextPath}/mypage/myPage/${sessionMember.id}">예매내역</a></li>
					<li class="nav-item"><a name="btn" value="review"
						class="nav-link active" href="#">후기</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">회원정보</a>
						<div class="dropdown-menu" style="">
							<a class="dropdown-item" name="btn" value="update"
								href="${pageContext.request.contextPath}/mypage/updateForm/${sessionMember.id}">수정</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" name="btn" value="delete"
								href="${pageContext.request.contextPath}/mypage/memberDelete/${sessionMember.id}">탈퇴</a>
						</div></li>
				</ul>
		<br>
		
		</div>
		
		<div class="row" style="text-align: center;">

			<table class="table table-hover" style="width: 1000px; text-align: center; margin: 0 auto;">
				<thead>
					<tr>
						<th scope="col">영화</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
						<th scope="col">별점</th>	      
					</tr>
				</thead>
				<tbody class="reviewList">	
					<c:forEach items="${requestScope.list}" var="review">
						<tr class="table-active">
							<td scope="row">${review.movie.movieName}</td>
							<td>${review.content}</td>
							<td>
								<fmt:parseDate value="${review.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
								<fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>
								<div class="rating" data-rate="${review.sratRating}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>	
								</div>
							</td>
						</tr>
			  		</c:forEach>
				</tbody>
			</table>
		</div>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<script type="text/javascript">
			$(function(){			
					
				alert('로그인 후 접속할 수 있습니다.');
				location.href="${pageContext.request.contextPath}/";
			
			})
		</script>
	
	</sec:authorize>

</body>
</html>