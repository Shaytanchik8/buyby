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
            <a href="/user" class="user_name">${user.name}</a>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="header_button" type="submit" value="Выйти" />
        </form>
   <#-- &lt;#&ndash; <#if user.isAdmin()>
         <a href="/admin">Панель администратора</a>
     </#if>&ndash;&gt;-->
    <#else>
        <div class="user">
            <div class="header_button"><a class="header_button-text" href="/login">Войти</a></h1>
            </div>
        </div>
    </#if>
    <div class="line_logo"></div>
</header>


<body>
<div class="form_message" id="info">
    <h1 class="form_title" id="product_info-title"> Регистрация </h1>
    <div class="form_info-container">
        <div class="slider">
            <div class="slider__wrapper">
                <div class="slider__items">
                    <#list images as img>
                    <div class="slider__item">
                        <img class="img-fluid" src="/images/${img.id}"  loading="lazy"/>
                    </div>
                    </#list>
                </div>
            </div>
            <a class="slider__control slider__control_prev" href="#" role="button" data-slide="prev"></a>
            <a class="slider__control slider__control_next" href="#" role="button" data-slide="next"></a>
        </div>


        <div class="product_info-container">
            <div class="product_info-item">
                <div class="product_info-title"> Название товара: </div>
                <div class="product_info-text"> ${product.title} </div>
                <div class="product_info-line"></div>
            </div>
            <div class="product_info-item">
                <div class="product_info-title"> Цена: </div>
                <div class="product_info-text"> ${product.price} </div>
                <div class="product_info-line"></div>
            </div>
            <div class="product_info-item">
                <div class="product_info-title"> Автор: </div>
                <div class="product_info-text"> <a href="/user/${product.user.id}"> ${product.user.name} </a> </div>
                <div class="product_info-line"></div>
            </div>
            <div class="product_info-item">
                <div class="product_info-title"> Город: </div>
                <div class="product_info-text"> ${product.city} </div>
                <div class="product_info-line"></div>
            </div>
        </div>

        <div class="product_info-description">
            <div class="product_info-title-description"> Описание: </div>
            <div class="product_info-text-description"> ${product.description} </div>
        </div>
    </div>
</div>

<div class="another_products-title"> Продукты других продовцов </div>
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


</body>
</html>