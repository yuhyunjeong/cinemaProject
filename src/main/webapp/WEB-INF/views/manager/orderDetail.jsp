<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>orderDetail.jsp 예매 상세정보입니다.</h1>

<div class="card mb-3" style="width: 40rem; display: inline-block">
  <h3 class="card-header">티켓 정보</h3>
  <div class="card-body">
    <h5 class="card-title">예매 코드 : ${requestScope.order.orderCode}</h5>
    <h6 class="card-subtitle text-muted">예매 상태 : 
    	<c:choose>
    		<c:when test="${requestScope.order.orderState==0}">
    			결제 완료
    		</c:when>
    		<c:when test="${requestScope.order.orderState==1}">
    			환불 요청
    		</c:when>
    		<c:when test="${requestScope.order.orderState==2}">
    			환불 완료
    		</c:when>
    	</c:choose>
    </h6>
  </div>
  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="500" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em"></text>
    
    <c:choose>
    <c:when test="${empty requestScope.order.movieOrderline[0].seatPerformance.time.movie.movieImage}">
    	<rect width="100%" height="100%" fill="#868e96"></rect>
    	<text x="50%" y="50%" fill="#dee2e6" dy=".3em">이미지가 없습니다</text>
    </c:when>
    <c:otherwise>
    	<rect width="100%" height="100%" fill="#868e96"></rect>
    	<text x="50%" y="50%" fill="#dee2e6" dy=".3em"></text>
    	<image href="${pageContext.request.contextPath}/img/HarryPotter/${requestScope.order.movieOrderline[0].seatPerformance.time.movie.movieImage}.jpeg" height="100%" width="100%"/>
    </c:otherwise>
    </c:choose>
  </svg>
  <div class="card-body">
    <p class="card-text">매출 정보</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">포인트 사용 금액 : ${requestScope.order.pointPrice}</li>
    <li class="list-group-item">최종 결제 금액 : ${requestScope.order.totalPrice}</li>
    <li class="list-group-item">결제 일시 : 
    	<fmt:parseDate value="${requestScope.order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
    	<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
  </ul>
  <div class="card-body">
    <a href="${pageContext.request.contextPath}/manager/members" class="card-link">회원 아이디 : ${requestScope.order.member.id}</a>
    <a href="#" class="card-link">영화 정보</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>
<div class="card" style="width: 40rem; display: inline-block; vertical-align: top">
  <div class="card-body">
    <h4 class="card-title">Card title</h4>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="card-link">ㅇㅇㅇㅇㅇ</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>

</body>
</html>