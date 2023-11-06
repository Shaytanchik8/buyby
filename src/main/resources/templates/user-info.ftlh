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
    <#--<form class="search" action="/" method="get">
        <input type="text" name="title" value="Поиск" class="search_input">
        <input type="submit" value="" class="search_button">
    <#--</form>&ndash;&gt;
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
    <#else>
        <div class="user">
            <div class="header_button"><a class="header_button-text" href="/login">Войти</a></h1>
            </div>
        </div>
    </#if>-->
    <div class="line_logo"></div>
</header>

<body>

<div class="form_message" id="info">
    <h1 class="form_title" id="product_info-title"> Подробная информация о пользователе ${user.name} </h1>
    <div class="form_info-container">
        <div class="user_image" width="300px">
            <img src="#" >
        </div>


        <div class="product_info-container">
            <div class="product_info-item">
                <div class="product_info-title"> Номер телефона: </div>
                <div class="product_info-text"> ${user.phoneNumber} </div>
                <div class="product_info-line"></div>
            </div>
            <div class="product_info-item">
                <div class="product_info-title"> Email:  </div>
                <div class="product_info-text"> ${user.email} </div>
                <div class="product_info-line"></div>
            </div>
        </div>
        <#if user.email??>
            <form class="user" action="/logout" method="post">
                <input class="header_button" type="submit" value="Редактировать" />
            </form>
        </#if>
    </div>
</div>

    <div class="another_products-title"> Товары пользователя ${user.name} </div>
<form class="user" action="/logout" method="post">
    <input class="header_button" type="submit" value="Редактировать" />
</form>
    <div class="line_logo"></div>


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


<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>