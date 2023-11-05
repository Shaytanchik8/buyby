<!DOCTYPE html>
<html>

<head>
    <title>buyBY</title>
    <link <#--th:href="@{/static/css/style.css}"--> href="/css/style.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,500;1,300&display=swap"
          rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,500;1,300;1,400&display=swap"
          rel="stylesheet">
</head>

<header>
    <div class="logo">buyBY</div>
    <div class="line_logo"></div>
</header>

<body>
<div class="form_message">
    <h1 class="form_title"> Регистрация </h1>
    <form class="form_registration" action="/registration" method="post">
        Имя пользователя: <input type="text" name="name">
        Эл. почта: <input type="email" name="email">
        Номер телефона: <input type="text" name="phoneNumber">
        Пароль: <input type="password" name="password">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="button_form" type="submit" value="Зарегистрироваться" />
    </form>
</div>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>