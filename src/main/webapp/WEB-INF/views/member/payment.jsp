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
	
<div class="container">
	<div class="row">
		<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center;">

		
			<div class="accordion col-lg-4" id="accordionExample" style="display:inline-block;">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <b>STEP1. 선택된 상품</b>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
			      	<h3><strong>영화</strong></h3><p><p>
					<div class="mr-5"style="display: flex; flex-flow: row; ">
						<div style="display: inline-block">
					        해리포터<br>
					        2D<br>
					        12세 관람가<br>
					        성인 2명<br>
						</div>
						<div style="display: inline-block">
							<!-- <img alt="범죄도시2" src=""> -->
							일시 : 2022년 6월 3일 <p>
							좌석번호 : G6, G7 
						</div>
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
			       	보유 포인트 : 3000P<p><p>
			       	사용 포인트 : 
			       	    <div class="input-group mb-3">
    						<input type="text" class="form-control" placeholder="사용하실 포인트를 입력해주세요." aria-label="사용하실 포인트를 입력해주세요." aria-describedby="button-addon2">
					      	<button class="btn btn-primary" type="button" id="button-addon2">사용하기</button>
					    </div>
					    
			       		<div class="form-check">
				        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="">
				        <label class="form-check-label" for="flexCheckChecked">
				          모두 사용
				        </label>
				   </div>
			       	
			      </div>
			    </div>
			  </div>
			</div>
			
			<div class="col-lg-4" style="display:inline-block;">
				<div class="card mb-3">
				  <h3 class="card-header text-center">결제 상세정보</h3>
				  <div class="card-body">
				    <h5 class="card-title">결제하실 금액</h5>
				    <h6 class="card-subtitle text-muted">24000원</h6>
				  </div><p>
				  <div class="card-body">
				    <h5 class="card-title">예상 적립금</h5>
				    <h6 class="card-subtitle text-muted">3000P</h6>
				  </div><p>
				  <div class="card-footer text-muted">
				   	<div class="mr-5" style="display: inline-block">
				    	<h5 class="card-title">총 결제 금액</h5>
				    	<h6 class="card-subtitle text-muted">24000원</h6>
				    </div>
				    <div style="display: inline-block">
				    	<button type="button" class="btn btn-primary">결제하기>></button>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>