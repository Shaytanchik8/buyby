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

<#--<header>
    <div class="logo">buyBY</div>
    <form class="search" action="/" method="get">
        <input type="text" name="title" value="Поиск" class="search_input">
        <input type="submit" value="" class="search_button">
    </form>
    <#if user.email??>
        <form class="user" action="/logout" method="post">
            <input type="submit" value="" class="user_page" id="user_button">
            <a href="/user" class="user_name">${user.name}</a>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="header_button" type="submit" value="Выйти" />
        </form>
    &lt;#&ndash; &lt;#&ndash; <#if user.isAdmin()>
          <a href="/admin">Панель администратора</a>
      </#if>&ndash;&gt;&ndash;&gt;
    </#if>
    <div class="line_logo"></div>
</header>-->
<body>
<div class="form_message">
    <h1 class="form_title"> Создать новый товар </h1>
    <form class="form_registration" action="/product/create" method="post"  enctype="multipart/form-data">
        Название объявления: <input type="text" name="title"/>
        Описание объявления: <input type="text" name="description"/>
        Цена: <input type="number" name="price"/>
        Город: <input type="text" name="city"/>
        Первая фотография: <input type="file" name="file1"/>
        Вторая фотография: <input type="file" name="file2"/>
        Третья фотография: <input type="file" name="file3"/>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="button_form" type="submit" value="Добавить товар" />
    </form>
</div>


</body>
</html>