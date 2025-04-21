<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro</title>
    <style>
        body {
            background-color: #f0f8ff; 
            color: #333; 
            font-family: Arial, sans-serif; 
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            text-align: center;
        }
        .centered-form {
            display: flex;
            flex-direction: column;
        }
        .centered-form h2 {
            margin-bottom: 20px;
            color: #2e8b57; 
        }
        .centered-form label {
            margin-top: 10px;
            text-align: left;
            display: block;
            width: 100%;
            text-align: left;
        }
        .centered-form input[type="text"],
        .centered-form input[type="email"],
        .centered-form input[type="password"],
        .centered-form input[type="number"] {
            padding: 10px; 
            margin-top: 5px;
            border: 1px solid #ccc; 
            border-radius: 3px; 
            width: 100%;
            box-sizing: border-box;
        }
        .centered-form input[type="submit"] {
            background-color: #4caf50; 
            color: white; 
            border: none;
            padding: 10px 15px; 
            border-radius: 5px;
            cursor: pointer; 
            margin-top: 20px;
        }
        .centered-form input[type="submit"]:hover {
            background-color: #45a049; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registro</h2>
        <form class="centered-form" method="post">
            <label for="nombre">Nombres:</label>
            <input type="text" id="nombre" name="nombre" required><br>

            <label for="apellido">Apellidos:</label>
            <input type="text" id="apellido" name="apellido" required><br>

            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required><br>

            <label for="edad">Edad:</label>
            <input type="number" id="edad" name="edad" min="0" required><br>

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" required><br>

            <label for="color">Color favorito:</label>
            <input type="text" id="color" name="color" required><br>

            <input type="submit" value="Guardar en sesión">
        </form>
        <%
            if (request.getMethod().equals("POST")) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("correo");
                String edad = request.getParameter("edad");
                String contrasena = request.getParameter("contrasena");
                String color = request.getParameter("color");

                if (nombre != null && !nombre.trim().isEmpty()) {
                    session.setAttribute("nombreUsuario", nombre);
                }
                if (apellido != null && !apellido.trim().isEmpty()) {
                    session.setAttribute("apellidoUsuario", apellido);
                }
                if (correo != null && !correo.trim().isEmpty()) {
                    session.setAttribute("correoUsuario", correo);
                }
                if (edad != null && !edad.trim().isEmpty()) {
                    session.setAttribute("edadUsuario", edad);
                }
                if (contrasena != null && !contrasena.trim().isEmpty()) {
                    session.setAttribute("contrasenaUsuario", contrasena);
                }
                if (color != null && !color.trim().isEmpty()) {
                    session.setAttribute("colorFavorito", color);
                }
            }

            String nombreGuardado = (String) session.getAttribute("nombreUsuario");
            String apellidoGuardado = (String) session.getAttribute("apellidoUsuario");
            String correoGuardado = (String) session.getAttribute("correoUsuario");
            String edadGuardada = (String) session.getAttribute("edadUsuario");
            String contrasenaGuardada = (String) session.getAttribute("contrasenaUsuario");
            String colorGuardado = (String) session.getAttribute("colorFavorito");
        %>
        
        <% if (nombreGuardado != null || apellidoGuardado != null || correoGuardado != null || edadGuardada != null || contrasenaGuardada != null || colorGuardado != null) { %>
            <h2>Datos guardados en sesión:</h2>
            <% if (nombreGuardado != null) { %>
                <p>Nombre: <%= nombreGuardado %></p>
            <% } %>
            <% if (apellidoGuardado != null) { %>
                <p>Apellido: <%= apellidoGuardado %></p>
            <% } %>
            <% if (correoGuardado != null) { %>
                <p>Correo: <%= correoGuardado %></p>
            <% } %>
            <% if (edadGuardada != null) { %>
                <p>Edad: <%= edadGuardada %></p>
            <% } %>
            <% if (colorGuardado != null) { %>
                <p>Color favorito: <%= colorGuardado %></p>
            <% } %>
            <form class="centered-form" method="post" action="?accion=limpiar">
                <input type="hidden" name="accion" value="limpiar">
                <input type="submit" value="Limpiar sesión">
            </form>
        <% } %>
        
        <%
            if ("limpiar".equals(request.getParameter("accion"))) {
                session.invalidate();
                response.sendRedirect("sesiones.jsp");
            }
        %>
    </div>  
</body>
</html>