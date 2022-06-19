<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
	h1 {
		text-align: center;
	}
	
	#box {
		margin: 30px;
	}
</style>
<script type="text/javascript">

	$(function() {
		$("#iamportPayment").click(function() {
			requestpay(); 
		});
		
		function requestpay(data) {
			
			uid = new Date().getTime();
			
			var IMP = window.IMP; // 생략가능 
			IMP.init("imp03894740"); // 가맹정 식별코드
			
			// IMP.request_pay(param, callback) 결제창 호출
		      IMP.request_pay({ // param
		          pg: "html5_inicis",
		          pay_method: "card",
		          /* merchant_uid: "ORD20180131-0000011",  */
		          merchant_uid: "marchant" + uid,
		          name: "영화",
		          amount: 300,
		          buyer_email: "gildong@gmail.com",
		          buyer_name: "홍길동",
		          buyer_tel: "010-4242-4242",
		          buyer_addr: "서울특별시 강남구 신사동",
		          buyer_postcode: "01181"
		      }, function (rsp) { // callback
		    	  
		    	  console.log("click")
		    	  console.log(rsp); 
		          if (rsp.success) { 
		        	console.log(rsp); 
		        	
		        	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + 300/* ${paymentPrice} */;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        /* // 결제 성공 시 로직,
		              alert("완료 -> imp_uid : " + rsp.imp_uid + " / merchant_uid(orderKey) : " + rsp.merchant_uid); */
       
		          } else {
		              
		              // 결제 실패 시 로직,
		              alert("실패 -> 코드(" + rsp.error_code + ") / 메세지 (" + rsp.error_msg + ")");	   
		              
	/* 	              $("#payForm #key").val("order");
					  $("#payForm #methodName").val("orders");
					  $("#payForm #orderCode").val(uid);
				      $("#payForm").submit();      */
		          }
		  	    alert(msg);
		      });
		    }        
		
	}) // ready end 
	
	$(function() {
		$("#button-addon2").on("click", function() {
			
			var str = "";
			str += "<h5 class='card-title'>사용하실 적립금</h5>";
			str += "<h6 class='card-subtitle text-muted'>2000P</h6>";
			
			$("#pay1").html(str);
			
			var str2 = "";
			str2 += "<h5 class='card-title'>총 결제 금액</h5>";
			str2 += "<h6 class='card-subtitle text-muted'>28000원</h6>";
			
			$("#pay2").html(str2);
			
			var str3 = "";
			str3 += "<h5 class='card-title'>예상 적립금</h5>"
			str3 += "<h6 class='card-subtitle text-muted'>1400p</h6>";
		    
			$("#pay3").html(str3);

		});
	})	
		
</script>

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
						<div style="display: inline-block" id="selectedProduct"> 
							
							<%-- ${movieOrderline.seatPerformance.time.movie.movieName} 영화이름<br>
							${movieOrderline.seatPerformance.time.movie.movieAge} 관람연령<br> --%>
							영화이름 : ${movieName}<br>
							일시 : 2022. 6. 9. / 오전 9:30:00 <%-- ${timeStart} --%> <p>
							좌석번호 : B2, B3 
							<!-- 관람연령 : <br> -->
							
							<!-- 예매인원 <br>
							
							 
					        해리포터<br>
					        12세 관람가<br>
					        성인 2명<br> -->
						</div>
						<div style="display: inline-block">
							<!-- <img alt="범죄도시2" src=""> -->
					<%-- 		일시 : ${timeStart} <p>
							좌석번호 : G6, G7   --%>
						</div>
					</div>
					
					<p><p>
			      	<h3><strong>먹거리</strong></h3><p><p>
					<div class="mr-5"style="display: flex; flex-flow: row; ">
						<div style="display: inline-block">
							<%-- ${foodOrderline.food.foodName} 먹거리 이름 <br>  
							${foodOrderline.food.foodPrice} 먹거리 가격 <br>   --%>
							먹거리 이름 : 달콤세트 <br>
							먹거리 가격 : 6000원
							
					     <!--    달콤콤보<br>
					        6000원<br> -->
						</div>
					</div>					
					
					<p><p>
			      	<h3><strong>사은품</strong></h3><p><p>
					<div class="mr-5"style="display: flex; flex-flow: row; ">
						<div style="display: inline-block">
							사은품 선택 O<br> 
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
	<!-- 			        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="">
				        <label class="form-check-label" for="flexCheckChecked">
				          모두 사용
				        </label> -->
				   </div> 
			       	
			      </div>
			    </div>
			  </div>
			</div>
			
			<div class="col-lg-4" style="display:inline-block; text-align:center;">
				<div class="card mb-3">
				  <h3 class="card-header text-center">결제 상세정보</h3>
				  <div class="card-body">
				    <h5 class="card-title">결제하실 금액</h5>
				    <h6 class="card-subtitle text-muted">30000원</h6>
				  </div><p>
				  <div class="card-body" id="pay1">
				    <h5 class="card-title">사용하실 적립금</h5>
				    <!-- <h6 class="card-subtitle text-muted">2000P</h6> -->
				  </div><p>
				  <div class="card-body" id="pay2">
				    <h5 class="card-title">총 결제 금액</h5>
				    <!-- <h6 class="card-subtitle text-muted">28000원</h6> -->
				  </div><p>
				  <div class="card-body" id="pay3">
				    <h5 class="card-title">예상 적립금</h5>
				    <!-- <h6 class="card-subtitle text-muted">1400p</h6> -->
				  </div><p>
				  <div class="card-footer text-muted">
<!-- 				   	<div class="mr-5" style="display: inline-block" id="all">
				    	<h5 class="card-title">총 결제 금액</h5>
				    	<h6 class="card-subtitle text-muted">28000원</h6>
				    </div> -->
				    <div style="display: inline-block">
				    	<input type="button" class="btn btn-primary" id="iamportPayment" value="결제하기>>">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>