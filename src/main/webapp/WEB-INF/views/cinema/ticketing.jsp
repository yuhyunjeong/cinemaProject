<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

/* #aa{
	display : flex;
	flex-flow : row nowrap;
	justify-content: center;
	
} */

</style>

</head>
<body>
<h1>영화선택</h1>

<form>
  <fieldset>
   <div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
    <div class="form-group col-lg-4" style="display: inline-block; width: 300px;">
      <label for="exampleSelect2" class="form-label mt-4">영화</label>
      <select multiple="" class="form-select" id="exampleSelect2">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
  
    <div class="form-group col-lg-4" style="display: inline-block; width: 300px;">
      <label for="exampleSelect2" class="form-label mt-4">날짜</label>
      <select multiple="" class="form-select" id="exampleSelect2">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
   
    
    <div class="form-group col-lg-4" style="display: inline-block; width: 300px;">
      <label for="exampleSelect2" class="form-label mt-4">시간</label>
      <select multiple="" class="form-select" id="exampleSelect2">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
  </div>
  </div>
    
    <p>
    
    
<div class="col-lg-12" style="display: flex; flex-flow: row; justify-content: center; ">
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px;">
		<div class="card" style="display: inline-block;">
			<div class="card-body">
			<h6 class="card-subtitle mb-2 text-muted">영화이미지</h6>
			</div>
		</div>
	</div>
		
		
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px;">
		<div class="card">
		  <div class="card-body">
		    <h4 class="card-title">영화이름</h4>
		    <h6 class="card-subtitle mb-2 text-muted">일시 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">상영관 : </h6>
		    <h6 class="card-subtitle mb-2 text-muted">인원 : </h6>
		  </div>
		</div>
	</div>
		
	<div class="form-group col-lg-4" style="display: inline-block; width: 200px;">
    	<button type="submit" class="btn btn-primary">좌석선택 <p> >> </button>
	</div>
</div>

    
    
</fieldset>
</form>

</body>
</html>