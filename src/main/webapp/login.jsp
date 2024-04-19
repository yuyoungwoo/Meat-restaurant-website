<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>로그인</title>
</head>

<body>

<div class="signup-form-body ">
<c:if test="${pageContext.request.method == 'GET'}">
<div class="login-form">
    <h2>로그인</h2>
     	<form method="POST">
            <p><h3>아이디:</h3></p>
            <p><input type="text" name="userid" placeholder="아이디" required autofocus></p> 
            <p><h3>비밀번호:</h3></p>
            <p><input type="password" name="userpw" placeholder="비밀번호" required></p>
            <p><button type="submit">로그인</button></p>
        </form>
  </div>

</c:if>
</div>
<c:if test="${pageContext.request.method == 'POST' }">

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="login" value="${memberDAO.login(dto) }" scope="session" />
	<c:redirect url="index.jsp" />
</c:if>


<%@ include file="footer.jsp" %>