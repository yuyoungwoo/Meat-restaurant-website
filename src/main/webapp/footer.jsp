<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, res.*, board.*, reply.*, assess.*, board2.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="resDAO" value="${ResDAO.getInstance() }"/>
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/>
<c:set var="assessDAO" value="${AssessDAO.getInstance() }"/>
<c:set var="menuDAO" value="${MenuDAO.getInstance() }"/>
<c:set var="board2DAO" value="${Board2DAO.getInstance() }"/>
<c:set var="likeyDAO" value="${LikeyDAO.getInstance() }"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>

<div class="footer">
			<div class="footer-section">
				<div class="footer-container">
					<div class="footer-layout">
						<div class="footer-layout-l">
							<div class="footer-layout-l-icon"></div>
						</div>
						<div class="footer-layout-c">
							<div>
								<div class="label">메뉴</div>
								<div style="margin-top: 40px;">
									<a href="${cpath}/index.jsp" class="footer-link">홈</a>
									<a href="${cpath}/history.jsp" class="footer-link">목구멍 역사</a>
									<a href="${cpath}/menu.jsp" class="footer-link">메뉴 안내</a>
									<a href="${cpath}/freeboard.jsp" class="footer-link">목소리</a>
									<a href="${cpath}/boardlist.jsp" class="footer-link">게시판</a>
									<a href="${cpath}/res.jsp" class="footer-link">예약</a>
								</div>
							
							</div>
	
							<div>
								<div class="label">가맹상담</div>
								<div style="margin-top: 35px;">
									<a class="footer-link">대표 전화 상담</a>
									<a class="footer-link">Tel. 1666-9280</a>
									<a href="${cpath}/res.jsp" class="footer-link"
									   style="font-size: 10px; color:green;">Mon-Fri/ 10am - 6pm</a>
								</div>
							</div>
							
							<div>
								<div class="label">SNS</div>
								<div style="margin-top: 35px;">
									<a href="https://www.instagram.com/tim__brother/" class="footer-link">Instagram</a>
									<a href="https://www.youtube.com/channel/UCBgAwWIsaikTtgq2G6NraeQ" class="footer-link">YouTube</a>
								</div>
							</div>
						</div>
						<div class="footer-layout-r">
							<div class="footer-layout-r-text">
								상호명 : (주)팀브로｜대표자 : 신철욱, 문성재｜
								개인정보보호책임자 : 신철욱, 문성재｜
								사업장 소재지 : 경상남도 김해시 주촌면 천곡로136번길 29-48<br>
								사업자 등록번호 : 435-86-01460｜
								TEL : 1666-9280
								<em style="text-decoration: none;
									   color:green;">EMAIL | tim_bro@naver.com</em>
								Copyright ©2019 목구멍. All rights reserved.
								<a href="https://www.jellokorea.com/"
								target="_blank"
								style="text-decoration: none;
									   color:green;
									   padding-top:20px;">Designed by (주) 젤로</a>
							</div>
						</div>
					</div>				
				</div>
			</div>
		</div>



</body>
</html>