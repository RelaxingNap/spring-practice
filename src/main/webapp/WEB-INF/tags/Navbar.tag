<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pagePath" %>

<c:url value="/board/list" var="listUrl" />
<c:url value="/board/write" var="writeUrl" />

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${listUrl }">게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${listUrl }">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${writeUrl }">글쓰기</a>
        </li>    
      </ul>
    </div>
  </div>
</nav>