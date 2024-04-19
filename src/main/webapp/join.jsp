<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>회원가입</title>
</head>
<body>
  
    	<div class="signup-form-body">
		<c:if test="${pageContext.request.method == 'GET'}">
		<div class="signup-form">
		    <h2>회원가입</h2>
		    <form action="OkId.jsp">
		      <p><h3>아이디</h3></p>
		      <p class ="id">
		      	<input type="text" name="userid" placeholder="아이디" value="${param.userid == 'tttttt' ? '' : param.userid} " required>
		        <button onclick="checkDuplicate()">중복체크</button>
		        <c:if test="${not empty param.userid }">
		        	<span>${param.userid == 'tttttt' ? '중복된 아이디입니다.' : '사용 가능한 아이디입니다' }</span>
		        	<span>${param.userid == 'admin' ? '관리자계정은 가입불가합니다.' : '' }</span>
		        </c:if> 

		     </p>
		     </form>
		     
		     <form method="POST">
		     <p><input type="hidden" name="userid" value="${param.userid }"/>
		      <p><h3>비밀번호</h3></p>
		      <p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		      <p><h3>이름</h3></p>
		      <p><input type="text" name="username" placeholder="이름" required></p>
		      <p><h3>이메일</h3></p>
		      <p><input type="text" name="email" placeholder="이메일" required></p>
		      <p><h3>성별</h3></p>
		      <p style="display: flex;">
		        <label><input type="radio" name="gender" value="여성" required>여성</label>
		        <label><input type="radio" name="gender" value="남성" required>남성</label>
		      </p>
		      <p><input type="submit" value="가입하기" ${param.userid=='tttttt' or empty param.userid ? 'disabled' : '' }></p>
		    </form>
		  </div>
		</c:if>
		</div>

		<c:if test="${pageContext.request.method == 'POST'}">
		<jsp:useBean id="dto" class="member.MemberDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${memberDAO.insert(dto) }" />
			<script>
			const row = '${row}'
			alert(row != 0 ? '가입성공': '가입실패')
			location.href = '${cpath}'
			</script>
		</c:if>
	
	<script>
    function checkDuplicate() {
        var userid = document.getElementsByName("userid")[0].value;
        if (userid === 'admin') {
            alert('관리자 계정은 가입불가합니다.');
        }
    }
</script>

<%@ include file="footer.jsp" %>