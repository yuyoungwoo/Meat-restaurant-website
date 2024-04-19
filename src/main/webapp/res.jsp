<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>


<body style="
    background-image: url(https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbeb3_%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A9%E1%84%85%E1%85%B5%20%E1%84%87%E1%85%A2%E1%84%80%E1%85%A7%E1%86%BC.png);
    background-position: 50%;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    ">
    
    <c:if test="${empty login }">
	<script>
		alert('먼저 로그인 후에 예약을 작성할 수 있습니다')
		history.go(-1)
	</script>
	</c:if>
    
	<div class="body-res">
		<!-- 헤더 텍스트 -->
		<div class="section-24">
			<div class="section-24-text">
				<div class="section-24-text1 chosungs">예약</div>
				<div class="section-24-text2 chosungs">목구멍은 항상 열려있다.</div>
			</div>
		</div>
		<c:if test="${pageContext.request.method == 'GET' }">
			<form method="POST">
				<div class="signup-form-body" style="margin-top: 90px;">
					<div class="signup-form" style="height: 950px;">
						<!-- 년월일 / 시간:분 -->
						<h2>예약 년도</h2>
			    		<p>
			    			<label><input type="number" name="res_year" placeholder="YYYY" min="2024"></label>
			    		</p>
			    		<h2>예약 달</h2>
			    		<p>
			    			<label><input type="number" name="res_month" placeholder="MM" min="1" max="12"></label>
			    		</p>
			    		<h2>예약 일</h2>
			    		<p>
			    			<label><input type="number" name="res_day" placeholder="DD" min="1" max="31"></label>
			    		</p>
			    		<h2>예약 시간(24시표기)</h2>
					    <p>
							<label><input type="number" name="res_hour" placeholder="hour" min="1" max="24"></label>
					    </p>
					    <h2>예약 분</h2>
					    <p>
							<label><input type="number" name="res_minute" placeholder="minute" min="0" max="59"></label>
					    </p>
					    
					    <p>
					    	<label><input type="hidden" name="member_userid" value="${login.userid }"> 	</label>
					    </p>
			
						<!-- 성인, 유아 수 -->
						<h2>성인 수</h2>
						<p>
							<input type="number" placeholder="성인 수" name="adult">
						</p>
						<h2>유아 수</h2>
						<p>
							<input type="number" placeholder="유아 수" name="chil">
						</p>
						<!-- 예약자 명 -->
						<h2>예약자 명</h2>
						<p>
					    	<input type="text" placeholder="예약자 명" name="name">
					    </p>
					    <!-- 작성 버튼 -->
					    <p style="padding-top: 25px;">
				       <input type="submit" value="예약하기" style="height: 35px;">
				    	</p>
				    </div>
				</div>
			</form>
		</c:if>
	 
	</div>
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="dto" class="res.ResDTO" />
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${resDAO.insert(dto) }" />
		<script>
			const row = '${row}'
			alert(row != 0 ? '예약성공' : '예약실패')
			location.href = '${cpath}'
		</script>
	</c:if>



    <%@ include file="footer.jsp" %>