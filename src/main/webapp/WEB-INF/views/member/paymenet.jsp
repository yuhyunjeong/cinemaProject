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
	
<div class="container">
	<div class="row">
		<div class="col-lg-12" style="justify-content: center;">
			<div id="box">
				<h1>결제</h1>
			</div>
		
			<div class="accordion col-lg-4" id="accordionExample" style="display:inline-block; width:300px; height:300px;">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <b>STEP1. 선택된 상품</b>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
					<div>
						<h3><strong>영화</strong></h3><p><p> 
				        해리포터<br>
				        2D<br>
				        12세 관람가<br>
				        성인 2명<br>
					</div>
					<div>
					
					</div>
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
			
			<div class="col-lg-4" style="display:inline-block; width:300px; height:300px;">
				<div class="card mb-3">
				  <h3 class="card-header text-center">결제 상세정보</h3>
				  <div class="card-body">
				    <h5 class="card-title">결제하실 금액</h5>
				    <h6 class="card-subtitle text-muted">24000원</h6>
				  </div>
				 <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
				    <rect width="100%" height="100%" fill="#868e96"></rect>
				    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
				  </svg> -->
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item">Cras justo odio</li>
				    <li class="list-group-item">Dapibus ac facilisis in</li>
				    <li class="list-group-item">Vestibulum at eros</li>
				  </ul>
				  <div class="card-body">
				    <a href="#" class="card-link">Card link</a>
				    <a href="#" class="card-link">Another link</a>
				  </div>
				  <div class="card-footer text-muted">
				    2 days ago
				  </div>
				</div>
<!-- 				<div class="card">
				  <div class="card-body">
				    <h4 class="card-title">Card title</h4>
				    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="card-link">Card link</a>
				    <a href="#" class="card-link">Another link</a>
				  </div>
				</div> -->
			</div>
			
		</div>
	</div>
</div>


</body>
</html>