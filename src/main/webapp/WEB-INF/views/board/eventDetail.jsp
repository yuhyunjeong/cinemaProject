<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			td, th {
				text-align: center;
				width: 1000px;
				height: 100%;
				border: solid 1px white;
			}
			textarea{
				width: 1000px;
				height: 100px;
				background: transparent;
				border: solid 1px white;
			}
			table{
				width: 1000px;
				height: 100%;
    			margin:0 auto;
    			border: solid 1px white;
			}
			.board_content{
				height: 500px;
			}
		</style>
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
				$("#lottery").on("click", function() {
					alert(22); 
					$.ajax({
						url: "${pageContext.request.contextPath}/board/eventLottery",
						type: "post", 
						dataType: "json", 
						data:{
							"bno":$('.bno').val(),
							"num":$('.num').val()
						}, 
						success: function(list) { 
							let str="당첨자아이디\n";
							$.each(list, function(index, item) {
								str+=`${"${item.member.id}"}, `;
							});
							alert(str);
							
						},
							
							
						error: function(err) {
							
						}
					}); 
				});
				
			})
			

			
			
		
		</script>
	</head>
	<body>
		<div class="container">
			<h2>이벤트 상세 화면</h2>
			<c:if test="${not empty result}">
				<script type="text/javascript">
					alert("${result}");
					
				</script>
				<% session.removeAttribute("result"); %>
			</c:if>
			
		    	<table class="board_view">
			        <colgroup>
			            <col width="15%">
			            <col width="35%">
			            <col width="15%">
			            <col width="*">
			        </colgroup>
			         
			        <tbody>
			            <tr>
			                <th>제목</th>
			                <td colspan="2">${board.title}</td>
			            </tr>
			            <tr>
			                <th>작성시간</th>
			                <td colspan="2">
			                	<fmt:parseDate value="${board.insertDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseIdateInsert"/>
						      	<fmt:formatDate value="${parseIdateInsert}" pattern="yyyy-MM-dd HH:mm"/>
			                </td>
			            </tr>
			        </tbody>
		    </table>
		    <div style="text-align: center;">
		    	<img src="${board.eventPath}">
		    </div>
		    <form id="changeForm" action="${pageContext.request.contextPath}/board/eventAttend" style="width: 1000px; margin: 0 auto; text-align: center; ">
               	<input type="hidden" name="bno" value="${board.bno}">
               	<br>
               	<input type="submit" class="btn btn-lg btn-info" value="참여하기" style="width: 500px">
            </form>
            

           	<input type="hidden" class="bno" value="${board.bno}">
			<select class="num">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
          	<input type="button" id="lottery" value="당첨자 추첨">

            

            
		</div>
	</body>
</html>