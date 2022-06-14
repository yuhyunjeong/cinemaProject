<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
$(function() {
	
	// 전체검색
/* 		$("#exampleSelect1").click(function() {
		$.ajax({
			url:"product", // 서버요청주소 
			type:"post", // 요청방식 
			dataType:"text" // 서버가 보내온 데이터(응답)타입 
			success: function(result) {
				alert(result)	
			}
		});
	} */
	
	//$(".date").html(moment.(${"${item.movieStartdate}"}).format('YYYY-MM-DD'))
	
	function select(){
		$.ajax({
			url: "selectMovie", // 서버요청주소 
			type: "post", // 요청방식(get, post, delete, patch),
			dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data:{
				"${_csrf.parameterName}" : "${_csrf.token}", 
				"optionsRadios":$("#optionsRadios1").val()
			}, // 서버에게 보낼 parameter 정보 */
			
			success: function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
				//alert(movieList)
				let str="";
				$.each(movieList, function(index, item){
					//var day = moment("${item.movieStartdate}").format("YYYY-MM-DD")+ " 개봉";
					
					str+="<div class='col-lg-3 col-md-6'>";
					str+="<div class='card mb-3 h-100'>";
					str+="<div class='card-body'>";
					//str+=`<h4 class='card-title'>영화</h4>`;
					str+=`<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
					str+="<hr>";
					str+=`<div class='card-text'><h5>${"${item.movieName}"}</h5></div><p><div class='date'></div>`;
					str+="</div></div></div>";
					//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
					
				});
				
				$("#rrr").empty();
				$("#rrr").html(str);
				
				//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
				
			}, error: function(err) {
				
			}
		});
	}
	
	
	
	$('input[name="optionsRadios"]').on("change", function() {
		
		//alert(this.value)
		
		$.ajax({
			url: "selectMovie", // 서버요청주소 
			type: "post", // 요청방식(get, post, delete, patch),
			dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data:{
				"${_csrf.parameterName}" : "${_csrf.token}", 
				"optionsRadios":$(this).val()
			}, // 서버에게 보낼 parameter 정보 */
			
			success: function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
				//alert(movieList)
				let str="";
				
				if($("#flexCheckDefault").is(":checked")){
					
					$.each(movieList, function(index, item){
										
					
						str+="<div class='col-lg-3 col-md-6'>";
						str+="<div class='card mb-3 h-100'>";
						str+="<div class='card-body'>";
						//str+=`<h4 class='card-title'>영화</h4>`;
						str+=`<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
						str+="<hr>";
						str+=`<div class='card-text'><h5>${"${item.movieName}"}</h5></div><p><div class='date'></div>`;
						str+="</div></div></div>";
						//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
					
					});
					
					$("#rrr").empty();
					$("#rrr").html(str);
				
				
					
				}else{
					
					
					
				}
				
				//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
				
			}, error: function(err) {
				
			}
		});
		
		
	});
	
	$("#flexCheckDefault").on("click", function() {
		
		//alert(this.value)
		
		$.ajax({
			url: "selectMovie", // 서버요청주소 
			type: "post", // 요청방식(get, post, delete, patch),
			dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data:{
				"${_csrf.parameterName}" : "${_csrf.token}", 
				"optionsRadios":$(this).val()
			}, // 서버에게 보낼 parameter 정보 */
			
			success: function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
				//alert(movieList)
				let str="";
				$.each(movieList, function(index, item){
										
					
					str+="<div class='col-lg-3 col-md-6'>";
					str+="<div class='card mb-3 h-100'>";
					str+="<div class='card-body'>";
					//str+=`<h4 class='card-title'>영화</h4>`;
					str+=`<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
					str+="<hr>";
					str+=`<div class='card-text'><h5>${"${item.movieName}"}</h5></div><p><div class='date'></div>`;
					str+="</div></div></div>";
					//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
					
				});
				
				$("#rrr").empty();
				$("#rrr").html(str);
				
				//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
				
			}, error: function(err) {
				
			}
		});
		
		
	});
	
	
	select();
	
	
	
	$()
	

}) // ready End

</script>

</head>
<body>
	
	
	<div class='container mb-4'>
	
	
	<div class="row">
	<div class="col">
	<h1>영화 목록</h1>
	
	 <div class="form-check">
	 	
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">
         현재상영작만 보기
        </label>
      </div>
	</div>
	<div class="col">
	<fieldset class="form-group" style="padding-left: 70%; padding-top: 5%">
	
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios1"
				value="option1" checked=""> 최신순
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios2"
				value="option2"> 예매율순
			</label>
		</div>
		<div class="form-check disabled">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios3"
				value="option3"> 별점순
			</label>
		</div>
	</fieldset>
	</div>
	</div>


	<div class="row">
		<div id='rrr' class='row row-cols-1 row-cols-md-4 g-4'>
			
		</div>
	</div>
	</div>
</body>
</html>