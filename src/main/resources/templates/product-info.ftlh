<!DOCTYPE html>
<html>
<head>
    <titlr>BUYby</titlr>
</head>
<body>
<h1>Бгиур дно?</h1>
Подробно о товаре:
<b>Title: </b> ${product.title} <br>
<b>Description: </b> ${product.description} <br>
<b>Price: </b> ${product.price} <br>
<b>City: </b> ${product.city} <br>
<b>Author: </b> ${product.author} <br>

<hr>
<h3> Создать новый товар</h3>
<form action="/product/delete" method="post">

    <input type="submit" value="delete"/>
</form>
</body>
</html>