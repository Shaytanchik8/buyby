<!DOCTYPE html>
<html>
<head>
    <titlr>BUYby</titlr>
</head>
<body>
<h1>Бгиур дно?</h1>
Товары:
<#list products as product>
    <div>
        <p><b>${product.title}</b>  ${product.price}  |  <a href="/product/${product.id}"> Подробнее...</a> </p>
    </div>
</#list>
<hr>
<h3> Создать новый товар</h3>
<form action="/product/create" method="post">
    Title <input type="text" name="title"/><br><br>
    Description <input type="text" name="description"/><br><br>
    Price <input type="number" name="price"/><br><br>
    City <input type="text" name="city"/><br><br>
    Author <input type="text" name="author"/><br><br>
    <input type="submit" value="create"/>
</form>
</body>
</html>