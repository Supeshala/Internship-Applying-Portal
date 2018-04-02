<%-- 
    Document   : internDetails
    Created on : Nov 24, 2017, 11:17:47 AM
    Author     : tt2017071
--%>
<%@page import="POJOS.Branch"%>
<%@page import="POJOS.Duration"%>
<%@page import="POJOS.Fields"%>
<%@page import="java.util.List"%>

<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%
    Session ses = DB.connection.getSessionFactory().openSession();
    Transaction tr = ses.beginTransaction();

%>
<form class="form-horizontal" action="internDel_Ref" method="POST">
    <fieldset>

        <!-- Form Name -->
        <legend>internship Details</legend>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="intern_field">Internship Field</label>
            <div class="col-md-4">
                <select id="intern_field" name="intern_field" class="form-control">
                    <%                                                        Criteria cr = ses.createCriteria(POJOS.Fields.class);
                        List<Fields> li = cr.list();
                        for (Fields f : li) {
                    %>
                    <option value="<%=f.getIdfields()%>"><%=f.getFieldName()%></option>

                    <%

                        }


                    %>

                </select>
            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="duration">Duration</label>
            <div class="col-md-4">

                <select id="duration" name="duration" class="form-control">

                    <%  
                        Criteria cr1 = ses.createCriteria(POJOS.Duration.class);
                        List<Duration> li1 = cr1.list();
                        for (Duration d : li1) {
                    %>
                    <option value="<%=d.getIddura()%>"><%=d.getNoOfMonths()%></option>
                    <%

                        }

                    %>

                </select>
            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="branch">Branch</label>
            <div class="col-md-4">
                <select id="branch" name="branch" class="form-control">

                    <% Criteria cr2 = ses.createCriteria(POJOS.Branch.class);
                        List<Branch> li2 = cr2.list();
                        for (Branch b : li2) {
                    %>
                    <option value="<%=b.getIdbranch()%>"><%=b.getBranchName()%></option>
                    <%

                        }

                    %>
                </select>
            </div>
        </div>

    </fieldset>


    <fieldset>

        <!-- Form Name -->
        <legend>Reference </legend>
        
        <table class="table">
            <thead>
            <th></th>
            <th><label class="col-md-4 control-label" for="refree_1">Referee 1 </label> </th>
            <th> <label class="col-md-4 control-label" for="refree_1">Referee 2</label> </th>
            </thead>
            <tbody>
                <tr>
                    <td><label class="col-md-2 control-label" for="refree_1">Name</label> </td>
                    <td><input id="refree_1" name="refree_1name" type="text" placeholder="" class="form-control input-md" required=""></td>
                    <td><input id="refree_1" name="refree_2name" type="text" placeholder="" class="form-control input-md" required=""></td>


                </tr>

                <tr>
                    <td><label class="col-md-2 control-label" for="refree_1">Post</label> </td>
                    <td><input id="refree_1" name="refree_1post" type="text" placeholder="" class="form-control input-md" required=""></td>
                    <td><input id="refree_1" name="refree_2post" type="text" placeholder="" class="form-control input-md" required=""></td>


                </tr>
                <tr>
                    <td><label class="col-md-2 control-label" for="refree_1">Address</label> </td>
                    <td><input id="refree_1" name="refree_1address" type="text" placeholder="" class="form-control input-md" required=""></td>
                    <td><input id="refree_1" name="refree_2address" type="text" placeholder="" class="form-control input-md" required=""></td>


                </tr>
                <tr>
                    <td><label class="col-md-2 control-label" for="refree_1">Email</label> </td>
                    <td><input id="refree_1" name="refree_1email" type="text" placeholder="" class="form-control input-md" required=""></td>
                    <td><input id="refree_1" name="refree_2email" type="text" placeholder="" class="form-control input-md" required=""></td>


                </tr>
                <tr>
                    <td><label class="col-md-2 control-label" for="refree_1">Contact</label> </td>
                    <td><input id="refree_1" name="refree_1tel" type="text" placeholder="" class="form-control input-md col-md-2" required=""></td>
                    <td><input id="refree_1" name="refree_2tel" type="text" placeholder="" class="form-control input-md col-md-2" required=""></td>


                </tr>

            </tbody>
        </table>
        <ul class="list-inline pull-right">
            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
            <li><button type="button" class="btn btn-default next-step">Skip</button></li>
            <li><button type="submit" class="btn btn-primary btn-info-full " name="btn_refSave">Save and continue</button></li>
            <!--<li><button type="submit" class="btn btn-primary btn-info-full " name="btn_refUpate">Save and continue</button></li>-->
        </ul>
    </fieldset>
</form>