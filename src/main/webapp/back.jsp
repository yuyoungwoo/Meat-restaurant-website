<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.back(param.idx) }"/>

<script>
const row = '${row}'
if(row != 0) {
	alert('복원 성공')	
	location.href = '${cpath}/myboard.jsp'
	
}else {
	alert('복원 실패')
	history.back()
}

</script>
</body>
</html>