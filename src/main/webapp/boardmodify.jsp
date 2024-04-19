<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<style>
  body{
  margin: 0;
  padding: 0; 
  background-image: url(https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbeb3_%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A9%E1%84%85%E1%85%B5%20%E1%84%87%E1%85%A2%E1%84%80%E1%85%A7%E1%86%BC.png);
  background-position: 50%;
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
  font-family: Noto Sans KR, sans-serif;
  font-weight: 500;
}
</style>


<c:if test="${pageContext.request.method == 'GET'}">
 <c:set var="dto" value="${boardDAO.selectOne(param.idx)}"/>
   <div id="main-container">

    
    <div class="mainsori">
<div class="sori text chosungs">
  <div style="font-size: 60px;">목소리</div>
  <div style="font-size: 18px; margin-top: 15px;">쓴소리, 단소리 모두 듣습니다</div>
</div>
</div>

<section class="s-compliment flex">
<div class="s-content sb"> 
  <div class="image"><img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbeb6_%25E1%2584%2586%25E1%2585%25A9%25E1%2586%25A8%25E1%2584%2589%25E1%2585%25A9%25E1%2584%2585%25E1%2585%25B5%2520%25E1%2584%258B%25E1%2585%25B5%25E1%2584%2586%25E1%2585%25B5%25E1%2584%258C%25E1%2585%25B5-p-500.png">
  </div>
 

 <div class="s-text">

  <div class="text">
  <p class="hi1">모든 항목은 필수 입력 항목입니다</p>
  <p><label class="hi2">상담유형</label></p>
  <p style="display: flex;">
    <label><input type="radio" name="compliment" value="칭찬" required>칭찬</label>
    <label><input type="radio" name="complain" value="불만" required>불만</label>
  </p>
  </div>


 
  <form class ="text3" method="POST" enctype="multipart/form-data">

  <p><label class="s-label">제목</label></p>
  <input class="s-input" maxlength="256" type="text" name="title" value="${dto.title }"placeholder="제목을 입력해주세요"></p>

  <p><label  class="s-label">파일첨부</label></p>
  <p><input class="s-input" type="file" name="uploadFile"></p>

  <p><label  class="s-label">문의내용</label></p>
  <p><textarea class="s-input" id="text" name="content" placeholder="문의 내용을 입력해주세요">${dto.content }</textarea></p>
  
  <input type="hidden" name="writer" value="${login.userid }">
	<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
  
  <div class="text-block">
    1. 개인정보의 수집 및 이용 목적<br>
    가맹 관련 문의 확인 및 답변을 위한 연락 통지, 처리 결과 통보 등을 목적으로 개인정보를 처리합니다.<br><br>
    
    2. 처리하는 개인정보 항목<br>
    -필수항목: 이름, 연락처 (접속IP정보, 쿠키, 서비스 이용 기록, 접속 로그)<br>
    -선택항목: 이메일<br><br>
    
    3. 개인정보의 처리 및 보유 기간<br>
    -법령에 따른 개인정보 보유. 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.<br>
    -개인정보의 보유 기간은 5년입니다.<br><br>
    ‍
    *개인정보 수입 및 활용 동의 시 목소리를 보내주세요.<br>
  </div>

  <div>
  <p><input type="submit" class="button2" value="목소리 보내기"></p>
  </div>
  </form>
</div>

</div>

</section>

</div>


</c:if>

<c:if test="${pageContext.request.method == 'POST' }">

<c:set var = "fileUtil" value="${FileUtil.getInstance() }"/>
<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }"/>
<c:set var="row" value="${boardDAO.modifyPost(dto) }"/>

<script>
const row='${row}'
alert(row != 0 ? '수정 성공': '수정 실패')
location.href = '${cpath}/boardview.jsp?idx=${dto.idx}'
</script>

</c:if>

<%@ include file="footer.jsp" %>