<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="reply.ReplyDTO" />
<jsp:setProperty property="*" name="dto" />
<jsp:setProperty property="writer" name="dto" value="${login.userid }" />

<c:set var="row" value="${replyDAO.delete(dto)}" />

<c:if test="${row != 0 }">
	<c:redirect url="/review.jsp?idx=${dto.board_idx }#reply" />
</c:if>


</body>
</html>