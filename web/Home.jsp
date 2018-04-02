<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*" %>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%if(request.getSession().getAttribute("User_NIC").toString()==null){
    response.sendRedirect("index.jsp");

}else{


%>
<html>
    <head>
        <title>SLT Internships</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">


        <script src="js/jquery-3.2.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/datepicker.min.js"></script>

        <link href="${pageContext.request.contextPath}/css/form_wizard.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="css/datepicker.min.css " rel="stylesheet">

<!--        <link rel="stylesheet" href="cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

        <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>-->
        <style>
            /* layout.css Style */
            .upload-drop-zone {
                height: 200px;
                border-width: 2px;
                margin-bottom: 20px;
            }

            /* skin.css Style*/
            .upload-drop-zone {
                color: #ccc;
                border-style: dashed;
                border-color: #ccc;
                line-height: 200px;
                text-align: center
            }
            .upload-drop-zone.drop {
                color: #222;
                border-color: #222;
            }
        </style>
        <script>

//         <%
    String a = request.getParameter("panelchange");

    if (a == null) {
    } else if (a.equals("1")) {
            %>
          
            $(document).ready(function () {
                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);
            });

            <%
            } else if (a.equals("2")) {
            %>

            $(document).ready(function () {
                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);
            });

            <%
                }

            %>
        </script>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <div class="container" >
            <!--slider-->
            <div class="col-md-12">
                <img class="img-responsive" src="image/form.jpg" alt="">
            </div>

            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">

                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Personal Details">
                                        <span class="round-tab">

                                            <i class="glyphicon glyphicon-folder-open"></i>



                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Educational Qualication">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-picture"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Educational Qualication">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-picture"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step5" data-toggle="tab" aria-controls="step3" role="tab" title="Internship details and file attachement">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Review and submission">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <!--<form role="form">-->
                        <div class="tab-content">
                            <div class="tab-pane active" role="tabpanel" id="step1">

                                <%@include file="site/personal_details.jsp" %>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="step2">

                                <%@include file="site/Reference.jsp" %>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="step3">


                                <%@include file="site/Edu_qucftion.jsp" %>

                            </div>
                            <div class="tab-pane" role="tabpanel" id="complete">
                                <h3>Complete</h3>
                                <p>You have successfully completed all steps.</p>
                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Previous</button></li>

                                    <li><button type="button" class="btn btn-primary btn-info-full next-step">Submit</button></li>
                                </ul>

                            </div>
                            <div class="tab-pane" role="tabpanel" id="step5">
                                <%@include file="site/internDetails.jsp" %>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!--</form>-->
                    </div>
                </section>
            </div>
        </div>



    </body>
    <script src="js/js_wizard.js"></script>
</html>
<%

}
%>