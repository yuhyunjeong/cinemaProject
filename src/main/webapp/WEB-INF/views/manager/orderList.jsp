<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>tickets.jsp 예매내역입니다</h1>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">예매 코드</th>
      <th scope="col">예매 상태</th>
      <th scope="col">영화 이름</th>
      <th scope="col">결제 일시</th>
      <th scope="col">결제 금액</th>
    </tr>
  </thead>
  <tbody>
  	<c:choose>
  		<c:when test="${empty requestScope.orderList}">
  			<tr>
  				<td colspan="5">예매 내역이 없습니다.</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			
  			<c:forEach items="${requestScope.orderList}" var="order">
			    <tr class="table-active">
			      <th scope="row"><a href="/manager/orderDetail">${order.orderCode}</a></th>
			      <td>${order.orderState}</td>
			      <td>영화이름</td>
			      <td>${order.orderDate}</td>
			      <td>${order.totalPrice}</td>
			    </tr>
		    </c:forEach>
  		</c:otherwise>
  	</c:choose> 
  </tbody>
</table>

<div>
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>
</body>
</html>