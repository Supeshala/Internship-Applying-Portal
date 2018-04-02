/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Reference;
import POJOS.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sltuser
 */
public class reference_update extends HttpServlet {

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
            
             Student students = (Student) session.load(Student.class, request.getSession().getAttribute("User_NIC").toString());
              String ref1_name = request.getParameter("refree_1name");
            String ref1_post = request.getParameter("refree_1post");
            String ref1_address = request.getParameter("refree_1address");
            String ref1_email = request.getParameter("refree_1email");
            String ref1_tel = request.getParameter("refree_1tel");
            
            String ref2_name = request.getParameter("refree_2name");
            String ref2_post = request.getParameter("refree_2post");
            String ref2_address = request.getParameter("refree_2address");
            String ref2_email = request.getParameter("refree_2email");
            String ref2_tel = request.getParameter("refree_2tel");
            
            Criteria cc=session.createCriteria(Reference.class).add(Restrictions.eq("student", students)).add(Restrictions.eq("refNo", "1"));
            Reference reference=(POJOS.Reference) cc.uniqueResult();
            reference.setRefName(ref1_name);
              reference.setRefPost(ref1_post);
            reference.setAddress(ref1_address);
            reference.setEmail(ref1_email);
            reference.setConNo(ref1_tel);
            session.update(reference);
            
            
                   Criteria cc1=session.createCriteria(Reference.class).add(Restrictions.eq("student", students)).add(Restrictions.eq("refNo", "2"));
            Reference reference1=(POJOS.Reference) cc1.uniqueResult();
             reference1.setRefName(ref2_name);
            reference1.setRefPost(ref2_post);
            reference1.setAddress(ref2_address);
            reference1.setEmail(ref2_email);
            reference1.setConNo(ref2_tel);
            session.update(reference1);
            
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
