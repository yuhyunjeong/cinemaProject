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
	<h1>상품 등록 페이지 입니다.</h1>
	
		<c:choose>
			<c:when test="${kind=='movie'}">
			<h1>영화 등록 페이지 입니다.</h1>
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/manager/productInsert" enctype="multipart/form-data">	
					<fieldset>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">영화제목</label>
							<input class="form-control" type="text" placeholder="영화제목을 입력해주세요">							    
						</div>
						<div class="form-group" style="width: 1000px">
							<label for="exampleTextarea" class="form-label mt-4">줄거리</label>
							<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
						</div>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">러닝타임</label>
							<input class="form-control" type="text" placeholder="러닝타임을 입력해주세요">							    
						</div>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">상영시작일자</label>
							<input class="form-control" type="text" placeholder="상영시작일자를 입력해주세요">							    
						</div>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">상영종료일자</label>
							<input class="form-control" type="text" placeholder="상영종료일자를 입력해주세요">							    
						</div>			
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">관람등급</label>
							<input class="form-control" type="text" placeholder="관람등급을 입력해주세요">							    
						</div>						
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">장르</label>
							<input class="form-control" type="text" placeholder="장르를 입력해주세요">							    
						</div>			
						<div class="form-group" style="width: 1000px">
							<label for="formFile" class="form-label mt-4">포스터</label>
							<input class="form-control" type="file" id="file">
						</div>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">출연진</label>
							<input class="form-control" type="text" placeholder="출연진을 입력해주세요">							    
						</div>	
						
						<p><p>
						
								
						<div class="col-lg-6 col-sm-12 text-lg-end text-center">
							<%-- <input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/product'" value="등록하기"/> --%>
							<input type="submit" class="btn btn-secondary" value="등록하기">
						</div><p><p>			
				  </fieldset>
				</form>
			</c:when>
			
			<c:when test="${kind=='food'}">
			<h1>먹거리 등록 페이지 입니다.</h1>
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/manager/productInsert">	
					<fieldset>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">먹거리이름</label>
							<input class="form-control" type="text" placeholder="먹거리이름을 입력해주세요">							    
						</div>		
						<div class="form-group" style="width: 1000px">
							<label for="exampleTextarea" class="form-label mt-4">먹거리설명</label>
							<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
						</div>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">먹거리가격</label>
							<input class="form-control" type="text" placeholder="먹거리가격을 입력해주세요">							    
						</div>				
						<div class="form-group" style="width: 1000px">
							<label for="formFile" class="form-label mt-4">먹거리 사진</label>
							<input class="form-control" type="file" id="file">
						</div>						
						<p><p>		
						<div class="col-lg-6 col-sm-12 text-lg-end text-center">
							<input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/product'" value="등록하기"/>
						</div><p><p>			
				  </fieldset>
				</form>
			</c:when>
			
			<c:when test="${kind=='gift'}">
			<h1>사은품 등록 페이지 입니다.</h1>
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/manager/productInsert">	
					<fieldset>
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">영화제목</label>
							<input class="form-control" type="text" placeholder="영화제목을 입력해주세요">							    
						</div>		
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">사은품이름</label>
							<input class="form-control" type="text" placeholder="사은품이름을 입력해주세요">							    
						</div>				
						<div class="form-group" style="width: 1000px">
							<label class="form-label mt-4" for="form-label">사은품수량</label>
							<input class="form-control" type="text" placeholder="사은품수량을 입력해주세요">							    
						</div>						
						<p><p>		
						<div class="col-lg-6 col-sm-12 text-lg-end text-center">
							<input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/product'" value="등록하기"/>
						</div><p><p>			
				  </fieldset>
				</form>
			</c:when>
		</c:choose>
	
	
	<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/manager/product">상품목록 리스트로 돌아가기</a>&gt;</span></div>



</body>
</html>