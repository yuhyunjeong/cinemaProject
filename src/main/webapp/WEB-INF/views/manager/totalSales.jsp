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
	
	$(function(){
		
	})
</script>
</head>
<body>
<h1>totalSales.jsp 매출 조회입니다</h1>

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
	<ul class="nav nav-pills" style="float:right">
	  <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">--옵션 선택--</a>
		<div class="dropdown-menu">
		  <a class="dropdown-item" href="#">월별</a>
		  <a class="dropdown-item" href="#">연도별</a>
		</div>
	  </li>
	</ul>
	<p>
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

</body>
</html>