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
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<body>
	<h1>${member.name}님의 마이페이지 입니다.</h1>
	<p>잔여 포인트 : ${member.point}
	<p>아이디 : ${member.id}
	<p>비밀번호 : ${member.password}
	<p>연락처 : ${member.phone}
	<p>
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/member/myPage">예매내역</a></li>
		<li class="nav-item"><a class="nav-link" href="#">후기</a></li>
		<li class="nav-item dropdown"><a
			class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
			href="#" role="button" aria-haspopup="true" aria-expanded="false">회원정보</a>
			<div class="dropdown-menu" style="">
				<a class="dropdown-item" href="#">수정</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberDelete">탈퇴</a>
			</div></li>
	</ul>
	<div class="col-sm-6, container" style="text-align: center;">
		<h1>카드 가운데 정렬 해야함</h1>
		<form name="updateForm" id="inForm" method="post" 
			action="${pageContext.request.contextPath}/member/update" onSubmit='return checkValid()'>
			
			<div class="card border-secondary mb-3" style="max-width: 40rem;"display:inline-block;>
				<div class="card-header">회원정보 수정 폼</div>
				<div class="card-body">
					<h4 class="card-title">수정해주세요.</h4>
					<p class="card-text">아이디, 생년월일은 수정 불가</p>


					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">아이디</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="${member.id}" id="id" value="${member.id}" name="id"
							readonly="readonly">

					</div>

					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">변경할 비밀번호</label> <input
							class="form-control form-control-lg" type="password"
							placeholder="7자 이상 영문/숫자를 입력해주세요." id="password"
							value="${member.password}" name="password" required="required">
					</div>

					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">비밀번호 확인</label> <input
							class="form-control form-control-lg" type="password"
							placeholder="비밀번호를 다시 입력해주세요." id="pwdCheck" name="pwdCheck"
							required="required">
						<div id="pCheck" name="pCheck"></div>
					</div>

					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">이름</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="이름을 입력해주세요." id="name" value="${member.name}"
							name="name" required="required">
					</div>

					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">생년월일</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="${member.birth}" id="birth" value="${member.birth}"
							name="birth" readonly="readonly">
					</div>

					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">연락처</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="000-0000-0000 형식으로 입력해주세요." id="phone"
							value="${member.phone}" name="phone" required="required">
					</div>

					<br>
					<div>
						<button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#updateModal">회원정보 수정 완료</button>
					</div>
					<br>

				</div>

			</div>
		</form>
		
		<!-- Modal -->
				<div class="modal" id="updateModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">회원정보가 수정되었습니다.</h5>	
							</div>
							<div class="modal-body">
								<p>다시 로그인을 해주세요.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checkValid();">
								확인</button>
								
							</div>
						</div>
					</div>
				</div>
		
	</div>

	<script type="text/javascript">
		$(function() {

			$("#pwdCheck").blur(function() {
				if ($('#password').val() != $('#pwdCheck').val()) {
					if ($('#pwdCheck').val() != '') {
						var html = "<div>비밀번호가 일치하지 않습니다.</div>";
						$("#pCheck").empty();
						$("#pCheck").append(html);

						$('#pwdCheck').val('');
						$('#pwdCheck').focus();
					}
				} else {
					var html = "<div>비밀번호가 일치합니다.</div>";
					$("#pCheck").empty();
					$("#pCheck").append(html);
				}
			})

		});
		
		function checkValid(){
			
			
			document.updateForm.submit();
			
			
		}
	</script>

</body>
</html>