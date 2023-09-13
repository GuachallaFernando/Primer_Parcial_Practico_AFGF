<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Producto> list = (ArrayList<Producto>) session.getAttribute("listaest");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Gestiòn de productos</title>
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
	<h1>Gestiòn de productos</h1>
	
	<a href="MainController?op=nuevo">Nuevo producto</a><br><br>
    <table border="2" cellspacing="0" cellpadding="6">
        <thead>
            <tr>
                <th>Id</th>
                <th>Descripcìon</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                if (list != null) {
                    for (Producto item : list) {
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getDescripcion()%></td>
                <td><%= item.getCantidad()%></td>
                <td><%= item.getPrecio()%></td>
                <td><%= item.getCategoria()%></td>
                <td><a href="MainController?op=editar&id=<%= item.getId()%>">Editar</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId()%>" onclick='return confirm("Estas seguro de eliminar el registro?");'>Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
