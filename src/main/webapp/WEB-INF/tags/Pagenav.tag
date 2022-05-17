<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pagePath" %>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item">
			<c:url value="${pagePath }" var="prevLink">
				<c:param name="page" value="${pageInfo.currentPage - 1 }"></c:param>
			</c:url>
			<a class="page-link" href="${prevLink }" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<c:forEach begin="${pageInfo.left }" end="${pageInfo.right }" var="pageNum">
		
			<c:url value="${pagePath }" var="presentLink">
				<c:param name="page" value="${pageNum }"></c:param>
			</c:url>
			<li class="page-item">
				<a class="page-link ${pageInfo.currentPage == pageNum ? 'active' : '' }" href="${presentLink }">${pageNum }</a>
			</li>
		</c:forEach>

		<c:url value="${pagePath }" var="nextLink">
			<c:param name="page" value="${pageInfo.currentPage + 1 }"></c:param>
		</c:url>
		<li class="page-item">
			<a class="page-link" href="${nextLink }" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</nav>