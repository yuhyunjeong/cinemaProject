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
		
		selectAll();
		
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
					/* alert(JSON.stringify(result))// m f g */
					
					let str = "";
					str += "<table class='table table-hover' style='width: 1000px'><tr>";
					str += "<th scope='col'>상품코드</th>";
					str += "<th scope='col'>상품이름</th></tr>";
					
					let insert = "";
					insert += "<form name='insertForm' method='post' id='insertForm'>"
					insert += "<input type='button' class='btn btn-secondary' onclick='insert()' value='등록하기'>"
					insert += "</form>";
					
					if(v=='movie'){
						
						$.each(result.list, function(index, item) { // item은 movie
						/* 	console.log(item)
							console.log(result.list[0].movieCode) */
		
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.movieCode + "</th>"
							/* str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.movieCode}'>" + item.movieName + "</td>" */
							str += "<td><a href='#' onclick=movepage('" + item.movieCode + "')>" + item.movieName + "</a></td>"
							str += "</tr>"		

						})  
						
					} else if(v=='food') {  
						
						$.each(result.list, function(index, item) { // item은 food
							console.log('rowClick')
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.foodCode + "</th>";
							/* str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.foodCode}'>" + item.foodName + "</td>"; */
							str += "<td><a href='#' onclick=movepage2('" + item.foodCode + "')>" + item.foodName + "</a></td>"
							str += "</tr>"
						})   
						
					} else if(v=='gift') {
						
						$.each(result.list, function(index, item) { // item은 gift 
							str += "<tr class='table-active'>";
							str += "<th scope='row'>" + item.giftCode + "</th>";
							/* str += "<td><a href='${pageContext.request.contextPath}/manager/productDetail/${item.giftCode}'>" + item.giftName + "</td>"; */
							str += "<td><a href='#' onclick=movepage3('" + item.giftCode + "')>" + item.giftName + "</a></td>"
							str += "</tr>"
						})   
					}
					
					str += "</table>";
				
 				    $("#productSelect").html(str);
 				    $("#insert").html(insert);
 				    
/*  					$("#insert").on("click", function() {
 						alert(1);
 						$("#insertForm").attr("action", "${pageContext.request.contextPath}/manager/productWrite");
 						$("#insertForm").submit();
 					}); */
					
				}, error: function(err) {
					alert("error")
				}
			});  
        }

	}) // ready End
	

    
    function insert(page) {
    	let hi = "${contextPath.reqeust.contextPath}/manager/productWrite";
    	window.document.location.href=hi;
    }
    
    function movepage(page) {
    	console.log('movepage1')
    	console.log('page1:', page)
    	let hi = "${pageContext.request.contextPath}/manager/movieDetail/"+page;
        window.document.location.href=hi;   
    }
    function movepage2(page) {
    	console.log('movepage2')
    	console.log('page2:', page)
    	let hi = "${pageContext.request.contextPath}/manager/foodDetail/"+page;
        window.document.location.href=hi;   
    }
    function movepage3(page) {
    	console.log('movepage3')
    	console.log('page3:', page)
    	let hi = "${pageContext.request.contextPath}/manager/giftDetail/"+page;
        window.document.location.href=hi;   
    }  
	 
	
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

<div id="productSelect"></div>

	
 <div class="col-lg-12 col-sm-12 text-lg-end" style="width:1000px">
  	<div class="text-lg-end" id="insert">
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