<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, res.*, board.*, reply.*, assess.*, board2.*, likey.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="resDAO" value="${ResDAO.getInstance() }"/>
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/>
<c:set var="assessDAO" value="${AssessDAO.getInstance() }"/>
<c:set var="menuDAO" value="${MenuDAO.getInstance() }"/>
<c:set var="board2DAO" value="${Board2DAO.getInstance() }"/>
<c:set var="likeyDAO" value="${LikeyDAO.getInstance() }"/>

<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <link rel="stylesheet" href="./history-styles.css">
    <link rel="stylesheet" href="./location-styles.css">
    <link rel="stylesheet" href="./res-styles.css">
    <link rel="stylesheet" href="./boardlist-styles.css">
    <title>목구멍</title>
</head>
<body>
    <div id="main-container">
        <header>
        <div class="nav-overlay">
            <nav class="nav">
            	<a href="index.jsp">
                	<img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd0a_logo_black.svg"
                	class="image-210">
                </a>
                <div class="header-nav">
                	<a>로그인 상태 : ${login.username }</a>
                    <a href="history.jsp">목구멍 역사</a>
                    <a href="menu.jsp">메뉴 안내</a>
                    <a href="location.jsp">매장 안내</a>
                    <a href="freeboard.jsp">목소리</a>
                    <li class="info-nav">
					    <a style="display: flex;">계정</a>
					    <ul class="info-nav-ul">
					        <li><a href="join.jsp">회원가입</a></li>
					        <li><a href="mypage.jsp">마이페이지</a></li>
					        <li>
					            <c:if test="${empty login}">
					                <a href="login.jsp" style="color: black;">로그인</a>
					            </c:if>
					            <c:if test="${not empty login}">
					                <a href="logout.jsp" style="color: black;">로그아웃</a>
					            </c:if>
					        </li>
					    </ul>
					</li>
                    <a href="boardlist.jsp">게시판</a>
                    <a href="res.jsp">예약</a>
                </div>
            </nav>
        </div>
    </header>
    </div>