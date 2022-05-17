<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 작성</h1>
				<form action="${appRoot }/board/write" method="post">
					<div class="mb-3">
						<label for="Input1" class="form-label">제목</label>
						<input type="text" class="form-control" name="title" id="Input1">
					</div>
					<div class="mb-3">
						<label for="Textarea1" class="form-label">본문</label>
						<textarea class="form-control" name="content" id="Textarea1" rows="5"></textarea>
					</div>
					<button id="write-button" class="btn btn-primary">작성</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>