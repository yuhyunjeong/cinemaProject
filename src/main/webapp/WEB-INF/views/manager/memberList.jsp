<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	  $("#memberListTable").tablesorter({
	    sortList: [0,0]
	  });

	});
</script>
</head>
<body>
<h1>member.jsp 회원 조회입니다</h1>
<table id="memberListTable" class="table table-hover" data-sortlist="[0,0]">
  <thead>
    <tr>
      <th scope="col">Index</th>
      <th scope="col">회원 아이디</th>
      <th scope="col">회원 등급</th>
      <th scope="col">가입 일시</th>
      <th scope="col">마지막 예매 일시</th>
      <th scope="col">휴면회원 여부</th>
    </tr>
  </thead>
  <tbody>
  	<c:choose>
  		<c:when test="${empty requestScope.pageList.content}">
  			<tr>
  				<td colspan="6">저장된 회원이 없습니다.</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			<c:forEach items="${requestScope.pageList.content}" var="member" varStatus="status">
			    <tr class="table-active">
			      <th>
			        <a href="/manager/memberDetail/${member.id}">${status.index+1}</a>
			      </th>
			      <th scope="row">
			      	<a href="/manager/memberDetail/${member.id}">${member.id}</a>
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
			      	<c:choose>
			      		<c:when test="${empty member.orderList}">
			      			내역 없음
			      		</c:when>
			      		<c:otherwise>
				      	<c:forEach items="${member.orderList}" var="order" varStatus="status">
					      	<c:if test="${status.last eq true}">
					      		<fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
		    					<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		    					<c:set value="${orderDate}" var="orderDate"/>
		    				</c:if>
	    				</c:forEach>
	    				</c:otherwise>
    				</c:choose>
			      </td>
			      <td>
			      	ㅇㅇㅇ
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
		       <a class="page-link" href="${pageContext.request.contextPath}/manager/memberList?nowPage=${i}">${i}</a>
		     </li> 
	    </c:if>
    </c:forEach>
    <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
      <li class="page-item">
        <a class="page-link" href="${pageContext.request.contextPath}/manager/memberList?nowPage=${startPage+blockCount}">&raquo;</a>
      </li>
	</c:if>
  </ul>
</div>
</body>
</html>