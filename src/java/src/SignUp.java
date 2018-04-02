/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.FileAtttach;
import POJOS.Login;
import POJOS.Payment;
import POJOS.Qualification;
import POJOS.Reference;
import POJOS.Status;
import POJOS.Student;
import POJOS.University;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sltuser
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

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

            System.out.println(request.getParameter("nic"));
            String nic = request.getParameter("nic");
            String pass = request.getParameter("pass");

            Session session = DB.connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();

           Criteria sa=(Criteria) session.createCriteria(Student.class).add(Restrictions.eq("nic",nic));
           Student ss=(Student) sa.uniqueResult();
            
            if (ss != null) {
                response.sendRedirect("index.jsp?val=1");
                
            } else {
//            
                University university = new University();
                university.setNic(nic);
                session.save(university);
//           FileAtttach fileAtttach=new FileAtttach();
//            Reference reference = new Reference();
//            session.save(reference);
                Qualification qualification = new Qualification();
                session.save(qualification);

//            Status status = (Status) session.load(Status.class, 1);
//            Payment payment = new Payment();
//            payment.setNic(nic);
//            payment.setStatus(status);
//            session.save(payment);
                Student student = new Student();
                student.setNic(nic);
                student.setDor(new Date());

                student.setUniversity(university);
//            student.setPayment(payment);
//       
//            student.setReference(reference);
                student.setQualification(qualification);

                session.save(student);

                FileAtttach fileAtttach = new FileAtttach();
                fileAtttach.setStudent(student);
                session.save(fileAtttach);

                Login login = new Login();
                login.setNic(nic);
                login.setPass(pass);
                login.setStudent(student);

                session.save(login);

                tr.commit();
                HttpSession s = request.getSession();
                s.setAttribute("User_NIC", nic);
                DB.userDetails.userNIC = (String) s.getAttribute("User_NIC");
                response.sendRedirect("Home.jsp");
            }
//            DatabaseClass.getMyConnection().createStatement().executeUpdate("insert into student(nic) values('" + nic + "')");
//            out.write("Save complete");
        } catch (Exception ex) {
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
