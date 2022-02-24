<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>${shop.shopName} Detail</title>
    </head>
    <body>
        <div id="wrap">
            <img src="/image/${shop.shopThumb}">
            <div id="shop_name">${shop.shopName}</div>
            <div id="shop_tel">${shop.shopTel}</div>
            <div id="shop_info">${shop.shopInfo}</div>
            <div id="shop_detail">${shop.shopDetail}</div>
            <div>${shop.shopLocation}</div>
            <div>${shop.shopLat}</div>
            <div>${shop.shopLong}</div>
            <div>${shop.shopRating}</div>
            <div>${shop.shopEvalNum}</div>
        </div>
    </body>
</html>