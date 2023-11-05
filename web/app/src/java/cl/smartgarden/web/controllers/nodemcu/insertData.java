/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cl.smartgarden.web.controllers.nodemcu;

import cl.smartgarden.web.models.Dato;
import cl.smartgarden.web.models.DatoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class insertData extends HttpServlet {

    Dato d = new Dato();
    DatoDAO dDAO = new DatoDAO();

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
            request.getRequestDispatcher("404.jsp").forward(request, response);
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

        int idDispositivo = 1;
        String tempA_Str = request.getParameter("tempA");
        String humA_Str = request.getParameter("humA");
        String nvlAgua_Str = request.getParameter("nvlAgua");
        String nvlLuz_Str = request.getParameter("nvlLuz");
        String humSuelo_Str = request.getParameter("humSuelo");

//        System.out.println("ID Dispositivo:" + idDispositivo);
//        System.out.println("Temp. Ambiente:" + tempA_Str);
//        System.out.println("Hum. Ambiente:" + humA_Str);
//        System.out.println("Nivel Agua (%):" + nvlAgua_Str);
//        System.out.println("Nivel Luz:" + nvlLuz_Str);
//        System.out.println("Hum. Suelo:" + humSuelo_Str);
//        System.out.println("--------------------------");
        System.out.println("insertDataController: Recibiendo datos del NodeMCU.");

        try {
            float tempA = Float.parseFloat(tempA_Str);
            int humA = Integer.parseInt(humA_Str);
            int humS = Integer.parseInt(humSuelo_Str);
            int nvlAgua = Integer.parseInt(nvlAgua_Str);
            int nvlLuz = Integer.parseInt(nvlLuz_Str);

            dDAO.insertData(idDispositivo, tempA, humA, nvlAgua, nvlLuz, humS);
        } catch (Exception ex) {
            System.out.println("Error al parsear los datos");
            System.out.println(ex.getMessage());
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
