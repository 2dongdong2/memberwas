<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }
        .wrap {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header, .nav {
            background-color: #fff;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            color: #000;
            font-weight: bold;
        }
        .nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-around;
        }
        .nav ul li {
            display: inline;
        }
        .nav ul li a {
            text-decoration: none;
            color: #2970ff;
            font-weight: bold;
        }
        .nav ul li a:hover {
            text-decoration: underline;
        }
        .banner {
            display: flex;
            justify-content: space-between; /* 베너 및 세션 유지 부분을 좌우로 정렬 */
            align-items: center; /* 수직 정렬 */
            margin-bottom: 20px;
        }
        .banner button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #2970ff;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .banner button:hover {
            background-color: #1a5ab8;
        }
        .session-info {
            font-size: 14px;
            color: #555;
        }
        .main-content {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .member-products {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border-top: 2px solid #009688;
            border-bottom: 2px solid #009688;
        }
        .member-products ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .member-products li {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 250px;
            margin-right: 20px;
            text-align: left; /* 설명 텍스트를 왼쪽 정렬 */
        }
        .product-img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .food-info {
            font-size: 14px;
            color: #555;
            margin-top: 10px;
        }
    </style>
<body>
    <div class="wrap">
        <div class="header">
            <!-- Header Content -->
        </div>
        <div class="banner">
            <button onclick="location.href='http://www.4tier.store/mileage_products'">마일리지 상품</button>
            <div class="session-info">
                <% 
                    String userId = (String) session.getAttribute("userId");
                    if (userId != null) { 
                %>
                    <span style="color: #009688;"><%= userId %>님 환영합니다.</span>
                    <a href="http://www.4tier.store/login/logout.jsp" style="color: #009688;">Logout</a>
                <% } else { %>
                    <a href="/login" style="color: #009688;">로그인</a>
                <% } %>
            </div>
        </div>
        <div class="nav">
            <ul>
                <% 
                    if (userId != null) { 
                %>
                    <li><a href="http://www.4tier.store?userId=<%= userId %>&sessionId=<%= session.getId() %>">메인 페이지</a></li>
                    <li><a href="/board?userId=<%= userId %>&sessionId=<%= session.getId() %>">고객센터</a></li>
                    <li><a href="/write?userId=<%= userId %>&sessionId=<%= session.getId() %>">게시글 작성</a></li>
                    <li><a href="event.jsp?userId=<%= userId %>&sessionId=<%= session.getId() %>">마일리지 상품</a></li>
                <% 
                    } else { 
                %>
                    <li><a href="http://www.4tier.store/">메인 페이지</a></li>
                    <li><a href="/board">고객센터</a></li>
                    <li><a href="/login">로그인</a></li>
                    <li><a href="event.jsp">마일리지 상품</a></li>
                <% 
                    } 
                %>
            </ul>
        </div>
        <div class="main-content">
            <h1>회원 전용 상품</h1>
            <div class="member-products">
                <ul>
                    <li>
                        <img src="products1.jpg" alt="엄따밥" class="product-img">
                        <strong>엄따밥1호</strong>
                        <p class="food-info">어머니의 손맛이 들어간 손수 수제 건강 도시락</p>
                    </li>
                    <li>
                        <img src="products2.jpg" alt="자연 도시락" class="product-img">
                        <strong>자연 도시락</strong>
                        <p class="food-info">특산물 지역에서 가져온 초식동물 간접 체험 도시락</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html></head>
