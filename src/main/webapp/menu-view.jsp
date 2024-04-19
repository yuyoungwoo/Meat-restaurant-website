<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main-top-content {
   padding-top: 50px;
    justify-content: center;
    display: flex;
}
.review{
    width: 1140px;
    display: flex;
}
.review>.photo{
    width: 45%;   
    height: 500px;
    margin-left: 30px;
    margin-right: 70px;
    float: left;
}
.review>.price{
    width: 45%;
    height: 463px;
    margin-left: 30px;
    margin-right: 32px;
    margin-top: 37px;
    float: right;
}
/* .body,div{
    border: 1px solid green;
} */
.review-button{
    display: flex;
    /* border: 1px solid red; */
    height: 50px;
}
.review-button>.category{
    width: 1400px;
}
.photo>.p{
    width: 380px;
    padding: 60px;
    margin-top: 50px;
}
.option{
    border: 1px solid black;
    float: left;
    font-size: 18px;
    line-height: 33px;
    margin-top: 30px;
}
.option > div>button{
    width: 317px;
    height: 100%;
    font-size: 16px;
    position: relative;
    border: none;
}
.option >div>p{
    margin: 10px 54px;
}
.option2{
    float: left;
    font-size: 18px;
    line-height: 33px;
    margin-top: 30px;
}
.option2 > div>button{
    width: 221px;
    height: 53px;
    font-size: 16px;
    position: relative;
    border: none;
    margin: 15px 7px;
}
.option-border{
border-bottom: 1px solid grey; 
margin-bottom: 10px;
}
.sb{
    display: flex;
    justify-content: space-between;
}
.review-button{
    width: 800px;
    display: flex;
    justify-content: center;
    text-align: center;
    margin: auto;
}
.middle{
   border-top: 1px solid grey;
   border-bottom: 1px solid grey;
   width: 100%;
}
.explain{
    width: auto;
    background-image: url(https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd6d_%E1%84%89%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%84%80%E1%85%A5%E1%86%AB.png);
}
.s-explain{
    margin: auto;
    border: 1px solid grey;
    width: 800px;
    height: fit-content;
    font-size: 30px;
    padding: 100px;
    }

.photoreview {
    margin-top: 70px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

.photobox {
  width: 200px;
  height: 200px;
  background-color: lightgray;
  display: flex;
  justify-content: center;
  align-items: center;
}

  </style>
</head>
<body>
<%-- <c:set var="dto" value="${fileUtil.getMenuDTO(pageContext.request) }"/> --%>
<c:set var="dto" value="${menuDAO.selectOne(param.idx) }"/>
<c:set var="list" value="${board2DAO.selectList2(dto.meatname) }"/>

<div id="main-container">
  
<div class="main-top-content">
    <div class="review">
        <div class="photo"><img src="${cpath }/reviewImage/${dto.meatimage}" width="100%" height="100%"></div>
        <div class="price chosungs">
            <h2>${dto.meatname }</h2>
            <p>기준가</p>
            <p>100g당 ${dto.price }원</p>
            <p class="option-border"></p> 
        <div class="option flex">
            <div><p class="chosungs">옵션</p></div>
            <div><button class="chosungs">보통</button></div>
        </div>
        <div class="option flex">
            <div><p  class="chosungs">수량</p></div>
            <div><button class="chosungs">보통</button></div>
        </div>
        <div class="option2 flex">
            <div><button class="chosungs">바로구매</button></div>
            <div><button class="chosungs" style="background-color: green; color: white;">장바구니</button></div>
        </div>
        </div>
    </div>
</div>

<div class="middle chosungs">
<div class="review-button">
    <div class="category sb">
        <p>상품설명</p>
        <p>상품리뷰</p>
        <p><a href="${cpath }/menu.jsp"></a>목록</p>
    </div>
</div>
</div>


<div class="explain">
    <div class="s-explain chosungs">
    <p class="padding-bottom: 20px;">${dto.content }</p>
    </div>
    <div class="photoreview sb">
       <h1>포토 리뷰</h1>
        <div class="photobox"></div>
        <div class="photobox"></div>
        <div class="photobox"></div>
        <div class="photobox"></div>
        <div class="photobox"></div>
    </div>
    
    
    <div class="content chosungs">
            <h1>상품 리뷰</h1>
        
        <form>
        <input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
        <input type="submit" value="검색">
       </form>
         
         
        <a href ="${cpath }/review-write.jsp?menuidx=${param.idx}"><button>작성하기</button></a>   
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
         
         
         <c:forEach var="meatdto" items="${list }">
         <tr>
         <td>${meatdto.idx }</td>
         <td><a href="${cpath}/review.jsp?idx=${meatdto.idx}&menuidx=${param.idx}">
            ${meatdto.mtitle }
            ${not empty meatdto.photo_review ? '❤' : '⨉'}
         </a>
         </td>
         <td>${meatdto.mwriter }</td>
         <td>${meatdto.viewCount }</td>
         <td>${meatdto.writeDate }</td>
         </tr>
         </c:forEach>
      </table>
             
         </div>
           
 
    </div> 
    
</div>


<%@ include file="footer.jsp" %>