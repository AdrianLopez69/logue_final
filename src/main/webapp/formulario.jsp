<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, com.elvis.login.logueo.models.*" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
    Producto producto = (Producto) request.getAttribute("producto");
    if (producto == null) {
        producto = new Producto();  // Inicializa un nuevo objeto Producto si es null
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agregar Producto</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            padding: 20px;
            box-sizing: border-box;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #555;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .error {
            color: red;
            margin-top: 5px;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 4px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<!-- Nav-bar -->
<div class="navbar">
    <ul>
        <li><a href="<%=request.getContextPath()%>/index_ad.html">Inicio</a></li>
        <li><a href="<%=request.getContextPath()%>/logout"><img src="imagenes/logout.png" alt="Logout"></a></li>
    </ul>
</div>

<div class="content">
    <div class="card">
        <h2>Agregar Nuevo Producto</h2>
        <form action="<%= request.getContextPath() %>/formulario" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="<%= producto.getNombre() %>" required>
            <% if (errores != null && errores.containsKey("nombre")) { %>
            <div class="error"><%= errores.get("nombre") %></div>
            <% } %>

            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" required><%= producto.getDescripcion() %></textarea>
            <% if (errores != null && errores.containsKey("descripcion")) { %>
            <div class="error"><%= errores.get("descripcion") %></div>
            <% } %>

            <label for="precio">Precio:</label>
            <input type="text" id="precio" name="precio" value="<%= producto.getPrecio() %>" required>
            <% if (errores != null && errores.containsKey("precio")) { %>
            <div class="error"><%= errores.get("precio") %></div>
            <% } %>

            <label for="stock">Stock:</label>
            <input type="text" id="stock" name="stock" value="<%= producto.getStock() %>" required>
            <% if (errores != null && errores.containsKey("stock")) { %>
            <div class="error"><%= errores.get("stock") %></div>
            <% } %>

            <label for="idCategoria">Categoría:</label>
            <select id="idCategoria" name="idCategoria" required>
                <% if (categorias != null) { %>
                <% for (Categoria c : categorias) { %>
                <option value="<%= c.getIdCategoria() %>" <%= (producto.getCategoria() != null && c.getIdCategoria() == producto.getCategoria().getIdCategoria()) ? "selected" : "" %>><%= c.getNombre() %></option>
                <% } %>
                <% } %>
            </select>
            <% if (errores != null && errores.containsKey("Categoria")) { %>
            <div class="error"><%= errores.get("Categoria") %></div>
            <% } %>

            <input type="hidden" name="id" value="<%= producto.getIdProducto() %>">
            <button type="submit" class="submit-btn"><%= (producto.getIdProducto() != null && producto.getIdProducto() > 0 ? "Editar" : "Crear") %></button>
        </form>
    </div>
</div>
</body>
</html>
