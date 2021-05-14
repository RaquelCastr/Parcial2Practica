<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ControllerUsuario" method="post">
				<label>Usuario</label> 
			<input type="text" name="usuario" required> 
				<label>Password</label> 
			<input type="password" name="contrasena" required>
			<button name="btnLogin" value="Login">Iniciar Sesion</button>
		</form>
</body>
</html>