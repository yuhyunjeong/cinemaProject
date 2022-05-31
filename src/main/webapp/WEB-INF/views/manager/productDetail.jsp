<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>productDetail 페이지 입니다.</h1>
	
<form>
  <fieldset>
	<div class="form-group">
	
	    <label class="form-label mt-4" for="form-label">상품명</label>
	    <input class="form-control" type="text" placeholder="상품명을 입력해주세요">
	    
	    <label class="form-label mt-4" for="form-label">상품코드</label>
	    <input class="form-control" type="text" placeholder="상품명을 입력해주세요">

	 
	</div>
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">상품설명</label>
      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
    </div>
    <div class="form-group">
      <label for="formFile" class="form-label mt-4">이미지</label>
      <input class="form-control" type="file" id="formFile">
    </div><p><p>
	
	<div class="col-lg-6 col-sm-12 text-lg-end text-center">
	  <button type="button" class="btn btn-primary">등록하기</button>
	</div><p><p>
  </fieldset>
</form>
</body>
</html>