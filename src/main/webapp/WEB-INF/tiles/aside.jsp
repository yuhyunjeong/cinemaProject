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
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">★관리하기★</a>
  <a href="${pageContext.request.contextPath}/manager/tickets" id = "tickets" class="list-group-item list-group-item-action">예매내역 조회</a>
  <a href="${pageContext.request.contextPath}/manager/salesByMonth" id = "sales" class="list-group-item list-group-item-action">매출 조회</a>
  <a href="${pageContext.request.contextPath}/manager/members" id = "members" class="list-group-item list-group-item-action">회원 조회</a>
  <a href="${pageContext.request.contextPath}/manager/product" id = "product" class="list-group-item list-group-item-action">상품관리</a>
</div>

</body>
</html>