<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.seat {
    width: 40px;
    height: 40px;
    background-color: rgba( 255, 255, 255, 0.5 );
    color: white;
    border: 1px solid white; 
   /*  border-collapse: collapse;
    border-radius: 10px; */
}

.clicked {
    background-color: #E83283;
    color: white;
}

.btn-check : hover {
	background-color: #E83283;
	color: white;
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
		    <h4 class="card-title">영화이름</h4>
		    <h6 class="card-subtitle mb-2 text-muted">일시 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">상영관 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">인원 : </h6>
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
		  
		  
		 <div class="form-group col-lg-4" style=" width: 100px; justify-content: center; ">
			<div class="card-body" style="justify-content: center;" >
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

	
</div> <!-- 인원선택 끝 -->&nbsp;&nbsp;&nbsp;&nbsp;
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 560px;">
		<div class="card">
		  <div class="card-body" style="justify-content: center;">
		   <div class="seat-wrapper"></div>
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
			  <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"> <!-- checked 로 바뀌면 받을게요. 수량 . 사은품이름. -->
			  <label class="form-check-label" for="flexSwitchCheckChecked">안 받을게요.</label>
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
		<h4 class="card-title">스낵 (택1)</h4>
		이미지랑 설명
		<div class="form-check">
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="snacks" id="snacks1" value="snacks1">
	          KLJ팝콘세트 
	        </label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="snacks" id="snacks2" value="snacks2">
	          달콤세트 
	        </label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="snacks" id="snacks3" value="snacks3">
	          짭잘세트 
	        </label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="snacks" id="snacks4" value="snacks4" checked="checked">
	          선택안함
	        </label>
	      </div>
	      
	      <div class="form-group">
	      <label for="exampleSelect1" class="form-label mt-4">개수</label>
		      <select class="form-select" id="exampleSelect1">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		      </select>
	      </div>
	      
	      
	      </div>
	      </div>
	</div>
</div>	  <p> 

<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
	<div class="form-group col-lg-4" style="display: inline-block; width: 1000px;">   
	<div class="card">
	<div class="card-body">
		<h4 class="card-title">음료 (택1)</h4>
		<div class="form-check">
			<label class="form-check-label">
				<input type="radio" class="form-check-input" name="beverage" id="beverage1" value="beverage1">콜라
			</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="form-check-label">
				<input type="radio" class="form-check-input" name="beverage" id="beverage2" value="beverage2">사이다
			</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="form-check-label">
				<input type="radio" class="form-check-input" name="beverage" id="beverage3" value="beverage3">오렌지주스
			</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="form-check-label">
				<input type="radio" class="form-check-input" name="beverage" id="beverage4" value="beverage4" checked="checked">선택안함
			</label>
		</div>
		
		 <div class="form-group">
	      <label for="exampleSelect1" class="form-label mt-4">개수</label>
		      <select class="form-select" id="exampleSelect1">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		      </select>
	    </div>
		
		</div>
		</div>
	</div>
</div>
		
<p><p>

<!-- 영화 선택 정보 &결제하기 버튼 -->

<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 280px; background-color: none;">
		<div class="card">
			<div class="card-body" style="height: 280px;">
			<h6 class="card-subtitle mb-2 text-muted" style="width: 200px; height: 200px;"></h6>
			</div>
		</div>
	</div>&nbsp;&nbsp;

	<div class="form-group col-lg-4" style="display: inline-block; width: 600px; height: 280px;">
		<div class="card">
		  <div class="card-body" style="height: 280px;">
		    <h4 class="card-title">영화이름</h4>
		    <h6 class="card-subtitle mb-2 text-muted">일시 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">상영관 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">인원 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">좌석번호 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">일반 : 금액 *인원 </h6>
		    <h6 class="card-subtitle mb-2 text-muted">먹거리 : 스낵금액 *갯수 + 음료금액 *갯수</h6>
		    <h6 class="card-subtitle mb-2 text-muted">총 금액 : sum(금액 * 인원) + sum(스낵금액 *갯수) + sum(음료금액 *갯수)</h6>
		  </div>
		</div>
	</div>
	&nbsp;&nbsp;
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 280px;">
    	<button type="submit" class="btn btn-primary btn-lg" style="width: 200px; height: 280px;">결제하기 <p> >> </button>
	</div>
	
</div>

<p><p><p><p><p><p><p><p><p><p>
<script>
	//좌석선택
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

     for (let i = 0; i < 8; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 1; j < 11; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    //상영관 코드 1이명 (일반)80
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
    
    //상영관 코드 2이명 (특별관) 64석
    
   /* for (let i = 0; i < 8; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 1; j < 9; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    //상영관 코드 1이명 (일반)80
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
     */
</script>

</body>
</html>