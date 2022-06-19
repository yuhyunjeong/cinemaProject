<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Demo styles -->

<style>
.swiper mySwiper {
	position: relative;
	height: 300px;
	width: 1500px;
}

.swiper mySwiper {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 1500px;
	height: 300px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 1500px;
	height: 300px;
	object-fit: cover;
}

.movie_container {
	width: 100%;
	height: 100%;
}

.movie_left {
	width: 50%;
	height: 60px;
	float: left;
}

.movie_right {
	width: 50%;
	height: 60px;
	float: right;
	text-align: right;
}

.movie_list {
	width: 100%;
	height: 100%;
	float: left;
}

#event_notice_container {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-around;
}

#event_container {
	width: 100%;
	height: 100%;
	float: left;
	flex: 1;
}

.notice_container {
	width: 100%;
	height: 100%;
	float: right;
	flex: 1;
}

#event_left {
	width: 50%;
	height: 40px;
	float: left;
}

#event_right {
	width: 50%;
	height: 40px;
	float: right;
	text-align: right;
}

#event_list {
	width: 100%;
	height: 150px;
	float: left;
}

.notice_left {
	width: 50%;
	height: 40px;
	float: left;
}

.notice_right {
	width: 50%;
	height: 40px;
	float: right;
	text-align: right;
}

.notice_list {
	width: 100%;
	height: 150px;
	background-color: green;
	float: left;
}

.card-img-top {
	width: 100%;
	height: 100%;
}

.card-text {
	text-align: center;
}

#movieCard {
  transition: all 0.2s linear;
}
#movieCard:hover {
  transform: scale(1.2);
}


</style>



<script type="text/javascript">
	$(function() {
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});

		function select() {
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
								//alert(item.movieStartdate)
								if (index < 4) {
									str += "<div class='col-lg-3 col-md-6'>";
									str += "<div id='movieCard' class='card  m-1 h-90'>";
									str += "<div class='card-body'>";
									//str+=`<h4 class='card-title'>영화</h4>`;
									str += `<a class='card-img' href='${pageContext.request.contextPath}/cinema/movieDetail/${"${item.movieCode}"}'> 
									<img class='card-img-top' src='${path}/img/movie/${"${item.movieImage}"}' /></a>`
									str += "<hr>";
									str += `<p class='card-text'><h5>${'${item.movieName}'}</h5></p><span class="badge bg-primary">${"${item.movieGenre}"}</span>`;
									str += "</div></div></div>";
								}
							});

							$("#rrr").empty();
							$("#rrr").html(str);

						},
						error : function(err) {

						}
					});
		}
		function eventMainList() {
			$.ajax({
				url: "${pageContext.request.contextPath}/board/eventMainList",
				type: "post", 
				dataType: "json", 
				data:{
					
				}, 
				success: function(eList) { 
					let str = "";
					$.each(eList, function(index, item) {
						if(index < 5){
							str += `<a href='${pageContext.request.contextPath}/board/eventDetail/${"${item.bno}"}'>${"${item.title}"}</a><br>`
						}
					});
					$("#event_list").empty();
					$("#event_list").html(str);
				},
					
					
				error: function(err) {
					
				}
			});
		}
		
		function noticeMainList() {
			$.ajax({
				url: "${pageContext.request.contextPath}/board/noticeMainList",
				type: "post", 
				dataType: "json", 
				data:{
					
				}, 
				success: function(nList) { 
					let str = "";
					$.each(nList, function(index, item) {
						if(index < 5){
							str += `<a href='${pageContext.request.contextPath}/board/noticeDetail/${"${item.bno}"}'>${"${item.title}"}</a><br>`
						}
					});
					$("#notice_list").empty();
					$("#notice_list").html(str);
				},
					
					
				error: function(err) {
					
				}
			});
		}

		select();
		eventMainList();
		noticeMainList();
		
	});
	
		
</script>

</head>
<body>
 
	<!-- Swiper -->
	<!-- 
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/img/movieTest1.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/img/movieTest2.jpg">
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div> 
	-->

	<br>


	<div class="movie_container">
		<div class="row">
			<div class="col movie_left">
				<h2>&nbsp;&nbsp;&nbsp;최신 상영작</h2>
			</div>
			<div class="col movie_right">
				<button type="button" class="btn btn-secondary"
					onclick="location.href='${pageContext.request.contextPath}/cinema/movie'">전체보기</button>
			&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="row">
			<div class="movie_list">

				<div class='row row-cols-1 row-cols-md-4 g-4'
					style="justify-content: center;" id="rrr"></div>

			</div>
		</div>
		<br>
	</div>



	<div  id="event_notice_container">
		<div class="card" style="width: 40%;">
			<div class="card-body" id="event_container">
				<div id="event_left">
					<h2>이벤트</h2>
				</div>
				<div id="event_right">
					<a href="${pageContext.request.contextPath}/board/event">전체보기</a>
				</div>
				<div id="event_list"></div>
			</div>
		</div>
		<div class="card" style="width: 40%;">
			<div class="card-body"  id="notice_container">
				<div class="notice_left">
					<h2>공지사항</h2>
				</div>
				<div class="notice_right">
					<a href="#">전체보기</a>
				</div>
				<div id="notice_list">리스트</div>
			</div>
		</div>
	</div>




</body>
</html>