package com.emergentes.controlador;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        if (ses.getAttribute("listaest") == null) {
            ArrayList<Producto> listaux = new ArrayList<Producto>();
            ses.setAttribute("listaest", listaux);
        }
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaest");
        String op = request.getParameter("op");
        String opcion = (op != null) ? request.getParameter("op") : "view";
        Producto producto = new Producto();
        switch (opcion) {
            case "nuevo":
                request.setAttribute("Producto", producto);
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
                break;
            case "editar":
                producto = lista.get(buscarIndice(request, Integer.parseInt(request.getParameter("id"))));
                request.setAttribute("Producto", producto);
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
                break;
            case "eliminar":
                lista.remove(buscarIndice(request, Integer.parseInt(request.getParameter("id"))));
                ses.setAttribute("listaest", lista);
                response.sendRedirect("index.jsp");
                break;
            case "view":
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<Producto> list = (ArrayList<Producto>) ses.getAttribute("listaest");
        Producto producto = new Producto();
        producto.setId(Integer.parseInt(request.getParameter("id")));
        producto.setDescripcion(request.getParameter("descripcion"));
        producto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
        producto.setCategoria(request.getParameter("categoria"));
        int idtemp = producto.getId();
        if (idtemp == 0) {
            int ultId = ultimoId(request);
            producto.setId(ultId);
            list.add(producto);
        } else {
            list.set(buscarIndice(request, idtemp), producto);
        }
        ses.setAttribute("listaest", list);
        response.sendRedirect("index.jsp");
    }

    private int buscarIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaest");
        int indice = 0;
        if (lista.size() > 0) {
            while (indice < lista.size()) {
                if (lista.get(indice).getId() == id) {
                    break;
                } else {
                    indice++;
                }
            }
        }
        return indice;
    }

    private int ultimoId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Producto> list = (ArrayList<Producto>) ses.getAttribute("listaest");
        int idaux = 0;
        for (Producto producto : list) {
            idaux = producto.getId();
        }
        return idaux + 1;
    }
}