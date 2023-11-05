/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.smartgarden.web.controllers;

import cl.smartgarden.web.models.Dato;
import cl.smartgarden.web.models.DatoDAO;
import cl.smartgarden.web.models.Usuario;
import cl.smartgarden.web.models.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class mainController extends HttpServlet {

    Usuario u = new Usuario();
    UsuarioDAO uDAO = new UsuarioDAO();

    Dato d = new Dato();
    DatoDAO dDAO = new DatoDAO();

    List<Dato> datos = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            //Si la sesión existe
            if (session.getAttribute("userAcc") != null) {
                Usuario uSession = (Usuario) session.getAttribute("userAcc");
                datos = dDAO.obtainData(uSession.getDispositivoActualUsuario()); //Obtenemos todos los datos del dispositivo que tiene seleccionado el usuario (default: 1)               

                request.setAttribute("datos", datos); //Enviamos los datos a la vista
                System.out.println("MainController: Existe una sesion.");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else {
                System.out.println("MainController: No hay sesion.");
                response.sendRedirect("signin.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        String emailUsuario = request.getParameter("email");
        String claveUsuario = request.getParameter("password");

        switch (accion) {
            //Si se esta logeando
            case "sign-in":
                HttpSession loginSession = request.getSession();

                //Si la sesión existe
                if (loginSession.getAttribute("userAcc") != null) {
                    Usuario uLogin = (Usuario) loginSession.getAttribute("userAcc");

                    datos = dDAO.obtainData(uLogin.getDispositivoActualUsuario()); //Obtenemos todos los datos del dispositivo que tiene seleccionado el usuario (default: 1)
                    request.setAttribute("datos", datos); //Enviamos los datos a la vista
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                } else {
                    u = uDAO.validateUser(emailUsuario, claveUsuario);

                    if (u != null) {
                        loginSession.setMaxInactiveInterval(30 * 60); //Session expira en 30 min
                        loginSession.setAttribute("userAcc", u); //Guardamos el usuario en la sesión

                        datos = dDAO.obtainData(u.getDispositivoActualUsuario()); //Obtenemos todos los datos del dispositivo que tiene seleccionado el usuario (default: 1)

                        request.setAttribute("datos", datos); //Enviamos los datos a la vista

                        System.out.println("MainController: " + u.getNombreUsuario() + " inicio sesion");

                        request.setAttribute("tituloMensaje", "¡Bienvenid@!");
                        request.setAttribute("mensaje", "Ha iniciado sesión exitosmaente.");

                        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    } else {
                        System.out.println("MainController: Error al iniciar sesión de: " + emailUsuario);
                        
                        request.setAttribute("tituloMensaje", "Error");
                        request.setAttribute("error", "No se ha encontrado su cuenta, verifique los datos.");
                        request.getRequestDispatcher("signin.jsp").forward(request, response);
                    }
                    u = null;
                }
                break;

            //Si se está registrando
            case "sign-up":
                Usuario uAdd = new Usuario();
                String nombreUsuario = request.getParameter("nombre");
                String apellidoUsuario = request.getParameter("apellido");

                //Verificamos si el usuario existe
                uAdd = uDAO.searchUser(emailUsuario);

                //Si el usuario ya existe...
                if (uAdd != null) {
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                    System.out.println("MainController: El usuario ya existe");
                    
                    request.setAttribute("tituloMensaje", "Error");
                    request.setAttribute("error", "El correo ingresado ya está registrado.");
                    //Si no existe
                } else {
                    boolean res = uDAO.addUser(nombreUsuario, apellidoUsuario, emailUsuario, claveUsuario);

                    if (res == true) {
                        System.out.println("mainController: Usuario registrado exitosamente.");
                        Usuario uAux = uDAO.validateUser(emailUsuario, claveUsuario); //Traemos todos los datos del usuario recién registrado.

                        HttpSession registerSession = request.getSession();
                        registerSession.setMaxInactiveInterval(30 * 60); //Session expira en 30 min                        
                        registerSession.setAttribute("userAcc", uAux); //Guardamos el usuario en la sesión

                        datos = dDAO.obtainData(1); //Obtenemos todos los datos del dispositivo que tiene seleccionado el usuario (default: 1)

                        request.setAttribute("datos", datos); //Enviamos los datos a la vista
                        
                        request.setAttribute("tituloMensaje", "¡Bienvenid@!");
                        request.setAttribute("mensaje", "Su cuenta se ha registrado exitosamente");

                        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("signin.jsp");
                    }
                }
                u = null;
                break;

            default:
                throw new AssertionError();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
