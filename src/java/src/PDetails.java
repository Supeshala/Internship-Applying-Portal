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
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sltuser
 */
@WebServlet(name = "PDetails", urlPatterns = {"/PDetails"})
public class PDetails extends HttpServlet {

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
            System.out.println("OKKKK");
            if (request.getSession().getAttribute("User_NIC") != null) {
                Session session = DB.connection.getSessionFactory().openSession();
                Transaction tr = session.beginTransaction();

                String initial_name = "";
                String fname = "";
                String gender = "";
                String dob = "";
                String no = "";
                String street = "";
                String city = "";
                String zipcode = "";
                String country = "";
                String address1 = "";
                String contact_no = "";
                String email = "";
                String btn = "";
                String path = "";

                 Student student = (Student) session.load(Student.class, request.getSession().getAttribute("User_NIC").toString());
                
//            
//            Student student=new Student();
//            student.setFullname(fname);
//            student.setName(fname);
//            student.setGender(gender);
//            student.setDob(d);
//            student.setAddress(address);
//            student.setTpNo(contact_no);
//            student.setEmail(email);
//            
//            session.update(student);
                FileItemFactory factory = new org.apache.commons.fileupload.disk.DiskFileItemFactory();
                org.apache.commons.fileupload.servlet.ServletFileUpload upload = new org.apache.commons.fileupload.servlet.ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                for (Object object : items) {
                    org.apache.commons.fileupload.FileItem fileitem = (org.apache.commons.fileupload.FileItem) object;
                    if (fileitem.isFormField()) {
                        if (fileitem.getFieldName().equals("intial_name")) {
                            initial_name = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("fname")) {
                            fname = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("gender")) {
                            gender = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("dob")) {
                            dob = fileitem.getString();
                           
                        } else if (fileitem.getFieldName().equals("no")) {
                            no = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("add2")) {
                            street = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("city")) {
                            city = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("zipcode")) {
                            zipcode = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("country")) {
                            country = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("contact_no")) {
                            contact_no = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("email")) {
                            System.out.println(fileitem.getString());
                            email = fileitem.getString();

                        } else if (fileitem.getFieldName().equals("personal_update")) {
                            System.out.println(fileitem.getString());
                            btn = fileitem.getString();

                        }
                        System.out.println("okkkkkkkkkk details *******************************************************8");
                    } else {

                        System.out.println(fileitem.getFieldName() + "sssssss");
                        System.out.println("sssssss");
                        if (fileitem.getFieldName().equals("image")) {

                            System.out.println("okkkkkkkkkkkkkkkkk image111");
                            System.out.println(fileitem.getString());
                            if (!fileitem.getString().equals("")) {
                                System.out.println(fileitem.getString());
                                String contentType = fileitem.getContentType();
                                path = "image_upload/" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + Math.random() + fileitem.getName();
                                // Upload.upLoad(name, path);
                                System.out.println(request.getServletContext().getRealPath("/") + path + " pathhhhhhhhhhh");
                                File files = new File("C:\\Users\\Sltuser\\Documents\\NetBeansProjects\\sltproject\\web\\" + path);
                                System.out.println(files.getPath());
                                try {
                                    fileitem.write(files);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            } else {

                                System.out.println("nulll #######################");

                            }

                        }
                    }

                }
                 System.out.println(dob);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
                Date d = sdf.parse(dob);
                System.out.println(d);
                
//            Save code
               
//            Student student =(Student) session.load(Student.class, "917800475V");

                student.setFullname(fname);
                student.setName(initial_name);
                student.setGender(gender);
                student.setDob(d);
                student.setAddress(no + " " + street + " " + city + " " + country + " " + zipcode);
                student.setTpNo(contact_no);
                student.setEmail(email);

                Criteria ss = (Criteria) session.createCriteria(FileAtttach.class).add(Restrictions.eq("student", student));
                FileAtttach fileAtttach = (FileAtttach) ss.uniqueResult();
                System.out.println(fileAtttach);

                fileAtttach.setPhoto(path);
                session.update(fileAtttach);

                session.update(student);
                tr.commit();

                if (btn.equals("Update")) {
                    response.sendRedirect("profile.jsp");
                } else {

                    response.sendRedirect("Home_1.jsp");
                }

//            response.sendRedirect("Home.jsp?panelchange="+1);
            } else {

                response.sendRedirect("index.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();

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
