<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${MemberDAO.selectOne(param.idx) }"/> 

<c:if test="${ContextPage.request.contextPath()== 'GET' }">

<div>
    <form method="post">
        <input type="hidden" name="idx" value="${dto.idx}" />
       
        <input type="text" name="username" value="${dto.username}" placeholder="이름" /><br/>
        <input type="text" name="userid" value="${dto.userid}" placeholder="아이디" /><br/>
        <input type="text" name="userpw" value="${dto.userpw}" placeholder="비밀번호" /><br/>
        <input type="text" name="email" value="${dto.email}" placeholder="이메일" /><br/>
        <p style="display: flex;">
        <label><input type="radio" name="gender" value="여성" required>여성</label>
        <label><input type="radio" name="gender" value="남성" required>남성</label>
        </p><br/>
        <input type="submit" value="수정" />
    </form>
</div>


</c:if>


<c:if test="${ContextPage.request.contextPath()== 'POST' }">

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${memberDAO.modify(dto)}" />

<script>
	const row = '${row}'
	alert(row != 0 ? '수정 성공': '수정 실패')
	location.href = '${cpath}/boardview.jsp?idx=${dto.idx}'
</script>

</c:if>

<%@ include file="footer.jsp" %>