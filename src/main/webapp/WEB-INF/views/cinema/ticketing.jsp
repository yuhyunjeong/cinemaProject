<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>



.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    height: 250px;
    overflow: scroll;
    overflow-x: hidden;
}


.reserve-date::-webkit-scrollbar { /*스크롤바 전체 */
	background: none;
}
.reserve-date::-webkit-scrollbar-thumb { /*스크롤 막대 */
    background: rgba( 255, 255, 255, 0.3 );
    
}
.reserve-date::-webkit-scrollbar-track { /*스크롤 막대 외부 */
    background: none;
}


.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
    background-color: rgba( 255, 255, 255, 0 );
    border: white 1px;
    
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 15px;
    width: 12px;
    height: 22px;
    line-height: 30px;
}

.movie-day {
    text-align: center;
    width: 30px;
    height: 20px;
    font-size: 17px;
    font-weight: bold;
    border-collapse: collapse;
}

.saturday {
    color: #39CBFB;
    font-weight: bold;
}

.sunday {
    color: #F2358D;
    font-weight: bold;
}

.movie-date-wrapper-active>* {
    color: white;
}


</style>
    
</head>
<body>
<p>
<h1>&nbsp;&nbsp;영화선택</h1>
<p>
<!-- 영화선택 -->
<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
	<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
		<div class="card">
				<div class="movie-part"><p>
					<h4 class="card-title">&nbsp;&nbsp;영화</h4>
					<div class="movie-list">영화 목록 가져오기</div>
			</div>
		</div>
	</div>
	&nbsp;&nbsp;
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
		<div class="card">
			<div class="day-part"><p>
				<h4 class="card-title">&nbsp;&nbsp;날짜</h4>
				<div class="reserve-date"></div>
			</div>
		</div>
	</div>
	&nbsp;&nbsp;
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 300px; height: 300px;">
		<div class="card">
			<div class="time-part"><p>
			<h4 class="card-title">&nbsp;&nbsp;시간</h4>
			</div>
		</div>
	</div>
</div>
<p><p><p><p>

<!-- 영화예약정보 -->    
    
<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 150px; background-color: none;">
		<div class="card">
			<div class="card-body" style="height: 150px;">
			<h6 class="card-subtitle mb-2 text-muted" style="width: 200px; height: 150px;"></h6>
			</div>
		</div>
	</div>&nbsp;&nbsp;

	<div class="form-group col-lg-4" style="display: inline-block; width: 600px; height: 150px;">
		<div class="card">
		  <div class="card-body" style="height: 150px;">
		    <h4 class="card-title">영화이름</h4>
		    <h6 class="card-subtitle mb-2 text-muted">일시 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">상영관 : </h6>
		  </div>
		</div>
	</div>
	&nbsp;&nbsp;
	
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px; height: 150px;">
    	<button type="button" class="btn btn-primary btn-lg" style="width: 200px; height: 150px;" onclick="${pageContext.request.contextPath}/cinema/seat">좌석선택 <p> >> </button>
	</div>
	
</div>
<p>


<script>
    const date = new Date();
    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    const reserveDate = document.querySelector(".reserve-date");

  
        const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
        const year = date.getFullYear();
        const month = date.getMonth();
        for (i = date.getDate(); i <= lastDay.getDate(); i++) {

            const button = document.createElement("button");
            const spanWeekOfDay = document.createElement("span");
            const spanDay = document.createElement("span");

            //class넣기
            button.classList = "movie-date-wrapper"
            spanWeekOfDay.classList = "movie-week-of-day";
            spanDay.classList = "movie-day";

            //weekOfDay[new Date(2021-06-03)]
            const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

            //요일 넣기
            if (dayOfWeek === "토") {
                spanWeekOfDay.classList.add("saturday");
                spanDay.classList.add("saturday");
            } else if (dayOfWeek === "일") {
                spanWeekOfDay.classList.add("sunday");
                spanDay.classList.add("sunday");
            }
            spanWeekOfDay.innerHTML = dayOfWeek;
            button.append(spanWeekOfDay);
            //날짜 넣기
            spanDay.innerHTML = i;
            button.append(spanDay);
            
            reserveDate.append(button);

            dayClickEvent(button);
        }

    function dayClickEvent(button) {
        button.addEventListener("click", function() {
            const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
            movieDateWrapperActive.forEach((list) => {
                list.classList.remove("movie-date-wrapper-active");
            })
            button.classList.add("movie-date-wrapper-active");
        })
    }
</script>


</body>
</html>