<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>메인메뉴</title>
    <style>
    </style>
</head>

<body>
    <div id="index-main-container">
        <video id="main-video" autoplay="" loop=""
            style="background-image:url(&quot;https://assets-global.website-files.com/61fbac17e278a944888cf28a/62222992778530cde6558319_bgvideo-poster-00001.jpg&quot;)"
            muted="" playsinline="" data-wf-ignore="true" data-object-fit="cover">
            <source
                src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbde6_bg%20video-transcode.mp4"
                data-wf-ignore="true">
        </video>
        <a class="img154ho" href="#">
            <img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597b7ce99e5877af81c53ae_Group%20525.png"
                loading="lazy" sizes="(max-width: 479px) 50vw, 149.609375px"
                srcset="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597b7ce99e5877af81c53ae_Group%20525-p-500.png 500w,
            https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597b7ce99e5877af81c53ae_Group%20525.png 588w" alt=""
                class="image-211">
        </a>
        <div class="index-nav-overlay">
            <nav class="nav">
	            <a href="index.jsp">
	                <img
                    src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd08_logo_2.svg"
                    alt="" class="image-210">
	            </a>
                <div style="display: flex;">
                	<a>로그인 상태 : ${login.username }</a>
                    <a href="history.jsp">목구멍 역사</a>
                    <a href="menu.jsp">메뉴 안내</a>
                    <a href="location.jsp">매장 안내</a>
                    <a href="freeboard.jsp">목소리</a>
					<li class="info-nav">
					    <a style="display: flex;">계정</a>
					    <ul class="info-nav-ul">
					        <li><a href="join.jsp" style="color: black;">회원가입</a></li>
					        <li><a href="mypage.jsp" style="color: black;">마이페이지</a></li>
					        <li>
					            <c:if test="${empty login}">
					                <a href="login.jsp" style="color: black;">로그인</a>
					            </c:if>
					            <c:if test="${not empty login}">
					                <a href="logout.jsp" style="color: black;">로그아웃</a>
					            </c:if>
					        </li>
					    </ul>
					</li>
                    <a href="boardlist.jsp">게시판</a>
                    <a href="res.jsp">예약</a>
                </div>
            </nav>
        </div>
        <div class="main-text">
            숙성이고 나발이고
            <br>
            좋은 고기가 맛있습니다.
        </div>
        
        <div class="index-movingbar">
        	<a href="#section1" class="im chosungs">하나</a>
        	<a href="#section2" class="im chosungs">둘</a>
        	<a href="#section3" class="im chosungs">셋</a>
        	<a href="#section4" class="im chosungs">넷</a>
        	<a href="#section5" class="im chosungs">다섯</a>
        </div>

        
        <div class="main-menu">
            <div class="main-menu01">
                <div class="home-sect">
                    <div class="main-menu01-line"></div>
                    <div class="main-menu01-content">
                        <div class="font-white">
                            <div class="chosungs text20px">가맹 절차 안내</div>
                            <div class="main-menu01-content-text">
                                대표가 1:1로
                                <br>
                                직접 상담합니다.
                            </div>
                        </div>
                        <a href="#" class="w-inline-block">
                            <img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd87_arrow.svg"
                            class="image-78">
                        </a>
                    </div>
                </div>
                <div class="home-sect">
                    <div class="main-menu01-line"></div>
                    <div class="main-menu01-content">
                        <div class="font-white">
                            <div class="chosungs text20px">고르고, 또 고른 선별육</div>
                            <div class="main-menu01-content-text">
                                숙성도 물론 중요합니다.
                                <br>
                                하지만 정말 중요한 것은 고기의 질 그자체입니다.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-menu02">
                <div class="home-sect_1">
                    <div class="main-menu01-line"></div>
                    <div class="main-menu01-content">
                        <div class="font-white">
                            <div class="chosungs text20px">목구멍 페이지</div>
                            <div class="main-menu01-content-icon">
                                <a href="https://www.youtube.com/channel/UCBgAwWIsaikTtgq2G6NraeQ"
                                class="link-yt w-inline-block">
                                    <img
                                        src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbebd_%EC%9C%A0%ED%8A%AD.png"
                                        loading="lazy" alt="" class="image-77">
                                </a>
                                <a href="https://www.instagram.com/tim__brother/" class="w-inline-block">
                                    <img
                                    src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbebf_%EC%9D%B8%EC%8A%A4%ED%83%80.png"
                                    class="image-77">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="section1"> 
        <div style="margin: auto">
            <img
            src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597b7b11da8d59298cc0ad6_Group%201544.png"
            class="section1-top-img">
            <img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597c081045fc91ee2d842a6_24_01_05%20%E1%84%83%E1%85%A2%E1%84%83%E1%85%A9%E1%86%AB%E1%84%8B%E1%85%A7%E1%84%8C%E1%85%B5%E1%84%83%E1%85%A9%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%87%E1%85%A9%E1%86%AB-p-2000.png"
            class="image-213">
        </div>
        <div class="section1-area">
            <div class="section1-area">
                <a href="#" class="section1-area-btn">가맹 지역 문의</a>
            </div>
        </div>

    </div>
    

 	<div id="section2">
    	<div class="section2-top">
			<div class="section2-top-texttop chosungs">
				영수증
            </div>
            <div class="section2-top-textmid">
                전국 지점별
                <br>
                한달 최고 매출 지표
            </div>
            <div class="section2-top-textbot">
                영수증을 확인하시면 결정시 더욱 편리합니다.
            </div>
        </div>
    	<div class="section2-top-bill">
    		<div class="section2-top-bill-main">
    			<img class="bill-left"
    				 src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/65499ec3da80be39e94743d8_Group%201626.png">
    			<img class="bill-mid"
    				 src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/658e55b146a2dae052eb7f2f_%E1%84%83%E1%85%A2%E1%84%80%E1%85%AE.png">
    			<img class="bill-right"
    				 src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/6597b769f077368688c8a93d_Group%202051.png">
    		</div>
    		<div class="section2-top-info">
    			<img
    				src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbda0_%E1%84%89%E1%85%AE%E1%84%8C%E1%85%A5%E1%86%BC1.svg"
    				class="section-top-info-main">
    			<a href="#" class="section-top-info-btn">가맹 지점 정보</a>
    		</div>
    	</div>
    </div>

	<div id="section3">
		<div class="section3-top">
			<div class="section3-top-toptext chosungs">3<span style="color: green">無</span>3<span style="color: green">有</span>
			</div>
			<div class="section3-top-bottext">
				목구멍 삼무삼유
			</div>
		</div>
		<div class="section3-mid">
			<div class="section3-mid-left">
				<div class="section3-mid-left-top">
					목구멍에<br><strong>없는 것</strong>
				</div>
				<img
				class="section3-mid-left-bot"
				src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd05_%E1%84%89%E1%85%A1%E1%86%B7%E1%84%86%E1%85%AE.svg">
			</div>
			<div class="section3-mid-right">
				<div class="section3-mid-right-top">
					목구멍에<br><strong>있는 것</strong>
				</div>
				<img
				class="section3-mid-right-bot"
				src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd04_%E1%84%89%E1%85%A1%E1%86%B7%E1%84%8B%E1%85%B2.svg">
			</div>
		</div>
		<div class="section3-bot">
			<a href="#" class="section3-bot-btn">목구멍 이야기</a>
		</div>
	</div>

	<div>
		<div class="half">
			<div class="half1">
				<div class="half2">
					<div class="half3">
						<div class="half4">
							<div class="chosungs signature">
								목<br>구<br>멍<br>시<br>그<br>니<br>처,<br><br>&zwj;
							</div>
							<div class="chosungs lid">
								솥<br>뚜<br>껑<br>&zwj;<br>
							</div>
							<div class="half-bot">
								<div class="half-bot-text">
									목구멍은 뒤집지 않습니다.<br>
									둥글게 솟은 솥뚜껑에 고기를 얹고 흘러내린 기름에<br>
									김치, 콩나물, 미나리를 굽습니다.<br>
									가장 조화로운 솥뚜껑 한 판, 목구멍만의 스타일입니다.<br>
								</div>
								<div class="half-bot-btn">
									<a href="#" class="button-2 w-button">메뉴 안내</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section3-1">
		<div class="section3-1-1">
			<div class="section3-1-1-text">
				<div class="section3-1-1-text-left">
					솥<br>뚜<br>껑<br>
				</div>
				<div class="section3-1-1-text-right">
					<div class="section3-1-1-text-top">
						목구멍,<br>솥뚜껑 삼겹살을<br>다시 부흥시키다.<br>
					</div>
					<a href="#" class="section3-1-1-text-btn button-2 w-button ">목구멍 이야기</a>
				</div>

			</div>
			<div class="section3-1-1-img">
				
			</div>
		</div>
		<div class="section3-1-2">
			<div class="section3-1-2-img">
			
			</div>
			<div class="section3-1-2-text">
				<div class="section3-1-2-text-left">
					<div class="section3-1-2-text-left-top">
						가맹 점주 인큐베이팅<br>
					</div>
					<div class="section3-1-2-text-left-mid">
						목구멍만이 가능한 ‘동반성장’의 이유,<br>
						창업 시 필요한 것들을 교육하고<br>
						성장할 수 있게 발판이 되어주어<br>
						점주가 도약할 수 있도록 합니다.<br>
					</div>
					<a class="section3-1-2-text-left-bot button-2 w-button"
					   href="#">
						가맹 스토리
					</a>
				</div>
				<div class="section3-1-2-text-right">
					목<br>구<br>멍<br>사<br>관<br>학<br>교<br>‍<br>
				</div>
			</div>
		</div>
		<div class="section3-1-3">
			<div class="section3-1-3-text">
				<div class="section3-1-3-text-left">
					프<br>렌<br>드<br>차<br>이<br>즈<br>
				</div>
				<div class="section3-1-3-text-right">
					<div class="section3-1-3-text-right-top">
						프렌;드차이즈<br>
					</div>
					<div class="section3-1-3-text-right-mid">
						전형적인 프랜차이즈가 아닌<br>
						점주와 본사가 상생하는 ‘프렌;드차이즈’<br>
						가맹 사업의 새로운 패러다임을 <br>
						구축하고 있다고 단.언.합니다.<br>
					</div>
					<a 
					href="#"
					class="section3-1-3-text-right-bot button-2 w-button">
						목구멍 이야기
					</a>
				</div>
			</div>
			<div class="section3-1-3-img">
			
			</div>
		</div>
	</div>
	
	<div id="section4">
		<div class="section4-main">	
			<div class="section4-main-left">
				<div class="section4-main-left-top">
					프렌드차이즈
				</div>
				<div class="section4-main-left-mid">
					<div class="section4-main-left-mid-top">
						단순히 가맹점이 아닌
						<br>
						'함께 성장하는 친구'로써<br>
					</div>
					<div class="section4-main-left-mid-mid">
					
					</div>
					<div class="section4-main-left-mid-bot">
						전형적인 프랜차이즈가 아닌<br>
						<span style="color: green; font-weight: bold;">
						점주와 본사가 상생하는 '프렌;드차이즈'
						</span>
						가맹 사업의 새로운 패러다임을 구축하고 있다고 단.언.합니다.
						<br><br>
						광역시를 제외한
						<span style="color: green; font-weight: bold;">
						시 단위 1개 지점
						</span>
						만을 가맹하고,<br>
						<span style="color: green; font-weight: bold;">
						철저한 상권 분석 및 지역 내 희소성
						</span>
						을 부각시킵니다.<br>
						본사에서 직접 고기를 선별하고 유통마진을 최소화하는 등의<br>
						노력을 기울이고 있습니다.
					</div>
				</div>
			</div>
			<div class="section4-main-right">
				<div class="section4-main-right-btn button-2 w-button">
					목구멍 이야기					
				</div>
			</div>
		</div>	
	</div>
	
	<div id="section5">
		<div class="section5-top">
			<div class="section5-topuptext">
				가맹 상담
			</div>
			<div class="section5-topdowntext">
				<span style="color:#ff9627; font-weight: bold;">외람되지만,  </span>
				아무에게나 드리지 않습니다.
			</div>
		</div>
		<div class="section5-bot">
			<div class="section5-bot-top">
				<div class="section5-bot-top-text">
					"대표가 직접 상담합니다."
				</div>
				<div class="section5-bot-bot-text">
					1666-9280
				</div>
			</div>
			<div class="section5-bot-mid">
				<img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbdc8_%ED%8F%AC%EC%8A%A4%ED%8A%B8%EC%9E%87%2001.svg">
				<img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbdd5_Group%20502.svg">
				<img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbdcb_Group%20501.svg">
			</div>
			<div class="section5-bot-bot">
				<a href="#" class="button-2 w-button">가맹 안내</a>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp" %>