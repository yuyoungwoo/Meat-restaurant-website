<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<body>
        <h2>리뷰 수정 폼</h2>
        
        <c:if test="${pageContext.request.method == 'GET'}">
        <c:set var="dto" value="${board2DAO.selectOne(param.idx)}"/>
        <form method="POST" enctype="multipart/form-data">
            <label>제목:</label>
            <input type="text" value="${dto.mtitle }"  name="mtitle" required>
            
             <label>고기 이름:</label>
            <input type="text" value="${dto.meat_name } name="meat_name" required>
            
             <label>메뉴 이름:</label>
            <input type="text" value="${dto.menu_name }" name="menu_name" required>
            
            <input type="hidden" value="${login.userid }" name="mwriter" required>
            
            <label>파일첨부</label>
  			<input class="s-input" type="file" name="uploadFile">
            
             <label>가격:</label>
            <input type="text" value="${dto.price }" name="price" required>
            
            <label>내용:</label>
            <textarea id="meatcontext" name="meatcontext" rows="4" required>${dto.meatcontext }</textarea>
            
            <input type="submit" value="리뷰 작성">
        </form>
        </c:if>
 
 
 		<c:if test="${pageContext.request.method == 'POST' }">

		<c:set var = "fileUtil" value="${FileUtil.getInstance() }"/>
		<c:set var="dto" value="${fileUtil.getBoard2DTO(pageContext.request) }"/>
		<c:set var="row" value="${board2DAO.modifyPost(dto) }"/>

		<script>
		const row='${row}'
		alert(row != 0 ? '수정 성공': '수정 실패')
		location.href = '${cpath}/review.jsp?idx=${param.idx}'
		</script>

		</c:if>
    
    
    </body>
</html>