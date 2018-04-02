/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.FileAtttach;
import POJOS.Student;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sltuser
 */
@WebServlet(name = "uploadfils", urlPatterns = {"/uploadfils"})
public class uploadfils extends HttpServlet {

    private String btn;

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
            String n=null;
             boolean ismultiple = ServletFileUpload.isMultipartContent(request);
               if (ismultiple) {
                
                FileItemFactory fif = new DiskFileItemFactory();
                ServletFileUpload upload=new ServletFileUpload(fif);
                
                try {
                    
                    List<FileItem> fit=upload.parseRequest(request);
                    for (FileItem f : fit) {
                       
                        if (!f.isFormField()) {
                            System.out.println("uploaddd ok before");
                            n=new File(f.getName()).getName();
                            System.out.println(f.getSize());
                            f.write(new File("D:/fleuploads/"+n));
                           // response.sendRedirect("myindex.html");
                            System.out.println("uploaddd ok after");
                            out.write(request+"");
                            out.write(n);
                            
                            
                        }else{
                        if (f.getFieldName().equals("profileUpdate")) {
                           btn = f.getString();
                        } 
                        
                        }
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
             Session session = DB.connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();
            
            
             Student student =(Student) session.load(Student.class, request.getSession().getAttribute("User_NIC").toString());
            Criteria ss=(Criteria) session.createCriteria(FileAtttach.class).add(Restrictions.eq("student",student));
            FileAtttach fileAtttach=(FileAtttach) ss.uniqueResult();
                System.out.println(fileAtttach);
           
            fileAtttach.setCv("D:/fleuploads/"+n);
            session.update(fileAtttach);
            tr.commit();
            
                       if (btn.equals("Update")) {
                    response.sendRedirect("profile.jsp");
                } else {

                    response.sendRedirect("Home_3.jsp");
                }
//               response.sendRedirect("Home_3.jsp");
            
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
