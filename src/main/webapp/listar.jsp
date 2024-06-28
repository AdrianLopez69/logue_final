<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, com.elvis.login.logueo.models.*" %>
<%
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado de Productos</title>
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
        <li>
            <% if (username.isPresent()) { %>
            <% if ("admin".equals(username.get())) { %>
            <a href="<%= request.getContextPath() %>/index_ad.html">Inicio</a>
            <% } else if ("user".equals(username.get())) { %>
            <a href="<%= request.getContextPath() %>/index_usu.html">Inicio</a>
            <% } %>
            <% } else { %>
            <a href="<%= request.getContextPath() %>/index.html">Inicio</a> <!-- Default for non-logged in users -->
            <% } %>
        </li>
        <li><a href="<%= request.getContextPath() %>/logout"><img src="imagenes/logout.png" alt="Logout"></a></li>
    </ul>
</div>

<div class="content">
    <h1>LISTADO DE PRODUCTOS</h1>
    <% if (username.isPresent()) { %>
    <div>Hola <%= username.get() %>, ¡Bienvenido!</div>
    <% if ("admin".equals(username.get())) { %>
    <div class="button-container">
        <button><a href="<%= request.getContextPath() %>/formulario">CREAR NUEVO PRODUCTO</a></button>
    </div>
    <% } %>
    <% } %>

    <table>
        <tr>
            <th>ID Producto</th>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Descripción</th>
            <% if (username.isPresent() && "admin".equals(username.get())) { %>
            <th>Precio</th>
            <th>Editar</th>
            <th>Eliminar</th>
            <% } else if (username.isPresent() && "user".equals(username.get())) { %>
            <th>Agregar</th>
            <% } %>
        </tr>

        <% for (Producto p : productos) { %>
        <tr>
            <td><%= p.getIdProducto() %></td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getCategoria().getNombre() %></td>
            <td><%= p.getDescripcion() %></td>

            <% if (username.isPresent()) { %>
            <% if ("admin".equals(username.get())) { %>
            <td><%= p.getPrecio() %></td>
            <td><a href="<%= request.getContextPath() %>/editar-producto?idProducto=<%= p.getIdProducto() %>"><img src="imagenes/edit.png" style="height: 20px;"></a></td>
            <td><a onclick="return confirm('¿Estás seguro que deseas eliminar el producto?');" href="<%= request.getContextPath() %>/eliminar-producto?id=<%= p.getIdProducto() %>"><img src="imagenes/remove.png" style="height: 20px;"></a></td>
            <% } else if ("user".equals(username.get())) { %>
            <td><a href="<%= request.getContextPath() %>/agregar-carro?id=<%= p.getIdProducto() %>"><img src="imagenes/checklist.png" style="height: 20px;"></a></td>
            <% } %>
            <% } %>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
