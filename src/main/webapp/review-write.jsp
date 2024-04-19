<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.review-form-container {
    width: 50%;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

</style>
</head>
<body>

    <div class="review-form-container">
        <h2>리뷰 작성 폼</h2>
        
        <c:if test="${pageContext.request.method == 'GET'}">
        <form method="POST" enctype="multipart/form-data">
            <label>제목:</label>
            <input type="text" name="mtitle" required>
            
             <label>고기 이름:</label>
            <input type="text" name="meat_name" required>
            
             <label>메뉴 이름:</label>
            <input type="text" name="menu_name" required>
            
            <input type="hidden" value="${login.userid }" name="mwriter" required>
            
            <label>파일첨부</label>
  			<input class="s-input" type="file" name="uploadFile">
            
             <label>가격:</label>
            <input type="text" name="price" required>
            
            <label>내용:</label>
            <textarea id="meatcontext" name="meatcontext" rows="4" required></textarea>
            
            <input type="submit" value="리뷰 작성">
        </form>
        </c:if>
    </div>

		<c:if test="${pageContext.request.method == 'POST'}">
		<c:set var="dto" value="${fileUtil.getBoard2DTO(pageContext.request) }"/>
		<c:set var="row" value="${board2DAO.insert(dto) }" />
		<c:set var="list" value="${board2DAO.selectList(param.search) }"/>
			<script>
			const row = '${row}'
			alert(row != 0 ? '작성 성공': '작성 실패')
			location.href = '${cpath}/review.jsp?idx=${list[0].idx}&menuidx=${param.menuidx}'
			</script>
		</c:if>
</body>
</html>