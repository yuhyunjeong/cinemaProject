<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />


<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<style type="text/css">
.card {
	transition: all 0.2s linear;
}

.card:hover {
	transform: scale(1.2);
}
#rrr{
	margin-top: 24px;
}
</style>

<script type="text/javascript">

$(function() {
	

	function select(){
		
		
		var optionsRadios = document.getElementsByName("optionsRadios");
		var option = "";
		//alert(optionsRadios.length);
		
		for (var i = 0; i < optionsRadios.length; i++)
		{
			//alert(radioObj[i].checked);	 // true or false 반환한다.
			
			if (optionsRadios[i].checked)
			{
				option = "option"+(i+1);
				//alert(option)		
		
				$.ajax({
										
					url: "selectMovie", // 서버요청주소 
					type: "post", // 요청방식(get, post, delete, patch),
					dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
					data:{
						"${_csrf.parameterName}" : "${_csrf.token}", 
						"optionsRadios": option
						//"optionsRadios": $("#optionsRadios1").val()
					}, // 서버에게 보낼 parameter 정보 */
					
					success: function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
						//alert(movieList)
						let str="";
						$.each(movieList, function(index, item){
							//var day = moment("${item.movieStartdate}").format("YYYY-MM-DD")+ " 개봉";
							
							let i = item.movieStartdate.substr(0,10).split("-");
							var dateinfo = i[0]+"-"+i[1]+"-"+i[2]+" 개봉"
							console.log(dateinfo);
							
							str+="<div class='col-lg-3 col-md-6'>";
							str+="<div class='card mb-3 h-100'>";
							str+="<div class='card-body'>";
							//str+=`<h4 class='card-title'>영화</h4>`;
							str+=`<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
							str+="<hr>";
							str+=`<div class='card-text'><h5>${"${item.movieName}"}</h5></div><span class="badge bg-primary">${"${item.movieGenre}"}</span><p><div class='date'>${"${dateinfo}"}</div>`;
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
		}
		
			
	}
	

	$('input[name="optionsRadios"]').on("change", function() {	
		
		
		$.ajax({
			url: "selectMovie", // 서버요청주소 
			type: "post", // 요청방식(get, post, delete, patch),
			dataType: "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data:{
				"${_csrf.parameterName}" : "${_csrf.token}", 
				"optionsRadios":$(this).val()
				//"flexCheckDefault": x
			} // 서버에게 보낼 parameter 정보 */
			,
			success: function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
				//alert(movieList)
				let str="";
		
					
					$.each(movieList, function(index, item){
							
						let i = item.movieStartdate.substr(0,10).split("-");
						var dateinfo = i[0]+"-"+i[1]+"-"+i[2]+" 개봉"
						console.log(dateinfo);
					
						str+="<div id='${item.movieCode}' class='col-lg-3 col-md-6'>";
						str+="<div class='card mb-3 h-100'>";
						str+="<div class='card-body'>";
						//str+=`<h4 class='card-title'>영화</h4>`;
						str+=`<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> <img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`							
						str+="<hr>";
						str+=`<div class='card-text'><h5>${"${item.movieName}"}</h5></div><span class="badge bg-primary">${"${item.movieGenre}"}</span><p><div class='date'>${"${dateinfo}"}</div>`;
						str+="</div></div></div>";
						//$(".date").html(moment(${item.movieStartdate}).format("YYYY-MM-DD")+" 개봉");
					
					});
					
					$("#rrr").empty();
					$("#rrr").html(str);
				
				
				
			}, error: function(err) {
				
			}
		});	
	
	
	});	
	
	var data = null;
	
	function checkBox(){
		
		$.ajax({
			url : "cinema/nowMovie", // 서버요청주소 
			type : "post", // 요청방식(get, post, delete, patch),
			dataType : "json", // (제일 중요!)서버가 응답해주는 데이터타입 (text, html, xml, json)
			data : {
				"${_csrf.parameterName}" : "${_csrf.token}"
			//	"optionsRadios":$("#optionsRadios1").val()
			}, // 서버에게 보낼 parameter 정보 */

			success : function(movieList) { // 성공여부 callback함수 , result는 서버가 리턴해주는 데이터가 들어간다.
				//alert(movieList)
				let str = "";
				$.each(movieList, function(index, item) {
					//$("div").remove("${item.movieCode}");
					data = $(".${item.movieCode}").detach();

				});

			},
			error : function(err) {

			}
		});
		
	}
	
	select();
	
	if($('#flexCheckDefault').is(":checked")){
		
		checkBox();
	}else{
		$(".${item.movieCode}").after(data);
	}
	
	//var current = 
	
	

}) // ready End

</script>


</head>
<body>


	<div class='container mb-4'>


		<div class="row" style="padding-top: 30px;">
			<div class="col" style="padding-left: 60px;">
				<h1>Movie</h1>
				<!-- 
				<div class="form-check">

					<input class="form-check-input" type="checkbox" value="check"
						name="check" id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 현재상영작만 보기 </label>
				</div>
				 -->
			</div>
			<div class="col">
				<fieldset class="form-group"
					style="padding-left: 70%; padding-top: 5%">

					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="optionsRadios" id="optionsRadios1"
							value="option1" checked=""> 최신순
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="optionsRadios" id="optionsRadios2"
							value="option2"> 인기순
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

		<hr>
		
		<div class="row">
			<div id='rrr' class='row row-cols-1 row-cols-md-4 g-4'></div>
		</div>
		
		<!-- 
		<div class="row m-3">
			<ul class="pagination">
				<c:set var="doneLoop" value="false" />
				<li class="${(startPage-blockCount) <= 0?'page-item disabled':page}">

					<a class="page-link"
					href="${pageContext.request.contextPath}/cinema/movie?nowPage=${startPage-1}">&laquo;</a>

				</li>
				<c:forEach var='i' begin='${startPage}'	end='${(startPage-1)+blockCount}'>
					<c:if test="${(i-1)>=pageList.getTotalPages()}">
						<c:set var="doneLoop" value="true" />
					</c:if>
					<c:if test="${not doneLoop}">
					
						<li class="${i==nowPage?'page-item active':active}">
						<a class="page-link"
							href="${pageContext.request.contextPath}/cinema/movie?nowPage=${i}">${i}</a>
						</li>
					</c:if>
				</c:forEach>
					<li
						class="${(startPage+blockCount)>pageList.getTotalPages()? 'page-item disabled': page}">
						<a class="page-link"
						href="${pageContext.request.contextPath}/cinema/movie?nowPage=${startPage+blockCount}">&raquo;</a>
					</li>
				</ul>
		</div>
		
		-->
	</div>

</body>
</html>