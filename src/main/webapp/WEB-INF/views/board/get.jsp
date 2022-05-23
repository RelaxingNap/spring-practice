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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
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
		
		$(".reply-edit-toggle-button").click(function(){
			const replyId = $(this).attr("data-reply-id");
			const displayDivId = "#replyDisplayContainer" + replyId;
			const editFormId = "#replyEditFormContainer" + replyId;

			$(displayDivId).hide();
			$(editFormId).show();
		});
		
		$(".reply-delete-button").click(function(){
			const replyId = $(this).attr("data-reply-id");
			
			if(confirm("댓글을 삭제하시겠습니까")){
				$("#reply-delete-input").val(replyId);
				$("#reply-delete-form").submit();
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
				<h1>${board.id }번게시물
					<button id="edit-button" class="btn btn-secondary">
						<i class="fa-solid fa-pen-to-square"></i>
					</button>
				</h1>
				<form action="${appRoot }/board/modify" id="form1" method="post">
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
				<h2>댓글 ${board.replyNum }개</h2>
				<form action="${appRoot }/reply/write" method="post">
					<div class="input-group">
						<input type="hidden" name="boardId" value="${board.id }" />
						<input class="form-control" type="text" name="content" required />
						<button class="btn btn-outline-secondary">
							<i class="fa-solid fa-comment dots"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<ul class="list-group">
					<c:forEach items="${replyList }" var="reply">
						<li class="list-group-item">
							<div id="replyDisplayContainer${reply.id }">
								<div class="fw-bold">
									<i class="fa-solid fa-comment"></i>
									${reply.inserted } ${reply.content }
									<button class="reply-edit-toggle-button"
										id="replyEditToggleButton${reply.id }"
										data-reply-id="${reply.id }">
										<i class="fa-solid fa-pen-to-square"></i>
									</button>
									<button class="reply-delete-button"
										data-reply-id="${reply.id }">
										<i class="fa-solid fa-trash-can"></i>
									</button>
								</div>
							</div>

							<div id="replyEditFormContainer${reply.id }"
								style="display: none;">
								<form action="${appRoot }/reply/modify" method="post">
									<div class="input-group">
										<input type="hidden" name="boardId" value="${board.id }" />
										<input type="hidden" name="id" value="${reply.id }" />
										<input class="form-control" type="text" name="content"
											value="${reply.content }" required />
										<button class="btn btn-outline-secondary">
											<i class="fa-solid fa-comment dots"></i>
										</button>
									</div>
								</form>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div class="d-none">
		<form id="reply-delete-form" action="${appRoot }/reply/remove"
			method="post">
			<input type="hidden" name="boardId" value="${board.id }" />
			<input id="reply-delete-input" type="text" name="id" />
		</form>
	</div>


</body>
</html>