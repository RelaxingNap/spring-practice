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

<title>Insert title here</title>
</head>
<body>
	<sub:Navbar pagePath="list" />
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>작성 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.id }</td>
					<td>
						<a href="${appRoot }/board/${board.id }">${board.title }</a>
						
						<c:if test="${board.replyNum > 0}">
							[${board.replyNum }]
						</c:if>
					</td>
					<td>${board.inserted }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid justify-content-center">
			<form class="d-flex" action="${appRoot }/board/search">
				<input class="form-control me-2" type="search" name="title" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<sub:Pagenav pagePath="list"/>
	
</body>
</html>