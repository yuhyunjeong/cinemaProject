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
<h1>sales.jsp 매출 조회입니다</h1>

<ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
</ul>


<div class="card text-white bg-secondary mb-3" style="max-width: 20rem;">
  <div class="card-header">월별 매출</div>
  <div class="card-body">
    <p class="card-text">
    	<canvas id="myChart"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">
  var labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  var data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };

  var config = {
    type: 'line',
    data: data,
    options: {}
  };
  var myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>


<div class="card text-white bg-secondary mb-3" style="max-width: 20rem;">
  <div class="card-header">영화별 매출</div>
  <div class="card-body">
    <p class="card-text">
    	<canvas id="myPie"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">
var data = {
		  labels: [
		    'Red',
		    'Blue',
		    'Yellow'
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [300, 50, 100],
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)'
		    ],
		    hoverOffset: 4
		  }]
		};

var config = {
  type: 'pie',
  data: data,
};

var myPie = new Chart(
   document.getElementById('myPie'),
   config
 );
</script>

</body>
</html>