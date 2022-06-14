<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<style type="text/css">
.movie-list {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    height: 250px;
    overflow: scroll;
    overflow-x: hidden;
}

.time-list {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    height: 250px;
    overflow: scroll;
    overflow-x: hidden;
}

.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    height: 250px;
    overflow: scroll;
    overflow-x: hidden;
}


.reserve-date::-webkit-scrollbar { /*스크롤바 전체 */
	background: none;
}
.reserve-date::-webkit-scrollbar-thumb { /*스크롤 막대 */
    background: rgba( 255, 255, 255, 0.3 );
    
}
.reserve-date::-webkit-scrollbar-track { /*스크롤 막대 외부 */
    background: none;
}

.movie-list::-webkit-scrollbar { /*스크롤바 전체 */
	background: none;
}
.movie-list::-webkit-scrollbar-thumb { /*스크롤 막대 */
    background: rgba( 255, 255, 255, 0.3 );
    
}
.movie-list::-webkit-scrollbar-track { /*스크롤 막대 외부 */
    background: none;
}

.time-list::-webkit-scrollbar { /*스크롤바 전체 */
	background: none;
}
.time-list::-webkit-scrollbar-thumb { /*스크롤 막대 */
    background: rgba( 255, 255, 255, 0.3 );
    
}
.time-list::-webkit-scrollbar-track { /*스크롤 막대 외부 */
    background: none;
}



.btn2{
	width: 280px; 
	height: 200px; 
	background-color: transparent; 
	font-size: 17px; 
	border: white;
	color: white;
	font-weight: bold;

}
 <!-- 일안함 -->
.btn2:visited {
	color: red;
}

.btn3{
	width: 280px; 
	height: 30px; 
	background-color: transparent; 
	font-size: 17px; 
	border: white;
	font-weight: bold;
	color: white;

}

.btn3:active {
	font-weight: bold;
	color: red;
}

.card-img-top{
	width: 100%;
	height: 100%
}

.btn4{
	width: 280px; 
	height: 30px; 
	background-color: transparent; 
	font-size: 17px; 
	border: white;
	font-weight: bold;
	color: white;

}

</style>
    
</head>
<body>
<p>
<h1>&nbsp;&nbsp;영화선택</h1>
<p>

<!-- 영화선택 -->
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
			<div class="card">
					<div class="movie-part"><p>
						<h4 class="card-title">&nbsp;&nbsp;영화</h4>
							<div class="movie-list">
							<c:choose>
						 		<c:when test="${empty requestScope.movieList}">
							  		<div>등록된 영화가 없습니다.</div>
						  		</c:when>
							  	<c:otherwise>
							  		<c:forEach items="${requestScope.movieList}" var="movie">
										<button type="button" class="btn2" id="moviebtn" style="color: white;" value="${movie.movieCode}">${movie.movieName}</button>
							  		</c:forEach>
							  	</c:otherwise>
					  		</c:choose>
						
						</div>
				</div>
			</div>
		</div>
		&nbsp;&nbsp;
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
			<div class="card">
				<div class="day-part"><p>
					<h4 class="card-title">&nbsp;&nbsp;날짜</h4>
					<div class="reserve-date">
					</div>
				</div>
			</div>
		</div>
		&nbsp;&nbsp;
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
			<div class="card">
				<div class="time-part"><p>
				<h4 class="card-title">&nbsp;&nbsp;시간</h4>
					<div class="time-list">
					</div>
				</div>
			</div>
		</div>
	</div>
<p><p><p><p>


<!-- 영화예약정보 -->    
    
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		
		<div class="form-group col-lg-4" style="display: inline-block; width: 250px; height: 300px; background-color: none;">
			<div class="card">
				<div class="card-body" style="height: 300px;">
				<h6 class="card-subtitle mb-2 text-muted" style="width: 250px; height: 300px; justify-content: center;">
					<div class="movieImg" style="width: 200px; height: 250px; justify-content: center;"></div>
				</h6>
				</div>
			</div>
		</div>&nbsp;&nbsp;
	
		<div class="form-group col-lg-4" style="display: inline-block; width: 650px; height: 300px;">
			<div class="card">
			  <div class="card-body" style="height: 300px;">
			    <h4 class="card-title"><div class="movieNameInfo"></div></h4>
			    <h6 class="card-subtitle mb-2 text-muted">일시 :  <div class="dateInfo" style="display: inline-block;"></div></h6>
			    <h6 class="card-subtitle mb-2 text-muted">상영관 : <div class="screenInfo" style="display: inline-block;"></div> </h6>
			  </div>
			</div>
		</div>
	</div>
<p><p><p><p>


<!-- 버튼 -->
	<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
		<div class="form-group col-lg-4" style="display: inline-block; width: 900px; height: 150px;">
		<div class="goSeat"></div>
		</div>
	</div>	
<p><p><p><p>


<script>
     
    /* 영화 클릭 시 날짜 선택하는 창뜨기 */
	$(function(){
   		$(".btn2").on("click", function(){
   			//alert(this.value); //클릭한 값이 나옴..!
   			let mc=this.value;
   			$.ajax({
   				type:"post",
   				url:"/cinema/date", //서버요청주소
   				dataType : "json", //서버가 응답해주는 데이터 타입 나중에 json으로..
   				data:{ "movieCode" : this.value }, //서버에 보낼 parameter정보
   				success: function(timeList){ //timeList에 있는 값들 꺼내와야함..
   					var result='';
   					var dateinfo ='';
					  $.each(timeList, function(index, item){
						  let i = item.timeDate.substr(0,10).split("-");
						  var dateinfo = i[0]+"년"+i[1]+"월"+i[2]+"일 "
						  let str = item.timeCode +"/" +item.timeDate +"/"+mc+"/"+item.timeStart+"/"+dateinfo;
						  result += '<button type="button" class="btn3" id="datebtn" value="'+str+'">' + dateinfo +'</button><p>';
						 
					 }) 
					 
					 $(".reserve-date").html(result);
					 $(".dateInfo").html(dateinfo);
					 $(".time-list").empty();
					 $(".goSeat").empty();
   			
					 
   					}
   			});	
   		});	
   	});  
   	
    
   	/* 날짜 클릭 시 시간 선택하기 */
    $(function() {
		$("body").on("click", "[class=btn3]" , function() {
			let v = this.value.split("/");
			let timeinfo ='';

			 $.ajax({
   				type:"post",
   				url:"/cinema/time",
   				dataType : "text", 
   				data:{ "timeDate" : v[1] , "movieCode" : v[2]  }, 
   				success: function(result){ 
   					let timeinfo = v[3].substr(11,5);
   					let str = v[0]+"/"+v[1]+"/"+v[2]+"/"+v[3]+"/"+v[4]+"/"+timeinfo; //item.timeCode +"/" +item.timeDate +"/"+mc+"/"+item.timeStart+"/"+dateinfo"/"+"/"+timeinfo;
   					var result='';
					result += '<button type="button" class="btn4" id="timebtn" value="'+str+'">' + timeinfo + '</button><p>';
					
					$(".time-list").html(result);
					$(".dateInfo").empty();
					$(".timeInfo").empty();
					$(".screenInfo").empty();
					$(".goSeat").empty();
   				}
   			});	 
		});
	}); 
   	
    function movepage(th) { 
		let v =   th.value.split(",");
		document.f.timeCode.value= v[0];
		document.f.tdate.value= v[1];
		document.f.mCode.value= v[2];
		document.f.tStart.value= v[3];
		document.f.sCode.value= v[4];
		document.f.submit();
		      
    }
   	
   	
   	/* 시간 클릭 시 상영관, 상영시간 예매창에 띄우기*/
    $(function() {
		$("body").on("click", "[class=btn4]" , function() {
			let v = this.value.split("/");
			var seatbtn ='';

			$.ajax({
   				type:"post",
   				url:"/cinema/ticketingInfo2",
   				dataType : "json", //나중에 json으로..
   				data:{ "timeCode" : v[0] }, //서버에 보낼 parameter정보
   				success: function(result){ 
	   				let str = v[0]+","+v[1]+","+v[2]+","+v[3]+","+result.screenCode+","+result.screenName;
	   				seatbtn +='<button type="button" class="btn btn-primary btn-lg" id="goSeat" style="width: 910px; height: 150px;" value="'+str+'" onclick="movepage(this)" >좌석선택<p>>></button><p>';	   				$(".dateInfo").html(v[4]+"  /  "+v[5]);	
	   				$(".screenInfo").html(result.screenName);
	   				$(".goSeat").html(seatbtn);
	   				
	   				
				}

   			});	 
		});
	}); 
    
   	
    /* 영화 클릭 시 영화이름, 영화이미지 예매창에 띄우기*/
    /* 선택가능한 날짜만 출력해서 선택하게..?*/
    $(function() {
		$(".btn2").on("click", function() {
			$.ajax({
   				type:"post",
   				url:"/cinema/ticketingInfo",
   				dataType : "json", //나중에 json으로..
   				data:{ "movieCode" : this.value }, //서버에 보낼 parameter정보
   				success: function(movie){ //movie에 있는 값들 꺼내와야함..
   					$(".dateInfo").empty();
   					$(".timeInfo").empty();
   	   				$(".screenInfo").empty();
   					$(".movieNameInfo").html(movie.movieName);
   					
   					var result ='';
   					result += '<img class="card-img-top" src="${pageContext.request.contextPath}/img/movie/'+movie.movieImage+'" />';
   					$(".movieImg").html(result);
				}

   			});	
		});
	})

</script>

	<form action="${pageContext.request.contextPath}/cinema/seat" name="f" method="post">
		<input type="hidden" name="timeCode" value="">
		<input type="hidden" name="tdate" value="">
		<input type="hidden" name="mCode" value="">
		<input type="hidden" name="tStart" value="">
		<input type="hidden" name="sCode" value="">
	</form>
	
</body>
</html>