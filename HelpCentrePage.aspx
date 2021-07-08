<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpCentrePage.aspx.cs" ErrorPage="~/ErrorPage.aspx" Inherits="Coding_Community.HelpCentrePage" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Help Centre</title>

    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" />
    <!-- multi select css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" />
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="styles.css" />

    <style>
        .accordion .card-header h5 {
            color: black !important;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="min-height: 46px; background-color: #343A40;">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Title Page.aspx"">Home <span class="sr-only" style=" position: absolute;">(current)</span></a>
                    </li>
                    <li class="nav-item temp">
                        <a class="nav-link" href="LoginPage.aspx">Login <span class="sr-only" style="position: absolute;">(current)</span></a>
                    </li>
                    <li class="nav-item temp">
                        <a class="nav-link" href="Register Page.aspx">Register <span class="sr-only" style="position: absolute;">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <div class="custom-control-inline" id="user-profile">

                    <% if (Session["username"] != null)
                        {
                            Image1.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                        }%>

                    <asp:Image ID="Image1" runat="server" Style="border-radius: 100%; height: 40px; width: 40px;" />

                    <div class="nav-item dropdown">

                        <%  string username = "";
                            if (Session["username"] != null)
                            {
                                username = Session["username"].ToString();
                            }%>

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username %></a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dropdown-item" OnClick="toUserDashBoard"><span class="picon" style="margin-right: 10px;"><i class="fa fa-user-circle"></i></span>My Account</asp:LinkButton>

                            <!--<a class="dropdown-item" href="#" onclick="logoutFunction()"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>Logout</a>-->
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="logout_click" CssClass="dropdown-item"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>

                        </div>
                    </div>

                </div>
            </div>
        </nav>

        <div class="container text-center" style="margin-top: 80px;">
            <img src="images/faq2.png" alt="QuestionMarkImage" style="width: 800px; height: 250px;"/>
            <h1 style="font-size: 70px; font-weight: 400; margin-top: 30px; color: black !important;">Need some help?</h1>
        </div>

        <div class="container-fluid">

            <div class="row" style="margin-top: 60px;">
                <div class="col-md-5" style="margin-left: auto;">
                    <div class="accordion md-accordion accordion-3 z-depth-1-half" id="accordionEx194" role="tablist" aria-multiselectable="true">
                                <div style="padding: 15px;">
                                    <p style="margin-bottom: 0; font-weight: bold; color: black;">User Account Setting</p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;" />
                            
                                <!--Accordion wrapper-->
                                <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne1">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                                                <h5 class="mb-0">Q: How to edit your Asked Question?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                <img alt="" src="HelpImages/queedit.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingTwo2">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                                                aria-expanded="false" aria-controls="collapseTwo2">
                                                <h5 class="mb-0">Q: How to Deactivate Your Account?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                <img alt="" src="HelpImages/deactivate.png" style="width: 700px; height: 300px;"/> 
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingThree3">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3"
                                                aria-expanded="false" aria-controls="collapseThree3">
                                                <h5 class="mb-0">Q: How to Report a Problem?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                <img alt="" src="HelpImages/report.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingThree4">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree4"
                                                aria-expanded="false" aria-controls="collapseThree4">
                                                <h5 class="mb-0">Q: How to Change your Password?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseThree4" class="collapse" role="tabpanel" aria-labelledby="headingThree4"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                <img alt="" src="HelpImages/changepass.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                            
                                    <!-- Accordion card -->

                                </div>
                                <!-- Accordion wrapper -->
                            </div>
                </div>

                <div class="col-md-5" style="margin-right: auto;">
                    <div class="accordion md-accordion accordion-3 z-depth-1-half" id="accordionEx195" role="tablist" aria-multiselectable="true">
                                <div style="padding: 15px;">
                                    <p style="margin-bottom: 0; font-weight: bold; color: black;">Question Related</p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;" />
                            
                                <!--Accordion wrapper-->
                                <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne11">
                                            <a data-toggle="collapse" data-parent="#accordionEx1" href="#collapseOne11" aria-expanded="true" aria-controls="collapseOne1">
                                                <h5 class="mb-0">Q: How to view Question Related to a Tag ?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseOne11" class="collapse show" role="tabpanel" aria-labelledby="headingOne11"
                                            data-parent="#accordionEx1">
                                            <div class="card-body">
                                                <img src="HelpImages/Tagrelatedque.png"  style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingTwo12">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#collapseTwo12"
                                                aria-expanded="false" aria-controls="collapseTwo2">
                                                <h5 class="mb-0">Q: How to reach Top in Leaderboard?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseTwo12" class="collapse" role="tabpanel" aria-labelledby="headingTwo12"
                                            data-parent="#accordionEx1">
                                            <div class="card-body">
                                               Answer as many Question you can.The more you answer ,more your score will go high
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingThree13">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#collapseThree13"
                                                aria-expanded="false" aria-controls="collapseThree3">
                                                <h5 class="mb-0">Q: How to see other User Info?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseThree13" class="collapse" role="tabpanel" aria-labelledby="headingThree13"
                                            data-parent="#accordionEx1">
                                            <div class="card-body">
                                                <img src="HelpImages/otheruser.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                </div>
                                <!-- Accordion wrapper -->
                            </div>
                </div>

            </div>

            <div class="row" style="margin-top: 60px; margin-bottom: 20px;">
                <div class="col-md-5" style="margin-left: auto;">
                    <div class="accordion md-accordion accordion-3 z-depth-1-half" id="accordionEx196" role="tablist" aria-multiselectable="true">
                                <div style="padding: 15px;">
                                    <p style="margin-bottom: 0; font-weight: bold; color: black;">Authentication Related</p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;" />
                            
                                <!--Accordion wrapper-->
                                <div class="accordion md-accordion" id="accordionEx3" role="tablist" aria-multiselectable="true">

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne31">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx3" href="#collapseOne31" aria-expanded="true" aria-controls="collapseOne31">
                                                <h5 class="mb-0">Q: Can I change My UserName?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseOne31" class="collapse" role="tabpanel" aria-labelledby="headingOne31"
                                            data-parent="#accordionEx3">
                                            <div class="card-body">
                                                <h3>No</h3>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingTwo32">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx3" href="#collapseTwo32"
                                                aria-expanded="false" aria-controls="collapseTwo32">
                                                <h5 class="mb-0">Q: Forgot Your Password?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseTwo32" class="collapse" role="tabpanel" aria-labelledby="headingTwo32"
                                            data-parent="#accordionEx3">
                                            <div class="card-body">
                                                <img src="HelpImages/forgotpass.png" style="width: 700px; height: 300px;" />
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                </div>
                                <!-- Accordion wrapper -->
                            </div>
                </div>

                <div class="col-md-5" style="margin-right: auto;">
                    <div class="accordion md-accordion accordion-3 z-depth-1-half" id="accordionEx197" role="tablist" aria-multiselectable="true">
                                <div style="padding: 15px;">
                                    <p style="margin-bottom: 0; font-weight: bold; color: black;">Profile setting</p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;" />
                            
                                <!--Accordion wrapper-->
                                <div class="accordion md-accordion" id="accordionEx4" role="tablist" aria-multiselectable="true">

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne41">
                                            <a  class="collapsed" data-toggle="collapse" data-parent="#accordionEx4" href="#collapseOne41" aria-expanded="true" aria-controls="collapseOne41">
                                                <h5 class="mb-0">Q: How to change your Profile info?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseOne41" class="collapse" role="tabpanel" aria-labelledby="headingOne41"
                                            data-parent="#accordionEx4">
                                            <div class="card-body">
                                                <img src="HelpImages/profileedit.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                    <!-- Accordion card -->
                                    <div class="card">

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingTwo42">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx4" href="#collapseTwo42"
                                                aria-expanded="false" aria-controls="collapseTwo42">
                                                <h5 class="mb-0">Q: How to Change my Profile Picture?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>

                                        <!-- Card body -->
                                        <div id="collapseTwo42" class="collapse" role="tabpanel" aria-labelledby="headingTwo42"
                                            data-parent="#accordionEx4">
                                            <div class="card-body">
                                                <img src="HelpImages/profileinfo.png" style="width: 700px; height: 300px;"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Accordion card -->

                                </div>
                                <!-- Accordion wrapper -->
                            </div>
                </div>

            </div>

            <div class="row">
                <h5 style="font-weight: bold; font-size: larger; color: darkgray; margin-left: 170px;">For more queries, Email us.</h5>
            </div>

            <div class="row">
                <h1 style="font-weight: bold; margin-left: auto; margin-right:auto; margin-top: 50px; color: black !important;">Want To Join Our Community?</h1>
            </div>

            <div class="row" style="margin-bottom: 50px;">
                <h4 style="font-weight: bold; margin-left: auto; margin-right:auto;"> <span class="social-media-icons fas fa-envelope"></span>Email us at -<a href="https://www.google.com/gmail/" style="color: black !important;">codingcommunity20@gmail.com</a> </h4>
            </div>


        </div>

        <section class="siteFooter">
            <footer  class="bg-dark" style="margin-top: 25px; line-height: 2; text-align: center; padding-bottom: 40px; padding-top: 40px;">
                <div class="container-fluid">
                    <span class="social-media-icons fab fa-twitter" style="color: white !important;"></span>
                    <span class="social-media-icons fab fa-facebook" style="color: white !important;"></span>
                    <span class="social-media-icons fab fa-instagram" style="color: white !important;"></span>
                    <a href="https://www.google.com/gmail/">
                         <span class="social-media-icons fas fa-envelope" style="color: white !important;"></span>
                    </a>
                   
                    <p id="copyright">© Copyright 2020 Coding Community - All Rights Reserved</p>
                </div>
            </footer>
        </section>

    </form>

    <script>
            <%
            if (Session["username"] == null)
            {
                    %>
            document.getElementById('user-profile').style.display = 'none';
            $('.temp').show();

                <%
            }
            if (Session["username"] != null)
            {
                    %>
            document.getElementById('user-profile').style.display = 'inline-flex';
            $('.temp').hide();

                <%
            }
                %>
    </script>

</body>
</html>
