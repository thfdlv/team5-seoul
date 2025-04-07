<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="nav.fortune"/></title>

    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕", helvetica, "Apple SD Gothic Neo", sans-serif;
            background-color: #f5f6f7;
            color: #333;
            margin: 0;
            padding: 40px 0;
        }
        .container {
            max-width: 768px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 30px;
        }
        h2 {
            color: #03c75a;
            font-size: 24px;
            margin-top: 0;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        h3 {
            color: #1e63e9;
            font-size: 18px;
            margin-top: 25px;
        }
        input[type="date"] {
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background-color: #03c75a;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 5px;
        }
        button:hover {
            background-color: #02b350;
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #eee;
            margin: 25px 0;
        }
        .result-box {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }
        .result-box p {
            font-size: 16px;
            line-height: 1.8;
            color: #333;
        }
        .back-btn {
            margin-bottom: 20px;
            display: inline-block;
            background-color: #03c75a;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }
        .back-btn:hover {
            background-color: #02b350;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- ✅ 뒤로가기 버튼 -->
    <button class="back-btn" onclick="location.href='/project1/template'">
        ← <spring:message code="fortune.back"/>
    </button>

    <h2><spring:message code="nav.fortune"/></h2>

    <!-- ✅ form 방식 -->
    <form method="get" action="${pageContext.request.contextPath}/getFortune">
        <spring:message code="fortune.date"/>:
        <input type="date" name="date" value="<%= java.time.LocalDate.now() %>" />
        <button type="submit"><spring:message code="fortune.check"/></button>
    </form>

    <hr>

    <!-- ✅ JSP 결과 출력 -->
    <c:if test="${not empty fortune}">
        <div class="result-box">
            <h3>
                <spring:message code="fortune.result.title">
                    <spring:argument value="${date}"/>
                </spring:message>
            </h3>
            <p>${fortune}</p>
        </div>
    </c:if>

    <!-- ✅ JS fetch 결과 출력 -->
    <div id="result" class="result-box" style="display:none;"></div>
</div>

<script>
    function getFortune() {
        const date = document.getElementById("dateInput").value;
        fetch("${pageContext.request.contextPath}/api/fortune?date=" + date)
            .then(res => {
                if (!res.ok) throw new Error("HTTP error " + res.status);
                return res.json();
            })
            .then(data => {
                const resultDiv = document.getElementById("result");
                resultDiv.innerHTML = `<h3>📅 ${data.date} <spring:message code="fortune.result.label"/></h3><p>${data.fortune}</p>`;
                resultDiv.style.display = "block";
            })
            .catch(err => {
                document.getElementById("result").innerText = "❌ <spring:message code='fortune.error'/>: " + err;
            });
    }
</script>
</body>
</html>
