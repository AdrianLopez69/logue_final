<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.elvis.login.logueo.models.*" %>
<%Carro carro = (Carro) session.getAttribute("carro");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Carro de compras</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: aqua;
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar ul {
            display: flex;
            justify-content: right;
            padding: 0;
            margin: 0;
        }

        .navbar li {
            margin: 0 15px;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #007bff;
        }

        .navbar img {
            height: 24px;
            vertical-align: middle;
        }

        .content {
            padding-top: 60px;
            text-align: center; /* Center the content horizontally */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }

        .button-container {
            margin-top: 20px;
        }

        .button-container button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }

        .button-container a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<!-- Nav-bar -->
<div class="navbar">
    <ul>
        <li><a href="<%=request.getContextPath()%>/index_usu.html">Inicio</a></li>
        <li><a href="<%=request.getContextPath()%>/logout"><img src="imagenes/logout.png" alt="Logout"></a></li>
    </ul>
</div>

<div class="content">
    <h1>Carro de compras</h1>
    <% if (carro == null || carro.getItems().isEmpty()) { %>
    <p>Lo sentimos, no hay productos en el carro de compras!</p>
    <% } else { %>
    <table>
        <tr>
            <th>ID PRODUCTO</th>
            <th>NOMBRE</th>
            <th>PRECIO</th>
            <th>CANTIDAD</th>
            <th>SUBTOTAL</th>
        </tr>
        <% for(ItemCarro item : carro.getItems()) { %>
        <tr>
            <td><%= item.getProducto().getIdProducto() %></td>
            <td><%= item.getProducto().getNombre() %></td>
            <td><%= item.getProducto().getPrecio() %></td>
            <td><%= item.getCantidad() %></td>
            <td><%= item.getImporte() %></td>
        </tr>
        <% } %>
        <tr>
            <td colspan="4">Total :</td>
            <td><%= carro.getTotal() %></td>
        </tr>
    </table>
    <% } %>
    <div class="button-container">
        <button><a href="<%= request.getContextPath() %>/productos">Seguir comprando</a></button>
        <a href="<%= request.getContextPath() %>/index.html" class="button">Volver</a>
    </div>
</div>
</body>
</html>
