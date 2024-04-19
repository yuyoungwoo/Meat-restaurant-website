<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<body style="
    background-image: url(https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbeb3_%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A9%E1%84%85%E1%85%B5%20%E1%84%87%E1%85%A2%E1%84%80%E1%85%A7%E1%86%BC.png);
    background-position: 50%;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    ">

<c:if test="${empty login}">
    <script>
        alert('먼저 로그인 후에 예약 조회가 가능합니다.');
        history.go(-1);
    </script>
</c:if>



<div class="flex">
    <div class="reservation-info">
        <c:forEach var="res" items="${resDAO.selectAll(login.userid)}">
            <hr>
            <div style="padding: 5px;">
                예약일 : ${res.res_year }년 ${res.res_month }월 ${res.res_day }일
            </div>
            <div style="padding: 5px;">
                시간 : ${res.res_hour}시 ${res.res_minute }분
            </div>
            <div style="padding: 5px;">
                성인 : ${res.adult}명
            </div>
            <div style="padding: 5px;">
                유아 : ${res.chil}명
            </div>
            <div style="padding: 5px;">
                예약자 명 : ${res.name}
            </div>
            <hr>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>
