<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	h1 {
		text-align: center;
	}
	
	table { 
		margin-left: auto; 
		margin-right: auto;
	}
	
	.form-group {
		margin-left: auto; 
		margin-right: auto; 
	}
</style>
<script type="text/javascript">
	$(function() {
		
		// 전체검색
		$("exampleSelect1").on("load", function() {
			selectAll(this.value);
		});
		
		$("#exampleSelect1").on("change", function() {
			/* alert(this.value) */ 
  			selectAll(this.value);
		});
	
		
        function selectAll(v) { 
        	if(v == null || v == '') {
        		v = 'movie'; 
        	}
        	$.ajax({
				url: "${pageContext.request.contextPath}/manager/productSelect", // 서버요청주소 
				type: "post", // 요청방식(get, post, delete, patch),
				dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
				data: {productSelect : v},  // 서버에게 보낼 parameter 정보 
				success: function(result) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
					alert(JSON.stringify(result))// m f g
					
					let str = "";
					str += "<table class='table table-hover' style='width: 1000px'><tr>";
					str += "<th scope='col'>상품코드</th>";
					str += "<th scope='col'>상품이름</th></tr>";
					
					if(v=='movie'){
						$.each(result, function(index, item) { // item은 movie
							alert(result);
							alert(result.movieCode)
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.movieCode + "</th>"
							str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.movieCode}'" + item.movieName + "</td>"
							str += "</tr>"
						})  
					}else if(v=='food'){
						$.each(result, function(index, item) { // item은 food 
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.foodCode + "</th>";
							str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.foodCode}'" + item.foodName + "</td>";
							str += "</tr>"
						})   
					}else if(v=='gift'){
						$.each(result, function(index, item) { // item은 gift 
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.giftCode + "</th>";
							str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.giftCode}'" + item.giftName + "</td>";
							str += "</tr>"
						})   
					}
					
					str += "</table>";
				
 				    $("#productSelect").html(str);
					
					
				}, error: function(err) {
					alert("error")
				}
			});  
        }
		
		
	}) // ready End
	
</script>
</head>
<body>
	<h1>상품관리 page입니다.</h1>

 	<div class="form-group" style="width: 1000px">
		<label for="exampleSelect1" class="form-label mt-4 col-lg-12">상품 종류</label> 
		<select class="form-select" id="exampleSelect1" name="productSelect" style="width: 150px; height:50px">
			<option value="movie" selected="selected">영화</option>
			<option value="food">먹거리</option>
			<option value="gift">사은품</option>
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


	<%-- <table class="table table-hover" style="width: 1000px">
	  <thead>
	    <tr>
	      <th scope="col">상품코드</th>
	      <th scope="col">상품이름</th>
	      <th scope="col">상품등록일</th>
	    </tr>
	  </thead>
  <tbody>
	
	<c:set var="movie" value="${requestScope.movieList}"/>
	<c:set var="food" value="${requestScope.foodList}"/>
	<c:set var="gift" value="${requestScope.giftList}"/>
	
   <c:choose>
 		<c:when test="${empty requestScope.movieList}">
	  		<tr>
	  			<td colspan="3" style="text-align: center">
	  				<b><span>등록된 영화가 없습니다.</span></b>
	  			</td>
	  		</tr>
  		</c:when>
	  	<c:when test="${movie eq movieList}">
	  		<c:forEach items="${requestScope.movieList}" var="movie">
	  			<tr class="table-active">
			      <th scope="row">${movie.movieCode}</th>
			      <td>
			      	<a href="${pageContext.request.contextPath}/manager/productDetail/${movie.movieCode}">
			      		${movie.movieName}
			      	</a>
			      </td>
			      <td>${movie.movieStartdate}</td>
	  			</tr>
	  		</c:forEach>
	  	</c:when>
	  	
	  	<c:when test="${empty requestScope.foodList}">
	  		<tr>
	  			<td colspan="3" style="text-align: center">
	  				<b><span>등록된 먹거리가 없습니다.</span></b>
	  			</td>
	  		</tr>
  		</c:when>
  		<c:when test="${food eq foodList}">
  			<c:forEach items="${requestScope.foodList}" var="food">
	  			<tr class="table-active">
			      <th scope="row">${food.foodCode}</th>
			      <td>
			      	<a href="${pageContext.request.contextPath}/manager/productDetail/${food.foodCode}">
			      		${food.foodName}
			      	</a>
			      </td>
	  			</tr>
	  		</c:forEach>
  		</c:when>
  		
  		<c:when test="${empty requestScope.giftList}">
	  		<tr>
	  			<td colspan="3" style="text-align: center">
	  				<b><span>등록된 사은품이 없습니다.</span></b>
	  			</td>
	  		</tr>
  		</c:when>
  		<c:when test="${gift eq giftList}">
  			<c:forEach items="${requestScope.giftList}" var="movie">
	  			<tr class="table-active">
			      <th scope="row">${gift.giftCode}</th>
			      <td>
			      	<a href="${pageContext.request.contextPath}/manager/productDetail/${gift.giftCode}">
			      		${gift.giftName}
			      	</a>
			      </td>
	  			</tr>
	  		</c:forEach>
  		</c:when>
	  	<c:otherwise>
	  		<tr>
	  			<td colspan="3" style="text-align: center">
	  				<b><span>등록된 게시물이 없습니다.</span></b>
	  			</td>
	  		</tr>
	  	</c:otherwise>
  </c:choose> 
 
    

  </tbody>
</table> --%>

<div id="productSelect"></div>

	
<div class="col-lg-12 col-sm-12 text-lg-end" style="width:1000px">
  	<div class="text-lg-end">
  		<input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/productWrite'" value="등록하기"/>
  	</div>
</div><p><p>


<!-- 페이징처리 -->
<%-- <div class="text-center">
	<nav class="pagination-container">
	  <ul class="pagination">
	  <c:set var="doneLoop" value="false"/>
	  	<c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
			<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.request.contextPath}/manager/product?nowPage=${startPage-1}">&laquo;</a>
		    </li>
		</c:if>
		
		
			<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
				<c:if test="${(i-1)>=pageList.getTotalPages()}">
					<c:set var="doneLoop" value="true"/>
				</c:if> 
				    
				<c:if test="${not doneLoop}">
					<li class="page-item" style="float: left">
	     				<a class="page-link ${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/manager/product?nowPage=${i}">${i}</a>
	   				</li> 
				</c:if>
				   
			</c:forEach> --%>
		

<%-- 	    <li class="page-item active">
	      <a class="page-link ${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/manager/product?nowPage=${i}">${i}</a>
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
	    </li> --%>
	    <li class="page-item">
	      <a class="page-link" href="#">&raquo;</a>
	    </li>
	  </ul>
	</nav>
</div>


	
</body>
</html>