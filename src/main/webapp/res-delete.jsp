<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${resDAO.delete(login.userid)}"/>


<script>
const row = '${row}'
if(row != 0) {
   alert('삭제 성공')   
   location.href = '${cpath}/mypage.jsp#res-view';
   
}else {
   alert('삭제 실패')
   history.back()
}
</script>
</body>
</html>