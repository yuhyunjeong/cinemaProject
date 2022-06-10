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
<h1>salesByMonth.jsp 매출 조회입니다</h1>
<fieldset>
	<div class="form-check form-switch" onclick="movepage('${pageContext.request.contextPath}/manager/salesByMovie')">
	  <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
	  <label class="form-check-label" for="flexSwitchCheckChecked">영화별 조회하기</label>
	</div>
</fieldset>
<p>

<div class="card text-white bg-secondary mb-3" style="max-width: 70rem;">
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

</body>
</html>