<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script type="text/javascript">
	function movepage(page) { 
		window.document.location.href=page; 
		return; 
	}
</script>
</head>
<body>
<h1>sales.jsp 매출 조회입니다</h1>


<div class="card text-white bg-secondary mb-3" style="max-width: 60rem;">
  <div class="card-header">
  	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a class="nav-link" href="${pageContext.request.contextPath}/manager/totalSales">전체 매출</a>
	  </li>
	  <li class="nav-item">
    	<a class="nav-link active" href="#">영화별 매출</a>
  	  </li>
  	</ul>
  </div>
  <div class="card-body">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="float: right">
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="">
	  <label class="btn btn-outline-secondary" for="btnradio1">이번달</label>
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
	  <label class="btn btn-outline-secondary" for="btnradio2">올해</label>
	</div>
    <p class="card-text">
    	<canvas id="myDoughnut"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">
//시작화면 : 이번달 매출
window.onload = monthly;
$("#btnradio1").click(monthly);
$("#btnradio2").click(yearly);

//setup시작
var labels = []
var salesArr = []

const data = {
  labels: labels,
  datasets: [
    {
      label: '영화별 예매 횟수',
      data: salesArr,
      backgroundColor: [
          'rgba(255, 99, 132, 0.5)',
          'rgba(255, 159, 64, 0.5)',
          'rgba(255, 206, 86, 0.5)',
          'rgba(75, 192, 192, 0.5)',
          'rgba(54, 162, 235, 0.5)',
          'rgba(153, 102, 255, 0.5)'
      ],
    }
  ]
};//setup끝

//config시작
const config = {
		  type: 'doughnut',
		  data: data,
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      }
		    }
		  },
		};//config끝

var myDoughnut = new Chart(
   document.getElementById('myDoughnut'),
   config
 );

function yearly(){
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/salesYearlyByMovieList",
		mothod : "post",
		dataType : "json",
		success : function(result){
			
			config.data.labels = [];
			config.data.datasets[0].data = [];
			
			$.each(result, function(index, item){
				config.data.labels.push(item.movie_Name);
				config.data.datasets[0].data.push(item.cnt);
			});
			
			myDoughnut.update();
		},
		error : function(err){
			console.log(err + "에러 발생");
		}
		
	});//ajax끝
}//yeary()끝

function monthly(){
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/salesMonthlyByMovieList",
		mothod : "post",
		dataType : "json",
		async : false,
		success : function(result){
			config.data.labels = [];
			config.data.datasets[0].data = [];
			
			$.each(result, function(index, item){
				config.data.labels.push(item.movie_Name);
				config.data.datasets[0].data.push(item.cnt);
			});
			
			myDoughnut.update();
		},
		error : function(err){
			console.log(err + "에러 발생");
		}
		
	});//ajax끝
}//yeary()끝
</script>

</body>
</html>