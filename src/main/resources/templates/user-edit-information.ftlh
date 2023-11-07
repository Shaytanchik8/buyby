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
    <#if user_log.email??>

        <form class="user" action="/logout" method="post">
            <input type="submit" value="" class="user_page" id="user_button">
            <a href="/user/${user_log.id}" class="user_name">${user_log.name}</a>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="header_button" type="submit" value="Выйти" />
        </form>
    <#-- &lt;#&ndash; &lt;#&ndash; <#if user.isAdmin()>
           <a href="/admin">Панель администратора</a>
       </#if>&ndash;&gt;&ndash;&gt;-->
    <#else>
        <div class="user">
            <div class="header_button"><a class="header_button-text" href="/login">Войти</a></h1>
            </div>
        </div>
    </#if>
    <div class="line_logo"></div>
</header>

<body>
<div class="form_message">
    <h1 class="form_title"> Регистрация </h1>
    <form class="form_registration" action="/user/${user.id}/edit_post" method="post">
        Имя пользователя: <input type="text" name="name" value="${user.name}">
        Эл. почта: <input type="email" name="email" value="${user.email}">
        Номер телефона: <input type="text" name="phoneNumber" value="${user.phoneNumber}">
        Новый пароль: <input type="password" name="password" value="${user.password}">  <#--Можно добавить старый и новый пароль, с проверкой на совпадение-->
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="button_form" type="submit" value="Сохранить" />
    </form>
</div>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>