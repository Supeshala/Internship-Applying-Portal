<%-- 
    Document   : index
    Created on : Nov 24, 2017, 10:13:14 AM
    Author     : tt2017071
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
        <title>SLT Internship</title>


        <script src="js/jquery-3.2.1.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet"> 

       
   
       
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    </head>
    <body>
        <%
        String aa=request.getParameter("val");
        
if(aa==null){

}else if(aa.equals("1")){
   
    %>
<script>
    
   
    alert("Already Exist");
//    document.getElementById("message-signup").innerHTML="<div class=\"alert alert-danger\"><strong>Already exist..................</strong></div>";
</script>
        
        <%

}
        
        %>
        <div class="container">
            <div class="col-md-12">
                <img class="img-responsive" src="image/cov1.jpg" alt="">
            </div>


            <div class="col-md-6">
                <h2>Students: Applying to Sri Lanka Telecom</h2> 
                <p>Ready to apply for an internship at Sri Lanka Telecom? Here is what you'll need:</p>
                <ul>
                    <li>An updated resume</li>
                    <li>A letter from your university (unofficial is fine)</li>
                    <li>A police report</li>
                    <li>Copy of National Identity Card</li>
                </ul>
                <h3>Focus on your resume</h3>
                <p>Your resume is the first piece of information we'll see about you. Here's how to highlight your achievements:</p>
                <ul>
                    <li>Align your skills and experience with the internship</li>
                    <li>Be specific about projects you have worked on or managed. What was the outcome? How did you measure success?</li>
                    <li>If you have had a leadership role in a volunteer organization or at a part-time job, tell us about it. How big was the team? What was the scope of your work?</li>
                    <li>Include your GPA, as well as school-related projects or coursework that demonstrate relevant skills and knowledge</li>
                    <li>Keep it short: Aim for one page. If there is additional information we need during the hiring process, (like a portfolio), your recruiter will work with you to collect it</li>
                </ul>

                <h3>Prepare for the interview process</h3>

                <ul>
                    <li>Once you have submitted your application online, our staffing team will review your resume, transcript, and any supplementary materials</li>
                    <li>The next step in the process is a series of interviewsâwhich may be on the phone, or in personâto assess your skills</li>

                </ul>
            </div>    

            <div class="col-md-6">
                <div class="form">


                    <ul class="tab-group">

                        <li class="tab active">
                            <a href="#signup">Sign Up</a>
                        </li>

                        <li class="tab"><a href="#login">Log In</a>
                        </li>

                    </ul>


                    <div class="tab-content">

                        <div id="signup">   

                            <h1>Sign Up</h1>


                            <form  name="f1"  onsubmit="return matchpass()" action="SignUp" method="post">


                                <div class="top-row">


                                </div>


                                <div class="field-wrap">

                                    <label>
                                        NIC<span class="req">*</span>
                                    </label>

                                    <input type="text" id="nic" name="nic" pattern="[0-9]{9}[vV]" required autocomplete="off"/>

                                </div>


                                <div class="field-wrap">

                                    <label>
                                        Password<span class="req">*</span>
                                    </label>

                                    <input name="pass" id="pass" type="password" required autocomplete="off"/>

                                </div>

                                <div class="field-wrap">

                                    <label>
                                        Confirm Password<span class="req">*</span>
                                    </label>

                                    <input name="pwd2" type="password" required autocomplete="off"/>

                                </div>
<!--                                <div class="alert alert-warning" id="message-signup">

                                   

                                </div>-->

                                <button type="submit"  onclick="matchpass()" class="button button-block"/>Get Started</button>

                                <script type="text/javascript">
                                    function matchpass() {
                                        var firstpassword = document.f1.pass.value;
                                        var secondpassword = document.f1.pwd2.value;

                                        if (firstpassword == secondpassword) {
                                            return true;
                                        } else {
                                            alert("password must be same!");
                                            return false;
                                        }
                                    }
                                </script>  

                            </form>


                        </div>


                        <div id="login">   



                            <h1>Welcome Back!</h1>


                            <form action="Login" method="post">


                                <div class="field-wrap">

                                    <label>
                                        NIC<span class="req">*</span>
                                    </label>

                                    <input type="text" name="nic" pattern="[0-9]{9}[vV]" required autocomplete="off"/>

                                </div>


                                <div class="field-wrap">

                                    <label>
                                        Password<span class="req">*</span>
                                    </label>

                                    <input type="password" name="pass" required autocomplete="off"/>

                                </div>
                                <div class="field-wrap" id="message-log">

                                 

                                </div>


                                <p class="forgot"><a href="forgotpassword.jsp">Forgot Password?</a></p>


                                <button class="button button-block"/>Log In</button>


                            </form>


                        </div>


                    </div><!-- tab-content -->

                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>


        <!--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>-->
        <script src="${pageContext.request.contextPath}/js/index.js"></script>

    </body>
</html>
