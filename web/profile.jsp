<%@page import="POJOS.AwardsAchive"%>
<%@page import="POJOS.Qualification"%>
<%@page import="POJOS.EducationalLevel"%>
<%@page import="POJOS.Branch"%>
<%@page import="POJOS.Duration"%>
<%@page import="POJOS.Fields"%>
<%@page import="POJOS.FileAtttach"%>
<%@page import="POJOS.Reference"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Student"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*" %>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.


-->

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
    Session ses = DB.connection.getSessionFactory().openSession();
    if (request.getSession().getAttribute("User_NIC") == null) {

        response.sendRedirect("index.jsp");
    } else {
%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <script src="js/jquery-3.2.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/datepicker.min.js"></script>

        <link href="${pageContext.request.contextPath}/css/form_wizard.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/form_wizard.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/profile_css.css" rel="stylesheet">
        <link href="css/datepicker.min.css " rel="stylesheet">

        <script type="text/javascript">
            var b = new Array();
            function appendText() {

                var text = document.getElementById("desec").value;
                b.push(text);
                alert(b);

                if (text == "") {


                } else {

                    var addcolum = "<tr><td>" + text + "</td><tr>";
                    $("#add_description").append(addcolum);
                    $("#tabledata").val(b);
                    $("#desec").val("");


                }

            }

            function appendAward() {

                var titel = document.getElementById("titel").value;

                if (titel == "") {


                } else {

                    var addcolum1 = "<tr><td>" + titel + "</td><tr>";
                    $("#add_titel").append(addcolum1);
                    $("#titel").val("");
                }

            }
        </script>



    </head>
    <body>
        <!--
 User Profile Sidebar by @keenthemes
 A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
 Licensed under MIT
        -->
        <%@include file="header.jsp" %>
        <%
            Criteria cr = ses.createCriteria(Student.class).add(Restrictions.eq("nic", request.getSession().getAttribute("User_NIC").toString()));
            //Criteria cr=ses.createCriteria(Student.class).add(Restrictions.eq("nic","koshil@gmail.com"));
            Student s = (Student) cr.uniqueResult();

        %>



        <div class="container">
            <div class="row profile">
                <div class="col-md-3">
                    <div class="profile-sidebar">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">

                            <%Criteria cr3 = ses.createCriteria(FileAtttach.class);
                                cr3.add(Restrictions.eq("student", ses.load(Student.class, request.getSession().getAttribute("User_NIC").toString())));
                                FileAtttach f = (FileAtttach) cr3.uniqueResult();
                            %>
                            <img src="<%=f.getPhoto()%>" class="img-responsive" alt="">
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">

                                <%=s.getName()%>
                            </div>
                            <div class="profile-usertitle-job">
                                Candidate
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <div class="profile-userbuttons">
                            <button type="button" class="btn btn-success btn-sm">Change Profile Picture</button>

                        </div>
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav " role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#tab_personD" data-toggle="tab" aria-controls="tab_personD" role="tab" title="Personal Details">
                                        <i class="glyphicon glyphicon-home"></i>
                                        Personal Details </a>
                                </li>
                                <li>
                                    <a href="#tab_Refer" data-toggle="tab" aria-controls="tab_Refer" role="tab" title="Personal Details">
                                        <i class="glyphicon glyphicon-education"></i>
                                        Educational Qualifications</a>
                                </li>
                                <li>
                                    <a  href="#uploadfiles" data-toggle="tab" aria-controls="tab_Refer" role="tab" title="Personal Details">
                                        <i class="glyphicon glyphicon-paperclip"></i>
                                        Upload Files </a>
                                </li>
                                <li>
                                    <a  href="#internship_del" data-toggle="tab" aria-controls="tab_Refer" role="tab" title="Personal Details">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                        internship Details</a>
                                </li>
                                <li>
                                    <a  href="" data-toggle="tab" aria-controls="tab_Refer" role="tab" title="Personal Details">
                                        <i class="glyphicon glyphicon-envelope"></i>
                                        payment </a>
                                </li>

                            </ul>
                        </div>
                        <!-- END MENU -->
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="container-fluid">
                        <div class="" style=" position: relative;
                             top: 0;
                             left: 0">
                            <img src="image/telecomInternship1.png" alt="New York" style="width:100%">
                        </div>
                        <div class="profile-content tab-content" id="panelmain">


                            <div class="tab-pane active" role="tabpanel" id="tab_personD">

                                <div class="form-group">
                                    <ul class="list-inline">
                                        <li><h3>Personal Details</h3></li>
                                        <li>  <a href="" class=" btn btn-primary" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
                                    </ul>

                                    <table class="table table-striped table-responsive">

                                        <tbody>
                                            <tr>
                                                <td><h5>Name with Initials</h5></td>

                                                <td><h5><%=s.getName()%></h5></td>


                                            </tr>
                                            <tr>
                                                <td><h5>Full Name</h5></td>

                                                <td><h5><%=s.getFullname()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Gender</h5></td>

                                                <td><h5><%=s.getGender()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Date of Birth</h5></td>

                                                <td><h5><%=s.getDob()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Postal address</h5></td>

                                                <td><h5><%=s.getAddress()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Contact Number</h5></td>

                                                <td><h5><%=s.getTpNo()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Email</h5></td>

                                                <td><h5><%=s.getEmail()%></h5></td>
                                            </tr>
                                        </tbody>


                                    </table>



                                </div>




                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_Refer">
                                <div class="form-group">
                                    <ul class="list-inline">
                                        <li><h3>Educational Qualifications</h3></li>
                                        <li>  <a href="" class=" btn btn-primary" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
                                    </ul>

                                    <table class="table table-striped table-responsive">

                                        <tbody>
                                            <tr>
                                                <td><h5>Educational Level</h5></td>

                                                <td><h5><%=s.getEducationalLevel().getLevelName()%></h5></td>


                                            </tr>
                                            <tr>
                                                <td><h5>University/Institute Name</h5></td>

                                                <td><h5><%=s.getUniversity().getName()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Address</h5></td>

                                                <td><h5><%=s.getUniversity().getAddress()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Course</h5></td>

                                                <td><h5><%=s.getUniversity().getDegree()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Started Date</h5></td>

                                                <td><h5><%=s.getUniversity().getStartedDate()%></h5></td>
                                            </tr>
                                        </tbody>
                                    </table>


                                </div>

                                <!--*************************************************88-->
                                <div class="form-group">
                                    <div class="panel panel-primary filterable">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Other Qualification</h3>
                                            <div class="pull-right">
                                                <button class="btn btn-default btn-xs btn-filter" data-toggle="modal" data-target="#other_qucli"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
                                            </div>

                                        </div>
                                        <table class="table">
                                            <thead>

                                            </thead>
                                            <tbody>
<%
    int i=1;
Criteria qu=ses.createCriteria(POJOS.Qualification.class).add(Restrictions.eq("studentNic", request.getSession().getAttribute("User_NIC").toString()));
List<Qualification> qul=qu.list();
for(Qualification q:qul){
%>

<tr>
    <td><%=i%></td>
    <td><%=q.getProQua()%></td>
</tr>
                                                
                                                
<%

i++;
}

%>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>  
                                <div class="form-group">
                                    <div class="panel panel-primary filterable">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Awards and Achievements</h3>
                                            <div class="pull-right">
                                                <button class="btn btn-default btn-xs btn-filter" data-toggle="modal" data-target="#award_achi"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
                                            </div>
                                        </div>
                                        <table class="table">
                                            <thead>

                                            </thead>

                                            <tbody>
                                                <%
                                                
                              Criteria awa=ses.createCriteria(POJOS.AwardsAchive.class).add(Restrictions.eq("studentNic", request.getSession().getAttribute("User_NIC").toString()));
                                         List<AwardsAchive> awr=awa.list();
                                         for(AwardsAchive a:awr){
                                         
                                         %>
                                                <tr>
                                                    <td></td>
                                                    <td><%=a.getAward()%></td>
                                                
                                                </tr>
                                                
                                                <%
                                         
                                         }
                                                %>
 

<tr><td></td></tr>
                                                
                                                


                                            </tbody>
                                        </table>
                                    </div>
                                </div>  

                            </div>
                            <div class="tab-pane" role="tabpanel" id="internship_del">

                                <div class="form-group">
                                    <ul class="list-inline">
                                        <li><h3>Internship Details</h3></li>
                                        <li>  <a href="" class=" btn btn-primary" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
                                    </ul>
                                    <table class="table table-striped table-responsive">

                                        <tbody>
                                            <tr>
                                                <td><h5>Internship Field</h5></td>

                                                <td><h5><%=s.getFields().getFieldName()%></h5></td>


                                            </tr>
                                            <tr>
                                                <td><h5>Training Period</h5></td>

                                                <td><h5><%=s.getDuration().getNoOfMonths()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Branch</h5></td>

                                                <td><h5><%=s.getBranch().getBranchName()%></h5></td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <div class="form-group">
                                        <ul class="list-inline">
                                            <li><h3>References</h3></li>
                                            <li>  <a href="" class=" btn btn-primary" data-toggle="modal" data-target="#myModal3"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
                                        </ul>

                                        <table class="table table-striped table-responsive">

                                            <%
                                                Criteria cr1 = ses.createCriteria(Reference.class);
                                                cr1.add(Restrictions.eq("student", ses.load(Student.class, request.getSession().getAttribute("User_NIC").toString())));
                                                cr1.add(Restrictions.eq("refNo", "1"));
                                                Reference r = (Reference) cr1.uniqueResult();
                                            %>
                                            <tr>
                                                <td><h5>Referee 1</h5></td>
                                                <td><h5>Name</h5></td> 
                                                <td><h5><%=r.getRefName()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4"></td>
                                                <td><h5>Post</h5></td>
                                                <td><h5><%=r.getRefPost()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Address</h5></td>
                                                <td><h5><%=r.getAddress()%></h5></td>

                                            </tr>
                                            <tr>
                                                <td><h5>Email</h5></td>
                                                <td><h5><%=r.getEmail()%></h5></td>

                                            </tr>
                                            <tr>
                                                <td><h5>Contact Number</h5></td>
                                                <td><h5><%=r.getConNo()%></h5></td>

                                            </tr>
                                        </table>

                                        <table class="table table-striped table-responsive">
                                            <%
                                                Criteria cr2 = ses.createCriteria(Reference.class);
                                                cr2.add(Restrictions.eq("student", ses.load(Student.class, request.getSession().getAttribute("User_NIC").toString())));
                                                cr2.add(Restrictions.eq("refNo", "2"));
                                                Reference rr = (Reference) cr2.uniqueResult();
                                            %>
                                            <tr>
                                                <td><h5>Referee 2</h5></td>
                                                <td><h5>Name</h5></td> 
                                                <td><h5><%=rr.getRefName()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4"></td>
                                                <td><h5>Post</h5></td>
                                                <td><h5><%=rr.getRefPost()%></h5></td>
                                            </tr>
                                            <tr>
                                                <td><h5>Address</h5></td>
                                                <td><h5><%=rr.getAddress()%></h5></td>

                                            </tr>
                                            <tr>
                                                <td><h5>Email</h5></td>
                                                <td><h5><%=rr.getEmail()%></h5></td>

                                            </tr>
                                            <tr>
                                                <td><h5>Contact Number</h5></td>
                                                <td><h5><%=rr.getConNo()%></h5></td>

                                            </tr>
                                        </table>

                                    </div>


                                </div>

                            </div>
                            <div class="tab-pane" role="tabpanel" id="uploadfiles">

                                <h3>Your CV ...</h3>
                                <form enctype="multipart/form-data" method="post" id="uploadForm" action="uploadfils">
                                    <div class="form-group  ">
                                        <img id="output" style="width: 200px; height: 200px; " src="image/"/>



                                        <div id="upFile" class="btn btn-primary">
                                            <span>Select</span>

                                            <!--<input type="file"  onchange="loadFile(event)" name="image" class="upload"  required="" >-->
                                            <input type="file" accept="application/pdf" onchange="loadFile(event)"  name='image' class="upload" required="required">

                                        </div>
                                        <a href="#" class="btn btn-danger" onchange="deleteimage()"><span class="glyphicon glyphicon-trash"></span> </a>

                                        <script>
                                            var loadFile = function (event) {
                                                var reader = new FileReader();
                                                reader.onload = function () {
                                                    var output = document.getElementById('output');

                                                    output.src = reader.result;
                                                };
                                                reader.readAsDataURL(event.target.files[0]);
                                            };

                                            function deleteimage() {
                                                $("#output").remove();
                                            }


                                        </script>


                                    </div>
                                    <ul class="list-inline pull-right">
                                        <li><button  type="submit" class="btn btn-primary " name="profileUpdate" value="Update">Update</button></li>
                                    </ul>
                                </form>



                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <br>
            </div>


            <!--modal personal details-->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Personal Details</h4>
                        </div>

                        <!-- Modal body -->
                        <form method="POST" action="PDetails" enctype="multipart/form-data">
                            <div class="modal-body">

                                <div class="form-horizontal">

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="intial_name">Surname with initials</label>  
                                        <div class="col-md-4">
                                            <input id="intial_name" name="intial_name" type="text" required="" placeholder="" value="<%=s.getName()%>" class="form-control input-md" >
                                            <span class="help-block">Eg : E . I Senanayake</span>  
                                        </div>

                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="fname">Full Name</label>  
                                        <div class="col-md-6">
                                            <input id="fname" name="fname" type="text" placeholder="" required="" value="<%=s.getFullname()%>" class="form-control input-md"  autocomplete="off">

                                        </div>
                                    </div>

                                    <!-- Multiple Radios -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="gender">Gender</label>
                                        <div class="col-md-4">
                                            <div class="radio">
                                                <label for="gender-0">







                                                           <input type="radio" name="gender" id="gender-0"  value="male" <%
                                                        if (s.getGender().equals("male")) {%>checked="checked"<%}%> >
                                                    Male
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label for="gender-1">
                                                       <input type="radio" name="gender" id="gender-1"  value="female"<%
                                                        if (s.getGender().equals("female")) {%>checked="checked"<%}%> >
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->


                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="gender">Date of Birth</label>
                                        <div class="col-md-4 date">
                                            <div class="input-group input-append date" id="datePicker">
                                                <input type="text" class="form-control" required="" value="<%=s.getDob()%>"  name="dob" placeholder="MM/DD/YYYY" />
                                                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $('#datePicker')
                                                    .datepicker({
                                                        format: 'yyyy-mm-dd'
                                                    })
                                                    .on('changeDate', function (e) {
                                                        // Revalidate the date field
                                                        $('#eventForm').formValidation('revalidateField', 'date');
                                                    });

                                            $('#eventForm').formValidation({
                                                framework: 'bootstrap',
                                                icon: {
                                                    valid: 'glyphicon glyphicon-ok',
                                                    invalid: 'glyphicon glyphicon-remove',
                                                    validating: 'glyphicon glyphicon-refresh'
                                                },
                                                fields: {
                                                    name: {
                                                        validators: {
                                                            notEmpty: {
                                                                message: 'The name is required'
                                                            }
                                                        }
                                                    },
                                                    date: {
                                                        validators: {
                                                            notEmpty: {
                                                                message: 'The date is required'
                                                            },
                                                            date: {
                                                                format: 'MM/DD/YYYY',
                                                                message: 'The date is not a valid'
                                                            }
                                                        }
                                                    }
                                                }
                                            });
                                        });
                                    </script>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="no">Postal Address</label>  
                                        <%
                                            String address = s.getAddress();
                                            String splitaddress[] = address.split(" ");
                                        %>
                                        <div class="col-md-5">
                                            <input id="no" name="no" type="text" required="" value="<%=splitaddress[0]%>" placeholder="Address1" class="form-control input-md" >

                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="add2"></label>  
                                        <div class="col-md-5">
                                            <input id="add2" name="add2" type="text" placeholder="Address 2" value="<%=splitaddress[1]%>" class="form-control input-md">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="city"></label>  
                                        <div class="col-md-2">
                                            <input id="city" name="city" type="text" required="" placeholder="City" value="<%=splitaddress[2]%>" class="form-control input-md">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="zipcode"></label>

                                        <div class="col-md-2">
                                            <input id="zipcode" name="zipcode" type="text" required="" placeholder="Zip Code" value="<%=splitaddress[5]%>" class="form-control input-md">

                                        </div>
                                    </div>

                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="country"></label>
                                        <div class="col-md-4">
                                            <select id="country" name="country" class="form-control" required="" onchange="<%=splitaddress[3]%>">
                                                <option value="Sri lanka">Sri lanka</option>
                                                <option value="2">Option two</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="contact_no">Contact No</label>  
                                        <div class="col-md-2">
                                            <input id="contact_no" name="contact_no" required="" value="<%=s.getTpNo()%>" type="tel" pattern="[0-9]{10}"  placeholder="" class="form-control input-md" >

                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="email">Email</label>  
                                        <div class="col-md-5">
                                            <input id="email" name="email" type="text" placeholder="" required="" value="<%=s.getEmail()%>" class="form-control input-md" >

                                        </div>
                                    </div>

                                    <div class="form-group  ">
                                        <label class="col-md-4 control-label" >Upload a picture</label> 
                                        <img id="output2" style="width: 200px; height: 200px; " src="<%=f.getPhoto()%>"/>



                                        <div id="upFile" class="btn btn-primary">
                                            <span>Select</span>

                                            <!--<input type="file"  onchange="loadFile(event)" name="image" class="upload"  required="" >-->
                                            <input type="file" accept="image/*" onchange="loadFile(event)"  value="<%=f.getPhoto()%>" name='image' class="upload" >

                                        </div>
                                        <!--<a href="#" class="btn btn-danger" onchange="deleteimage()"><span class="glyphicon glyphicon-trash"></span> </a>-->

                                        <script>
                                            var loadFile = function (event) {
                                                var reader = new FileReader();
                                                reader.onload = function () {
                                                    var output = document.getElementById('output2');

                                                    output.src = reader.result;
                                                };
                                                reader.readAsDataURL(event.target.files[0]);
                                            };

                                            function deleteimage() {
                                                $("#output").remove();
                                            }


                                        </script>

                                    </div>


                                    <!--upload image-->


                                </div>

                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button  type="submit" name="personal_update" value="Update" class="btn btn-primary ">Update</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <!-- The Modal Educational Qualification -->
            <div class="modal fade" id="myModal1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Educational Qualifications</h4>
                        </div>

                        <!-- Modal body -->
                        <form class="form-horizontal" action="EduDetails" method="post">
                            <div class="modal-body">
                                <fieldset>

                                    <!-- Form Name -->
                                    <!--<legend>Educational Qualifications</legend>-->
                                    <!-- Text input-->
                                    <div class="form-group">
                                       <label class="col-md-4 control-label" for="uni_name">Educational Level</label>  
                                        <div class="col-md-4">
                                            <select id="edu_level" name="edu_level" class="form-control" >
                                                <%
                                                Criteria dd=ses.createCriteria(POJOS.EducationalLevel.class);
                                                List<EducationalLevel> e=dd.list();
                                                for (EducationalLevel elem : e) {
                                                        
                                                    
                                                    %>
                                                <option value="<%=elem.getIdEdu()%>" <%if(elem.getIdEdu().equals(s.getEducationalLevel().getIdEdu())){%>  selected="" <%}%> ><%=elem.getLevelName()%></option>
                                                <%
                                                    }
                                                
                                                %>
                                          
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="uni_name">University / Institute Name</label>  
                                        <div class="col-md-5">
                                            <input id="uni_name" name="uni_name" type="text" placeholder="" value="<%=s.getUniversity().getName()%>" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="uni_address">Address</label>  
                                        <div class="col-md-5">
                                            <input id="uni_address" name="uni_address" type="text" placeholder="" value="<%=s.getUniversity().getAddress()%>" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="uni_course">Course</label>  
                                        <div class="col-md-5">
                                            <input id="uni_course" name="uni_course" type="text" placeholder="" value="<%=s.getUniversity().getDegree()%>" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $('#datePicker1')
                                                    .datepicker({
                                                        format: 'mm/dd/yyyy'
                                                    })
                                                    .on('changeDate', function (e) {
                                                        // Revalidate the date field
                                                        $('#eventForm').formValidation('revalidateField', 'date');
                                                    });

                                            $('#eventForm').formValidation({
                                                framework: 'bootstrap',
                                                icon: {
                                                    valid: 'glyphicon glyphicon-ok',
                                                    invalid: 'glyphicon glyphicon-remove',
                                                    validating: 'glyphicon glyphicon-refresh'
                                                },
                                                fields: {
                                                    name: {
                                                        validators: {
                                                            notEmpty: {
                                                                message: 'The name is required'
                                                            }
                                                        }
                                                    },
                                                    date: {
                                                        validators: {
                                                            notEmpty: {
                                                                message: 'The date is required'
                                                            },
                                                            date: {
                                                                format: 'MM/DD/YYYY',
                                                                message: 'The date is not a valid'
                                                            }
                                                        }
                                                    }
                                                }
                                            });
                                        });
                                    </script>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label"  for="uni_startedDate">started Date</label>  
                                        <div class="col-md-2 date">
                                            <div class="input-group input-append date" id="datePicker1">
                                                <input type="text" class="form-control" required="" value="<%=s.getUniversity().getStartedDate()%>" name="date" />
                                                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                                <form class="form-horizontal">
                                    <fieldset>

                                        <!--*******************Other Qualifications********************-->


                                       
                                        <!--*******************Awards and Achievements********************-->
                                        
                                    </fieldset>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" name="edu_update" value="Update">Update</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <!-- The Modal Internship Details -->
            <div class="modal fade" id="myModal2">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Internship Details</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form class="form-horizontal" action="interDel_update" method="POST">
                            <div class="modal-body">

                                <fieldset>


                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="intern_field">Internship Field</label>
                                        <div class="col-md-4">
                                            <select id="intern_field" name="intern_field" class="form-control">
                                                <%Criteria cr4 = ses.createCriteria(POJOS.Fields.class);
                                                    List<Fields> li = cr4.list();
                                                    for (Fields f1 : li) {
                                                %>
                                                <option value="<%=f1.getIdfields()%>" <%if(f1.getIdfields().equals(s.getFields().getIdfields())){%>  selected="" <%}%>><%=f1.getFieldName()%></option>

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

                                                <%  Criteria cr5 = ses.createCriteria(POJOS.Duration.class);
                                                    List<Duration> li1 = cr5.list();
                                                    for (Duration d : li1) {
                                                        
                                                %>
                                                <option value="<%=d.getIddura()%>" <%if(d.getIddura().equals(s.getDuration().getIddura())){%>  selected="" <%}%>><%=d.getNoOfMonths()%></option>
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

                                                <% Criteria cr6 = ses.createCriteria(POJOS.Branch.class);
                                                    List<Branch> li2 = cr6.list();
                                                    for (Branch b : li2) {
                                                %>
                                                <option value="<%=b.getIdbranch()%>" <%if(b.getIdbranch().equals(s.getBranch().getIdbranch())){%>  selected="" <%}%>><%=b.getBranchName()%></option>
                                                <%

                                                    }

                                                %>
                                            </select>
                                        </div>
                                    </div>

                                </fieldset>



                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary  " name="edu_update">Update</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- The Modal References -->
            <div class="modal fade" id="myModal3">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">References</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <form class="form-horizontal" action="reference_update" method="POST">
                            <div class="modal-body">
                                <table class="table">
                                    <thead>
                                    <th></th>
                                    <th><label class="col-md-4 control-label" for="refree_1">Referee 1 </label> </th>
                                    <th> <label class="col-md-4 control-label" for="refree_1">Referee 2</label> </th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><label class="col-md-2 control-label" for="refree_1">Name</label> </td>
                                            <td><input id="refree_1" name="refree_1name" type="text" placeholder="" value="<%=r.getRefName()%>" class="form-control input-md" required=""></td>
                                            <td><input id="refree_1" name="refree_2name" type="text" placeholder="" value="<%=rr.getRefName()%>" class="form-control input-md" required=""></td>


                                        </tr>

                                        <tr>
                                            <td><label class="col-md-2 control-label" for="refree_1">Post</label> </td>
                                            <td><input id="refree_1" name="refree_1post" type="text" placeholder="" value="<%=r.getRefPost()%>" class="form-control input-md" required=""></td>
                                            <td><input id="refree_1" name="refree_2post" type="text" placeholder="" value="<%=rr.getRefPost()%>" class="form-control input-md" required=""></td>


                                        </tr>
                                        <tr>
                                            <td><label class="col-md-2 control-label" for="refree_1">Address</label> </td>
                                            <td><input id="refree_1" name="refree_1address" type="text" placeholder="" value="<%=r.getAddress()%>" class="form-control input-md" required=""></td>
                                            <td><input id="refree_1" name="refree_2address" type="text" placeholder="" value="<%=rr.getAddress()%>" class="form-control input-md" required=""></td>


                                        </tr>
                                        <tr>
                                            <td><label class="col-md-2 control-label" for="refree_1">Email</label> </td>
                                            <td><input id="refree_1" name="refree_1email" type="text" placeholder="" value="<%=r.getEmail()%>" class="form-control input-md" required=""></td>
                                            <td><input id="refree_1" name="refree_2email" type="text" placeholder="" value="<%=rr.getEmail()%>" class="form-control input-md" required=""></td>


                                        </tr>
                                        <tr>
                                            <td><label class="col-md-2 control-label" for="refree_1">Contact</label> </td>
                                            <td><input id="refree_1" name="refree_1tel" type="text" placeholder="" value="<%=r.getConNo()%>" class="form-control input-md col-md-2" required=""></td>
                                            <td><input id="refree_1" name="refree_2tel" type="text" placeholder="" value="<%=rr.getConNo()%>" class="form-control input-md col-md-2" required=""></td>


                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Update</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!-- The Modal -->
            <div class="modal fade" id="other_qucli">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!--Modal Header--> 
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Other Qualification</h4>
                        </div>

                        <!--Modal body--> 
                            <form action="qulia_update" method="GET">
                        <div class="modal-body">
                           <div class="form-group">
                                            <div class="panel panel-primary filterable">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Other Qualifications</h3>

                                                </div>
                                                <table class="table">
                                                    <thead>
                                                        <tr class="filters">
                                                            <!--<th><input type="text" class="form-control" placeholder="Description"  ></th>-->
                                                            <th><div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Description" id="desec" >
                                                                    <span class="input-group-btn"><button class="btn btn-warning" type="button" onclick="appendText()">Add</button></span>
                                                                </div></th>

                                                        </tr>
                                                    </thead>

                                                    <tbody id="add_description">


                                                    </tbody>
                                                    <input type="text" name="tabledata" id="tabledata" >

                                                </table>
                                            </div>
                                        </div>
                        </div>

                        <!--Modal footer--> 
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                                </form>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="award_achi">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!--Modal Header--> 
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Awards and Achievements</h4>
                        </div>

                        <!--Modal body--> 
                            <form action="awardsAchi_update" method="GET">
                        <div class="modal-body">
                           <div class="form-group">
                                            <div class="panel panel-primary filterable">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Awards and Achievements</h3>

                                                </div>
                                                <table class="table">
                                                    <thead>
                                                        <tr class="filters">
                                                            <!--<th><input type="text" class="form-control" placeholder="Description"  ></th>-->
                                                            <th><div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Description" id="desec" >
                                                                    <span class="input-group-btn"><button class="btn btn-warning" type="button" onclick="appendText()">Add</button></span>
                                                                </div></th>

                                                        </tr>
                                                    </thead>

                                                    <tbody id="add_description">


                                                    </tbody>
                                                    <input type="text" name="tabledata" id="tabledata" >

                                                </table>
                                            </div>
                                        </div>
                        </div>

                        <!--Modal footer--> 
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                                </form>

                    </div>
                </div>
            </div>

            

        </div>
                                            
        <%@include file="footer.jsp" %>

    </body>
</html>
<%    }
%>