<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <style>
    .contentmax{
    width: 70%;
    flex-flow: wrap;
    } 
     
    .container {
    height: 1800px;
    width: auto;
    margin: 0 auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
   
    }

        .left-sidebar {
            width: 20%;
            padding: 20px;
            box-sizing: border-box;
            background-color: #111;
            color: #fff;
            display: flex;
            flex-direction: column;
        }

        .left-sidebar a {
            display: block;
            padding: 10px;
            color: #fff;
            text-decoration: none;
            border-bottom: 1px solid #555;
            transition: background-color 0.3s;
        }

        .left-sidebar a:hover {
            background-color: #555;
        }

        .content {
            width: 70%;
            padding: 20px;
            box-sizing: border-box;
        }

        .spacer {
            width: 10%;
        }

        h1 {
            color: #333;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }

        p {
            color: #555;
        }
        .Mypagebar{
        margin: 20px;
        }
        
        .member-modify > input{
        width: 300px;
        height: 30px;
        margin: 30px
    }
    .hidebar {
    	width: 20%;
        padding: 20px;
        box-sizing: border-box;
        background-color: #111;
        color: #fff;
        display: flex;
        flex-direction: column;
    }
    .hidebar > a {
    	color: #111;
    	display: block;
        padding: 10px;
        color: #fff;
        text-decoration: none;
        border-bottom: 1px solid #555;
    }
        
    </style>
</head>
<body>
 <div class=" Mypagebar sb">
        <div class="Mypage1"><h3>MYPAGE</h3></div>
        <div class="Mypage2">
            <div><h3><a style="color: black;" href="${cpath }/logout.jsp">로그아웃</a></h3></div>
        </div>
    </div>
    
    <div class="container">
  
        		<div class="left-sidebar chosungs" style="position: fixed;">
            	<a href="#personal-info">개인정보 수정</a>
            	<a href="#board-posts">작성한 게시판 글</a>
            	<a href="#review-posts">작성한 리뷰 글</a>
            	<a href="#withdrawal">후기작성</a>
            	<a href="#res-view">예약조회</a>
            	<a href="#liked-posts">좋아요</a>
            	<a href="${cpath }/delete.jsp">탈퇴</a>
        		</div>
        		
        		<div class="chosungs hidebar" style="color: #111; background-color: #111;">
					<span>&nbsp;&nbsp; &nbsp; &nbsp;</span>
        		</div>

        <div class="spacer"></div>

	<div class ="contentmax">
        <div class="content chosungs" id="personal-info">
            <h1>개인정보 수정</h1>
        
            <c:set var="dto" value="${memberDAO.selectOne(param.userid)}"/>
            <c:if test="${pageContext.request.method == 'GET' }">
                <form class="member-modify" method="POST">
                    <input type="hidden" name="idx" value="${login.idx}" />
                    <input type="text" name="username" value="${login.username}" placeholder="이름" /><br/>
                    <input type="text" name="userid" value="${login.userid}" placeholder="아이디" /><br/>
                    <input type="text" name="userpw" value="${login.userpw}" placeholder="비밀번호" /><br/>
                    <input type="text" name="email" value="${login.email}" placeholder="이메일" /><br/>
                    <p style="display: flex;">
                        <label><input type="radio" name="gender" value="여성" required>여성</label>
                        <label><input type="radio" name="gender" value="남성" required>남성</label>
                    </p><br/>
                    <input type="submit" value="수정" />
                </form>
            </c:if>
        
            <c:if test="${pageContext.request.method == 'POST' }">
                <jsp:useBean id="dto" class="member.MemberDTO"/>
                <jsp:setProperty property="*" name="dto"/>
                <c:set var="row" value="${memberDAO.update(dto)}"/>
                
            <script>
			const row='${row}'
			alert(row != 0 ? '수정 성공': '수정 실패')
			</script>
          
            </c:if>      
        </div>
        
        
          <div class="content chosungs" id="board-posts">
            <h1>작성한 게시판 글</h1>
        
           
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
             
         </div>
		
     		 <div class="content chosungs" id="review-posts">
            <h1>작성한 리뷰 글</h1>
        
           <a href="${cpath }/review-write.jsp"><button>리뷰 작성</button></a>
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

			<c:set var="list" value="${board2DAO.selectListByWriter(login.userid) }"/>
			<c:forEach var="review" items="${list }">
			<tr>
			<td>${review.idx }</td>
			<td><a href="${cpath}/menu-view.jsp?idx=${review.idx}">
				${review.mtitle }
				${not empty review.photo_review ? '❤' : '⨉'}
				</a>
			</td>
			<td>${review.mwriter }</td>
			<td>${review.viewCount }</td>
			<td>${review.writeDate }</td>
			<td>${review.deleted == 1 ? '🍄': '🍑'}</td>
			<td>
				<a href="${cpath }/back2.jsp?idx=${review.idx }"><button>삭제 복원</button></a>
			</td>
			</tr>
			</c:forEach>
		</table>
             
         </div>
         
         
            <div class="content chosungs" id="res-view">
            
            <h1>예약 글</h1>
        
           <a href="res.jsp"><button>예약하기</button></a>
            <table id="boardList">
			<thead>
			<tr>
				<th>번호</th>
				<th>예약일</th>
				<th>예약시간</th>
				<th>성인수</th>
				<th>유아수</th>
				<th>예약자명</th>
			</tr>
			</thead>

			<c:set var="list" value="${resDAO.selectListByWriter(login.userid) }"/>
			<c:forEach var="res" items="${list }">
			<tr>
			<td>${res.idx }</td>
			<td>${res.res_year }년 ${res.res_month }월 ${res.res_day }일</td>
			<td>${res.res_hour }:${res.res_minute }</td>
			<td>${res.adult }</td>
			<td>${res.chil }</td>
			<td>${res.name }</td>
			<td><a href="res-delete.jsp">취소</a></td>
			</tr>
			</c:forEach>
		</table>
             
         </div>
     		
    </div> 
    </div>   
<%@ include file="footer.jsp" %>