<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card mb-3" style="width: 30rem; display: inline-block;">
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
  <c:set value="${requestScope.order.movieOrderline[0].seatPerformance.time}" var="time"/>
  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="500" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
    <c:choose>
    <c:when test="${empty time.movie.movieImage}">
    	<text x="50%" y="50%" fill="#dee2e6" dy=".3em">이미지가 없습니다</text>
    </c:when>
    <c:otherwise>
    	<image href="${pageContext.request.contextPath}/img/movie/${time.movie.movieImage}.jpeg" height="100%" width="100%"/>
    </c:otherwise>
    </c:choose>
  </svg>
  <div class="card-body">
    <p class="card-text">영화 이름 : ${time.movie.movieName}</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">상영일시 : 
    	<fmt:formatDate value="${time.timeDate}" type="date" />
    	<fmt:formatDate value="${time.timeStart}" pattern="HH:mm"/> - <fmt:formatDate value="${time.timeEnd}" pattern="HH:mm"/>
    </li>
    <li class="list-group-item">상영관 : ${time.screen.screenName}</li>
    <li class="list-group-item">좌석 :
    	<c:forEach items="${requestScope.order.movieOrderline}" var="movieOrderline" varStatus="status">
    	${movieOrderline.seatPerformance.seat.seatRow}${movieOrderline.seatPerformance.seat.seatCol}<c:if test="${status.last eq false}">, </c:if>
  		</c:forEach>
  	</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">영화 정보</a>
    <a href="#" class="card-link">상영관 정보</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>

<!-- 가격정보 -->
<div class="card" style="width: 30rem; display: inline-block; vertical-align: top">
  <h3 class="card-header">가격 정보</h3>
  <div class="card-body">
  	<h5 class="card-title">영화 정보</h5>
  	<h6 class="card-subtitle mb-2 text-muted">
  	<!-- 상영관 종류 page에 저장 -->
  	<c:set var="scr" value="${time.screen.screenName}"/>
	상영관 종류 : ${scr}
	</h6>
    <p class="card-text">
    	<c:choose>
    		<c:when test="${scr eq '일반관'}"><c:set value="8000" var="ticketPrice"/></c:when>
    		<c:when test="${scr eq '특별관'}"><c:set value="10000" var="ticketPrice"/></c:when>
    	</c:choose>
    	좌석 가격 : ${ticketPrice}원<br>
    	<c:set value="${fn:length(requestScope.order.movieOrderline)}" var="ticketQty"/>
    	수량 : ${ticketQty}석 <p>
    	<b>합산가 : ${ticketPrice*ticketQty}원</b>
	</p>
  	<hr>
    <h5 class="card-title">먹거리 정보</h5>
    <p class="card-text">
    	<c:set value="${requestScope.order.foodOrderline}" var="foodOrderline"/>
    	<c:set value="${requestScope.order.movieOrderline[0].withGift}" var="withGift"/>
    	<h6 class="card-subtitle mb-2 text-muted">선택한 옵션 :
	    	<c:if test="${not empty foodOrderline}">
	    		${foodOrderline}
	    	</c:if>
    	</h6>
    	<c:if test="${not empty foodOrderline}">
    		<c:set var="foodTotalPrice" value="0"/>
		  	<c:forEach items="${foodOrderline}" var="foodOrderline" varStatus="status">
		  		이름 : ${foodOrderline.food.foodName}<br>
		  		가격 : ${foodOrderline.food.foodPrice}원<br>
		  		수량 : ${foodOrderline.qty}개<br>
		  		<c:if test="${status.last eq false}">, </c:if>
		  		<c:set var="foodTotalPrice" value="${foodTotalPrice + (foodOrderline.food.foodPrice)*(foodOrderline.qty) }"/>
		  	</c:forEach><p></p>
  			<b>합산가 : ${foodTotalPrice}원</b>
  		</c:if>
    </p>
    
    <hr>
    
    <h5 class="card-title">사은품 정보</h5>
    <p class="card-text">
    	<c:set value="${requestScope.order.foodOrderline}" var="foodOrderline"/>
    	<c:set value="${requestScope.order.movieOrderline[0].withGift}" var="withGift"/>
    	<h6 class="card-subtitle mb-2 text-muted">선택한 옵션 :
	    	<c:if test="${withGift == 'true'}">
	    		사은품
	    	</c:if>
    	</h6>
    	사은품 이름 : ${time.movie.gift.giftName}
    </p>
  </div>
</div>

<!-- 매출정보 -->
<div class="card border-primary mb-3" style="width: 30rem; display: inline-block; vertical-align: top">
  <h3 class="card-header">매출 정보</h3>
  <div class="card-body">
    <h5 class="card-title">구매 정보</h5>
  	<h6 class="card-subtitle mb-2 text-muted">
		결제 일시 : 
    	<fmt:parseDate value="${requestScope.order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
    	<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" />
	</h6>
    <p class="card-text">
    	좌석 가격 : ${ticketPrice*ticketQty}원 <br>
    	먹거리 가격 : ${foodTotalPrice}원 <br>
    	포인트 사용 금액 : -${requestScope.order.pointPrice}원<p>
    	<b>최종 결제 금액 : ${(ticketPrice*ticketQty)+foodTotalPrice}원</b>
    </p>
	<hr>
    <a href="${pageContext.request.contextPath}/manager/members" class="card-link">결제 회원 아이디 : ${requestScope.order.member.id}</a>
    <a href="#" class="card-link">회원 등급 : 일반/vip/vvip</a>
  </div>
</div>

</body>
</html>