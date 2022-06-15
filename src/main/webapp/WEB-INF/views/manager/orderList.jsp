<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	  $("#orderListTable").tablesorter({
	    sortList: [0,0]
	  });

	});
</script>
</head>
<body>
	<h1>tickets.jsp 예매내역입니다</h1>
<table id="orderListTable" class="table table-hover" data-sortlist="[0,0]">
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
  		<c:when test="${empty requestScope.pageList.content}">
  			<tr>
  				<td colspan="5">예매 내역이 없습니다.</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			
  			<c:forEach items="${requestScope.pageList.content}" var="order">
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
			      	<fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm" var="orderDate"/>
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

<div>
  <ul class="pagination">
    <c:set var="doneLoop" value="false"/>
    <li class="page-item disabled">
      <c:if test="${(startPage-blockCount) > 0}">
        <a class="page-link" href="#">&laquo;</a>
      </c:if>
    </li>
    <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
	    <c:if test="${(i-1)>=pageList.getTotalPages()}">
	       <c:set var="doneLoop" value="true"/>
	    </c:if> 
	    <c:if test="${not doneLoop}" >
	    	 <!-- 수정전<li class="page-item active"> //참고${i==nowPage?'pagination-active':page}-->
	    	 <li class="${i==nowPage?'page-item':active}">
		       <a class="page-link" href="${pageContext.request.contextPath}/manager/orderList?nowPage=${i}">${i}</a>
		     </li> 
	    </c:if>
    </c:forEach>
    <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
      <li class="page-item">
        <a class="page-link" href="${pageContext.request.contextPath}/manager/orderList?nowPage=${startPage+blockCount}">&raquo;</a>
      </li>
	</c:if>
  </ul>
</div>
</body>
</html>