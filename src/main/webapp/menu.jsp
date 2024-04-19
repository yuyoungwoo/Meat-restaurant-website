<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="list" value="${menuDAO.selectList() }"/>

<div class="main-top-content" style="height: 20vh;">
<div class="main-top-content-text">
  <div class="main-top-content-text1">목구멍 차림표</div>
  <div class="main-top-content-text2">저희 목구멍은 고객에게
    <br>단순한 식사 한 끼 이상의 가치를 전하고자 합니다.</div>
  </div>
</div>

<div class="image2">
  <div></div>
</div>

<div class="meat">
  <div class="meat-content">
    <div class="category flex center chosungs">
      <div>전체</div>
      <div>고기</div>
      <div>식사</div>
    </div>
	
    <div class="menu chosungs center">전체 메뉴</div>
      
    <div class="meatpicture">
      <div class=" picture center">
      <c:forEach var="dto" items="${list }">
        <div class="flex">
          <div class="chosungs meatname">
          ${dto.name }
          </div>
          	<div class="menu-img">
          	<a href="menu-view.jsp?idx=${dto.idx }">
            <img src="reviewImage/${dto.meatimage }" style="width: 220px;">
            </a>
            </div>
        </div>
        </c:forEach>
      </div>
     </div>
  </div>
</div>



<%@ include file="footer.jsp" %>