<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${memberDAO.delete(login.userid) }"/>
    <c:remove var="login" scope="session"/>
    <c:redirect url="/"/>
<script>
const row = '${row}'
if(row != 0) {
   alert('삭제 성공')   
   location.href = '${cpath}'
   
}else {
   alert('삭제 실패')
   history.back()
}


      
</script>
</body>
</html>