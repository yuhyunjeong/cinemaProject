<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<link
  rel="stylesheet"
  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
/>
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
      img{
      	width: 100%;
      	height: 100%;
      }
      
      .movie_container {
      	width:100%;height:100%;
      }

      .movie_left {
      	width:50%;
      	height:40px;
      	float:left;
      }
      .movie_right {
     	 width:50%;
     	 height:40px;
     	 float:right;
     	 text-align: right;
     }
     .movie_list {
    	 width:100%;
    	 height:150px;
    	 background-color:red;
    	 float:left;
     }
     .event_notice_container {
      	width:100%;
      	height:100%;
      }
      .event_container{
      	width:50%;height:100%;
      	float: left;
      }
      .notice_container{
     	width:50%;height:100%;
     	float: right;
      }

      .event_left {
      	width:50%;
      	height:40px;
      	float:left;
      }
      .event_right {
     	 width:50%;
     	 height:40px;
     	 float:right;
     	 text-align: right;
     }
     .event_list {
    	 width:100%;
    	 height:150px;
    	 background-color:blue;
    	 float:left;
     }
     .notice_left {
      	width:50%;
      	height:40px;
      	float:left;
      }
      .notice_right {
     	 width:50%;
     	 height:40px;
     	 float:right;
     	 text-align: right;
     }
     .notice_list {
    	 width:100%;
    	 height:150px;
    	 background-color:green;
    	 float:left;
     }



    </style>
    <script type="text/javascript">
    	$(function() {
    		var swiper = new Swiper(".mySwiper", {
    	        spaceBetween: 30,
    	        centeredSlides: true,
    	        autoplay: {
    	          delay: 2500,
    	          disableOnInteraction: false,
    	        },
    	        pagination: {
    	          el: ".swiper-pagination",
    	          clickable: true,
    	        },
    	        navigation: {
    	          nextEl: ".swiper-button-next",
    	          prevEl: ".swiper-button-prev",
    	        },
    	      });
		});
    </script>
    
</head>
<body>

	<!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/movieTest1.jpg"></div>
        <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/movieTest2.jpg"></div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    
    <br>

    
	<div class="movie_container">
	    <div class="movie_left"><h2>영화</h2> </div>
	    <div class="movie_right"><a href="#">전체보기</a></div>
	    <div class="movie_list">리스트</div>
	    <br>
    </div>

	
	
	<div class="event_notice_container">
		<div class="event_container">
			<div class="event_left"><h2>이벤트</h2> </div>
		    <div class="event_right"><a href="#">전체보기</a></div>
		    <div class="event_list">리스트</div>
		</div>
	    <div class="notice_container">
			<div class="notice_left"><h2>공지사항</h2> </div>
		    <div class="notice_right"><a href="#">전체보기</a></div>
		    <div class="notice_list">리스트</div>
		</div>
    </div>


    


    

</body>
</html>