<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<!-- toastr쓰기 위해서 넣어주기!! -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

.btn-check : hover {
	background-color: #E83283;
	color: white;
}

.selectedSeatsMap{
	background-color: #AB5AA1;
    color: gray;
}

/*  */
.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: white;
    padding-top: 20px;
    font-size: 20px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid white;
    letter-spacing: 4px;
}

/*seat관련*/
.seat {
    width: 40px;
    height: 40px;
    background-color: rgba( 255, 255, 255, 0.5 );
    color: white;
    border: 1px solid white; 
    font-size: 13px;
   /*  border-collapse: collapse;
    border-radius: 10px; */
}

.seat:hover {
    background-color: #E83283;
    color: white;
    cursor: pointer;
}

.seat:active {
    background-color: #E83283;
    color: white;
}

.clicked {
    background-color: #E83283;
    color: white;
}

/*  */
.seatButtonWrapper {
    text-align: center;
}

.seatButtonWrapper>input {
    width: 40px;
    height: 40px;
}

/*인원수*/
.select-wrapper {
    width: 900px;
    margin: 0 auto;
  
}

/*  */
.select-seat-container {
    display: flex;
}

.select-seat-number-container {
    flex-grow: 1;
    border-right: 1px solid white;
    display: flex;
}

.select-seat-number-wrapper {
    padding: 10px 0 20px 20px;
    flex-grow: 1;
}

/*  */
.select-seat-ul {
    display: flex;
}

.select-seat-ul>li {
    width: 20px;
    height: 20px;
    border: 1px solid #dddddd;
    text-align: center;
    font-weight: bold;
    padding: 2px;
}

.select-seat-ul>li:hover {
    color: white;
    background-color: #222222;
    cursor: pointer;
}

.select-seat-ul-active {
    color: white;
    background-color: #222222;
}

.select-seat-ul>li:not(:first-child) {
    margin-left: 5px;
}

.select-seat-information {
    flex-grow: 1;
    padding: 15px 0 20px 20px;
}

.select-seat {
    display: flex;
    font-size: 12px;
}

.select-seat:not(:first-child) {
    margin-top: 12px;
}

.select-seat-number {
    margin-left: 15px;
}

.reserve-number-wrapper {
    flex-grow: 1;
    padding-top: 15px;
    border-left: 1px solid #DDDDDD;
    text-align: center;
}

.reserve-number {
    margin-top: 20px;
    font-size: 34px;
    font-weight: bold;
}

.remain-seats {
    margin-left: 3px;
    color: rgba(255, 0, 0, 0.6);
    font-weight: bold;
}

.selected-seats-wrapper {
    margin-top: 5px;
}

.selected-seats {
    font-size: 13px;
    word-spacing: 2px;
    margin-left: 20px;
}

.ticket-price-wrapper{
	margin-top: 5px;
	display: flex;
	align-items: center;
}
.ticket-price-wrapper>div{	
	font-weight: bold;
}

.ticket-price-title{
	font-size: 13px;
}

.ticket-price {
	margin-left: 47px;
	font-size:20px;
}

.reserve-button {
    margin-top: 5px;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 13px;
    padding: 0;
}

.reserve-button img { /*예매버튼  */
    margin-left: 20px;
    width: 60px;
}

.left-margin {
    margin-left: 30px;
}

.right-margin {
    margin-right: 30px;
}

.top-margin {
    margin-top: 30px;
}

</style>

</head>
<body>
<p>

	<h1>&nbsp;&nbsp;좌석선택</h1>
	
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 1000px;">
			<div class="card">
			  <div class="card-body">
			    <h4 class="card-title">${movie.movieName}</h4>
			    <h6 class="card-subtitle mb-2 text-muted">일시 :
			    	<fmt:formatDate value="${time.timeDate}" type="date" />
			    	/
			    	<fmt:formatDate value="${time.timeStart}" type="time"/>
			    </h6>
			    <h6 class="card-subtitle mb-2 text-muted">상영관 :  ${time.screen.screenName}</h6>
			    <h6 class="card-subtitle mb-2 text-muted">인원 : <div class="peopleNum" style="display: inline-block;"></div>명 </h6>
			  </div>
			</div>
		</div>
	</div>
	<p>
	
	
	<!-- 인원선택 & 좌석선택 -->
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 400px;">
			<div class="card">
			  <div class="card-body">
			    <h6 class="card-title">인원선택</h6>
			    <p class="card-text">인원은 총 4명까지 선택 가능합니다.</p>
			  </div>
			  
			 <div class="form-group col-lg-4" style=" width: 800px; justify-content: center; ">
				<div class="card-body" style="justify-content: center;" >
					<div class="select-wrapper">
						<div class="btn-group" id="peoplebtn" role="group" aria-label="Basic radio toggle button group" style="width: 330px; justify-content: center; " >
							<input type="radio" class="btn-check" name="peo" id="peo1" autocomplete="off" value="1">
							<label class="btn btn-outline-light" for="peo1">1</label>
							<input type="radio" class="btn-check" name="peo" id="peo2" autocomplete="off" value="2">
							<label class="btn btn-outline-light" for="peo2">2</label>
							<input type="radio" class="btn-check" name="peo" id="peo3" autocomplete="off" value="3">
							<label class="btn btn-outline-light" for="peo3">3</label>
							<input type="radio" class="btn-check" name="peo" id="peo4" autocomplete="off" value="4">
							<label class="btn btn-outline-light" for="peo4">4</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- 인원선택 끝 -->&nbsp;&nbsp;&nbsp;&nbsp;
		
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 600px; justify-content: center;">
			<div class="card">
			  <div class="card-body" style="justify-content: center; margin: 0 auto 30px auto; ">
				   <div class="seat-wrapper" style="justify-content: center;">
					   <div class="screen-view-wrapper">
							<div class="screen-view" style="text-align: center;">SCREEN</div>
						</div>
				   </div>
			  </div>
			</div>
		</div>
	
	
	&nbsp;&nbsp;
	
	
	</div><!--col12끝 좌석  -->
	<p><p>
	
	
	<p><p>
	<h1>&nbsp;&nbsp;사은품선택</h1>
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 1000px;">
			<div class="card">
			  <div class="card-body">
			    <p class="card-text">사은품은 표1개당 1개 입니다. 수량이 없는 경우 받으실 수 없습니다.</p>
			  	<div class="form-check form-switch">
			        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
			        <label class="form-check-label" for="flexSwitchCheckDefault">
			        	<div class="checkmessage">안받을게요</div>
			        	<div class="checkmessage1"></div>
			        </label>
				</div>
			  </div>
			</div>
		</div>
	</div>
	<p><p>
	<h1>&nbsp;&nbsp;먹거리선택</h1>	
				
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 1000px;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">스낵 & 음료</h4>
					<div class="form-check">
						<%-- <c:choose>
					 		<c:when test="${empty requestScope.foodList}">
						  		<div>음식이 준비되어 있지 않습니다.</div>
					  		</c:when>
						  	<c:otherwise>
						  	<!-- 조건 -->
						  		<c:forEach items="${requestScope.foodList}" var="foods">
									<div class='row row-cols-1 row-cols-md-4 g-4' style="justify-content: center;" id="foodList"></div>
						  		</c:forEach>
						  	</c:otherwise>
				  		</c:choose> --%>
				  		
				  		<div class="form-check">
					        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					        <label class="form-check-label" for="flexCheckDefault">달콤콤보</label>
					   </div>
					   <div class="form-check">
					        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					        <label class="form-check-label" for="flexCheckDefault">짭잘콤보</label>
					   </div>
					   <div class="form-check">
					        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					        <label class="form-check-label" for="flexCheckDefault">매콤콤보</label>
					   </div>
					   <div class="form-check">
					        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					        <label class="form-check-label" for="flexCheckDefault">단짠콤보</label>
					   </div>
				  		
				      </div>
			      </div>
		      </div>
		</div>
	</div>	  
	<p><p><p>
	
	<!-- 영화 선택 정보 &결제하기 버튼 -->
	
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 280px; background-color: none;">
			<div class="card">
				<div class="card-body" style="height: 280px;">
						<img class="card-img-top" src="${pageContext.request.contextPath}/img/movie/${movie.movieImage}" />
					
				</div>
			</div>
		</div>&nbsp;&nbsp;
	
		<div class="form-group col-lg-4" style="display: inline-block; width: 600px; height: 280px;">
			<div class="card">
			  <div class="card-body" style="height: 280px;">
			    <h4 class="card-title">${movie.movieName}</h4>
			    <h6 class="card-subtitle mb-2 text-muted">일시 :
			    	<fmt:formatDate value="${time.timeDate}" type="date" />
			    	/
			    	<fmt:formatDate value="${time.timeStart}" type="time"/>
			    </h6>
			    <h6 class="card-subtitle mb-2 text-muted">상영관 :  ${time.screen.screenName}</h6>
			    <h6 class="card-subtitle mb-2 text-muted">인원 :  <div class="peopleNum" style="display: inline-block;"></div>명 </h6>
			    <h6 class="card-subtitle mb-2 text-muted">좌석번호 : B2, B3 </h6>
			   <!--  <h6 class="card-subtitle mb-2 text-muted">
			    	<div class="selected-seats-wrapper">
						<span class="selected-seats-title">좌석번호 : B2, B3
					</div>
			    </h6> -->
			    <h6 class="card-subtitle mb-2 text-muted">
			    	<div class="ticket-price-wrapper">
			    		<h6 class="card-subtitle mb-2 text-muted">좌석가격 : 일반 12000원 * <div class="peopleNum" style="display: inline-block;"></div>명</h6>
					</div>
			    </h6>
			    <h6 class="card-subtitle mb-2 text-muted">먹거리 : 달콤콤보 6000원 * 1개 </h6>
			    <h6 class="card-subtitle mb-2 text-muted">총 금액 : 18000원</h6>
			  </div>
			</div>
		</div>
		&nbsp;&nbsp;
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 280px;">
	    	<button type="submit" class="btn btn-primary btn-lg" style="width: 200px; height: 280px;" onclick="movepage()">결제하기 <p> >> </button>
		</div>
		
	</div>
	
	<p><p><p><p><p><p><p><p><p><p>
<script>

	var temp = [];
	
	/*인원선택시 인원수 예약창에 보여주기*/
	$(function(){
   		$(".btn-check").on("click", function(){
   			var peopleNum = this.value;
   			
   			temp.push(peopleNum);
   			
   			  $.ajax({
   				type:"post",
   				url:"/cinema/people",
   				dataType : "text",
   				success: function(result){ 
   					$(".peopleNum").html(peopleNum);
   					console.log(peopleNum);
   				
   				}
   			})
   		});	
   	});  

	/*좌석선택 - 상영관에 따라 달라짐!! -- 들어오는 상영관 코드로 바뀌기 때문에 아작스 처리 x*/
	function chooseSeat() {

		/*row, col 불러와서 자리 출력하기(isbooked 적용 전)*/
 		let test = []; //배열을 주고
	    let selectedSeatsArray = new Array(); //선택한 좌석의 배열 --인원수
	    //let selectedSeatsMap = []; //
	    const seatWrapper = document.querySelector(".seat-wrapper"); //seat-wrapper에 좌석 띄워주기
	    let clicked = ""; //클릭된거
	    let div = "";
	    
	    //예매좌석을 확인하고 -> 상영관 예매좌석 표시(상영일정에서 booked된 자리 표시해주기 )
	    let bookedSeat = "";
	    
	    //추가했음.. 돈문제
 	    let seat = document.querySelectorAll('.seat');
	    //const selectedSeats = document.querySelector('.selected-seats');
	    const allSeat = document.querySelector('.all-seats');
	    const remainSeat = document.querySelector('.remain-seats'); //남은좌석
	    
	    const reserveNumber = document.querySelector('.reserve-number'); //선택한 좌석수 --표시??
	    		
	    const selectSeatListNormal = document.querySelectorAll('.peopleNum'); //인원체크
	    let selectSeatListUlActive = '';
	    let normalNumber = 0;
	    let allNumber = 0; //모든 좌석 : 나중에 청소년, 우대 요금 받을 수도 있으니까 allNumber로 전체넘버 봐주기
	    let prevNumber = 0;
	    let normalMoney = 0;
	    let allMoney = 0; //총 금액 : 일반요금 + 나중에 청소년, 우대 요금 확대
	    const selectNumberNormal = document.querySelectorAll('.btn-check'); //일반요금 선택값이 .btn-check
		//alert(selectNumberNormal)
		
	    //예약 관련
	    const ticketPrice = document.querySelector('.ticket-price'); //티켓가격
	    const seatForm = document.querySelector('.seatForm'); //나중에 히든으로 값넘길때 필요
	    const reserveButton = document.querySelector('.reserve-button'); //선택한 좌석 버튼
	    const selectedSeat = document.querySelector('.selectedSeat');//선택한 좌석

	    toastr.options = {
	        positionClass: 'toast-top-center',
	        timeOut: 1000,
	        preventDuplicates: true
	    };
	     
		   /*버튼클릭시 다른 class 추가 초기화해주기*/
		   function selectSeatList(list) {
		       allNumber = 0;
			   allMoney = 0;
			   list.forEach(li => {
				   //클릭시에 다른 class초기화해주기
				   initList(list, li);
			   });
		   }//selectSeatList(list) 끝
		   
		  
		 
		   
	     
	    
	    /*좌석 띄워주기*/
	     for (let i = 0; i < ${row} ; i++) {
	        div = document.createElement("div"); //A1~10 한줄
	        div.classList = 'seatButtonWrapper'; //class 이름 주기
	        seatWrapper.append(div);
	        
	        for (let j = 1; j <= ${col}; j++) {
	            const input = document.createElement('input'); 
	            input.type = "button"; //input 타입, 네임, 클래스 부여 -버튼 하나하나 속성주기
	            input.name = "seats"
	            input.classList = "seat";
	            
	            mapping(input, i, j); //3중포문 사용 안하려고
	            div.append(input); //요소 마지막에 input을 추가...?
	            		
	            		
	            
           		input.addEventListener('click', function(e) {
	                console.log(e.target.value); //누르는 값
	                //중복방지 함수
	                selectedSeatsArray = selectedSeatsArray.filter((element, index) => selectedSeats.indexOf(element) != index);
	
	                //click class가 존재할때(제거해주는 toggle)
	                if (input.classList.contains('clicked')) {
	                    input.classList.remove('clicked');
	                    clicked = document.querySelectorAll('.clicked');
	                    
	                    //배열안의 값 제거
	                    selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
	                    clicked.forEach((data) => {
	                    	selectedSeatsArray.push(data.value);
	                    });
	                
	                //click class가 존재하지 않을때 (추가해주는 toggle)
	                } else {
	                    input.classList.add('clicked');
	                    clicked = document.querySelectorAll('.clicked');
	                    
	                    //인원수에 맞게 선택하게 해주기-->아니면 동작 안되게!!
	                    console.log(allNumber); //toastr
	                  /*   if (clicked.length > allNumber) {
	                        input.classList.remove('clicked');
	                        /* toastr.error(
	                            '<div style="color:white">선택한 인원수를 넘었습니다. <p>다시 확인해 주세요.</div>',
	                            '<div style="color:white">인원 수 확인</div>'
	                            //,{} --toastr옵션 일케주기
	                        );  */
	                        return;
	                    }//if문 끝 -- allNumber가 clicked보다 작아야 함..! */
	                    
	                     	/* clicked.forEach((data) => {
	                     	selectedSeatsArray.push(data.value);
	                   		});  */
	                 //} 
	                 console.log(selectedSeatsArray);
	            });
	        }
	        
		    //console.log(selectedSeatsArray.length);
		    
	        //console.log(selectedSeatsArray);
	        
	        //좌석번호의 innerHTML 설정
	        //selectedSeats.innerHTML = selectedSeatsArray; //selectedSeats -> 출력할때 selectedSeatsArray로..?
	        //reserveNumber.innerHTML = selectedSeatsArray.length; //ncaught TypeError: Cannot set properties of null (setting 'innerHTML') at chooseSeat (seat:531:34) at seat:562:2
	        //remainSeat.innerHTML = seat.length - selectedSeatsArray.length;
	        
	        
	    }//상영관에 따른 좌석배열 불러오기 끝
		   
	   
		 /*인원수 체크하면 예약된좌석, 예약할 좌석 보여주기*/     
	     $(".btn-check").on("click", function() {
	    	 //alert(booked)
	    	 //여기서 timeCode를 불러오고 싶음.
				 $.ajax({
	   				type:"post",
	   				url:"/cinema/chooseSeat",
	   				dataType : "json", //나중에 json으로..
	   				data:{ "tCode" : ${time.timeCode} }, //서버에 보낼 parameter정보
	   				success: function(result){ //값들 꺼내와야함..
	   					//console.log(result)
	   					//alert(booked) 여기 booked에 booked=1인값 넣어주기..
	   					
						$.each(result, function(index, item){ //item = seatPerformance
							
							if (item.booked){
								console.log(item.seatPerformanceCode) //예약됨
								console.log(item.seat.seatCol) //undefined
								console.log(item.seat.seatRow)
								//$("input[value=]").css("background-color", "#BA2869");
								//$("input[value=]").attr("disabled",true);
								//$(bookedSeat).val("ss");
								//console.log(bookedSeat); //booked가 되어 있는 seat-per 의 seat코드
								
							} //이제 여기서 seat도 가져와서 seat-perform테이블이랑 조인해주면 됨..
							//선택한 자리 예매예약창에 띄워주기
						})
					}
	   			});	 
			});    
	}//chooseSeat() 끝

	chooseSeat();
	
	function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        } else if (i === 7) {
            input.value = "H" + j;
        }
    }
	
	/*form 제출시 hidden설정하기*/
/* 	reserveButton.addEventListener('click', function() { //결제하기 버튼을 누르면 이벤트 발생 reserveButton 없음..ㅋㅋ
	    title.value = selectedMovie.innerHTML;
	    selectedSeatsArray.value = selectedSeatsArray.innerHTML;
	    console.log(allNumber + '하하');
	    
	    if (
	        Number(ticketNumber.value) === allNumber ) {
	        seatForm.submit();
	    } else {
	        alert('좌석을 선택해 주세요.');
	    }
	});
	 */
	
    /*결제하기 이동 : 나중에 좌석, 사은품, 먹거리 선택 후 버튼이 나오게 만들거임]*/
	function movepage(page) {
		let hi = "${pageContext.request.contextPath}/member/payment";
	    window.document.location.href=hi;
	    
	    /* console.log("${time.timeDate}");
	    console.log("${time.timeStart}"); */ 
	   	console.log("${peopleNum}");
	    console.log(typeof("${time.timeDate}"));
	    console.log(typeof("${time.timeStart}")); 
	    console.log("${movie.movieName}");   
	    console.log("${time.screen.screenName}"); 
	    
	    temp.push("${time.timeDate}");
	    temp.push("${time.timeStart}");
	    temp.push("${movie.movieName}");   
	    temp.push("${time.screen.screenName}");
	    console.log(temp); 
	    /* let hi = "${pageContext.request.contextPath}/member/payment";
	    window.document.location.href=hi;  */
	    

/* 		document.f.timeDate.value= temp[0].toString;
		document.f.timeStart.value= temp[1].toString; */
/* 		document.f.timeDate.value= String(temp[0]);
		document.f.timeStart.value= String(temp[1]); */
		
		document.f.peopleNum.value= temp[0];
		document.f.timeDate.value= temp[1];
		document.f.timeStart.value= temp[2];
		document.f.movieName.value= temp[3];
		document.f.screenName.value= temp[4];

		document.f.submit();  
	}
     
   /*사은품 선택*/
   $('#flexSwitchCheckDefault').click(function(){
		var checked = $('#flexSwitchCheckDefault').is(':checked');
		
		if(checked)
			$('input:checkbox').prop('checked',true);
		    $('.checkmessage').remove();
			$('.checkmessage1').html('받을래요');
			
	});
   
 
   
</script>

	<form action="${pageContext.request.contextPath}/member/payment" name="f" method="post">
		<input type="hidden" name="peopleNum" value="">
		<input type="hidden" name="timeDate" value="">
		<input type="hidden" name="timeStart" value="">
		<input type="hidden" name="movieName" value="">
		<input type="hidden" name="screenName" value="">
	</form>

</body>
</html>