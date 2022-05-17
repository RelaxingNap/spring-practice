<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sub" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script>
	$(function(){
		$("#edit-button").click(function(){
			$("#Input1").removeAttr("readonly");
			$("#Textarea1").removeAttr("readonly");
			$("#modify-submit").removeClass("d-none");
			$("#delete-submit").removeClass("d-none");
		});
		
		$("#delete-submit").click(function (e) {
			e.preventDefault();
						
			if (confirm("삭제하시겠습니까")) {
				let form1 = $("#form1");
				let action1 = "${appRoot }/board/remove";

				form1.attr("action", action1);

				form1.submit();
			}
		});
	});
</script>


<title>Insert title here</title>
</head>
<body>
	<sub:Navbar />
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>${board.id }번게시물 <button id="edit-button" class="btn btn-secondary">
						<i class="fa-solid fa-pen-to-square"></i></button></h1>
				<form action="${appRoot }/board/modify" method="post">
					<input type="hidden" name="id" value="${board.id }" />
					<div class="mb-3">
						<label for="Input1" class="form-label">제목</label>
						<input type="text" class="form-control" name="title" id="Input1"
							value="${board.title }" readonly>
					</div>
					<div class="mb-3">
						<label for="Textarea1" class="form-label">본문</label>
						<textarea class="form-control" name="content" id="Textarea1"
							rows="5" readonly>${board.content }</textarea>
					</div>
					<div class="mb-3">
						<label for="input2" class="form-label">작성일시</label>
						<input class="form-control" type="datetime-local"
							value="${board.inserted }" id="input2" readonly />
					</div>
					<button id="modify-submit" class="btn btn-primary d-none">수정</button>
					<button id="delete-submit" class="btn btn-danger d-none">삭제</button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<form action="${appRoot }/reply/write" method="post">
					<input type="hidden" name="boardId" value="${board.id }" />
					<input class="form-control" type="text" name="content" required />
					<button class="btn btn-outline-secondary"><i class="fa-solid fa-comment dots"></i></button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<c:forEach items="${replyList }" var="reply">
					<input class="form-control" type="text" name="content" value="${reply }" readonly />
				</c:forEach>
			</div>
		</div>
	</div>
	
</body>
</html>