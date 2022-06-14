<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
</head>
<body>
<h1>매출 조회 중입니다.</h1>
<div class="card text-white bg-secondary mb-3" style="max-width: 70rem;">
  <div class="card-header">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a class="nav-link active" href="#">전체 매출</a>
	  </li>
	  <li class="nav-item">
    	<a class="nav-link" href="${pageContext.request.contextPath}/manager/salesByMovie">영화별 매출</a>
  	  </li>
  	</ul>
  </div>
  <div class="card-body">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="float: right">
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="">
	  <label class="btn btn-outline-secondary" for="btnradio1">월별</label>
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
	  <label class="btn btn-outline-secondary" for="btnradio2">연도별</label>
	</div>
	<p>
    <p class="card-text">
    	<canvas id="myChart"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">

//시작화면 : 월별 매출
window.onload = monthly;
$("#btnradio1").click(monthly);
$("#btnradio2").click(yearly);

//setup시작
var labels = new Array();
var salesArr = new Array();
var foodSalesArr = new Array();
var movieSalesArr = new Array();

const data = {
  labels: labels,
  datasets: [
    {
      label: '먹거리매출',
      data: foodSalesArr,
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgb(255, 99, 132)',
      type: 'bar'
    },
    {
      label: '영화매출',
      data: movieSalesArr,
      borderColor: 'rgba(54, 162, 235, 1)',
      backgroundColor: 'rgba(54, 162, 235, 1)',
      type: 'bar'
    },
    {
      label: '총 매출',
      data: salesArr,
      borderColor: 'rgba(75, 192, 192, 1)',
      backgroundColor: 'rgba(75, 192, 192, 1)',
      fill: false,
      type: 'line'
    }
  ]
};
//setup끝

//config시작
const config = {
  type: 'line',
  data: data
};//config끝

const myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );

	  
function yearly(){
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/salesByYear",
		mothod : "post",
		dataType : "json",
		success : function(result){
			
			config.data.labels = [];
			config.data.datasets[0].data = [];
			config.data.datasets[1].data = [];
			config.data.datasets[2].data = [];
			
			$.each(result, function(index, item){
				config.data.labels.push(item.datedata+"년");
				config.data.datasets[0].data.push(item.food_Price);
				config.data.datasets[1].data.push(item.movie_Price);
				config.data.datasets[2].data.push(item.total_Price);
			});
			
			myChart.update();
			$("#salesSelectToggle").text("연도별");
		},
		error : function(err){
			console.log(err + "에러 발생");
		}
		
	});//ajax끝
}//yeary()끝

function monthly(){
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/salesByMonth",
		mothod : "post",
		dataType : "json",
		async : false,
		success : function(result){
			config.data.labels = [];
			config.data.datasets[0].data = [];
			config.data.datasets[1].data = [];
			config.data.datasets[2].data = [];
			
			$.each(result, function(index, item){
				config.data.labels.push((index+1)+"월");
				config.data.datasets[0].data.push(item.food_Price);
				config.data.datasets[1].data.push(item.movie_Price);
				config.data.datasets[2].data.push(item.total_Price);
			});
			
			myChart.update();
			$("#salesSelectToggle").text("월별");
		},
		error : function(err){
			console.log(err + "에러 발생");
		}
		
	});//ajax끝
}//yeary()끝

</script>

</body>
</html>