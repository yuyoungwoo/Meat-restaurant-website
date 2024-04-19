<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="reply.ReplyDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${replyDAO.insert(dto) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/review.jsp?idx=${dto.board_idx }" />
</c:if>

<script>
	alert('영향받은 줄 수 : ' ${row})
	history.go(-1)
</script>

</body>
</html>