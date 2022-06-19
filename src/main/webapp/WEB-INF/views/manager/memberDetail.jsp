<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${member.id}님의 정보입니다.</h1>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">회원 아이디</th>
      <th scope="col">회원 등급</th>
      <th scope="col">가입 일시</th>
      <th scope="col">마지막 예매 일시</th>
    </tr>
  </thead>
  <tbody>
	<tr class="table-active">
      <th scope="row">
      	${member.id}
      </th>
      <td>
        <c:choose>
   		<c:when test="${member.grade==0}">
   			일반 회원
   		</c:when>
   		<c:when test="${member.grade==1}">
   			VIP
   		</c:when>
   		<c:when test="${member.grade==2}">
   			VVIP
   		</c:when>
   		</c:choose>
      </td>
      <td>
      	<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="regdate"/>
 		<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
      </td>
      <td>
      	<c:set value="${orderDate}" var="orderDate"/>
      	<c:forEach items="${member.orderList}" var="order" varStatus="status">
	      	<c:if test="${status.last eq true}">
	      		<fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
  					<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" />
  					<c:set value="${orderDate}" var="orderDate"/>
  				</c:if>
 		</c:forEach>
      </td>
    </tr>
  </tbody>
</table>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">예매 코드</th>
      <th scope="col">예매 상태</th>
      <th scope="col">예매 내용</th>
      <th scope="col">결제 일시</th>
      <th scope="col">결제 금액</th>
      <th scope="col">회원 아이디</th>
    </tr>
  </thead>
  <tbody>
  	<c:choose>
  		<c:when test="${empty requestScope.member.orderList}">
  			<tr>
  				<td colspan="6">예매 내역이 없습니다.</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			<c:forEach items="${requestScope.member.orderList}" var="order">
			    <tr class="table-active">
			      <th scope="row"><a href="/manager/orderDetail/${order.orderCode}">${order.orderCode}</a></th>
			      <td>
			        <c:choose>
		    		<c:when test="${order.orderState==0}">
		    			결제 완료
		    		</c:when>
		    		<c:when test="${order.orderState==1}">
		    			환불 요청
		    		</c:when>
		    		<c:when test="${order.orderState==2}">
		    			환불 완료
		    		</c:when>
		    		</c:choose>
			      </td>
			      <td>${order.movieOrderline[0].seatPerformance.time.movie.movieName}
			      	<c:if test="${not empty order.foodOrderline}">
			      		<c:forEach items="${order.foodOrderline}" varStatus="status">
			      		외 ${status.count}건
			      		</c:forEach>
			      	</c:if>
			      </td>
			      <td>
			      	<fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
    				<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			      <td>${order.totalPrice}</td>
			      <td>
			      	${order.member.id}
			      </td>
			    </tr>
		    </c:forEach>
  		</c:otherwise>
  	</c:choose> 
  </tbody>
</table>
<button type="button" class="btn btn-primary btn-sm" onclick="history.back()">목록으로</button>
</body>
</html>