<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.boardview {
    margin: 36px auto;
    padding: 20px;
}

.board-detail {
    margin-bottom: 20px;
}

.button-container {
    text-align: center;
}

button {
    padding: 10px;
    background-color: #4caf50;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}
.site{
    padding: 29px 29px 0;
    border: 1px solid black;
    border-radius: 6px;
    margin: 10px;
}

</style>
</head>
<body>

<c:set var="dto" value="${board2DAO.selectOne(param.idx) }"/>

<main class="boardview">
    <h3 class="chosungs" style="margin: 20px 0; border-bottom: 2px solid black; color: black; padding: 10px;">게시글 상세보기</h3>
    
    <div class="board-detail chosungs">
    	<div class="site">
    	<p><h3>제목: ${dto.mtitle }</h3></p>
        <p style="text-align: right;">글번호: ${dto.idx }| 작성자: ${dto.mwriter }</p>
        <p style="text-align: right;">
        	<c:set var="row" value="${board2DAO.totalView(param.idx)}"/>
        	<c:set var="dto" value="${board2DAO.selectOne(param.idx) }"/>조회수: ${dto.viewCount }
        </p>
        <p style="margin-bottom: 50px; text-align:right;">작성일: ${dto.writeDate }</p>
        </div>
        <div class="site center">
        <p><img src="reviewImage/${dto.photo_review }"></p>
        <p>내용: ${dto.meatcontext }</p>
        </div>
    </div>

    <div class="button-container">
        <a href="${cpath}/menu-view.jsp?idx=${param.menuidx }"><button>목록으로 돌아가기</button></a>
        
        <div>
        <c:if test="${dto.mwriter == login.userid }">
        	<a href ="${cpath }/review-modify.jsp?idx=${dto.idx}"><button>수정</button></a>
        	<a class="deleteBtn"
        		idx="${dto.idx }"
        		href="${cpath }/board2delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
        </c:if>
        </div>  
    </div>

<script>


const deleteBtnList = document.querySelectAll('a.deleteBtn')

const deleteHandler = function(event){
	event.preventDefault()
	let target = event.target
	
	while(target.classLsit.contains('deleteBtn') == false){
		target = target.parentNode
	}
	const idx = target.getAttribute('idx')
	const url = target.href
	const flag = confirm(idx + '번 게시글을 삭제하시겠습니까?')
	if(flag){
		location.href = url
	}
}
deleteBtnList.forEach(element => element.onclick = deleteHandler)

</script>    
    <!-- 
    
    <form method="POST" action="reply-write.jsp">
	<h3 style="chosungs" >댓글 작성</h3>
	<c:if test="${empty login }">
		<c:set var="replyComment">로그인 후에 댓글 작성 가능합니다</c:set>
	</c:if>
	<c:if test="${not empty login }">
		<c:set var="replyComment">바르고 고운 말을 사용합시다</c:set>
	</c:if>
	<div style="display: flex; align-items: center;">
		<textarea name="content" rows="5" cols="80"
				  placeholder="${replyComment }" ${empty login ? 'disabled' : '' }
				  style="resize: none;
				  		 height: 100px;
				  		 padding: 10px;
				  		 box-sizing: border-box;"></textarea>
		<input type="submit" value="댓글쓰기"
			   ${empty login ? 'disabled' : '' }
			   style="margin: 10px;
			   		  height: 100px;">
	</div>
	<input type="hidden" name="board_idx" value="${dto.idx }">
	<input type="hidden" name="writer" value="${login.userid }">
	</form>

<div id="reply">
	<c:forEach var="reply" items="${replyDAO.selectList(param.idx) }">
	<div class="replyItem" style="border: 1px solid grey; 
								  margin: 20px;
								  padding: 10px;
								  box-sizing: border-box;">
		<div style="display: flex; justify-content: space-between;">
			<div>${reply.writer }</div>
			<div><fmt:formatDate value="${reply.writeDate }" pattern="yyyy-MM-dd a hh:mm" /></div>
		</div>
		<div>
			<pre>${reply.content }</pre>
			<c:if test="${reply.writer == login.userid }">
				<a href="${cpath }/reply-delete.jsp?idx=${reply.idx}&board_idx=${dto.idx}">
					<button>댓글 삭제</button>
				</a>
			</c:if>
		</div>
	</div>
	</c:forEach>
</div>

      -->
   
</main>

<%@ include file="footer.jsp" %>