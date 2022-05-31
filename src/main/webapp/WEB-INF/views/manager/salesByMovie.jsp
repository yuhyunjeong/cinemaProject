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
<fieldset>
	<div class="form-check form-switch" onclick="movepage('${pageContext.request.contextPath}/manager/salesByMonth')">
	  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
	  <label class="form-check-label" for="flexSwitchCheckDefault">월별 조회하기</label>
	</div>
</fieldset>
<p>

<div class="card text-white bg-secondary mb-3" style="max-width: 40rem;">
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