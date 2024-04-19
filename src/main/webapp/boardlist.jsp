<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<main>
    <h3 class="chosungs"
    	style="color:black; padding:10px; 
    		   font-size: 50px; display: flex; justify-items: center;
    		   justify-content: center;
    		   margin-left: 500px; 
    		   margin-right: 500px;
    		   margin-top: 100px;
    		   margin-bottom: 30px;
    	">
    	목소리
    </h3>
    <div style="border: 1px solid black; width: 150px; 
			    display: flex;
			    justify-items: center;
			    justify-content: center;
				margin: auto;
	">
    </div>

        	<c:set var="boardCount" value="${boardDAO.selectCount(param.search) }"/>
			<c:set var ="paramPage" value="${empty param.page ? 1: param.page }"/>
			<c:set var="paging" value="${Paging.newInstance(paramPage, boardCount) }"/>
			<c:set var="list" value="${boardDAO.selectList(param.search, paging) }"/>

	<div class="flex board-nav-type">
	    <form >
	        <input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요"
	        	   style="margin-right: 10px;
					      width: 400px;
					      padding: 10px;">
	        <input type="submit" value="검색" style="background-color: #1F1F1F;
												    color: white;
												    padding: 5px 30px;">
	    </form>
			<a href="${cpath }/freeboard.jsp" style="padding-left: 5px; height: 100%; display: flex; margin-top: 2px;">
				<button style="background-color: #1F1F1F;
							   color: white;
							   padding: 5px 30px;">
							   새 글 작성
				</button>
			</a>
	</div>

    <table id="boardList"> 
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>날짜</th>
            </tr>
        </thead>

		<c:forEach var="dto" items="${list}">
	    <tr style="background-color: ${boardDAO.importlist(dto.idx) == 1 ? '#ccc' : ''};">
	        <td>${dto.idx}</td>
	        <td>
	            <a href="${cpath}/boardview.jsp?idx=${dto.idx}" style="display: flex;">
	                ${dto.title}
	                <c:if test="${boardDAO.newpost(dto.idx) == 1}">
	                    <div style="height: 20px; padding-left:5px;">
	                        <img src="https://t1.daumcdn.net/cfile/tistory/9990F533599974E506"
	                        	 style="height: 100%;">
	                    </div>
	                </c:if>
	                <div style="padding-left:5px;">
	                	${not empty dto.image ? '💾': ''}
	                </div>
	                <c:if test="${boardDAO.importlist(dto.idx) == 1}">
	                    <div style="padding-left:5px;">
	                        📢
	                    </div>
	                </c:if>
	            </a>
	        </td>
	        <td>${dto.writer}</td>
	        <td>${dto.viewCount}</td>
	        <td>${dto.writeDate}</td>
	    </tr>
		</c:forEach>
    </table>

</main>
	
    <div class="center">
        <c:if test="${paging.prev}">
            <a href="${cpath}/boardlist.jsp?page=${paging.begin - 10}&search=${param.search}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${paging.begin}" end="${paging.end}">
            <a class="${paging.page == i ? 'bold' : ''}" href="${cpath}/boardlist.jsp?page=${i}&search=${param.search}">[${i}]</a>
        </c:forEach>
        <c:if test="${paging.next}">
            <a href="${cpath}/boardlist.jsp?page=${paging.end + 1}&search=${param.search}">[다음]</a>
        </c:if>
    </div>


	<%@ include file="footer.jsp" %>