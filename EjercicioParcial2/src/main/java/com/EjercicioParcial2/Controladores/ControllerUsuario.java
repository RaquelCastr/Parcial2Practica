package com.EjercicioParcial2.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Ejercicio2Parcial2.DAO.ClsUsuario;
import com.Ejercicio2Parcial2.Entidades.Usuario;

/**
 * Servlet implementation class ControllerUsuario
 */
public class ControllerUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession(true);

		String btncerrar = request.getParameter("btncerrar");
		String btniniciar = request.getParameter("btniniciar");

		if (btncerrar != null) {
			response.sendRedirect("index.jsp");
			session.invalidate();

		} else if (btniniciar != null) {
			response.sendRedirect("iniciar.jsp");
		}

		else {

			String user = request.getParameter("usuario");
			String pass = request.getParameter("contrasena");
			Usuario usuario = new Usuario();

			usuario.setNombre(user);
			usuario.setContrasena(pass);

			ClsUsuario clsU = new ClsUsuario();

			boolean valoracceso = clsU.LoguinUser(usuario.getNombre(), usuario.getContrasena());

			if (valoracceso == true) {
				session.setAttribute("usuario", user);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("Error.jsp");

			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
