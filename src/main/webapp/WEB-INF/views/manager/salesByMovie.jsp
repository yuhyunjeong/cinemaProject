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


<div class="card text-white bg-secondary mb-3" style="max-width: 70rem;">
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
	  <label class="btn btn-outline-secondary" for="btnradio1">월별</label>
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
	  <label class="btn btn-outline-secondary" for="btnradio2">연도별</label>
	</div>
    <p class="card-text">
    	<canvas id="myDoughnut"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">
//setup시작
const DATA_COUNT = 6;

const data = {
  labels: ['Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'],
  datasets: [
    {
      label: 'Dataset 1',
      data: [12,19,15,3,2,7],
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
</script>

</body>
</html>