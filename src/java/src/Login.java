/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sltuser
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            
             String nic=request.getParameter("nic").toString();
            String pass=request.getParameter("pass");

          
            Session ses = DB.connection.getSessionFactory().openSession();
            
            
            Criteria cr1 = ses.createCriteria(POJOS.Student.class).add(Restrictions.eq("refNo", "ok"));
            cr1.add(Restrictions.eq("nic", nic));
            Student st=(Student) cr1.uniqueResult();
            
            
            Criteria cr = ses.createCriteria(POJOS.Login.class).add(Restrictions.eq("nic", nic));
            POJOS.Login login=(POJOS.Login) cr.uniqueResult();
     
//    cr.add(Restrictions.and(Restrictions.eq("nic", nic), Restrictions.eq("pass", pass))).uniqueResult();
 
if(st==null){


 response.sendRedirect("index.jsp");

}else{

   if(login.getPass().equals(pass)){

    HttpSession s = request.getSession();
    s.setAttribute("User_NIC",nic);
    DB.userDetails.userNIC=(String) s.getAttribute("User_NIC");
       response.sendRedirect("profile.jsp");
   
   }else{
       
       response.sendRedirect("index.jsp");
        
        }
    
}
    
    
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
