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
	function select(){
		
	}
	
	
	$('input[name="optionsRadios"]').on("change", function() {
		
		//alert(this.value)
				
		$.ajax({
			url: "selectMovie", // 서버요청주소 
			type: "post", // 요청방식(get, post, delete, patch),
			dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data:{
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
					str+=`<a class='card-link' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
					str+="<hr>";
					str+=`<p class='card-text'>${'${item.movieName}'}</p>`;
					str+="</div></div></div>";
					
				});
				
				$("#rrr").empty();
				$("#rrr").html(str);
				
			}, error: function(err) {
				
			}
		});
	});
	
	
	
	select();

}) // ready End

</script>

</head>
<body>
	<h1>영화목록 페이지 입니다.</h1>
	
	<div class='container mb-4'>
	<div class="row">
	<fieldset class="form-group" style="padding-left: 80%">
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios"
				value="option1" checked=""> 최신순
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios"
				value="option2"> 예매율순
			</label>
		</div>
		<div class="form-check disabled">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="optionsRadios" id="optionsRadios"
				value="option3"> 관람객순
			</label>
		</div>
	</fieldset>
	</div>


	
		<div id='rrr' class='row row-cols-1 row-cols-md-4 g-4'>
			
		</div>
	</div>
</body>
</html>