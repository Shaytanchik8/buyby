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
    <form class="search" action="/" method="get">
        <input type="text" name="title" value="Поиск" class="search_input">
        <input type="submit" value="" class="search_button">
    </form>
    <#if user.email??>
    <form class="user" action="/logout" method="post">
        <input type="submit" value="" class="user_page" id="user_button">
        <a href="/user/${user.id}" class="user_name">${user.name}</a>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="header_button" type="submit" value="Выйти" />
    </form>
       <#-- <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
        </#if>-->
    <#else>
    <div class="user">
       <div class="header_button"><a class="header_button-text" href="/login">Войти</a></h1>
       </div>
   </div>
    </#if>
    <div class="line_logo"></div>
</header>

<body>

<div class="products_container">
    <#list products as product>
    <div class="product-item">
        <div class="product_img"> <img class="image" src="product.jpg" alt=""></div>
        <div class="product_title"> ${product.title} </div>
        <div class="product_price">${product.price} руб.</div>
        <div class="product_info"><a href="/product/${product.id}">Подробнее...</a></div>
    </div>
    <#else>
        <h3>Товаров нет</h3>
    </#list>
</div>


<#--<h1>BUYSELL</h1>
<hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<hr>
<h4>Товары</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Товаров нет</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Создать новый товар</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Название объявления: <input type="text" name="title"/><br><br>
        Описание объявления: <input type="text" name="description"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        Город: <input type="text" name="city"/><br><br>
        Первая фотография: <input type="file" name="file1"/><br><br>
        Вторая фотография: <input type="file" name="file2"/><br><br>
        Третья фотография: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>-->


</body>
</html>