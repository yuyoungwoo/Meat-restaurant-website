<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="OkId" value="${memberDAO.OkId(param.userid) }"/>

<c:if test="${empty OkId }">
	<c:redirect url="join.jsp?userid=${param.userid }"/>
</c:if>

<c:if test="${not empty OkId }">
	<c:redirect url="join.jsp?userid=tttttt"/>
</c:if>

</body>
</html>