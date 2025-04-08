<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="login.title" /></title>
    <style>
       <style>
        * {
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕", Helvetica, Arial, sans-serif;
        }
        
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f6f7;
        }
        
        .container {
            max-width: 460px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #e5e5e5;
            border-radius: 6px;
        }
        
        h1 {
            text-align: center;
            color: #03c75a;
            font-size: 50px;
            margin: 0 0 30px 0;
            font-weight: 800;
        }
        
        .login-form {
            width: 100%;
        }
        
        .input-field {
            position: relative;
            width: 100%;
            height: 51px;
            border: 1px solid #dadada;
            margin-bottom: 10px;
            padding: 10px;
            background: #fff;
        }
        
        .input-field:focus-within {
            border: 1px solid #03c75a;
        }
        
        .input-field input {
            width: 100%;
            height: 29px;
            border: none;
            outline: none;
            background: transparent;
            font-size: 15px;
        }
        
        .error-msg {
            color: #ff1616;
            font-size: 13px;
            margin-bottom: 10px;
        }
        
        .btn-area {
            margin-top: 30px;
        }
        
        .btn {
            display: block;
            width: 100%;
            padding: 13px 0;
            margin-bottom: 10px;
            font-size: 20px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            border-radius: 6px;
            border: none;
        }
        
        .btn-primary {
            background-color: #03c75a;
            color: white;
        }
        
        .btn-cancel {
            background-color: #f8f9fa;
            color: #222;
            border: 1px solid #dadada;
        }
    </style>
    </style>
</head>
<body>
    <div class="container">
        <h1>TEAM5</h1>
        <div class="error-msg">
            <font color="red">${msg}</font>
        </div>
        <form action="member/login" method="post" id="f" class="login-form">
            <div class="input-field">
                <input type="text" name="id" placeholder="<spring:message code='login.id'/>" id="id">
            </div>
            <div class="input-field">
                <input type="password" name="password" placeholder="<spring:message code='login.password'/>" id="password">
            </div>
            <div class="btn-area">
                <input type="button" class="btn btn-primary" value="<spring:message code='login.submit'/>" onclick="loginCheck()">
                <input type="button" class="btn btn-cancel" value="<spring:message code='login.cancel'/>" onclick="location.href='http://www.team5.click/project1/template'">
            </div>
        </form>
    </div>

<script>
function loginCheck() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("password").value;

    if (!id) {
        alert("<spring:message code='alert.id.required'/>");
        document.getElementById("id").focus();
        return;
    }
    if (!pw) {
        alert("<spring:message code='alert.pw.required'/>");
        document.getElementById("password").focus();
        return;
    }

    document.getElementById("f").submit();
}
</script>
</body>
</html>