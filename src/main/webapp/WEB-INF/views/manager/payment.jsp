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
	
	#box {
		margin: 30px;
	}
</style>
</head>
<body>
	
	<div id="box">
		<h1>결제</h1>
	</div>

	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingOne">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	        <b>STEP1. 선택된 상품</b>
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
	      <div class="accordion-body">
	        <strong>This is the first item's accordion body.</strong> 
	        It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. 
	        These classes control the overall appearance, as well as the showing and hiding via CSS transitions. 
	        You can modify any of this with custom CSS or overriding our default variables. 
	        It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	        <b>STEP2. 포인트</b>
	      </button>
	    </h2>
	    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
	      <div class="accordion-body">
	        <strong>This is the second item's accordion body.</strong> 
	        It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. 
	        These classes control the overall appearance, as well as the showing and hiding via CSS transitions. 
	        You can modify any of this with custom CSS or overriding our default variables. 
	        It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>