<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<main>
<h3>내가 쓴 글</h3>

<table id="boardList">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>조회수</th>
<th>날짜</th>
<th>삭제 여부</th>
<th>삭제 복원</th>
</tr>
</thead>

<c:set var="list" value="${boardDAO.selectListByWriter(login.userid) }"/>
<c:forEach var="dto" items="${list }">
<tr>
<td>${dto.idx }</td>
<td><a href="${cpath}/boardview.jsp?idx=${dto.idx}">
	${dto.title }
	${not empty dto.image ? '❤' : '⨉'}
	</a>
</td>
<td>${dto.writer }</td>
<td>${dto.viewCount }</td>
<td>${dto.writeDate }</td>
<td>${dto.deleted == 1 ? '🍄': '🍑'}</td>
<td>
	<a href="${cpath }/back.jsp?idx=${dto.idx }"><button>삭제 복원</button></a>
</td>
</tr>
</c:forEach>





</table>




</main>
<%@ include file="footer.jsp" %>