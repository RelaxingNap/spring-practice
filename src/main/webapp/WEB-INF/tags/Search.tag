<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pagePath" %>

<nav class="navbar navbar-light bg-light">
	<div class="container-fluid justify-content-center">
		<form class="d-flex" action="${appRoot }/board/list">
			<select name="type" class="form-select w-50">
				<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="body">본문</option>
			</select>

			<input class="form-control me-2" type="search" name="keyword"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>
</nav>
