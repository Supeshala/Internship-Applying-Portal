<%-- 
    Document   : header
    Created on : Nov 24, 2017, 10:47:04 AM
    Author     : tt2017071
--%>
<!--Header-->


<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Sri Lanka Telecom</a>
                </div>

                <ul class="nav navbar-nav navbar-right">
                    <!--<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span><%=request.getSession().getAttribute("User_NIC").toString()%>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="profile.jsp">My Profile</a></li>
                            <li><a href="logout">Logout</a></li>
                         
                        </ul>
                    </li>
                    <!--<li><a href="#"><span class="glyphicon glyphicon-user"></span>Supeshala </a></li>-->
                </ul>
            </div>
        </nav>