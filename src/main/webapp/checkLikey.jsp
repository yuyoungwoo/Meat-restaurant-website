<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${likeyDAO.checkLikey(login.userid, param.idx) }"/>
      <c:if test="${empty dto}">
         ${likeyDAO.insert(login.userid, param.idx) }
         <c:redirect url="boardview.jsp?idx=${param.idx }"/>
      </c:if>
      <c:if test="${not empty dto}">
         ${likeyDAO.delete(param.idx, login.userid) }
         <c:redirect url="boardview.jsp?idx=${param.idx }"/>
      </c:if>