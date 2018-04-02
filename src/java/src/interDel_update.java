/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Branch;
import POJOS.Duration;
import POJOS.Fields;
import POJOS.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sltuser
 */
public class interDel_update extends HttpServlet {

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
           
             Session session = DB.connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();
            
            int inren_field = Integer.parseInt(request.getParameter("intern_field"));
            int inren_duration = Integer.parseInt(request.getParameter("duration"));
            
            int inren_branch = Integer.parseInt(request.getParameter("branch"));
            
            Student students = (Student) session.load(Student.class, request.getSession().getAttribute("User_NIC").toString());
//            Student students = (Student) session.load(Student.class,"koshil@gmail.com");
            students.setFields((Fields) session.load(Fields.class, inren_field));
            students.setDuration((Duration) session.load(Duration.class, inren_duration));
            students.setBranch((Branch) session.load(Branch.class, inren_branch));
            
             session.save(students);
            
            tr.commit();
            response.sendRedirect("profile.jsp");
            
        }catch(Exception ex){
        ex.printStackTrace();
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
        processRequest(request, response);
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
