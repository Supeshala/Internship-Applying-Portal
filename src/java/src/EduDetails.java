/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.AwardsAchive;
import POJOS.EducationalLevel;
import POJOS.Qualification;
import POJOS.Student;
import POJOS.University;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "EduDetails", urlPatterns = {"/EduDetails"})
public class EduDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Session session = DB.connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();

//           University Detials
            if (request.getSession().getAttribute("User_NIC") != null) {

                int edulevel = Integer.parseInt(request.getParameter("edu_level"));
                String uniName = request.getParameter("uni_name");
                String uniAddress = request.getParameter("uni_address");
                String uniCourse = request.getParameter("uni_course");
                String unistarteddate = request.getParameter("date");
                String qualif = request.getParameter("qualification");
                String award = request.getParameter("award");
                String btn = request.getParameter("edu_update");

                Student student = (Student) session.load(Student.class, request.getSession().getAttribute("User_NIC").toString());
                student.setEducationalLevel((EducationalLevel) session.load(EducationalLevel.class, edulevel));

                SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
                Date dt = sdf.parse(unistarteddate);

                Criteria cr = session.createCriteria(University.class).add(Restrictions.eq("nic", request.getSession().getAttribute("User_NIC").toString()));
                University uni = (University) cr.uniqueResult();

                //  University uni=(University) session.load(University.class, u);
                uni.setName(uniName);
                uni.setAddress(uniAddress);
                uni.setDegree(uniCourse);
                uni.setNic(request.getSession().getAttribute("User_NIC").toString());
                uni.setStartedDate(dt);
                session.update(uni);

//            GCE O/L and GCE A/L exam result
                String sub1 = request.getParameter("sub1");
                String mark1 = request.getParameter("mark1");
                String sub2 = request.getParameter("sub2");
                String mark2 = request.getParameter("mark2");
                String sub3 = request.getParameter("sub3");
                String mark3 = request.getParameter("mark3");
                String sub4 = request.getParameter("sub4");
                String mark4 = request.getParameter("mark4");
                String sub5 = request.getParameter("sub5");
                String mark5 = request.getParameter("mark5");
                String sub6 = request.getParameter("sub6");
                String mark6 = request.getParameter("mark6");
                String sub7 = request.getParameter("sub7");
                String mark7 = request.getParameter("mark7");
                String sub8 = request.getParameter("sub8");
                String mark8 = request.getParameter("mark8");
                String sub9 = request.getParameter("sub9");
                String mark9 = request.getParameter("mark9");
                String sub10 = request.getParameter("sub10");
                String mark10 = request.getParameter("mark10");

                String Asub1 = request.getParameter("Asub1");
                String Amark1 = request.getParameter("Amark1");
                String Asub2 = request.getParameter("Asub2");
                String Amark2 = request.getParameter("Amark2");
                String Asub3 = request.getParameter("Asub3");
                String Amark3 = request.getParameter("Amark3");
                String Asub4 = request.getParameter("Asub4");
                String Amark4 = request.getParameter("Amark4");
                String Asub5 = request.getParameter("Asub5");
                String Amark5 = request.getParameter("Amark5");

                student.setOl(sub1 + "=" + mark1 + ","
                        + sub2 + "=" + mark2 + ","
                        + sub3 + "=" + mark3 + ","
                        + sub4 + "=" + mark4 + ","
                        + sub5 + "=" + mark5 + ","
                        + sub6 + "=" + mark6 + ","
                        + sub7 + "=" + mark7 + ","
                        + sub8 + "=" + mark8 + ","
                        + sub9 + "=" + mark9 + ","
                        + sub10 + "=" + mark10);

                student.setAl(Asub1 + "=" + Amark1 + ","
                        + Asub2 + "=" + Amark2 + ","
                        + Asub3 + "=" + Amark3 + ","
                        + Asub4 + "=" + Amark4 + ","
                        + Asub5 + "=" + Amark5);

//                Save code of Qualification
                Qualification qualification = new Qualification();
                qualification.setProQua(qualif);
                //qualification.setAwardsAchiv(award);
                qualification.setStudentNic(request.getSession().getAttribute("User_NIC").toString());
                session.save(qualification);

                
                
                POJOS.AwardsAchive aw = new AwardsAchive();

                aw.setAward(award);
                aw.setStudentNic(request.getSession().getAttribute("User_NIC").toString());
                session.save(aw);

                student.setQualification(qualification);
                session.update(student);

                tr.commit();

//            response.sendRedirect("Home.jsp?panelchange="+1);
                if (btn.equals("Update")) {
                    response.sendRedirect("profile.jsp?tab=step1");
                } else {

                    response.sendRedirect("Home_2.jsp");
                }

            } else {

                response.sendRedirect("index.jsp");
            }

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
