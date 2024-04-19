<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // 모든 탭과 store set 가져오기
            var tabs = document.querySelectorAll('.section-25-tabs-name');
            var storeSets = document.querySelectorAll('.store-set');

            // 각 탭에 클릭 이벤트 리스너 추가
            tabs.forEach(function (tab, index) {
                tab.addEventListener('click', function () {
                    // 모든 store set 숨기기
                    storeSets.forEach(function (set) {
                        set.style.display = 'none';
                    });

                    // 전국 탭을 클릭한 경우 모든 store set 보이기
                    if (index === 0) {
                        storeSets.forEach(function (set) {
                            set.style.display = 'block';
                        });
                    } else {
                        // 해당하는 store set만 보이기
                        storeSets[index - 1].style.display = 'block';
                    }

                    // 탭 색상 초기화
                    tabs.forEach(function (t) {
                        t.style.color = 'gray';
                    });

                    // 클릭한 탭의 색상을 초록색으로 변경
                    tab.style.color = 'green';
                });
            });
            
            // store-locate-group-info-btn에 대한 이벤트 리스너 추가
            var infoBtns = document.querySelectorAll('.store-locate-group-info-btn');

            infoBtns.forEach(function (btn) {
                btn.addEventListener('click', function () {
                    // 클릭된 버튼이 속한 store-locate-group 찾기
                    var currentGroup = btn.closest('.store-locate-group');

                    if (currentGroup) {
                        // 현재 store-locate-group 내부의 store-locate-group-list 찾기
                        var list = currentGroup.querySelector('.store-locate-group-list');

                        if (list) {
                            // store-locate-group-list의 표시 여부를 전환
                            list.style.display = list.style.display === 'none' ? 'block' : 'none';
                        }
                    }
                });
            });
            
            
            
        });

        
    </script>
<!-- 
document.addEventListener('DOMContentLoaded', function () {
        // 모든 store-locate-group-info-btn 가져오기
        var infoBtns = document.querySelectorAll('.store-locate-group-info-btn');

        // 각 버튼에 클릭 이벤트 리스너 추가
        infoBtns.forEach(function (btn) {
            btn.addEventListener('click', function () {
                // 현재 버튼이 속한 store-locate-group 찾기
                var currentGroup = btn.closest('.store-locate-group');

                if (currentGroup) {
                    // 현재 버튼이 속한 store-locate-group에 속하는 store-locate-group-list 찾기
                    var list = currentGroup.querySelector('.store-locate-group-list');

                    if (list) {
                        // store-locate-group-list에 active 클래스를 토글하여 나타내거나 숨김
                        list.classList.toggle('active');
                    }
                }
            });
        });
    });
 -->
<body>

    <div class="section-24">
        <div class="section-24-text">
            <div class="section-24-text1 chosungs">
                매장안내
            </div>
            <div class="section-24-text2 chosungs">
                전국 매장 안내
            </div>
        </div>
    </div>

    <div class="section-25">
        <div class="section-25-tabs w-tabs">
            <div class="section-25-tabs-menu">
                <a href="#">
                    <div class="section-25-tabs-name">전국</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">서울/경기</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">부산/경남</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">대구/경북</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">대전/충청도</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">광주/전라도</div>
                </a>
                <a href="#">
                    <div class="section-25-tabs-name">강원도</div>
                </a>
            </div>
            <div class="section-25-tabs-content">
                <div class="section-25-tabs-contents">
                    <div class="section-25-tabs-contents-img">
                        <div class="section-25-storesection">
                            <div class="section-25-storesection-group">
                                <div class="section-25-storesection-group-count">
                                    오픈 (154) 오픈예정 (14)
                                </div>
                                <img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbda5_%EC%A0%84%EA%B5%AD.png"
                                     style="width: 130px; margin-right: 0;">
                            </div>
                        </div>


                    </div>
                    
							<div class="section-25-storesection-block">

                                <div class="store-set b1">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                경기도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                26
                                            </div>
                                        </div>
                                    </div>
                                    <div class="store-locate-group-list">
                                        <div class="store-group">
                                            <div class="store-list">
                                                <div class="store-list-name">
                                                    목구멍 화성점
                                                </div>
                                                <div class="store-list-line"></div>
                                                <div class="store-list-con">
                                                    <div class="store-list-left">
                                                        031-356-1203<br>
                                                        경기 화성시 꽃내음 12-2
                                                    </div>
                                                    <div class="store-list-right">
                                                        월 최고매출<br>
                                                        74,047,000
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                인천광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                10
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                고양특례시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                03
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                수원특례시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                06
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                용인특례시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                03
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                서울특별시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                14
                                            </div>
                                        </div>
                                    </div>
                                </div>
     
                                <div class="store-set b2">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                경상남도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                10
                                            </div>
                                        </div>
                                    </div>

                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                부산광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                18
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                울산광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                06
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                창원특례시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                06
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="store-set b3">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                대구광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                08
                                            </div>
                                        </div>
                                    </div>

                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                경상북도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                09
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="store-set b4">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                충청북도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                04
                                            </div>
                                        </div>
                                    </div>

                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                충청남도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                12
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                대전광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                08
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                세종특별자치시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                02
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="store-set b5">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                전라북도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                04
                                            </div>
                                        </div>
                                    </div>

                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                전라남도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                06
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                광주광역시
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                05
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="store-set b6">
                                    <div class="store-locate-group">
                                        <div class="store-locate-group-name">
                                            <div class="store-locate-group-name-text">
                                                강원도
                                            </div>
                                        </div>
                                        <div class="store-locate-group-info">
                                            <div class="store-locate-group-info-btn">
                                                지점 정보                                                
                                            </div>
                                            <div class="store-locate-group-info-count chosungs">
                                                04
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                    
                </div>
            </div>
        </div>

    </div>

    <%@ include file="footer.jsp" %>