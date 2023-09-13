<%@page import="com.emergentes.modelo.Producto"%>
<%
    Producto producto = (Producto) request.getAttribute("Producto");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">producto
	<title>Nuevo Producto</title>
        <style>
		.box {
			margin: auto;
			width: 50%;
			padding: 10px;
			border: 1px solid #ccc;
			text-align: center;
		}
	</style>
</head>
<body>
        <div class="box">
                <h3>PRIMER PARCIAL PRÀCTICO TEM-742</h3>
                <p>Nombre : Abel Fernando Guachalla Fernandez</p>
                <p>Carnet : 10076417</p>
	</div>
	<h1><%= (producto.getId() == 0) ? "Nuevo " : "Editar "%>registro de productos</h1>

        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= producto.getId()%>">
            <table border="2" cellspacing="0" cellpadding="20">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>Nombre del Producto:</td>
                                <td><input type="text" name="descripcion" value="<%= producto.getDescripcion()%>"></td>
                            </tr>
                            <tr>
                                <td>Cantidad del producto:</td>
                                <td><input type="number"  name="cantidad" value="<%= producto.getCantidad()%>"></td>
                            </tr>
                            <tr>
                                <td>Precio del producto:</td>
                                <td><input type="double"  name="precio" value="<%= producto.getPrecio()%>"></td>
                            </tr>
                            <tr>
                                <td>Categoria del producto:</td>
                                <td><input type="text"  name="categoria" value="<%= producto.getCategoria()%>"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table><br>
            <input type="submit" value="Enviar">
        </form>
</body>
</html>