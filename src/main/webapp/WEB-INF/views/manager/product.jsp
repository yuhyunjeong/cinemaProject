<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 {
		text-align: center;
	}

</style>
</head>
<body>
	<h1>상품관리 page입니다.</h1>

 	<div class="form-group">
		<label for="exampleSelect1" class="form-label mt-4 col-lg-12">상품 종류</label> 
		<select class="form-select" id="exampleSelect1">
			<option>영화</option>
			<option>먹거리</option>
			<option>사은품</option>
		</select>
	</div> 
	
<!-- <div class="col-lg-12">
 	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" href="#movie">영화</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" href="#food">먹거리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" href="#goods">사은품</a>
		</li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade show active" id="movie">
			영화
		</div>
		<div class="tab-pane fade" id="food">
			먹거리 
		</div>
		<div class="tab-pane fade" id="goods">
			사은품
		</div>
	</div>
</div> -->


	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">상품코드</th>
      <th scope="col">상품이름</th>
      <th scope="col">상품등록일</th>
    </tr>
  </thead>

  
  <tbody>
  <c:choose>
  	<c:when test="${empty requestScope.movieList}">
  		<tr>
  			<td>
  				<b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b>
  			</td>
  		</tr>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${requestScope.movieList}" var="movie">
  			<tr class="table-active">
		      <th scope="row">${movie.movieCode}</th>
		      <td>
		      	${movie.movieName}
		      </td>
		      <td>${movie.movieInsertdate}</td>
  			</tr>
  		</c:forEach>
  	</c:otherwise>
  </c:choose>
    

  </tbody>
</table>

	
<div class="col-lg-12 col-sm-12 text-lg-end">
  <input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/productWrite'" value="등록하기"/>
</div><p><p>

<div class="text-center">
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