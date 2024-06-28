<%--
  Created by IntelliJ IDEA.
  User: ADMIN-ITQ
  Date: 30/5/2024
  Time: 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ingresando al Sistema</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 100px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Estilos para el nav-bar */
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

        .navbar .icon {
            display: flex;
            align-items: center;
            padding: 14px 20px;
        }

        .navbar img {
            height: 24px;
            vertical-align: middle;
        }

        /* Ajuste del contenido al nav-bar */
        .content {
            padding-top: 60px;
        }
    </style>
</head>
<body>

<!-- Nav-bar -->
<div class="navbar">
    <ul>
        <!-- Añade tus elementos de navegación aquí -->
        <li><a href="/logueo_war_exploded/index.html">Inicio</a></li>
    </ul>
</div>

<!-- Contenido principal -->
<div class="content">
    <h1>Iniciar sesión</h1>
    <form action="/logueo_war_exploded/Login" method="post">
        <div>
            <label for="username">Ingrese el nombre del usuario</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="password">Ingrese la contraseña</label>
            <input type="password" name="password" id="password">
        </div>
        <div>
            <input type="submit" value="Login">
        </div>
    </form>
</div>

</body>
</html>
